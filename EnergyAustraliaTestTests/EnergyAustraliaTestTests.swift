//
//  EnergyAustraliaTestTests.swift
//  EnergyAustraliaTestTests
//
//  Created by Josevin.Johny on 21/01/23.
//

import XCTest
@testable import EnergyAustraliaTest

final class MusicDataServiceTests: XCTestCase {
    
    func testForEmptyStringValidation() {
        let musicDataService = MusicDataService()
        let result = musicDataService.validateURL(urlString: "")

        // ASSERT
        XCTAssertNil(result)
    }
    
    func testForCorrectStringValidation() {
        let musicDataService = MusicDataService()
        let result = musicDataService.validateURL(urlString: "www.google.com")

        // ASSERT
        XCTAssertNotNil(result)
    }
}


