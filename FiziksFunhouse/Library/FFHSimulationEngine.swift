//
//  FFHSimulationEngine.swift
//  FiziksFunhouse
//
//  Created by Andre Muis on 5/4/16.
//  Copyright © 2016 Andre Muis. All rights reserved.
//

import GLKit
import SceneKit

class FFHSimulationEngine : NSObject, SCNPhysicsContactDelegate
{
    var scene : SCNScene = SCNScene()
    
    override init()
    {
        super.init()
        
        self.scene.physicsWorld.contactDelegate = self
    }

    func addCamera()
    {
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = Constants.cameraPosition
        
        self.scene.rootNode.addChildNode(cameraNode)
    }

    func addLights()
    {
        let omnidirectionalLightNode = SCNNode()
        omnidirectionalLightNode.light = SCNLight()
        omnidirectionalLightNode.light!.type = SCNLightTypeOmni
        omnidirectionalLightNode.light!.color = UIColor.init(white: 0.85, alpha: 1.0)
        omnidirectionalLightNode.position = Constants.omnidirectionalLightPosition
        
        self.scene.rootNode.addChildNode(omnidirectionalLightNode)
        
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = SCNLightTypeAmbient
        ambientLightNode.light!.color = Constants.ambientLightColor
        
        self.scene.rootNode.addChildNode(ambientLightNode)
    }

    func drawRoom()
    {
        let physicsBody : SCNPhysicsBody = SCNPhysicsBody(type: .Static, shape: nil)
        
        physicsBody.categoryBitMask = 1
        physicsBody.contactTestBitMask = 7
        physicsBody.collisionBitMask = 7

        physicsBody.restitution = 1.0
        
        physicsBody.friction = 0.0
        physicsBody.rollingFriction = 0.0
        physicsBody.damping = 0.0
        physicsBody.angularDamping = 0.0
        
        let floorMaterial : SCNMaterial = SCNMaterial()
        floorMaterial.diffuse.contents = UIImage(named: "Wood")

        let floorGeometry : SCNBox = SCNBox(width: CGFloat(Constants.roomWidth),
                                            height: CGFloat(Constants.roomHeight),
                                            length: CGFloat(Constants.roomWallDepth),
                                            chamferRadius: 0.0)
        
        floorGeometry.materials = [floorMaterial]
        
        let floorNode = SCNNode(geometry: floorGeometry)
        floorNode.position = SCNVector3(x: Constants.roomWidth / 2.0,
                                        y: -Constants.roomWallDepth / 2.0,
                                        z: Constants.roomDepth / 2.0)
        
        floorNode.rotation = SCNVector4(1.0, 0.0, 0.0, M_PI / 2.0)
        floorNode.physicsBody = physicsBody.copy() as? SCNPhysicsBody
        
        self.scene.rootNode.addChildNode(floorNode)
        
        
        
        let ceilingMaterial : SCNMaterial = SCNMaterial()
        ceilingMaterial.diffuse.contents = UIImage(named: "Plaster")
        ceilingMaterial.diffuse.contentsTransform = SCNMatrix4Scale(SCNMatrix4Identity, 3.0, 3.0, 3.0)
        ceilingMaterial.diffuse.wrapS = SCNWrapMode.Repeat
        ceilingMaterial.diffuse.wrapT = SCNWrapMode.Repeat
        
        let ceilingGeometry : SCNBox = SCNBox(width: CGFloat(Constants.roomWidth),
                                              height: CGFloat(Constants.roomHeight),
                                              length: CGFloat(Constants.roomWallDepth),
                                              chamferRadius: 0.0)

        ceilingGeometry.materials = [ceilingMaterial]
        
        let ceilingNode : SCNNode = SCNNode(geometry: ceilingGeometry)
        ceilingNode.position = SCNVector3(x: Constants.roomWidth / 2.0,
                                          y: Constants.roomHeight + Constants.roomWallDepth / 2.0,
                                          z: Constants.roomDepth / 2.0)
        
        ceilingNode.rotation = SCNVector4(1.0, 0.0, 0.0, M_PI / 2.0)
        ceilingNode.physicsBody = physicsBody.copy() as? SCNPhysicsBody
        
        self.scene.rootNode.addChildNode(ceilingNode)
        
        
        
        let wallMaterial : SCNMaterial = SCNMaterial()
        wallMaterial.diffuse.contents = UIImage(named: "Concrete")
        wallMaterial.diffuse.contentsTransform = SCNMatrix4Scale(SCNMatrix4Identity, 2.0, 2.0, 2.0)
        wallMaterial.diffuse.wrapS = SCNWrapMode.Repeat
        wallMaterial.diffuse.wrapT = SCNWrapMode.Repeat
        
        let leftWallGeometry : SCNBox = SCNBox(width: CGFloat(Constants.roomDepth),
                                               height: CGFloat(Constants.roomHeight),
                                               length: CGFloat(Constants.roomWallDepth),
                                               chamferRadius: 0.0)
        
        leftWallGeometry.materials = [wallMaterial]
        
        let leftWallNode = SCNNode(geometry: leftWallGeometry)
        leftWallNode.position = SCNVector3(x: -Constants.roomWallDepth / 2.0,
                                           y: Constants.roomHeight / 2.0,
                                           z: Constants.roomDepth / 2.0)
        
        leftWallNode.rotation = SCNVector4(0.0, 1.0, 0.0, M_PI / 2.0)
        leftWallNode.physicsBody = physicsBody.copy() as? SCNPhysicsBody
        
        self.scene.rootNode.addChildNode(leftWallNode)
        
        
        let rightWallNode : SCNNode = leftWallNode.clone()
        rightWallNode.position = SCNVector3(x: Constants.roomWidth + Constants.roomWallDepth / 2.0,
                                            y: Constants.roomHeight / 2.0,
                                            z: Constants.roomDepth / 2.0)
        
        rightWallNode.physicsBody = physicsBody.copy() as? SCNPhysicsBody
        
        self.scene.rootNode.addChildNode(rightWallNode)
        
        
        let backWallGeometry : SCNBox = SCNBox(width: CGFloat(Constants.roomWidth),
                                               height: CGFloat(Constants.roomHeight),
                                               length: CGFloat(Constants.roomWallDepth),
                                               chamferRadius: 0.0)
        
        backWallGeometry.materials = [wallMaterial]
        
        let backWallNode = SCNNode(geometry: backWallGeometry)
        backWallNode.position = SCNVector3(x: Constants.roomWidth / 2.0,
                                           y: Constants.roomHeight / 2.0,
                                           z: -Constants.roomWallDepth / 2.0)
        
        backWallNode.physicsBody = physicsBody.copy() as? SCNPhysicsBody
        
        self.scene.rootNode.addChildNode(backWallNode)
        
        
        let transparentMaterial : SCNMaterial = SCNMaterial()
        transparentMaterial.transparency = 0.0
        
        let frontWallGeometry : SCNBox = SCNBox(width: CGFloat(Constants.roomWidth),
                                                height: CGFloat(Constants.roomHeight),
                                                length: CGFloat(Constants.roomWallDepth),
                                                chamferRadius: 0.0)
        
        frontWallGeometry.materials = [transparentMaterial]
        
        let frontWallNode = SCNNode(geometry: frontWallGeometry)
        frontWallNode.position = SCNVector3(x: Constants.roomWidth / 2.0,
                                            y: Constants.roomHeight / 2.0,
                                            z: Constants.roomDepth + Constants.roomWallDepth / 2.0)
        
        frontWallNode.physicsBody = physicsBody.copy() as? SCNPhysicsBody
        
        self.scene.rootNode.addChildNode(frontWallNode)
    }
    
    func addBall(type type : FFHBallType)
    {
        let ballNode = FFHBallNode(type: type)
        
        ballNode.position = SCNVector3(x: Constants.roomWidth / 2.0,
                                       y: Constants.roomHeight / 2.0,
                                       z: Constants.roomDepth / 2.0)
        
        let impulse : SCNVector3 = SCNVector3.vectorWithRandomOrientation(magnitude: Constants.ballImplulseMagnitude)
        
        if let physicsBody = ballNode.physicsBody
        {
            physicsBody.applyForce(impulse, impulse: true)
        }
        
        self.scene.rootNode.addChildNode(ballNode)
    }
    
    func removeAllBalls()
    {
        for node : SCNNode in self.scene.rootNode.childNodes.flatMap({$0 as? FFHBallNode})
        {
            node.removeFromParentNode()
        }
    }
    
    @objc func physicsWorld(world: SCNPhysicsWorld, didBeginContact contact: SCNPhysicsContact)
    {
        if let physicsBodyA = contact.nodeA.physicsBody,
            let physicsBodyB = contact.nodeB.physicsBody
        {
            if physicsBodyA.categoryBitMask == 3 && (physicsBodyB.categoryBitMask == 2 || physicsBodyB.categoryBitMask == 3)
            {
                contact.nodeB.removeFromParentNode()
            }
            
            if physicsBodyB.categoryBitMask == 3 && (physicsBodyA.categoryBitMask == 2 || physicsBodyA.categoryBitMask == 3)
            {
                contact.nodeA.removeFromParentNode()
            }
        }
    }
    
    func drawAxes()
    {
        let xAxisGeometry : SCNCylinder = SCNCylinder(radius: CGFloat(Constants.axisRadius),
                                                      height: CGFloat(Constants.axisLength))
        
        let xAxisNode = SCNNode(geometry: xAxisGeometry)
        xAxisNode.position = SCNVector3(x: Constants.axisLength / 2.0,
                                        y: 0.0,
                                        z: 0.0)
        
        xAxisNode.rotation = SCNVector4(0.0, 0.0, 1.0, M_PI / 2.0)
        
        self.scene.rootNode.addChildNode(xAxisNode)
        
        
        let yAxisGeometry : SCNCylinder = SCNCylinder(radius: CGFloat(Constants.axisRadius),
                                                      height: CGFloat(Constants.axisLength))
        
        let yAxisNode = SCNNode(geometry: yAxisGeometry)
        yAxisNode.position = SCNVector3(x: 0.0,
                                        y: Constants.axisLength / 2.0,
                                        z: 0.0)
        
        self.scene.rootNode.addChildNode(yAxisNode)
        
        
        let zAxisGeometry : SCNCylinder = SCNCylinder(radius: CGFloat(Constants.axisRadius),
                                                      height: CGFloat(Constants.axisLength))
        
        let zAxisNode = SCNNode(geometry: zAxisGeometry)
        zAxisNode.position = SCNVector3(x: 0.0,
                                        y: 0.0,
                                        z: Constants.axisLength / 2.0)
        
        zAxisNode.rotation = SCNVector4(1.0, 0.0, 0.0, M_PI / 2.0)
        
        self.scene.rootNode.addChildNode(zAxisNode)
    }
}

















