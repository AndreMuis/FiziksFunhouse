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
    static let cameraPosition : SCNVector3 = SCNVector3(x: 8.0, y: 5.0, z: 18.0)
    
    static let omnidirectionalLightPosition : SCNVector3 = SCNVector3(x: 10.0, y: 7.0, z: 14.0)
    static let ambientLightColor : UIColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)

    static let roomWidth : Float = 16.0
    static let roomHeight : Float = 10.0
    static let roomDepth : Float = 10.0
    static let roomWallDepth : Float = 1.0

    static let axisLength : Float = 10.0
    static let axisRadius : Float = 0.1

    static let ballImplulseMagnitude : Float = 7.0
}
