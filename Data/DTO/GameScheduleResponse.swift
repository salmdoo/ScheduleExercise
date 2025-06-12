//
//  GameScheduleResponse.swift
//  ScheduleExercise
//
//  Created by Salmdo on 5/19/25.
//

struct GameScheduleResponse: Decodable {
    let defaultGameId: Int
    let team: TeamResponse
    let gameSections: [GameSectionResponse]
    
    enum CodingKeys: String, CodingKey {
        case defaultGameId = "DefaultGameId"
        case team = "Team"
        case gameSections = "GameSection"
    }
    
}
