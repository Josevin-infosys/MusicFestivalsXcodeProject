//
//  ViewController.swift
//  EnergyAustraliaTest
//
//  Created by Josevin.Johny on 21/01/23.
//

import UIKit

class ViewController: UIViewController, ViewModelViewDelegate {
    
    @IBOutlet weak var fetchMusicDataButton: UIButton!
    private var model: ViewController_ViewModel!
    var viewModel: ViewModelDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = ViewController_ViewModel(viewModelViewDelegate: self)
        // Do any additional setup after loading the view.
    }
    
    ///Delegate Function to Notify ViewModel that usser tapped on button
    /// - Parameter sender: sender
    @IBAction func fetchMusicDataFromAPI(_ sender: Any) {
        viewModel?.didTapOnButton()
    }
    
    /// call back Function to Notify View controller that fetching API done. Also Navigate to First Tableview Controller.
    /// - Parameters:
    ///   - data: API Text Data
    ///   - error: Issues with fetching data
    func updateViewWithFestivalData(data: [MusicFestival]?, error: APIError?) {
        DispatchQueue.main.async {
            
            guard let data = data else
            {
                if error != nil {
                    self.addAlert(message: error?.rawValue ?? "Error")
                }
                return
            }
            let recordLabelViewController = RecordLabelsTableViewController()
            recordLabelViewController.musicFestivalsData = data
            self.navigationController?.pushViewController(recordLabelViewController, animated: true)
        }
    }
}

