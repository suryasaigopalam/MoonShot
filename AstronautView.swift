//
//  AstronautView.swift
//  MoonShot
//
//  Created by surya sai on 14/03/24.
//

import SwiftUI

struct AstronautView: View {
    let astronaut:Astronaut
    var body: some View {
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                    .clipShape(.circle)
                    .overlay {
                        Circle().stroke(.white,lineWidth: 3)
                    }
                 
                Text(astronaut.description)
                    
                    .padding()
            }
            .background(Color.darkBackground)
            .navigationTitle(astronaut.name)
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    let astronauts:[String:Astronaut] =  Bundle.main.decode("astronauts.json")
   return AstronautView(astronaut: astronauts["armstrong"]!)
}
