//
//  FFHControlsViewController.swift
//  FiziksFunhouse
//
//  Created by Andre Muis on 5/4/16.
//  Copyright © 2016 Andre Muis. All rights reserved.
//

import UIKit

class FFHControlsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var ballTypesTableView: UITableView!
    
    let ballTypeCellIdentifier: String = "BallTypeCellIdentifier"
    var simulationEngine: FFHSimulationEngine?

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.ballTypesTableView.register(UITableViewCell.self, forCellReuseIdentifier: self.ballTypeCellIdentifier)
    }

    // MARK: UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int
    {
        return FFHBallType.valueCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell: UITableViewCell = self.ballTypesTableView.dequeueReusableCell(withIdentifier: self.ballTypeCellIdentifier, for: indexPath)
        
        cell.textLabel?.text = FFHBallType.valueAtIndex(index: indexPath.row)?.rawValue
        
        return cell
    }

    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {            
        if let ballType: FFHBallType = FFHBallType.valueAtIndex(index: indexPath.row)
        {
            self.simulationEngine?.addBall(type: ballType)
        }
    }
    
    // MARK:

    @IBAction func clearButtonPressed(sender: AnyObject)
    {
        self.simulationEngine?.removeAllBalls()
    }
}








