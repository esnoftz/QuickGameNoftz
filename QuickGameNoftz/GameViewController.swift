//
//  GameViewController.swift
//  QuickGameNoftz
//
//  Created by EVANGELINE NOFTZ on 2/14/25.
//

import UIKit
import SpriteKit
import GameplayKit

class AppData {
    static var points = 0
}

class GameViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    
    var play: GameScene!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // forces landscape mode
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")

        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // add this line of code (getting/initializing a reference to the GameScene)
                play = scene as? GameScene
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeRight
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    @IBAction func jumpAction(_ sender: UIButton) {
        play.ball.physicsBody?.velocity.dy = 600
        scoreLabel.text = "Score: \(AppData.points)"
    }
    
}
