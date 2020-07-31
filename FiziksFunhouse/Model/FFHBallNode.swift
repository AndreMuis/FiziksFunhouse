//
//  FFHBall.swift
//  FiziksFunhouse
//
//  Created by Andre Muis on 5/5/16.
//  Copyright © 2016 Andre Muis. All rights reserved.
//

import SceneKit

class FFHBallNode: SCNNode
{
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    init(type: FFHBallType)
    {
        super.init()
        
        let material: SCNMaterial = SCNMaterial()
        material.diffuse.contents = type.color
        material.specular.contents = UIColor.white
        
        let geometry: SCNSphere = SCNSphere(radius: type.radius)
        geometry.materials = [material]
        
        self.geometry = geometry
        
        let physicsBody: SCNPhysicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)

        physicsBody.categoryBitMask = type.categoryBitMask
        physicsBody.contactTestBitMask = Constants.allCategoriesBitMask
        physicsBody.collisionBitMask = Constants.allCategoriesBitMask
    
        physicsBody.mass = pow(type.radius / Constants.ballBaseRadius, 3.0)
        
        physicsBody.restitution = 1.0
        
        physicsBody.friction = 0.0
        physicsBody.rollingFriction = 0.0
        physicsBody.damping = 0.0
        physicsBody.angularDamping = 0.0
        
        self.physicsBody = physicsBody
    }
}















