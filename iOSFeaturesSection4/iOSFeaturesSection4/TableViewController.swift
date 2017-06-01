//
//  TableViewController.swift
//  iOSFeaturesSection4
//
//  Created by Luis Ramirez on 5/30/17.
//  Copyright © 2017 Lucho. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var cellSlider: UISlider!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var numberOfCells = 0
    
    //let cellContent = ["Frank", "Claire", "Doug", "Tom", "LeAnn", "Mark", "Mechum"]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfCells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = "\(indexPath.row + 1)"//cellContent[indexPath.row]
        
        return cell
    }
   
    @IBAction func sliderHasChanged(_ sender: Any) {
        
        numberOfCells = Int(cellSlider.value)
        
        tableView.reloadData()
        
    }

}
