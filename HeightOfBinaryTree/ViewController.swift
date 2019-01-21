//
//  ViewController.swift
//  HeightOfBinaryTree
//
//  Created by MUKUL on 22/01/19.
//  Copyright © 2019 CoderWork. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let node = self.createBinaryTree()
        let treeHeight = self.getTreeHeightWithNode(rootNode: node)
        print("Tree Height is \(treeHeight)")
    }
    
    
    
    func getTreeHeightWithNode(rootNode:Node) -> Int {
        
        func getLeftSubTreeHeight(ltNode:Node) ->Int {
            if ltNode.leftNode != nil {
                return 1 + getLeftSubTreeHeight(ltNode: ltNode.leftNode!)
            }
            else {
                return 0
            }
        }
        
        func getRightSubTreeHeight(rtNode:Node) ->Int {
            if rtNode.rightNode != nil {
                return 1 + getRightSubTreeHeight(rtNode: rtNode.rightNode!)
            }
            else {
                return 0
            }
        }
        let leftSubHeight = getLeftSubTreeHeight(ltNode: rootNode)
        let rightSubHeight = getRightSubTreeHeight(rtNode: rootNode)
        let mxHeight = max(leftSubHeight, rightSubHeight)
        let totalHeight = mxHeight + 1 //1 added for the connecting edge for the root to the left child or the right child
        return totalHeight
    }
    
}


//Tree Node DataStructure
class Node {
    var data:String?
    var leftNode:Node?
    var rightNode:Node?
}


//Create Binary Tree
extension ViewController {
    
    func createBinaryTree() -> Node {
        //Left SubTree
        let lftLft = Node()
        lftLft.data = "D"
        let rtLeft = Node()
        rtLeft.data = "F"
        let nn = Node()
        nn.data = "G"
        let rtNode = Node()
        rtNode.data = "E"
        rtNode.leftNode = rtLeft
        rtNode.rightNode = nn
        let ltNode = Node()
        ltNode.data = "B"
        ltNode.leftNode = lftLft
        ltNode.rightNode = rtNode
        let newRight = Node()
        newRight.data = "C"
        
        //Tree Root and Childrens
        let rootNode = Node()
        rootNode.data = "A"
        rootNode.leftNode = ltNode
        rootNode.rightNode = newRight
        return rootNode
    }
}

