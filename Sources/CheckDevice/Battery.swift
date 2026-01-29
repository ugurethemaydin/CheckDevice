//
//  Battery.swift
//  CheckDevice
//
//  Created by Uğur Ethem AYDIN on 18.11.2020.
//

import UIKit

public class Battery {
    /// Battery state enum
    public enum ChargingState: String {
        case charging = "Charging"
        case full = "Full"
        case unplugged = "Unplugged"
        case unknown = "Unknown"
    }

    /// Battery monitoring auto start
    private let device: UIDevice = {
        let device = UIDevice.current
        device.isBatteryMonitoringEnabled = true
        return device
    }()

    public init() {
        setupBatteryMonitoring()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
        device.isBatteryMonitoringEnabled = false
    }

    /// Battery state
    public var state: UIDevice.BatteryState {
        return device.batteryState
    }

    /// Battery level (0.0 to 1.0)
    public var level: Float {
        return device.batteryLevel
    }

    /// Battery percentage (0-100)
    public var percentage: Int {
        return Int(level * 100)
    }

    /// Battery state as string
    public var stateString: String {
        switch state {
        case .charging: return ChargingState.charging.rawValue
        case .full: return ChargingState.full.rawValue
        case .unplugged: return ChargingState.unplugged.rawValue
        case .unknown: return ChargingState.unknown.rawValue
        @unknown default: return ChargingState.unknown.rawValue
        }
    }

    /// Low Power Mode enabled?
    public var isLowPowerModeEnabled: Bool {
        return ProcessInfo.processInfo.isLowPowerModeEnabled
    }

    /// Battery details
    public var details: [String: String] {
        return [
            "State": stateString,
            "Level": "\(percentage)%",
            "Low Power Mode": isLowPowerModeEnabled ? "Enabled" : "Disabled"
        ]
    }

    /// Format battery state as string
    public func toString() -> String {
        return """
        Battery Information
        ====================
        State: \(stateString)
        Level: \(percentage)%
        Low Power Mode: \(isLowPowerModeEnabled ? "Enabled" : "Disabled")
        """
    }

    // MARK: - Private Methods
    private func setupBatteryMonitoring() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(batteryStateDidChange),
            name: .UIDeviceBatteryStateDidChange,
            object: nil
        )

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(batteryLevelDidChange),
            name: .UIDeviceBatteryLevelDidChange,
            object: nil
        )

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(powerModeDidChange),
            name: .NSProcessInfoPowerStateDidChange,
            object: nil
        )
    }

    @objc private func batteryStateDidChange(_ notification: Notification) {}
    @objc private func batteryLevelDidChange(_ notification: Notification) {}
    @objc private func powerModeDidChange(_ notification: Notification) {}
}
