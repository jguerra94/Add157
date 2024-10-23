//
//  LandmarkDetail.swift
//  Landmarks.JerryG
//
//  Created by student on 10/19/24.
//

import SwiftUI

struct LandmarkDetail: View {
    @Environment(ModelData.self) var modelData
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    var landmark: Landmark
    var body: some View {
    @Bindable var modelData = modelData
        ScrollView {
            VStack {
                MapView(coordinate: landmark.locationCoordinates)
                    .frame(height: 300)
                CircleView(image: landmark.image)
                    .offset(y: -130)
                    .padding(.bottom, -130)
                VStack(alignment: .leading) {
                    HStack{
                        Text(landmark.name)
                            .font(.title)
                        FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)}
                    HStack {
                        Text(landmark.park)
                        
                        Spacer() // seperates the two lines of text to use the whole width.
                        Text(landmark.state)
                        
                        
                    }
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    Divider()
                    Text("About \(landmark.name)")
                        .font(.title2)
                    Text (landmark.description)
                }
                .padding()
                
            }
        }
    }
}
    
    #Preview {
        LandmarkDetail(landmark: ModelData().landmarks[0])
            .environment(ModelData())
          
    }

