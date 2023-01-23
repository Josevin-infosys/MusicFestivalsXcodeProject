//
//  BandsTableViewController.swift
//  EnergyAustraliaTest
//
//  Created by Josevin.Johny on 23/01/23.
//

import UIKit

class BandsTableViewController: UITableViewController {
    
    var recordLabel: RecordLabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Bands"
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "bandCell")
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return recordLabel?.bands.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bandCell", for: indexPath)
        guard let bandKey = recordLabel?.bandKeys[indexPath.row],
              let band = recordLabel?.bands[bandKey] else { return UITableViewCell() }
        
        cell.textLabel?.text = band.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let bandKey = recordLabel?.bandKeys[indexPath.row],
              let band = recordLabel?.bands[bandKey] else { return }
        let musicFestival = MusicFestivalTableViewController()
        musicFestival.musicFestivals = band.toursPerformed.array as! [String]
        self.navigationController?.pushViewController(musicFestival, animated: true)
    }
}
