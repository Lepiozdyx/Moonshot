//
//  ListLayoutView.swift
//  Moonshot
//
//  Created by Alex on 20.11.2023.
//

import SwiftUI

struct ListLayoutView: View {
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    var body: some View {
        List(missions) { mission in
            NavigationLink(value: mission) {
                HStack {
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
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.lightBackground)
                    .clipShape(.rect(cornerRadius: 20))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.lightBackground)
                    )
                }
                .clipShape(.rect(cornerRadius: 20))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.lightBackground)
                )
            }
            .listRowBackground(Color(.darkBackground))
        }
        .listStyle(.plain)
        .navigationDestination(for: Mission.self) { selectedMission in
            MissionView(mission: selectedMission, astronauts: astronauts)
        }
    }
}

#Preview {
    let mission: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return ListLayoutView(
        astronauts: astronauts,
        missions: mission
    ).preferredColorScheme(.dark)
}
