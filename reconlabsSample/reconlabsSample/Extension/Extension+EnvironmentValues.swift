//
//  Extension+EnvironmentValues.swift
//  reconlabsSample
//
//  Created by 크림버드공주 on 2023/05/26.
//

import SwiftUI

@available(iOS 14.0,*)
extension EnvironmentValues
{
    var dismissable : () -> Void
    {
        return dismissAction
    }
    
    private func dismissAction()
    {
        if #available(iOS 15, *)
        {
            dismiss()
        }
        else
        {
            presentationMode.wrappedValue.dismiss()
        }
    }
}
