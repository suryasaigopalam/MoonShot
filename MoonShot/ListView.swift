//
//  ListView.swift
//  MoonShot
//
//  Created by surya sai on 17/03/24.
//

import SwiftUI

struct ListView: View {
    var astronauts:[String:Astronaut]
    
    var missions:[Mission]
    var body: some View {
        NavigationStack {
         
            List(missions) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                } label: {
                    HStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 70,height: 70)
                        
                        Text(mission.displayName)
                    }
                }
            }
            .listRowBackground(Color.darkBackground)
            
            
            
        }
        
    }
}

#Preview {
    ListView(astronauts: Bundle.main.decode("astronauts.json"), missions:Bundle.main.decode("missions.json") )

}
