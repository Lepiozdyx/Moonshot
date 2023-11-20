//
//  ContentView.swift
//  Moonshot
//
//  Created by Alex on 11.11.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingGrid = true
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        NavigationStack {
            Group {
                if isShowingGrid {
                    GridLayoutView(astronauts: astronauts, missions: missions)
                } else {
                    ListLayoutView(astronauts: astronauts, missions: missions)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Toggle(
                    isShowingGrid ? "Show List" : "Show Grid",
                    isOn: $isShowingGrid
                )
            }
        }
    }
}

#Preview {
    ContentView()
}
