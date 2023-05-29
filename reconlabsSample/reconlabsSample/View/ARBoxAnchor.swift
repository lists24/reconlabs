//
//  ARBoxAnchor.swift
//  reconlabsSample
//
//  Created by 크림버드공주 on 2023/05/26.
//

import ARKit
import SceneKit

class ARBoxAnchor : ARAnchor
{
    init(_ column : SIMD4<Float> = [1,0,0,0],
         _ column1 : SIMD4<Float> = [0,1,0,0],
         _ column2 : SIMD4<Float> = [0,0,1,0],
         _ column3 : SIMD4<Float> = [0,0,0,1])
    {
        
        let transform = simd_float4x4(columns: (column,column1,column2,column3))
        let boxAnchor = ARAnchor.init(name: "Box Anchor", transform: transform)
        
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
