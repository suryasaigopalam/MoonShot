//
//  GridView.swift
//  MoonShot
//
//  Created by surya sai on 17/03/24.
//

import SwiftUI

struct GridView: View {
    var astronauts:[String:Astronaut]
    
    var missions:[Mission]
    
    var columns = [GridItem(.adaptive(minimum: 150))]
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(missions) { mission in
                        NavigationLink {
                            MissionView(mission: mission, astronauts: astronauts)
                        } label: {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100,height: 100)
                                    .padding()
                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundStyle(.white)

                                    Text(mission.launchDate?.formatted(date:.abbreviated, time:.omitted) ?? "N/A")
                                        .font(.caption)
                                        .foregroundStyle(.gray)
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.lightBackground)
                                                               
                            }
                            .clipShape(.rect(cornerRadius: 20 ))
                            .overlay {
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.lightBackground)
                            }
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Moonshot")
            .background(Color.darkBackground)
            .preferredColorScheme(.dark)
        }
        
        
        
    }
}

#Preview {
    GridView(astronauts: Bundle.main.decode("astronauts.json"), missions:Bundle.main.decode("missions.json") )
}
