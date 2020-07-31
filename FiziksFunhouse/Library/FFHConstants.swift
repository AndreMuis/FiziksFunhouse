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
    static let cameraPosition: SCNVector3 = SCNVector3(x: 8.0, y: 5.0, z: 18.0)
    
    static let omnidirectionalLightColor: UIColor = UIColor.init(white: 0.85, alpha: 1.0)
    static let omnidirectionalLightPosition: SCNVector3 = SCNVector3(x: 10.0, y: 7.0, z: 14.0)
    
    static let ambientLightColor: UIColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)

    static let roomWidth: Float = 16.0
    static let roomHeight: Float = 10.0
    static let roomDepth: Float = 10.0
    static let roomWallDepth: Float = 1.0

    static let floorTextureName: String = "Wood"
    static let floorTextureScale: Float = 1.0
    
    static let ceilingTextureName: String = "Plaster"
    static let ceilingTextureScale: Float = 3.0

    static let wallTextureName: String = "Concrete"
    static let wallTextureScale: Float = 2.0

    static let ballBaseRadius: CGFloat = 1.0

    static let floorCategoryBitMask: Int = 1
    static let ballNormalCategoryBitMask: Int = 2
    static let ballDestroyerCategoryBitMask: Int = 4
    static let allCategoriesBitMask: Int = 7

    static let ballImplulseMagnitude: Float = 7.0

    static let axisLength: Float = 10.0
    static let axisRadius: Float = 0.1
}
