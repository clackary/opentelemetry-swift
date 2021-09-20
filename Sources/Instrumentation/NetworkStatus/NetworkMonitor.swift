/*
 * Copyright The OpenTelemetry Authors
 * SPDX-License-Identifier: Apache-2.0
 */

import Foundation

public class NetworkMonitor: NetworkMonitorProtocol {
    var reachability: Reachability

    public init() throws {
        reachability = try Reachability()
        try reachability.startNotifier()
    }

    deinit {
        reachability.stopNotifier()
    }

    public func getConnection() -> Connection {
        switch reachability.connection {
        case .wifi:
            return .wifi
        case .cellular:
            return .cellular
        case .unavailable:
            return .unavailable
        }
    }
}
