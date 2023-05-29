//
//  ARView.swift
//  reconlabsSample
//
//  Created by 크림버드공주 on 2023/05/25.
//

import Foundation
import ARKit
import SceneKit

class ARView : UIViewController
{
    var arView : ARSCNView { return self.view as! ARSCNView }
    
    override func loadView() {
        self.view = ARSCNView.init(frame: .zero)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arView.delegate = self
        arView.autoenablesDefaultLighting = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARWorldTrackingConfiguration.init()
        arView.session.run(configuration)
        arView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        arView.session.pause()
    }
}

extension ARView : ARSCNViewDelegate
{
    func sessionWasInterrupted(_ session: ARSession) {
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        
    }
    
    func session(_ session: ARSession, cameraDidChangeTrackingState camera: ARCamera) {
        
    }
}

class ARBoxAnchor : ARAnchor
{
    init(column0: SIMD4<Float> = [1, 0, 0, 0],
            column1: SIMD4<Float> = [0, 1, 0, 0],
            column2: SIMD4<Float> = [0, 0, 1, 0],
            column3: SIMD4<Float> = [0, 0, 0, 1])
    {
        let transform = simd_float4x4(columns: (column0,
                                                        column1,
                                                        column2,
                                                        column3))
        let boxAnchor = ARAnchor(name: "Box Anchor",
                                      transform: transform)
        super.init(anchor: boxAnchor)
    }
    
    required init(anchor: ARAnchor) {
            super.init(anchor: anchor)
        }
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            fatalError("Hasn't been implemented yet...")
        }
}
