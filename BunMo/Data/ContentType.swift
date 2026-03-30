//
//  ContentType.swift
//  BunMo
//
//  Created by Joon on 3/28/26.
//

import Foundation
import SwiftUI

enum ContentType: String, CaseIterable  {
    case eat
    case exercise
    case hangout
    case study
    
    var displayName: String {
        switch self {
        case .eat: return "밥먹자"
        case .hangout: return "놀자"
        case .exercise: return "운동하자"
        case .study: return "공부하자"
        }
    }
    
    var icon: String {
        switch self {
        case .eat: return "fork.knife"
        case .hangout: return "gamecontroller.fill"
        case .exercise: return "figure.run"
        case .study: return "book.fill"
        }
    }

    var color: Color {
        switch self {
            
        case .eat: return .red
        case .hangout: return .green
        case .exercise: return .blue
        case .study: return .yellow
        }
    }
    
}
