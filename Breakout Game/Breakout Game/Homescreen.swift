import Foundation
import SpriteKit

class Homescreen: SKScene {
    
    var playButton: Button!
    var settingsButton: Button!
    
    var gvc: GameViewController!
       
    override func didMove(to view: SKView) {
        playButton = self.childNode(withName: "playButton") as? Button

        playButton.action = {
            self.gvc.presentGameScreen()
        }
        
        settingsButton = self.childNode(withName: "settingsButton") as? Button
        
        settingsButton.action = {
            self.gvc.presentSettingsScreen()
        }

   }
}
