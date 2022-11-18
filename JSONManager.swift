//
//  JSONManager.swift
//  iCompare
//
//  Created by Павло on 20.10.2022.
//

import Foundation
import SwiftUI




struct iPhone: Codable, Hashable{
    let model: String
    let platform: Platform
    let body: Body
    let display: Display
    let rearCamera: RearCamera
    let frontCamera: FrontCamera
    let storage: Array<String>
    let battery: Battery
    let authentication: Authentication
    let processor: Processor
    let memory: Memory
    
    
    
    static let allIphones: [iPhone] = Bundle.main.decode(file: "iphones.json")
    static let sampleiPhone: iPhone = allIphones[0]
    static let currentDevice = UIDevice.current.name
    
    
    
    static var currentiPhone: iPhone {
        
        iPhone.allIphones.first { $0.model == iPhone.currentDevice } ?? iPhone.sampleiPhone
    }
    
    
}




struct Platform: Codable, Hashable{
    let year: String
    let firstIOS: String
    let latestIOS: String
}
struct Body: Codable, Hashable{
    let dimensions: Array<String>
    let weight: Array<String>
    let sim: Array<String>
}
struct Display: Codable, Hashable{
    let type: String
    let size: Double
    let ppi: Int
    let scale: Int
    let resolution: String
}
struct RearCamera: Codable, Hashable{
    let type: Array<String>
    let video: Array<String>
    let features: Array<String>
}
struct FrontCamera: Codable, Hashable{
    let type: Array<String>
    let video: Array<String>
    let features: Array<String>
}
struct Battery: Codable, Hashable{
    let type: String
    let capacity: String
}
struct Authentication: Codable, Hashable{
    let type: String
}
struct Processor: Codable, Hashable{
    let chipset: String
    let architecture: String
    let microarchitecture: Array<String>
    let cores: Int
    let bit: Int
    let clock: String
    let cache: Array<String>
    let gpu: String
}
struct Memory: Codable, Hashable{
    let size: Array<String>
    let type: String
}










//decoding the JSON file

extension Bundle {
    func decode<T: Decodable>(file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not find \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Could not decode \(file) from bundle.")
        }
        
        return loadedData
    }
}
