//
//  GameSection.swift
//  ScheduleExercise
//
//  Created by Salmdo on 5/19/25.
//

import Foundation

struct GameSection: Identifiable {
    let id = UUID()
    let heading: String
    let games: [Game]
    
    init(heading: String, games: [Game]) {
        self.heading = heading
        self.games = games
    }
    
    init(from response: GameSectionResponse) {
        self.heading = response.heading
        self.games = response.games.map { Game(from: $0)}
    }
}
