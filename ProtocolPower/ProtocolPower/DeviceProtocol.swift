//
//  DeviceProtocol.swift
//  ProtocolPower
//
//  Created by Gulciya Iltas on 18.01.2026.
//

import Foundation

protocol DeviceCapability {
    var deviceName: String { get }
    var iconName: String { get }
    func toggleAction()
}
