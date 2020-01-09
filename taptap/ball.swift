//
//  ball.swift
//  taptap
//
//  Created by Nicholas Kearns on 1/8/20.
//  Copyright © 2020 Nicholas Kearns. All rights reserved.
//

import SpriteKit


class Ball: SKSpriteNode {
    init(x: CGFloat, y: CGFloat) {
        let texture = SKTexture(imageNamed: "red-ball")
        let color = UIColor.clear
        
        super.init(texture: texture, color: color, size: CGSize(width: 50, height: 50))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
