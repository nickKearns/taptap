//
//  ball.swift
//  taptap
//
//  Created by Nicholas Kearns on 1/8/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import SpriteKit


class Ball: SKSpriteNode {
    init() {
        let color = UIColor.red
        
        super.init(texture: nil, color: color, size: CGSize(width: 50, height: 50))
        physicsBody = SKPhysicsBody(circleOfRadius: size.width/2)
        
    }
    
    
    func changeColor() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
