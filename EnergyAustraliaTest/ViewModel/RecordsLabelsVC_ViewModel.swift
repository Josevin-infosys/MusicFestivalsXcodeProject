//
//  RecordsLabelsVC_ViewModel.swift
//  EnergyAustraliaTest
//
//  Created by Josevin.Johny on 23/01/23.
//

import Foundation

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

class RecordsLabelsVC_ViewModel {
    var recordLabels = [String: RecordLabel]()
    
    /// Function to iterate thorugh the each Entry
    /// - Parameter json: Raw data
    /// - Returns: RecordLabels wtth its Objects and array of sorrted Labels
    func parseData(json: [[String: Any]] = []) -> ([String : RecordLabel],
                                                   [String]) {
        let _ = json.forEach {
            guard let festivalName = $0["name"] as? String,
                  let bands = $0["bands"] as? [[String: String]] else { return }
            
            bands.forEach { eachBand in
                guard let name = eachBand["name"],
                      let recordLabelName = eachBand["recordLabel"] else { return }
                
                if let existingRecordLabel = recordLabels[recordLabelName] {
                    existingRecordLabel.update(with: name, tourName: festivalName)
                    return
                }
                
                let recordLabel = RecordLabel(name: recordLabelName)
                recordLabel.update(with: name, tourName: festivalName)
                recordLabels[recordLabelName] = recordLabel
            }
        }
        recordLabels.values.forEach { $0.sortBands() }
        let recordLabelKeys = recordLabels.keys.sorted()
        return (recordLabels,recordLabelKeys)
    }
}
        
