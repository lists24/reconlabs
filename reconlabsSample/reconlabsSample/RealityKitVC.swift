//
//  RealityKitVC.swift
//  reconlabsSample
//
//  Created by 크림버드공주 on 2023/05/27.
//

import SwiftUI


struct RealityKitVC : UIViewControllerRepresentable
{
    typealias UIViewControllerType = ARVC
    
    let arVC = ARVC.init()
    
    func makeUIViewController(context: Context) -> ARVC {
        
        return arVC
    }
    
    func updateUIViewController(_ uiViewController: ARVC, context: Context) {
        
    }
    
    func rotationX()
    {
        arVC.rotationX()
    }
    
    func rotationY()
    {
        arVC.rotationY()
    }
    
    func rotationZ()
    {
        arVC.rotationZ()
    }
    
    func screenShot(){
        arVC.screenShot()
    }
}
