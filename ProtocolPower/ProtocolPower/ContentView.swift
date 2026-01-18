//
//  ContentView.swift
//  ProtocolPower
//
//  Created by Gulciya Iltas on 18.01.2026.
//

import SwiftUI

struct ContentView: View {
    let myDevices: [DeviceCapability] = [SmartPlug(), SmartFan()]
    
    var body: some View {
        NavigationStack {
            List(myDevices, id: \.deviceName) { device in
                HStack {
                    Image(systemName: device.iconName)
                        .font(.title2)
                        .frame(width: 40)
                    
                    Text(device.deviceName)
                        .font(.headline)
                    
                    Spacer()
                    
                    Button(String(localized: "btn_run")) {
                        device.toggleAction()
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            .navigationTitle(String(localized: "app_title"))
        }
    }
}
