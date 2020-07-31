//
//  FFHMainViewController.swift
//  FiziksFunhouse
//
//  Created by Andre Muis on 5/4/16.
//  Copyright © 2016 Andre Muis. All rights reserved.
//

import UIKit

class FFHMainViewController: UIViewController
{
    let simulationEngine: FFHSimulationEngine = FFHSimulationEngine()
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let viewController = segue.destination as? FFHControlsViewController
        {
            viewController.simulationEngine = self.simulationEngine
        }
        else if let viewController = segue.destination as? FFHSceneViewController
        {
            viewController.simulationEngine = self.simulationEngine
        }
    }
}
