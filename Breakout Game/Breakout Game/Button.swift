import SpriteKit

class Button: SKSpriteNode {
    var action: () -> Void = {}

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.isUserInteractionEnabled = true
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        action()
    }
}
