//
//  MusicFestivalTableViewController.swift
//  EnergyAustraliaTest
//
//  Created by Josevin.Johny on 23/01/23.
//

import UIKit

class MusicFestivalTableViewController: UITableViewController {
    
    var musicFestivals: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Music Festival"
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "musicFestivalCell")
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return musicFestivals.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "musicFestivalCell", for: indexPath)
        
        cell.textLabel?.text = musicFestivals[indexPath.row]
        
        return cell
    }
}
