//
//  Reducer+Analytics.swift
//  RxFramework
//
//  Created by William Huang on 1/8/24.
//

import Foundation

public protocol FirebaseMetricsAction: Equatable {
    func getStartMetricName() -> (String,
                                  attributes: [String: String]?)?
    func getStopMetricName() -> String?
}

public extension AnyReducer where Action: FirebaseMetricsAction {
    func traceMetrics(
        start: @escaping (_ metricName: String, _ attributes: [String: String]?) -> Void,
        stop: @escaping (_ metricName: String) -> Void
    ) -> AnyReducer {
        return .init { state, action, environment in
            let effects = self.run(&state, action, environment)

            if let metric = action.getStartMetricName() {
                return .merge(
                    .fireAndForget {
                        start(metric.0, metric.attributes)
                    },
                    effects
                )
            } else if let metricName = action.getStopMetricName() {
                return .merge(
                    effects,
                    .fireAndForget {
                        stop(metricName)
                    }
                )
            } else {
                return effects
            }
        }
    }
}
