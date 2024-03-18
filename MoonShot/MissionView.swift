//
//  MissionView.swift
//  MoonShot
//
//  Created by surya sai on 13/03/24.
//

import SwiftUI

struct CrewMember {
    let role:String
    let astronaut:Astronaut
}
struct MissionView: View {
    let crew:[CrewMember]
    let mission:Mission
    var body: some View {
        ScrollView(.vertical,showsIndicators: false) {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width,axis in
                        return width * 0.6
                    }
                Text("Launch : \(mission.launchDate?.formatted(date:.abbreviated, time: .omitted) ?? "N/A")")
                Rectangle()
                    .frame(height: 2)
                    .foregroundColor(Color.lightBackground)
                    .padding([.vertical,.horizontal])
                VStack(alignment: .leading){
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding()
                    
                    Text(mission.description)
                }
                .padding(.horizontal)
                Rectangle()
                    .frame(height: 2)
                    .foregroundColor(Color.lightBackground)
                    .padding([.vertical,.horizontal])
                Text("Crew")
                    .font(.title.bold())
                ScrollView {
                    HStack(spacing:30) {
                        ForEach(crew,id: \.role) {crewMember in
                            NavigationLink {
                                AstronautView(astronaut: crewMember.astronaut)
                            } label: {
                                VStack {
                                    Image(crewMember.astronaut.id)
                                        .resizable()
                                        .frame(width: 104,height: 72)
                                        .clipShape(.capsule)
                                        .overlay (
                                            Capsule().strokeBorder(.white,lineWidth: 1)
                                        )
                                    VStack(alignment:.leading) {
                                                Text(crewMember.astronaut.name)
                                                    .foregroundStyle(.white)
                                                    .font(.headline)
                                                
                                                Text(crewMember.role)
                                                    .foregroundStyle(.secondary)
                                                    
                                                    
                                            }
                                        }
                               }
                            }
                    }
                }
            }
            .padding(.bottom)
           
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.darkBackground)
        .preferredColorScheme(.dark)
    }
    init(mission: Mission,astronauts:[String:Astronaut]) {
        self.mission = mission
        self.crew = mission.crew.map { crew in
            if  let astronaut = astronauts[crew.name] {
              return CrewMember(role: crew.role, astronaut: astronaut)
            }else {
                fatalError("Missing \(crew.name)")
            }
        }
    }
    
}

#Preview {
    let missions:[Mission] = Bundle.main.decode("missions.json")
    let astronauts:[String:Astronaut] =  Bundle.main.decode("astronauts.json")
   return MissionView(mission: missions[2],astronauts: astronauts)
}
