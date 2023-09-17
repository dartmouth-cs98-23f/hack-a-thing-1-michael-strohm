import Foundation
import SpriteKit
let BallCategoryName = "ball"
let PaddleCategoryName = "paddle"
let BlockCategoryName = "Brick"
let ScoreCategoryName = "ScoreBoard"

class Gamescreen: SKScene, SKPhysicsContactDelegate {

    var homeButton: Button!
    var restart: Button!
    
    var gvc: GameViewController!
    var ball:SKSpriteNode!
    var brick:SKSpriteNode!
    var paddle:SKSpriteNode!
    var scoreBoard: SKLabelNode!
    var score: Int!
       
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        
        ball = childNode(withName: BallCategoryName) as? SKSpriteNode
        paddle = childNode(withName: PaddleCategoryName) as? SKSpriteNode
        scoreBoard = childNode(withName: ScoreCategoryName) as? SKLabelNode
        score = 0
        
        
        homeButton = self.childNode(withName: "homeButton") as? Button
        restart = self.childNode(withName: "Rbutton") as? Button

        restart.action = {
            for child in self.children{
                if child.name == "Brick" {
                    child.alpha = 1
                    child.physicsBody?.categoryBitMask = 1
                    self.resetScore()
                }
            }
            
        }
        
        homeButton.action = {
            self.gvc.presentHomeScreen()
        }
        
        

        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        ball.physicsBody!.applyImpulse(CGVectorMake(15, 15))

              // Set the restitution (bounciness) of the ball's physics body
              ball.physicsBody!.restitution = 1.0

              // Create a physics body that borders the screen
        let borderBody = SKPhysicsBody(edgeLoopFrom: (view.scene?.frame)!)

              // Set the friction of that physicsBody to 0
              borderBody.friction = 0

              // Set physicsBody of scene to borderBody
              self.physicsBody = borderBody
   }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        for touch in touches {
            let touchLocation = touch.location(in: self)
            paddle.position.x = touchLocation.x
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?){
        for touch in touches {
            let touchLocation = touch.location(in: self)
            paddle.position.x = touchLocation.x
        }
    }
    
    
    func didBegin(_ contact: SKPhysicsContact) {
        let objectA = contact.bodyA.node
        let objectB = contact.bodyB.node

        if objectA?.name == "Brick" || objectB?.name == "Brick" {
            objectA?.physicsBody?.categoryBitMask = 0
            objectA?.alpha = 0
            
            //updating score
            updateScore()
            
        } else if objectB?.name == "Bottom" && objectA?.name == "ball" || objectA?.name == "Bottom" && objectB?.name == "ball"{
            self.gvc.presentloseScreen()

        }
        else if objectB?.name == "ball" || objectA?.name == "ball"{
            let vel_y = ball.physicsBody!.velocity.dy
            let vel_x = ball.physicsBody!.velocity.dx
            if abs(vel_y) < 3 {
                ball.physicsBody!.applyImpulse(CGVectorMake(0,CGFloat(arc4random_uniform(30))-15))
            }
             if abs(vel_x) < 3 {
                ball.physicsBody!.applyImpulse(CGVectorMake(CGFloat(arc4random_uniform(30))-15,0))
            }
        }
        
        var check = 1
        for child in self.children {
            if child.name == "Brick" && child.alpha == 1 {
                check = 0
            }
        }
        if check == 1{
            self.gvc.presentwinScreen()
        }
    }
    func resetScore(){
        score = 0
        scoreBoard.text = "Score: " + String(score)
    }
    func updateScore(){
        score = score + 1
        scoreBoard.text = "Score: " + String(score)
    }

}
