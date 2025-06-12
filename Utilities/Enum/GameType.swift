//
//  GameType.swift
//  ScheduleExercise
//
//  Created by Salmdo on 5/24/25.
//

enum GameType {
    case S
    case F
    case B
    
    var value: String {
        switch self {
        case .S: "SCHEDULED"
        case .F: "FINAL"
        case .B: "BYE"
        }
    }
    
    init?(rawValue: String) {
        switch rawValue {
        case "S": self = .S
        case "F": self = .F
        case "B": self = .B
        default: return nil
        }
    }
}
