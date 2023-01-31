//
//  RecordLabelsTableViewController.swift
//  EnergyAustraliaTest
//
//  Created by Josevin.Johny on 22/01/23.
//

import UIKit

class RecordLabelsTableViewController: UITableViewController {
    
    var recordsLabelViewModel = RecordsLabelsVC_ViewModel()
    var recordLabels: [String:RecordLabel] = [:]
    var recordLabelSortedKeys:[String] = []
    var musicFestivalsData: [MusicFestival] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Record Labels"
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    // MARK: - Table view data source
    
    override func viewWillAppear(_ animated: Bool) {
        (recordLabels,recordLabelSortedKeys) = recordsLabelViewModel.parseData(json: musicFestivalsData)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return  1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return recordLabelSortedKeys.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text =  recordLabelSortedKeys[indexPath.row]
        cell.detailTextLabel?.text = "Bands"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let recordLabelKey = recordLabelSortedKeys[indexPath.row]
        guard let recordLabel = recordLabels[recordLabelKey] else { return }
        let bandTableViewController = BandsTableViewController()
        bandTableViewController.recordLabel = recordLabel
        self.navigationController?.pushViewController(bandTableViewController, animated: true)
    }
}
