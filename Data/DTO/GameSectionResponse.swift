//
//  GameSection.swift
//  ScheduleExercise
//
//  Created by Salmdo on 5/19/25.
//

struct GameSectionResponse: Decodable {
    let heading: String
    let games: [GameResponse]
    
    enum CodingKeys: String, CodingKey {
        case heading = "Heading"
        case games = "Game"
    }
}
