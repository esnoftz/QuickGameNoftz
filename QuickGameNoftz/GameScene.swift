//
//  GameScene.swift
//  QuickGameNoftz
//
//  Created by EVANGELINE NOFTZ on 2/14/25.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var ball: SKSpriteNode!
    let cam = SKCameraNode()
    
    override func didMove(to view: SKView) {
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        self.camera = cam
        //physicsWorld.contactDelegate = self
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        cam.position.x = ball.position.x + 300
        //ball.physicsBody?.velocity.dx = 200

    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        print("Collision happened")
        AppData.points += 1
    }
}
