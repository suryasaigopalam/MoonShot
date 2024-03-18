//
//  ContentView.swift
//  MoonShot
//
//  Created by surya sai on 10/03/24.
//

import SwiftUI

struct ContentView: View {
    var astronauts:[String:Astronaut] = Bundle.main.decode("astronauts.json")
    
    var missions:[Mission] = Bundle.main.decode("missions.json")
    @State var showGrid = false
    
    var columns = [GridItem(.adaptive(minimum: 150))]
    var body: some View {
        NavigationStack {
            VStack {
                Toggle("ShowGrid", isOn: $showGrid)
                Group {
                    if showGrid {
                        GridView(astronauts: astronauts, missions: missions)
                    } else {
                        ListView(astronauts: astronauts, missions: missions)
                    }
                }
                .navigationTitle("My Group")
            }
            .padding()
            .preferredColorScheme(.dark)
        }
    }
}
#Preview {
    ContentView()
}
