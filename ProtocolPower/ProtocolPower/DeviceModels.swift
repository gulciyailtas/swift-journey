//
//  DeviceModels.swift
//  ProtocolPower
//
//  Created by Gulciya Iltas on 18.01.2026.
//

import Foundation

struct SmartPlug: DeviceCapability {
    let deviceName = String(localized: "smart_plug_name")
    let iconName = "powerplug"
    
    func toggleAction() {
        print(String(localized: "log_plug_action"))
    }
}

struct SmartFan: DeviceCapability {
    let deviceName = String(localized: "smart_fan_name")
    let iconName = "fan"
    
    func toggleAction() {
        print(String(localized: "log_fan_action"))
    }
}
