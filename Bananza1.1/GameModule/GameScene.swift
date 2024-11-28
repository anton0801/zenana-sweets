import SwiftUI
import SpriteKit

class GameSpriteKit: SKScene, SKPhysicsContactDelegate, ObservableObject {
    var purpleBlock: BlockNode?
    var smallHorizontalGrayBlock: BlockNode?
    var horizontalGrayBlock: BlockNode?
    var smallVerticalGrayBlock: BlockNode?
    var verticalGrayBlock: BlockNode?
    var isWin = false
    var isLose = false
    var numberOfMoves = 5
    let randomNumber = Int.random(in: 0...2)
    
    func setPositionWith(name: String) -> CGPoint {
        let pointDictionary = ["smallHorizontalGrayBlock": CGPoint(x: size.width / 6, y: size.height / 2.5),
                           "horizontalGrayBlock":  CGPoint(x: size.width / 3.9, y: size.height / 1.09),
                           "smallVerticalGrayBlock": CGPoint(x: size.width / 1.45, y: size.height / 1.70),
                           "verticalGrayBlock": CGPoint(x: size.width / 2, y: size.height / 1.8)]
        
        let pointDictionary2 = ["smallHorizontalGrayBlock": CGPoint(x: size.width / 6, y: size.height / 3.5),
                           "horizontalGrayBlock":  CGPoint(x: size.width / 1.4, y: size.height / 1.09),
                           "smallVerticalGrayBlock": CGPoint(x: size.width / 1.45, y: size.height / 1.70),
                           "verticalGrayBlock": CGPoint(x: size.width / 2, y: size.height / 2.29)]
        
        let pointDictionary3 = ["smallHorizontalGrayBlock": CGPoint(x: size.width / 6, y: size.height / 1.34),
                           "horizontalGrayBlock":  CGPoint(x: size.width / 3.90, y: size.height / 1.09),
                           "smallVerticalGrayBlock": CGPoint(x: size.width / 1.6, y: size.height / 1.21),
                           "verticalGrayBlock": CGPoint(x: size.width / 2.3, y: size.height / 1.59)]
        
        let arrayOfDictionary: [[String: CGPoint]] = [pointDictionary, pointDictionary2, pointDictionary3]
        return arrayOfDictionary[randomNumber][name] ?? CGPoint(x: 0, y: 0)
    }
    func winGame(_ touches: Set<UITouch>) {
        if let test = (purpleBlock?.movePurple(touches,
                                          maxXPoint: purpleBlock?.maxX ?? 0,
                                          minXPoint: purpleBlock?.minX ?? 0,
                                               SKNode: self)) {
            isWin = test
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
             numberOfMoves = numberOfMoves - 1
             if numberOfMoves == 0 {
                 isLose = true
             }
     }
    
    func didBegin(_ contact: SKPhysicsContact) {
        var contactA: SKPhysicsBody
        var contactB: SKPhysicsBody
        
        if contact.bodyA.categoryBitMask > contact.bodyB.categoryBitMask {
            contactA = contact.bodyA
            contactB = contact.bodyB
        } else {
            contactA = contact.bodyB
            contactB = contact.bodyA
        }
        
        if contactB.categoryBitMask == CBitMask.verticalBlocks && contactA.categoryBitMask == CBitMask.horizontalBlocks {
            if let node = self.childNode(withName: contactA.node?.name ?? "") as? BlockNode {
                print("Найден спрайт с именем: \(node.name ?? "без имени")")
                if node.physicsBody?.categoryBitMask == CBitMask.horizontalBlocks {
                    node.maxX = node.position.x
                    let half = 295 - (node.size.width) //195
                    if node.position.x <= half {
                        node.maxX = node.position.x
                        node.minX = 60
                    } else {
                        node.maxX = 295
                        node.minX = node.position.x
                    }
                }
                
             
            }
            
            if let node = self.childNode(withName: contactB.node?.name ?? "") as? BlockNode {
                if node.physicsBody?.categoryBitMask == CBitMask.verticalBlocks {
                    let half = 295 - (node.size.height) //195
                    if node.position.y >= half {
                        node.maxY = node.position.y
                        node.minY = 60
                    } else {
                        node.maxY = 295
                        node.minY = node.position.y
                    }
                }
            }
        }
    }
    
    func didEnd(_ contact: SKPhysicsContact) {
        var contactA: SKPhysicsBody
        var contactB: SKPhysicsBody
        
        if contact.bodyA.categoryBitMask > contact.bodyB.categoryBitMask {
            contactA = contact.bodyA
            contactB = contact.bodyB
        } else {
            contactA = contact.bodyB
            contactB = contact.bodyA
        }
        
        if contactB.categoryBitMask == CBitMask.verticalBlocks && contactA.categoryBitMask == CBitMask.horizontalBlocks {
            if let node = self.childNode(withName: contactA.node?.name ?? "") as? BlockNode {
                print("Найден спрайт с именем: \(node.name ?? "без имени")")
                if node.physicsBody?.categoryBitMask == CBitMask.horizontalBlocks {
                    node.maxX = 298
                    node.minX = 60
                }
            }
            
            if let node = self.childNode(withName: contactB.node?.name ?? "") as? BlockNode {
                if node.physicsBody?.categoryBitMask == CBitMask.verticalBlocks {
                    node.maxY = 295
                    node.minY = 60
                }
            }
        }
//        checkForMoves()
    }
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        scene?.size = CGSize(width: 357, height: 357)
        
        purpleBlock = BlockNode(imageOfBlock: "purpleBlock",
                                position: CGPoint(x: size.width / 6, y: size.height / 1.73),
                                zPosition: 10,
                                xScale: BlockSize.purpleXScale.rawValue,
                                yScale: BlockSize.purpleYScale.rawValue,
                                zRotation: 0,
                                categoryBitMask: CBitMask.horizontalBlocks,
                                contactTestBitMask: CBitMask.verticalBlocks,
                                name: "purpleBlock")
        
        
        horizontalGrayBlock = BlockNode(imageOfBlock: "grayBlock",
                                        position: setPositionWith(name: "horizontalGrayBlock"),
                                        zPosition: 10,
                                        xScale: BlockSize.horizontalBlockXScale.rawValue,
                                        yScale: BlockSize.horizontalBlockYScale.rawValue,
                                        zRotation: 0,
                                        categoryBitMask: CBitMask.horizontalBlocks,
                                        contactTestBitMask: CBitMask.verticalBlocks,
                                        name: "horizontalGrayBlock")
        //setPosition(name: name)
        smallHorizontalGrayBlock = BlockNode(imageOfBlock: "grayBlock",
                                        position: setPositionWith(name: "smallHorizontalGrayBlock"),
                                        zPosition: 10,
                                        xScale: BlockSize.smallBlockXScale.rawValue,
                                        yScale: BlockSize.smallBlockYScale.rawValue,
                                        zRotation: 0,
                                        categoryBitMask: CBitMask.horizontalBlocks,
                                        contactTestBitMask: CBitMask.verticalBlocks,
                                        name: "smallHorizontalGrayBlock")
        
        smallVerticalGrayBlock = BlockNode(imageOfBlock: "grayBlock",
                                           position: setPositionWith(name: "smallVerticalGrayBlock"),
                                           zPosition: 10,
                                           xScale: BlockSize.smallBlockXScale.rawValue,
                                           yScale: BlockSize.smallBlockYScale.rawValue,
                                           zRotation: CGFloat.pi / 2,
                                           categoryBitMask: CBitMask.verticalBlocks,
                                           contactTestBitMask: CBitMask.horizontalBlocks,
                                           name: "smallVerticalGrayBlock")
        
        verticalGrayBlock = BlockNode(imageOfBlock: "grayBlock",
                                      position: setPositionWith(name: "verticalGrayBlock"),
                                           zPosition: 10,
                                      xScale: 0.42,
                                      yScale: 0.5,
                                           zRotation: CGFloat.pi / 2,
                                           categoryBitMask: CBitMask.verticalBlocks,
                                           contactTestBitMask: CBitMask.horizontalBlocks,
                                           name: "verticalGrayBlock")

        addChild(horizontalGrayBlock!)
        addChild(smallHorizontalGrayBlock!)
        addChild(purpleBlock!)
        addChild(smallVerticalGrayBlock!)
        addChild(verticalGrayBlock!)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let _ = purpleBlock?.moveHorizontal(touches,
                                    maxXPoint: purpleBlock?.maxX ?? 0,
                                    minXPoint: purpleBlock?.minX ?? 0,
                                    SKNode: self)
        winGame(touches)
        
        smallHorizontalGrayBlock?.moveHorizontal(touches,
                                            maxXPoint: smallHorizontalGrayBlock?.maxX ?? 0,
                                            minXPoint: smallHorizontalGrayBlock?.minX ?? 0,
                                            SKNode: self)
        
        horizontalGrayBlock?.moveHorizontal(touches,
                                            maxXPoint: horizontalGrayBlock?.maxX ?? 0,
                                            minXPoint: horizontalGrayBlock?.minX ?? 0,
                                            SKNode: self)
        
        smallVerticalGrayBlock?.moveVertical(touches,
                                             maxYPoint: smallVerticalGrayBlock?.maxY ?? 0,
                                             minYPoint: smallVerticalGrayBlock?.minY ?? 0,
                                             SKNode: self)
        
        verticalGrayBlock?.moveVertical(touches,
                                             maxYPoint: verticalGrayBlock?.maxY ?? 0,
                                             minYPoint: verticalGrayBlock?.minY ?? 0,
                                             SKNode: self)
    }
}
