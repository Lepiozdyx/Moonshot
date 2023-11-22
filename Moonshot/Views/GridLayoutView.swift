//
//  GridLayoutView.swift
//  Moonshot
//
//  Created by Alex on 20.11.2023.
//

import SwiftUI

struct GridLayoutView: View {
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(missions) { mission in
                    NavigationLink(value: mission) {
                        VStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                            
                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundStyle(.white.opacity(0.7))
                            }
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.lightBackground)
                        }
                        .clipShape(.rect(cornerRadius: 20))
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.lightBackground)
                        )
                    }
                }
            }
            .padding([.horizontal, .bottom])
        }
        .navigationDestination(for: Mission.self) { selectedMission in
            MissionView(mission: selectedMission, astronauts: astronauts)
        }
    }
}

#Preview {
    let mission: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return GridLayoutView(
        astronauts: astronauts,
        missions: mission
    ).preferredColorScheme(.dark)
}
