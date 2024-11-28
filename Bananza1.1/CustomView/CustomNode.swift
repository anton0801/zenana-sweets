import SwiftUI
import SpriteKit

struct CBitMask {
    static let verticalBlocks: UInt32 = 0b1
    static let collision: UInt32 = 0b10
    static let horizontalBlocks: UInt32 = 0b100
}

class BlockNode: SKSpriteNode {
    var maxY: CGFloat = 295
    var maxX: CGFloat = 295
    var minX: CGFloat = 60
    var minY: CGFloat = 60
    init(imageOfBlock: String, position: CGPoint, zPosition: CGFloat, xScale: CGFloat, yScale: CGFloat, zRotation: CGFloat, categoryBitMask: UInt32, contactTestBitMask: UInt32, name: String) {
        let texture = SKTexture(imageNamed: imageOfBlock)
        super.init(texture: texture, color: .clear, size: texture.size())
        self.position = position
        self.zPosition = zPosition
        self.xScale = xScale
        self.yScale = yScale
        self.zRotation = zRotation
        self.physicsBody = SKPhysicsBody(rectangleOf: size)
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = true
        self.physicsBody?.categoryBitMask = categoryBitMask
        self.physicsBody?.collisionBitMask = CBitMask.collision
        self.physicsBody?.contactTestBitMask = contactTestBitMask
        self.name = name
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func movePurple(_ touches: Set<UITouch>, maxXPoint: CGFloat, minXPoint: CGFloat, SKNode: SKNode) -> Bool {
        var boolValue = false
        for touch in touches {
            let location = touch.location(in: SKNode)
            let touchLocation = touch.location(in: SKNode)
            if self.contains(touchLocation) {
                if location.x > 60, location.x < 298,location.x < maxXPoint, location.x > minXPoint {
                    self.position.x = location.x
                    if self.position.x > 290 {
                        boolValue = true
                    }
                }
            }
        }
        return boolValue
    }
        
        func moveHorizontal(_ touches: Set<UITouch>, maxXPoint: CGFloat, minXPoint: CGFloat, SKNode: SKNode) {
            for touch in touches {
                let location = touch.location(in: SKNode)
                let touchLocation = touch.location(in: SKNode)
                if self.contains(touchLocation) {
                    if self.size.width < 125 {
                        // location.x < maxXPoint, location.x > minXPoint
                        if location.x > 60, location.x < 298,location.x < maxXPoint, location.x > minXPoint {
                            self.position.x = location.x
                        }
                    } else {
                        //, location.x < (maxXPoint + 50), location.x > (minXPoint - 80)
                        if location.x > 90, location.x < 268, location.x < maxXPoint, location.x > minXPoint  {
                            self.position.x = location.x
                        }
                    }
                }
            }
        }
        
        func moveVertical(_ touches: Set<UITouch>, maxYPoint: CGFloat, minYPoint: CGFloat, SKNode: SKNode) {
            for touch in touches {
                let location = touch.location(in: SKNode)
                let touchLocation = touch.location(in: SKNode)
                if self.contains(touchLocation) {
                    if self.size.height < 95 {
                        //, location.y < maxYPoint, location.y > minYPoint
                        if location.y > 70, location.y < 268, location.y < maxYPoint, location.y > minYPoint {
                            //                        print(location.y)
                            //                        print(maxYPoint)
                            self.position.y = location.y
                        }
                    } else {
                        //, location.y < maxYPoint, location.y > minYPoint
                        if location.y > 60, location.y < 295, location.y < maxYPoint, location.y > minYPoint {
                            self.position.y = location.y
                        }
                    }
                }
            }
        }
    }
