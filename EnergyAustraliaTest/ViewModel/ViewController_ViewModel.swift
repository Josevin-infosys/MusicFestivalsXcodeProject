//
//  ViewController_ViewModel.swift
//  EnergyAustraliaTest
//
//  Created by Josevin.Johny on 23/01/23.
//

import Foundation

protocol ViewModelViewDelegate: AnyObject {
    func updateViewWithFestivalData(data: [MusicFestival]?, error: APIError?)
}

protocol ViewModelDelegate: AnyObject {
    func didTapOnButton()
}

class ViewController_ViewModel : ViewModelDelegate {
    var viewModelViewDelegate: ViewModelViewDelegate?
    private var musicAPIService = MusicDataService()
    
    init(viewModelViewDelegate: ViewModelViewDelegate? = nil) {
        self.viewModelViewDelegate = viewModelViewDelegate
    }
    
    /// Delegate fucntion which call remote API to fetch data. From this funcation success and failure call back has been passed
    func didTapOnButton() {
        musicAPIService.getMusicFestivalData(from: Constants.barURLString) { [weak self] (result) in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let data):
                strongSelf.viewModelViewDelegate?.updateViewWithFestivalData(data: data, error: nil)
                print("Success")
            case .failure(let error):
                strongSelf.viewModelViewDelegate?.updateViewWithFestivalData(data: nil, error: error)
                print("Failed")
            }
        }
    }
}

 
    


