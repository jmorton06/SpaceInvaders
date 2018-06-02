//
//  GameOver.swift
//  SpacegameReloaded
//
//  Created by Joseph Morton on 03/06/2017.
//  Copyright © 2017 Training. All rights reserved.
//

import UIKit
import SpriteKit


class GameOverScene: SKScene
{

    var score:Int = 0
    
    var scoreLabel:SKLabelNode!
    var newGameButtonNode:SKSpriteNode!
    var mainMenuButtonNode:SKSpriteNode!
       
    override func didMove(to view: SKView)
    {
        scoreLabel = self.childNode(withName: "scoreLabel") as! SKLabelNode
        scoreLabel.text = "\(score)"
        
        newGameButtonNode  = self.childNode(withName: "newGameButton") as! SKSpriteNode
        mainMenuButtonNode = self.childNode(withName: "mainMenuButton") as! SKSpriteNode

    }
 
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        let touch = touches.first
        if newGameButtonNode.contains((touch?.location(in: self))!)
        {
            let transition = SKTransition.flipHorizontal(withDuration: 0.5)
            let gameScene = GameScene(size: self.size)
            gameScene.scaleMode = .aspectFill
            gameScene.size = (view?.bounds.size)!
            self.view!.presentScene(gameScene, transition: transition)
        }
        
        if mainMenuButtonNode.contains((touch?.location(in: self))!)
        {
            
            if let scene = SKScene(fileNamed: "MenuScene")
            {
                let transition = SKTransition.flipHorizontal(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                scene.size = (view?.bounds.size)!
                self.view!.presentScene(scene, transition: transition)
            }
        }
    }
    
}
