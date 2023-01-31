//
//  RecordsLabelsVC_ViewModel.swift
//  EnergyAustraliaTest
//
//  Created by Josevin.Johny on 23/01/23.
//

import Foundation

class RecordsLabelsVC_ViewModel {
    var recordLabels = [String: RecordLabel]()
    
    /// Function to iterate thorugh the each Entry
    /// - Parameter json: Raw data
    /// - Returns: RecordLabels wtth its Objects and array of sorrted Labels
    func parseData(json: [MusicFestival] = []) -> ([String : RecordLabel],
                                                   [String]) {
        
        for musicFestival in json {
            
            guard let festivalName = musicFestival.name, let bands = musicFestival.bands else { continue }
            for band in bands {
                guard let name = band.name, let recordLabelName = band.recordLabel else { continue }
                
                if let existingRecordLabel = recordLabels[recordLabelName] {
                    existingRecordLabel.update(with: name, tourName: festivalName)
                    break
                }
                
                let recordLabel = RecordLabel(name: recordLabelName)
                recordLabel.update(with: name, tourName: festivalName)
                recordLabels[recordLabelName] = recordLabel
            }
        }
        recordLabels.values.forEach { $0.sortBands() }
        let recordLabelKeys = recordLabels.keys.sorted().filter{ $0 != "" }
        return (recordLabels,recordLabelKeys)
    }
}
        
