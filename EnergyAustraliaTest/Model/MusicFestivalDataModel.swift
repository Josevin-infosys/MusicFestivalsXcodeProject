//
//  musicFestivalDataModel.swift
//  EnergyAustraliaTest
//
//  Created by Josevin.Johny on 22/01/23.
//

import Foundation

struct MusicBand: Decodable {
    var name: String?
    var recordLabel: String?
}

struct MusicFestival: Decodable {
    var name: String?
    var bands: [MusicBand]?
}

final class RecordLabel {
    let name: String
    private(set) var bandKeys = [String]()
    private(set) var bands = [String: Band]()
    
    init(name: String) {
        self.name = name
    }
    
    /// Update Bands under each Record Label along with tourName
    /// - Parameters:
    ///   - bandName: Band Name
    ///   - tourName: Tour Name
    func update(with bandName: String, tourName: String) {
        guard let band = bands[bandName] else {
            bandKeys.append(bandName)
            bands[bandName] = Band(name: bandName, toursPerformed: NSMutableOrderedSet(array: [tourName]))
            
            return
        }
        
        band.toursPerformed.add(tourName)
    }
    
    func sortBands() {
        bandKeys.sort()
    }
}

class Band {
    let name: String
    let toursPerformed: NSMutableOrderedSet
    
    init(name: String, toursPerformed: NSMutableOrderedSet = NSMutableOrderedSet()) {
        self.name = name
        self.toursPerformed = toursPerformed
    }
}



