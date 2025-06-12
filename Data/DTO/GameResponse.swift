//
//  Game.swift
//  ScheduleExercise
//
//  Created by Salmdo on 5/19/25.
//
import Foundation

struct GameResponse: Decodable, Identifiable {
    let id: Int
    let week: String
    let awayScore: String?
    let homeScore: String?
    let isHome: Bool
    let type: String
    let opponent: TeamResponse?
    let dateTimestamp: String?
    let time: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case week = "Week"
        case awayScore = "AwayScore"
        case homeScore = "HomeScore"
        case isHome = "IsHome"
        case type = "Type"
        case opponent = "Opponent"
        case date = "Date"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        week = try container.decode(String.self, forKey: .week)
        awayScore = try container.decodeIfPresent(String.self, forKey: .awayScore)
        homeScore = try container.decodeIfPresent(String.self, forKey: .homeScore)
        isHome = try container.decode(Bool.self, forKey: .isHome)
        type = try container.decode(String.self, forKey: .type)
        opponent = try container.decodeIfPresent(TeamResponse.self, forKey: .opponent)
        
        if let dateContainer = try? container.nestedContainer(keyedBy: DateCodingKeys.self, forKey: .date) {
            dateTimestamp = try dateContainer.decode(String.self, forKey: .timestamp)
            time = try dateContainer.decode(String.self, forKey: .time)
        } else {
            dateTimestamp = nil
            time = nil
        }
    }
    
    private enum DateCodingKeys: String, CodingKey {
        case timestamp = "Timestamp"
        case time = "Time"
    }
    
}
