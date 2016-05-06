//
//  FFHConstants.swift
//  FiziksFunhouse
//
//  Created by Andre Muis on 5/4/16.
//  Copyright © 2016 Andre Muis. All rights reserved.
//

import SceneKit
import UIKit

struct Constants
{
    static let cameraPosition : SCNVector3 = SCNVector3(x: 10.0, y: 5.0, z: 20.0)
    
    static let omnidirectionalLightPosition : SCNVector3 = SCNVector3(x: 10.0, y: 5.0, z: 15.0)
    static let ambientLightColor : UIColor = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1.0)

    static let roomWidth : Float = 20.0
    static let roomHeight : Float = 10.0
    static let roomDepth : Float = 10.0
    static let roomWallDepth : Float = 1.0

    static let axisLength : Float = 10.0
    static let axisRadius : Float = 0.1

    static let ballImplulseMagnitude : Float = 5.0
}
