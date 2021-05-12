//
//  Validator+Combine.swift
//  QHValidator
//
//  Created by Daniel Koster on 5/12/21.
//

import Combine

public extension Validator {
    func validateAsPublisher(value: Input) -> AnyPublisher<Bool, ValidationError> {
        return AnyPublisher.create { subscriber in
            do {
                let result = try self.validate(value: value)
                _ = subscriber.receive(result)
                subscriber.receive(completion: .finished)
            } catch let error as ValidationError {
                subscriber.receive(completion: .failure(error))
                subscriber.receive(completion: .finished)
            }
            catch let error {
                subscriber.receive(completion: .failure(ValidationError.with(message: "\(error)")))
                subscriber.receive(completion: .finished)
            }
        }
    }
}

extension Publishers {

    public struct Anonymous<Output, Failure: Swift.Error>: Publisher {
        private var closure: (AnySubscriber<Output, Failure>) -> Void

        public init(closure: @escaping (AnySubscriber<Output, Failure>) -> Void) {
            self.closure = closure
        }

        public func receive<S>(subscriber: S) where S : Subscriber, Anonymous.Failure == S.Failure, Anonymous.Output == S.Input {
            let subscription = Subscriptions.Anonymous(subscriber: subscriber)
            subscriber.receive(subscription: subscription)
            subscription.start(closure)
        }
    }

}

extension Subscriptions {

    final class Anonymous<SubscriberType: Subscriber, Output, Failure>: Subscription where SubscriberType.Input == Output, Failure == SubscriberType.Failure {

        private var subscriber: SubscriberType?

        init(subscriber: SubscriberType) {
            self.subscriber = subscriber
        }

        func start(_ closure: @escaping (AnySubscriber<Output, Failure>) -> Void) {
            if let subscriber = subscriber {
                closure(AnySubscriber(subscriber))
            }
        }

        func request(_ demand: Subscribers.Demand) {
            // Ignore demand for now
        }

        func cancel() {
            self.subscriber = nil
        }

    }

}

extension AnyPublisher {

    static func create(_ closure: @escaping (AnySubscriber<Output, Failure>) -> Void) -> AnyPublisher<Output, Failure> {
        return Publishers.Anonymous<Output, Failure>(closure: closure)
            .eraseToAnyPublisher()
    }

}
