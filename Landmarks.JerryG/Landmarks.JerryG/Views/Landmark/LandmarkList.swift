//
//  LandmarkList.swift
//  Landmarks.JerryG
//
//  Created by student on 10/19/24.
//

import SwiftUI

struct LandmarkList: View {
    @Environment(ModelData.self) var modelData
    @State var showFavoritesOnly = false
    var filteredLandmarks: [Landmark] { modelData.landmarks.filter { landmark in
        (!showFavoritesOnly || landmark.isFavorite)
    }
    }
    
    var body: some View {
        NavigationSplitView{
            
        List{ Toggle(isOn: $showFavoritesOnly,label: {
                Text("Show Favorites")})
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink{
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
            }
            }
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a landmark")
        }
    }
}
    #Preview {
        LandmarkList()
            .environment(ModelData())
    }

