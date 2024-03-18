//
//  Bundle-Decodable.swift
//  MoonShot
//
//  Created by surya sai on 10/03/24.
//

import Foundation
extension Bundle {
    func decode<T:Codable>(_ file:String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            
            fatalError("Couldn't load file")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Couldn't load data")
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        let decorder = JSONDecoder()
        decorder.dateDecodingStrategy = .formatted(formatter)
        guard  let dict = try? decorder.decode(T.self, from: data) else {
            fatalError("Couldn't parse the data")
        }
        
        return dict
    }
}
