//
//  SideMenuViewModel.swift
//  NTTTestiOS
//
//  Created by Jesus Ervin Chapi Suyo on 7/11/23.
//

import Foundation
import SwiftUI

enum SideMenuViewModel: Int, CaseIterable {
    case logout
    
    var title: String {
        switch self {
            case .logout: return "Logout"
        }
    }
    
    var imageName: String {
        switch self {
            case .logout: return "arrow.left.square"
        }
    } 
}
