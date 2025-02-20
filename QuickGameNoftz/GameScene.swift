//
//  GameScene.swift
//  QuickGameNoftz
//
//  Created by EVANGELINE NOFTZ on 2/14/25.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var ball: SKSpriteNode!
    let cam = SKCameraNode()
    
    override func didMove(to view: SKView) {
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        self.camera = cam
        physicsWorld.contactDelegate = self
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        cam.position.x = ball.position.x + 300
        ball.physicsBody?.velocity.dx = 300

    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        print("Collision happened")

        if contact.bodyA.node?.name == "bob" || contact.bodyB.node?.name == "bob" {
            AppData.points += 1
            // removes bob when gru collides with him
            if contact.bodyA.node?.name == "bob" {
                contact.bodyA.node?.removeFromParent()
            } else {
                contact.bodyB.node?.removeFromParent()
            }
        } else if contact.bodyA.node?.name == "elMacho" || contact.bodyB.node?.name == "elMacho" {
            AppData.points = 0
        } else if contact.bodyA.node?.name == "scarletOverkill" || contact.bodyB.node?.name == "scarletOverkill" {
            AppData.points = 0
        }

    }
}
