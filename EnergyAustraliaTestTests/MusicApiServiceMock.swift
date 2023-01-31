//
//  MusicApiServiceMock.swift
//  EnergyAustraliaTestTests
//
//  Created by Sivasankar on 31/1/23.
//

import Foundation

struct MusicDataServiceMock: MusicDataServiceType {
    func getMusicFestivalData(from urlString: String, completionHandler: @escaping (Result<[MusicFestival]?, APIError>) -> Void) {
        completionHandler(.success([]))
    }
}

