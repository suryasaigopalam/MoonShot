//
//  Mission.swift
//  MoonShot
//
//  Created by surya sai on 11/03/24.
//

import Foundation
struct CrewRole:Codable {
    let name:String
    let role:String
}
struct Mission:Codable,Identifiable {
    let id:Int
    var crew:[CrewRole]
    let launchDate:Date?
    let description:String

    
    
    var displayName:String {
        "Apollo \(id)"
    }
    var image:String {
        "apollo\(id)"
    }
}
