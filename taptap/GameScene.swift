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
        boundary.physicsBody = SKPhysicsBody(edgeLoopFrom: CGRect(origin: CGPoint(x: 30, y: 30), size: CGSize(width: 650, height: 1270)))
        boundary.physicsBody?.collisionBitMask = 0
        
        addChild(boundary)
        
        physicsWorld.contactDelegate = self
        
        
        
        for i in 0...7 {
            let ball = Ball()
            ball.name = "ball"
            ball.position.x = CGFloat(arc4random() % UInt32(size.width) - 10)
            ball.position.y = CGFloat(arc4random() % UInt32(size.height) - 10)
            ball.physicsBody?.affectedByGravity = false
            ball.physicsBody?.friction = 0.0
            ball.physicsBody?.linearDamping = 0.0
            ball.physicsBody?.restitution = 1.0
            ball.physicsBody?.angularDamping = 0.0
            ball.physicsBody?.categoryBitMask = UInt32(pow(2, Double(i)))
            ball.physicsBody?.collisionBitMask = UInt32(pow(2, Double(i)))

            
            ball.physicsBody?.velocity = CGVector(dx: Double(arc4random() % 400) + 300, dy: Double(arc4random() % 400) + 300)
            addChild(ball)
            
            
            
        }
        
//        for _ in 0...6 {
//            
//            let ball = SKSpriteNode()
//            ball.name = "ball"
//            ball.position.x = CGFloat(arc4random() % UInt32(size.width) - 10)
//            ball.position.y = CGFloat(arc4random() % UInt32(size.height) - 10)
//            ball.color = UIColor.red
//            ball.texture = SKTexture(imageNamed: "red-ball")
//            ball.size = CGSize(width: 50, height: 50)
//            ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width / 2)
//            ball.physicsBody?.affectedByGravity = false
//            ball.physicsBody?.friction = 0.0
//            ball.physicsBody?.linearDamping = 0.0
//            ball.physicsBody?.restitution = 0.0
//            ball.physicsBody?.velocity = CGVector(dx: Double(arc4random() % 400) + 200, dy: Double(arc4random() % 400) + 200)
//            ball.physicsBody?.contactTestBitMask = 1
//            ball.physicsBody.
//            addChild(ball)
//            
//            
//        }
           
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self)
        
        
//        let radiusOfTouch: CGRect = CGRect(x: location.x, y: location.y, width: 100, height: 100)
        
        
        if atPoint(location).name == "ball" {
            
            
        }
        
    }
    
    
    
    
   
}




extension GameScene: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        let nodeA = contact.bodyA.node
        let nodeB = contact.bodyB.node
        
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
//
//extension GameScene: SKPhysicsContactDelegate {
//   func didBegin(_ contact: SKPhysicsContact) {
//
//
//        let nodeA = contact.bodyA
//        let nodeB = contact.bodyB
//
//
//        let length = hypotf(Float(node.velocity.dx), Float(node.velocity.dy))
//        let multiplier = (290.0 / length)
//        firstBody.velocity.dx *= CGFloat(multiplier)
//        firstBody.velocity.dy *= CGFloat(multiplier)
//
//   }

}


//let length = hypotf(Float(node.velocity.dx), Float(node.velocity.dy))
//let multiplier = (290.0 / length)
//firstBody.velocity.dx *= CGFloat(multiplier)
//firstBody.velocity.dy *= CGFloat(multiplier)
