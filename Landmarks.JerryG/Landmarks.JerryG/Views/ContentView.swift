//
//  ContentView.swift
//  Landmarks.JerryG
//
//  Created by student on 10/18/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       LandmarkList()
        
        
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
