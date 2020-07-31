//
//  FFHSceneViewController.swift
//  FiziksFunhouse
//
//  Created by Andre Muis on 5/2/16.
//  Copyright (c) 2016 Andre Muis. All rights reserved.
//

import SceneKit
import UIKit

class FFHSceneViewController: UIViewController
{
    @IBOutlet weak var sceneView: SCNView!
    
    var simulationEngine: FFHSimulationEngine?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
            
        self.sceneView.scene = self.simulationEngine?.scene
            
        self.simulationEngine?.addCamera()
        self.simulationEngine?.addLights()
        self.simulationEngine?.drawRoom()
    }
}

















