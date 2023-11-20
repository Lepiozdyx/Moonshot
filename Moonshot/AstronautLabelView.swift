//
//  AstronautLabelView.swift
//  Moonshot
//
//  Created by Alex on 20.11.2023.
//

import SwiftUI

struct AstronautLabelView: View {
    let image: String
    let name: String
    let role: String
    
    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .frame(width: 124, height: 92)
                .clipShape(.rect(cornerRadius: 20))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .strokeBorder(.white, lineWidth: 1)
                )
            
            VStack(alignment: .leading) {
                Text(name)
                    .foregroundStyle(.white)
                    .font(.headline)
                    .padding(.bottom, 5)
                
                Text(role)
                    .foregroundStyle(.white.opacity(0.7))
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    AstronautLabelView(image: "white", name: "Edward H. White II", role: "Senior Pilot")
        .preferredColorScheme(.dark)
}
