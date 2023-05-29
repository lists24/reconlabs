//
//  MyARView.swift
//  reconlabsSample
//
//  Created by 크림버드공주 on 2023/05/26.
//

import SwiftUI

struct MyARView : View
{
    @Environment(\.dismissable) var dismiss
    
//    let realityView = RealityView.init()
    let realityVC = RealityKitVC.init()
    
    var body: some View
    {
        ZStack
        {
            realityVC.ignoresSafeArea()
            
            VStack{
                HStack{
                    Button("Back", action: { dismiss() })
                    .frame(width: 100, height: 60)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding([.top,.leading],10)
                    
                    Spacer()
                }
                
                
                Spacer()
                HStack
                {
                    Button("x-axis rotation", action: {
                        self.realityVC.rotationX()
                    })
                    Button("y-axis rotation", action: {
                        self.realityVC.rotationY()
                    })
                    Button("z-axis rotation", action: {
                        self.realityVC.rotationZ()
                    })
                }
                
                Button(action: {
                    self.realityVC.screenShot()
                })
                {
                    Image("CameraIcon")
                }
                .foregroundColor(.white)
                
            }
        }
        
    }
}
