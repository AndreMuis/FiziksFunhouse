//
//  FFHMainViewController.swift
//  FiziksFunhouse
//
//  Created by Andre Muis on 5/4/16.
//  Copyright © 2016 Andre Muis. All rights reserved.
//

import UIKit

class FFHMainViewController : UIViewController
{
    let simulationEngine : FFHSimulationEngine = FFHSimulationEngine()
 
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if let viewController = segue.destinationViewController as? FFHControlsViewController
        {
            viewController.simulationEngine = self.simulationEngine
        }
        else if let viewController = segue.destinationViewController as? FFHSceneViewController
        {
            viewController.simulationEngine = self.simulationEngine
        }
    }
}
