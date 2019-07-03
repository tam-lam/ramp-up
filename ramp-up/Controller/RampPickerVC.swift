//
//  RampPickerVC.swift
//  ramp-up
//
//  Created by Graphene on 20/6/19.
//  Copyright © 2019 tam-lam. All rights reserved.
//

import UIKit
import SceneKit

class RampPickerVC: UIViewController {
    
    var sceneView : SCNView!
    var size : CGSize!
    init(size: CGSize){
        super.init(nibName: nil, bundle: nil)
        self.size = size
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.frame = CGRect(origin: CGPoint.zero, size: size)
        sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        
        view.insertSubview(sceneView, at: 0)
        preferredContentSize = size

        let scene = SCNScene(named: "art.scnassets/ramps.scn")!
        sceneView.scene = scene
        
        let camera = SCNCamera()
        camera.usesOrthographicProjection = true
        scene.rootNode.camera = camera
        
        let rotate = SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: CGFloat(0.01 * Double.pi), z: 0, duration: 0.1))
        
        var obj = SCNScene(named: "art.scnassets/pipe.dae")
        var node = obj?.rootNode.childNode(withName: "pipe",recursively: true )
        node?.runAction(rotate)
        node?.scale = SCNVector3Make(0.0012, 0.0012, 0.0012)
        node?.position = SCNVector3Make(0, 0.7, 0)
        scene.rootNode.addChildNode(node!)
        
        obj = SCNScene(named: "art.scnassets/pyramid.dae")
        node = obj?.rootNode.childNode(withName: "pyramid",recursively: true )
        node?.runAction(rotate)
        node?.scale = SCNVector3Make(0.0032, 0.0032, 0.0032)
        node?.position = SCNVector3Make(0, 0.3, 0)
        scene.rootNode.addChildNode(node!)
        
        obj = SCNScene(named: "art.scnassets/quarter.dae")
        node = obj?.rootNode.childNode(withName: "quarter",recursively: true )
        node?.runAction(rotate)
        node?.scale = SCNVector3Make(0.0032, 0.0032, 0.0032)
        node?.position = SCNVector3Make(0, -0.2, 0)
        scene.rootNode.addChildNode(node!)

        
    }
    
    
}
