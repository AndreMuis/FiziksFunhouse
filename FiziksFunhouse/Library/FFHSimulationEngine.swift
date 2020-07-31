//
//  FFHSimulationEngine.swift
//  FiziksFunhouse
//
//  Created by Andre Muis on 5/4/16.
//  Copyright © 2016 Andre Muis. All rights reserved.
//

import GLKit
import SceneKit

class FFHSimulationEngine: NSObject, SCNPhysicsContactDelegate
{
    var scene: SCNScene = SCNScene()
    
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
        let omnidirectionalLight: SCNLight = SCNLight()
        omnidirectionalLight.type = SCNLight.LightType.omni
        omnidirectionalLight.color = Constants.omnidirectionalLightColor
        
        let omnidirectionalLightNode: SCNNode = SCNNode()
        omnidirectionalLightNode.light = omnidirectionalLight
        omnidirectionalLightNode.position = Constants.omnidirectionalLightPosition
        
        self.scene.rootNode.addChildNode(omnidirectionalLightNode)
        
        let ambientLight: SCNLight = SCNLight()
        ambientLight.type = SCNLight.LightType.ambient
        ambientLight.color = Constants.ambientLightColor

        let ambientLightNode = SCNNode()
        ambientLightNode.light = ambientLight
        
        self.scene.rootNode.addChildNode(ambientLightNode)
    }

    func drawRoom()
    {
        let physicsBody: SCNPhysicsBody = SCNPhysicsBody(type: .static, shape: nil)
        
        physicsBody.categoryBitMask = Constants.floorCategoryBitMask
        physicsBody.contactTestBitMask = Constants.allCategoriesBitMask
        physicsBody.collisionBitMask = Constants.allCategoriesBitMask

        physicsBody.restitution = 1.0
        
        physicsBody.friction = 0.0
        physicsBody.rollingFriction = 0.0
        physicsBody.damping = 0.0
        physicsBody.angularDamping = 0.0
        
        // Floor
        
        let floorMaterial: SCNMaterial = SCNMaterial()
        floorMaterial.diffuse.contents = UIImage(named: Constants.floorTextureName)
        floorMaterial.diffuse.contentsTransform = SCNMatrix4Scale(SCNMatrix4Identity, Constants.floorTextureScale, Constants.floorTextureScale, Constants.floorTextureScale)
        floorMaterial.diffuse.wrapS = SCNWrapMode.repeat
        floorMaterial.diffuse.wrapT = SCNWrapMode.repeat

        let floorGeometry: SCNBox = SCNBox(width: CGFloat(Constants.roomWidth),
                                            height: CGFloat(Constants.roomHeight),
                                            length: CGFloat(Constants.roomWallDepth),
                                            chamferRadius: 0.0)
        
        floorGeometry.materials = [floorMaterial]
        
        let floorNode = SCNNode(geometry: floorGeometry)
        floorNode.position = SCNVector3(x: Constants.roomWidth / 2.0,
                                        y: -Constants.roomWallDepth / 2.0,
                                        z: Constants.roomDepth / 2.0)
        
        floorNode.rotation = SCNVector4(1.0, 0.0, 0.0, Double.pi / 2.0)
        floorNode.physicsBody = physicsBody.copy() as? SCNPhysicsBody
        
        self.scene.rootNode.addChildNode(floorNode)
        
        // Ceiling
        
        let ceilingMaterial: SCNMaterial = SCNMaterial()
        ceilingMaterial.diffuse.contents = UIImage(named: Constants.ceilingTextureName)
        ceilingMaterial.diffuse.contentsTransform = SCNMatrix4Scale(SCNMatrix4Identity, Constants.ceilingTextureScale, Constants.ceilingTextureScale, Constants.ceilingTextureScale)
        ceilingMaterial.diffuse.wrapS = SCNWrapMode.repeat
        ceilingMaterial.diffuse.wrapT = SCNWrapMode.repeat
        
        let ceilingGeometry: SCNBox = SCNBox(width: CGFloat(Constants.roomWidth),
                                             height: CGFloat(Constants.roomHeight),
                                             length: CGFloat(Constants.roomWallDepth),
                                             chamferRadius: 0.0)

        ceilingGeometry.materials = [ceilingMaterial]
        
        let ceilingNode: SCNNode = SCNNode(geometry: ceilingGeometry)
        ceilingNode.position = SCNVector3(x: Constants.roomWidth / 2.0,
                                          y: Constants.roomHeight + Constants.roomWallDepth / 2.0,
                                          z: Constants.roomDepth / 2.0)
        
        ceilingNode.rotation = SCNVector4(1.0, 0.0, 0.0, Double.pi / 2.0)
        ceilingNode.physicsBody = physicsBody.copy() as? SCNPhysicsBody
        
        self.scene.rootNode.addChildNode(ceilingNode)
        
        // Walls
        
        let wallMaterial: SCNMaterial = SCNMaterial()
        wallMaterial.diffuse.contents = UIImage(named: Constants.wallTextureName)
        wallMaterial.diffuse.contentsTransform = SCNMatrix4Scale(SCNMatrix4Identity, Constants.wallTextureScale, Constants.wallTextureScale, Constants.wallTextureScale)
        wallMaterial.diffuse.wrapS = SCNWrapMode.repeat
        wallMaterial.diffuse.wrapT = SCNWrapMode.repeat
        
        // Left Wall

        let leftWallGeometry: SCNBox = SCNBox(width: CGFloat(Constants.roomDepth),
                                              height: CGFloat(Constants.roomHeight),
                                              length: CGFloat(Constants.roomWallDepth),
                                              chamferRadius: 0.0)
        
        leftWallGeometry.materials = [wallMaterial]
        
        let leftWallNode = SCNNode(geometry: leftWallGeometry)
        leftWallNode.position = SCNVector3(x: -Constants.roomWallDepth / 2.0,
                                           y: Constants.roomHeight / 2.0,
                                           z: Constants.roomDepth / 2.0)
        
        leftWallNode.rotation = SCNVector4(0.0, 1.0, 0.0, Double.pi / 2.0)
        leftWallNode.physicsBody = physicsBody.copy() as? SCNPhysicsBody
        
        self.scene.rootNode.addChildNode(leftWallNode)
        
        // Right Wall
        
        let rightWallNode: SCNNode = leftWallNode.clone()
        rightWallNode.position = SCNVector3(x: Constants.roomWidth + Constants.roomWallDepth / 2.0,
                                            y: Constants.roomHeight / 2.0,
                                            z: Constants.roomDepth / 2.0)
        
        rightWallNode.physicsBody = physicsBody.copy() as? SCNPhysicsBody
        
        self.scene.rootNode.addChildNode(rightWallNode)
        
        // Back Wall
        
        let backWallGeometry: SCNBox = SCNBox(width: CGFloat(Constants.roomWidth),
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
        
        // Front Wall
        
        let transparentMaterial: SCNMaterial = SCNMaterial()
        transparentMaterial.transparency = 0.0
        
        let frontWallGeometry: SCNBox = SCNBox(width: CGFloat(Constants.roomWidth),
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
    
    func addBall(type: FFHBallType)
    {
        let ballNode: FFHBallNode = FFHBallNode(type: type)
        
        ballNode.position = SCNVector3(x: Constants.roomWidth / 2.0,
                                       y: Constants.roomHeight / 2.0,
                                       z: Constants.roomDepth / 2.0)
        
        let impulse: SCNVector3 = SCNVector3.vectorWithRandomOrientation(magnitude: Constants.ballImplulseMagnitude)
        
        ballNode.physicsBody?.applyForce(impulse, asImpulse: true)
        
        self.scene.rootNode.addChildNode(ballNode)
    }
    
    func removeAllBalls()
    {
        for node: SCNNode in self.scene.rootNode.childNodes.compactMap({$0 as? FFHBallNode})
        {
            node.removeFromParentNode()
        }
    }
    
    @objc func physicsWorld(_ world: SCNPhysicsWorld, didBegin contact: SCNPhysicsContact)
    {
        let physicsBodyA = contact.nodeA.physicsBody
        let physicsBodyB = contact.nodeB.physicsBody
        
        if physicsBodyA?.categoryBitMask == Constants.ballDestroyerCategoryBitMask &&
                (physicsBodyB?.categoryBitMask == Constants.ballNormalCategoryBitMask || physicsBodyB?.categoryBitMask == Constants.ballDestroyerCategoryBitMask)
            {
                contact.nodeB.removeFromParentNode()
            }
            
            if physicsBodyB?.categoryBitMask == Constants.ballDestroyerCategoryBitMask &&
                (physicsBodyA?.categoryBitMask == Constants.ballNormalCategoryBitMask || physicsBodyA?.categoryBitMask == Constants.ballDestroyerCategoryBitMask)
            {
                contact.nodeA.removeFromParentNode()
            }
        
    }
    
    func drawAxes()
    {
        let xAxisGeometry: SCNCylinder = SCNCylinder(radius: CGFloat(Constants.axisRadius),
                                                      height: CGFloat(Constants.axisLength))
        
        let xAxisNode = SCNNode(geometry: xAxisGeometry)
        xAxisNode.position = SCNVector3(x: Constants.axisLength / 2.0,
                                        y: 0.0,
                                        z: 0.0)
        
        xAxisNode.rotation = SCNVector4(0.0, 0.0, 1.0, Double.pi / 2.0)
        
        self.scene.rootNode.addChildNode(xAxisNode)
        
        
        let yAxisGeometry: SCNCylinder = SCNCylinder(radius: CGFloat(Constants.axisRadius),
                                                     height: CGFloat(Constants.axisLength))
        
        let yAxisNode = SCNNode(geometry: yAxisGeometry)
        yAxisNode.position = SCNVector3(x: 0.0,
                                        y: Constants.axisLength / 2.0,
                                        z: 0.0)
        
        self.scene.rootNode.addChildNode(yAxisNode)
        
        
        let zAxisGeometry: SCNCylinder = SCNCylinder(radius: CGFloat(Constants.axisRadius),
                                                     height: CGFloat(Constants.axisLength))
        
        let zAxisNode = SCNNode(geometry: zAxisGeometry)
        zAxisNode.position = SCNVector3(x: 0.0,
                                        y: 0.0,
                                        z: Constants.axisLength / 2.0)
        
        zAxisNode.rotation = SCNVector4(1.0, 0.0, 0.0, Double.pi / 2.0)
        
        self.scene.rootNode.addChildNode(zAxisNode)
    }
}

















