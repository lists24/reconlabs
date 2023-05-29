//
//  ARVC.swift
//  reconlabsSample
//
//  Created by 크림버드공주 on 2023/05/27.
//

import UIKit
import ARKit

class ARVC: UIViewController {
    
    @IBOutlet weak var sceneView: ARSCNView!
    
    let config = ARWorldTrackingConfiguration.init()
    
    var isAnimationStart = false
    
    private var imageVM = ImageDataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // autoenablesDefaultLighting : 자동으로 조명값을 만들어 준다.
        sceneView.delegate = self
//        sceneView.debugOptions = [.showFeaturePoints , .showWorldOrigin]
        sceneView.autoenablesDefaultLighting = true
        
        config.planeDetection = [.horizontal , .vertical]
        config.isAutoFocusEnabled = true
        config.isLightEstimationEnabled = true
        config.worldAlignment = .gravity
        
        sceneView.session.run(config)
  
        // SCNBox 파라미터 단위는 m이다.
        let boxNode = SCNNode()
        boxNode.name = "BOX"
        boxNode.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
        boxNode.position = SCNVector3(0.1, 0.1, -0.1)
        
        let material = SCNMaterial.init()
        material.diffuse.contents = UIColor.red
        material.locksAmbientWithDiffuse = true
        
        boxNode.geometry?.materials = [material]
        
        
        sceneView.scene.rootNode.addChildNode(boxNode)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
    
    func rotationX()
    {
        if isAnimationStart
        {
            return
        }
        
        self.isAnimationStart = true
        
        let box = self.sceneView.scene.rootNode.childNode(withName: "BOX", recursively: false)
        let animation : CABasicAnimation = CABasicAnimation.init(keyPath: "rotation")
        animation.toValue = NSValue(scnVector4: SCNVector4Make(1, 0, 0, Float.pi * 2))
        animation.duration = 1
        animation.repeatCount = 1
        animation.delegate = self
        
        box?.addAnimation(animation, forKey: nil)
    }
    
    func rotationY()
    {
        if isAnimationStart
        {
            return
        }
        
        self.isAnimationStart = true
        
        let box = self.sceneView.scene.rootNode.childNode(withName: "BOX", recursively: false)
        let animation : CABasicAnimation = CABasicAnimation.init(keyPath: "rotation")
        animation.toValue = NSValue(scnVector4: SCNVector4Make(0, 1, 0, Float.pi * 2))
        animation.duration = 1
        animation.repeatCount = 1
        animation.delegate = self
        
        box?.addAnimation(animation, forKey: nil)
    }
    
    func rotationZ()
    {
        if isAnimationStart
        {
            return
        }
        
        self.isAnimationStart = true
        
        let box = self.sceneView.scene.rootNode.childNode(withName: "BOX", recursively: false)
        let animation : CABasicAnimation = CABasicAnimation.init(keyPath: "rotation")
        animation.toValue = NSValue(scnVector4: SCNVector4Make(0, 0, 1, Float.pi * 2))
        animation.duration = 1
        animation.repeatCount = 1
        animation.delegate = self
        
        box?.addAnimation(animation, forKey: nil)
    }
    
    func screenShot()
    {
//        guard let containerView = self.sceneView.superview,let containerSuperView = containerView.superview else { return }
//        let renderer = UIGraphicsImageRenderer(bounds: containerView.bounds)
//
//        let image =  renderer.image{
//            context in
//
//            containerSuperView.layer.render(in: context.cgContext)
//        }
        let image = sceneView.snapshot()
        imageVM.saveData(image: image)
        
    }
}

extension ARVC : CAAnimationDelegate
{
    // 해당 이벤트가 들어오는데 Delay가 발생함 - 연속으로 클릭시 들어오기전에 동작이 될수 있다.
    func animationDidStart(_ anim: CAAnimation) {
        self.isAnimationStart = true
    }
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.isAnimationStart = false
    }
}

extension ARVC : ARSCNViewDelegate
{
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        DispatchQueue.main.async {
            
            // hitTest Deprecated
            guard let query = self.sceneView.raycastQuery(from: self.sceneView.center, allowing: .estimatedPlane, alignment: .any) else { return }
    
            guard let _node = self.sceneView.scene.rootNode.childNode(withName: "BOX", recursively: false) else { return }
            
            let result : [ARRaycastResult] = self.sceneView.session.raycast(query)
            
            guard let rayCast : ARRaycastResult = result.first else { return }
            
            let pos = rayCast.worldTransform.columns.3
            
            _node.simdPosition = simd_float3(pos.x, pos.y, -0.5)
        }
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
       
        // 현재 카메라의 중앙으로 계속 따라오도록 한다.
        // 버벅임이 심하고 위치 고정의 기준을 잡기 어려움
//        DispatchQueue.main.async {
//            guard let query = self.sceneView.raycastQuery(from: self.sceneView.center, allowing: .estimatedPlane, alignment: .any) else { return }
//
//            guard let _node = self.sceneView.scene.rootNode.childNode(withName: "BOX", recursively: false) else { return }
//
//            let result : [ARRaycastResult] = self.sceneView.session.raycast(query)
//
//            guard let rayCast : ARRaycastResult = result.first else { return }
//
//            let pos = rayCast.worldTransform.columns.3
//
//            _node.simdPosition = simd_float3(pos.x, pos.y, -0.5)
//        }
    }
}
