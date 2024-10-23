//
//  CircleView.swift
//  Landmarks.JerryG
//
//  Created by student on 10/18/24.
//

import SwiftUI

struct CircleView: View {
    var image: Image
    var body: some View {
        image
            .clipShape(Circle())
            .overlay(Circle().stroke(.white, lineWidth: 4))
            .shadow(radius: 7)
    }
}

#Preview {
    CircleView(image: ModelData().landmarks[0].image)
}
