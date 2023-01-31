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





