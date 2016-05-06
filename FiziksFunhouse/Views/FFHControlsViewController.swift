//
//  FFHControlsViewController.swift
//  FiziksFunhouse
//
//  Created by Andre Muis on 5/4/16.
//  Copyright © 2016 Andre Muis. All rights reserved.
//

import UIKit

class FFHControlsViewController : UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var ballTypesTableView: UITableView!
    
    let BallTypeCellIdentifier : String = "BallTypeCellIdentifier"
    
    var simulationEngine : FFHSimulationEngine?

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        
        self.ballTypesTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: self.BallTypeCellIdentifier)
    }

    // MARK: UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1;
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return FFHBallType.valueCount
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell : UITableViewCell = self.ballTypesTableView.dequeueReusableCellWithIdentifier(BallTypeCellIdentifier, forIndexPath: indexPath)
        
        if let ballType : FFHBallType = FFHBallType.valueAtIndex(indexPath.row),
            label : UILabel = cell.textLabel
        {
            label.text = ballType.rawValue
        }
        
        return cell
    }

    // MARK: UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        if let simulationEngine = self.simulationEngine
        {
            if let ballType : FFHBallType = FFHBallType.valueAtIndex(indexPath.row)
            {
                simulationEngine.addBall(type: ballType)
            }
        }
    }
    
    // MARK:

    @IBAction func clearButtonPressed(sender: AnyObject)
    {
        if let simulationEngine = self.simulationEngine
        {
            simulationEngine.removeAllBalls()
        }
    }
}








