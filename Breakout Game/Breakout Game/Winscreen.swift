import Foundation
import SpriteKit

class Winscreen: SKScene {
    
    var play: Button!
    var home: Button!
    
    var gvc: GameViewController!

       
    override func didMove(to view: SKView) {

        
        play = self.childNode(withName: "Play") as? Button
        play.action = {
            self.gvc.presentGameScreen()
        }
        
        home = self.childNode(withName: "home") as? Button
        home.action = {
            self.gvc.presentHomeScreen()
        }

   }
}
