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
        boundary.physicsBody = SKPhysicsBody(edgeLoopFrom: CGRect(origin: .zero, size: size))
        boundary.position = .zero
        
        
        
        
        for _ in 0...6 {
            let ball = SKSpriteNode()
            ball.name = "ball"
            ball.position.x = CGFloat(arc4random() % UInt32(size.width) - 10)
            ball.position.y = CGFloat(arc4random() % UInt32(size.height) - 10)
            ball.color = UIColor.red
            ball.texture = SKTexture(imageNamed: "red-ball")
            ball.size = CGSize(width: 50, height: 50)
            ball.
            ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width / 2)
            ball.physicsBody?.affectedByGravity = false
            addChild(ball)
        }
           
        
        addChild(boundary)
    }
    
    
    
    
   
}
