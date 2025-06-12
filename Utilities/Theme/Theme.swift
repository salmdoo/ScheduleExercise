//
//  Theme.swift
//  ScheduleExercise
//
//  Created by Salmdo on 5/22/25.
//

import SwiftUI

enum Theme {
    enum Font {
        static let bold16 = SwiftUI.Font.system(size: 16, weight: .bold)
        static let semibold14 = SwiftUI.Font.system(size: 14, weight: .semibold)
        static let semibold30 = SwiftUI.Font.system(size: 30, weight: .semibold)
        static let medium16 = SwiftUI.Font.system(size: 16, weight: .medium)
        static let medium23 =  SwiftUI.Font.system(size: 23, weight: .medium)
        static let regular14 = SwiftUI.Font.system(size: 14, weight: .regular)
        static let regular13 = SwiftUI.Font.system(size: 13, weight: .regular)
        static let font13 = SwiftUI.Font.system(size: 13)
        static let font16 = SwiftUI.Font.system(size: 16)
        static let medium45 = SwiftUI.Font.system(size: 45, weight: .medium)
        static let regular18 = SwiftUI.Font.system(size: 18, weight: .regular)
    }
    
    enum Color {
        static let black = SwiftUI.Color.black
        static let gray = SwiftUI.Color(hex: "#999999")
        static let lightGray = SwiftUI.Color(hex: "#F3F3F2")
        static let darkGreen = SwiftUI.Color(hex: "#203731")
    }
    
    enum Size {
        static let CGFloat40: CGFloat = 40
        static let CGFloat140: CGFloat = 140
        static let CGFloat4: CGFloat = 4
        static let CGFloat16: CGFloat = 16
        static let CGFloat30: CGFloat = 30
        static let CGFloat100: CGFloat = 100
        static let CGFloat10: CGFloat = 10
        static let CGFloat5: CGFloat = 5
        static let CGFloat8: CGFloat = 8
        static let CGFloat12: CGFloat = 12
    }
} 
