//
//  GameScene.swift
//  taptap
//
//  Created by Nicholas Kearns on 1/7/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var boundary = SKNode()
    
    
    
    
    
   
    
    
    override func didMove(to view: SKView) {
        boundary.physicsBody = SKPhysicsBody(edgeLoopFrom: CGRect(origin: CGPoint(x: 50, y: 30), size: CGSize(width: 650, height: 1270)))
        boundary.physicsBody?.collisionBitMask = 0
        
        addChild(boundary)
        
        physicsWorld.contactDelegate = self
        
        
        
        
        
        for i in 0...10 {
            
            let ball = SKShapeNode(circleOfRadius: 50)
            ball.name = "ball"
            ball.physicsBody = SKPhysicsBody(circleOfRadius: 25)

            ball.position.x = CGFloat(arc4random() % UInt32(size.width) - 10)
            ball.position.y = CGFloat(arc4random() % UInt32(size.height) - 10)
            ball.physicsBody?.isDynamic = true
            ball.physicsBody?.affectedByGravity = false
            ball.physicsBody?.friction = 0.0
            ball.physicsBody?.linearDamping = 0.0
            ball.physicsBody?.restitution = 1.0
            ball.physicsBody?.angularDamping = 0.0
            ball.physicsBody?.categoryBitMask = UInt32(pow(2, Double(i)))
            ball.physicsBody?.collisionBitMask = UInt32(pow(2, Double(i)))
            ball.fillColor = UIColor.red
            
            ball.physicsBody?.velocity = CGVector(dx: Double(arc4random() % 400) + 300, dy: Double(arc4random() % 400) + 300)
            addChild(ball)


            
            
            
        }

           
        
    }
    
    
    func touchWithinRadius(node: SKSpriteNode) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self)
        
        
        
        
//        let radiusOfTouch: CGRect = CGRect(x: location.x, y: location.y, width: 100, height: 100)
        
     
    }
    
    
    
//
//    func nodesNearPoint(container:SKNode, point:CGPoint, maxDistance:CGFloat) -> [SKNode] {
//        var array = [SKNode]()
//        for node in container.children {
//
//            let dx = point.x - node.position.x
//            let dy = point.y - node.position.y
//
//            let distance = sqrt(dx*dx + dy*dy)
//            if (distance <= maxDistance) {
//                array.append(node)
//            }
//
//            // Only test sprite nodes (optional)
////            if node is SKSpriteNode {
////                let dx = point.x - node.position.x
////                let dy = point.y - node.position.y
////
////                let distance = sqrt(dx*dx + dy*dy)
////                if (distance <= maxDistance) {
////                    array.append(node)
////                }
////            }
//        }
//        return array
//    }
    
    
   
}




extension GameScene: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        let nodeA = contact.bodyA.node
        let nodeB = contact.bodyB.node
        
        print("balls contacted boundary")
        
//
//        if nodeA?.physicsBody?.velocity.dx == 0.0 {
//            nodeA?.physicsBody?.velocity.dx = 100
//        } else if nodeB?.physicsBody?.velocity.dx == 0.0 {
//            nodeB?.physicsBody?.velocity.dx = 100
//        }
        
        if nodeA?.name == "ball" {
            let length = hypot((nodeA?.physicsBody?.velocity.dx)!, (nodeA?.physicsBody?.velocity.dy)!)
            let multiplier = (length)
            nodeA?.physicsBody?.velocity.dx *= multiplier
            nodeA?.physicsBody?.velocity.dy *= multiplier
        } else if nodeB?.name == "ball" {
            let length = hypot((nodeB?.physicsBody?.velocity.dx)!, (nodeB?.physicsBody?.velocity.dy)!)
            let multiplier = (length)
            nodeB?.physicsBody?.velocity.dx *= multiplier
            nodeB?.physicsBody?.velocity.dy *= multiplier
            
    }
}


}


