//
//  SCNVector3+Orientation.swift
//  FiziksFunhouse
//
//  Created by Andre Muis on 5/5/16.
//  Copyright © 2016 Andre Muis. All rights reserved.
//

import GLKit
import SceneKit

extension SCNVector3
{
    static func vectorWithRandomOrientation(magnitude: Float) -> SCNVector3
    {
        var glkVector: GLKVector3 = GLKVector3Make(magnitude, 0.0, 0.0)
        
        let zAxisRotation: GLKMatrix3 = GLKMatrix3MakeZRotation(Float.randomFrom0to1() * Float(2.0 * Double.pi))
        let yAxisRotation: GLKMatrix3 = GLKMatrix3MakeYRotation(Float.randomFrom0to1() * Float(Double.pi))
        
        glkVector = GLKMatrix3MultiplyVector3(zAxisRotation, glkVector)
        glkVector = GLKMatrix3MultiplyVector3(yAxisRotation, glkVector)
        
        let scnVector: SCNVector3 = SCNVector3FromGLKVector3(glkVector)
        
        return scnVector
    }
}





