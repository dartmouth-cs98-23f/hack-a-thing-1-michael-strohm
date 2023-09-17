import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presentHomeScreen()
    }
    
    func presentHomeScreen() {
        if let view = self.view as! SKView? {
            if let scene = Homescreen(fileNamed: "Homescreen") {
                scene.scaleMode = .aspectFill
                scene.gvc = self
                view.presentScene(scene)
           }
       }
   }
    func presentGameScreen() {
        if let view = self.view as! SKView? {
            if let scene = Gamescreen(fileNamed: "Gamescreen") {
                scene.scaleMode = .aspectFill
                scene.gvc = self
                view.presentScene(scene)
            }
        }
    }
    func presentSettingsScreen() {
        if let view = self.view as! SKView? {
            if let scene = Settings(fileNamed: "Settings") {
                scene.scaleMode = .aspectFill
                scene.gvc = self
                view.presentScene(scene)
            }
        }
    }
    func presentwinScreen() {
        if let view = self.view as! SKView? {
            if let scene = Winscreen(fileNamed: "Winscreen") {
                scene.scaleMode = .aspectFill
                scene.gvc = self
                view.presentScene(scene)
            }
        }
    }
    func presentloseScreen() {
        if let view = self.view as! SKView? {
            if let scene = Losescreen(fileNamed: "Losescreen") {
                scene.scaleMode = .aspectFill
                scene.gvc = self
                view.presentScene(scene)
            }
        }
    }
}
