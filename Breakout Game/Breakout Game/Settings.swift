import Foundation
import SpriteKit

class Settings: SKScene {
    
    var homeButton2: Button!
    
    var gvc: GameViewController!
       
    override func didMove(to view: SKView) {
        homeButton2 = self.childNode(withName: "Home2") as? Button

        homeButton2.action = {
            self.gvc.presentHomeScreen()
        }
     
   }
}
