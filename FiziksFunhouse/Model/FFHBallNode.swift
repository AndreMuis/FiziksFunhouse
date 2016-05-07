//
//  FFHBall.swift
//  FiziksFunhouse
//
//  Created by Andre Muis on 5/5/16.
//  Copyright © 2016 Andre Muis. All rights reserved.
//

import SceneKit

class FFHBallNode : SCNNode
{
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    init(type : FFHBallType)
    {
        super.init()
        
        let baseRadius : CGFloat = 1.0
        
        var categoryBitMask : Int
        var radius : CGFloat
        var color : UIColor
        
        switch type
        {
        case .Small:
            categoryBitMask = 2
            radius = 0.8 * baseRadius
            color = UIColor.greenColor()
            
        case .Medium:
            categoryBitMask = 2
            radius = baseRadius
            color = UIColor.blueColor()

        case .Large:
            categoryBitMask = 2
            radius = 1.2 * baseRadius
            color = UIColor.redColor()
            
        case .Destroyer:
            categoryBitMask = 3
            radius = baseRadius
            color = UIColor.yellowColor()
        }
        
        let material : SCNMaterial = SCNMaterial()
        material.diffuse.contents = color
        material.specular.contents = UIColor.whiteColor()
        
        let geometry : SCNSphere = SCNSphere(radius: radius)
        geometry.materials = [material]
        
        self.geometry = geometry
        
        let physicsBody : SCNPhysicsBody = SCNPhysicsBody(type: .Dynamic, shape: nil)

        physicsBody.categoryBitMask = categoryBitMask
        physicsBody.contactTestBitMask = 7
        physicsBody.collisionBitMask = 7
    
        physicsBody.mass = pow(radius / baseRadius, 3.0)
        
        physicsBody.restitution = 1.0
        
        physicsBody.friction = 0.0
        physicsBody.rollingFriction = 0.0
        physicsBody.damping = 0.0
        physicsBody.angularDamping = 0.0
        
        self.physicsBody = physicsBody
    }
}















