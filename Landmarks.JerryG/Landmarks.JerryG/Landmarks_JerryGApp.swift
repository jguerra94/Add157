//
//  Landmarks_JerryGApp.swift
//  Landmarks.JerryG
//
//  Created by student on 10/18/24.
//

import SwiftUI

@main
struct Landmarks_JerryGApp: App {
@State private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(ModelData())
        }
    }
}
