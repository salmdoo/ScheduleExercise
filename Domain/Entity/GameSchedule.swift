//
//  GameSchedule.swift
//  ScheduleExercise
//
//  Created by Salmdo on 5/19/25.
//

struct GameSchedule {
    let defaultGameId: Int
    let team: Team
    let gameSections: [GameSection]
    
    init() {
        defaultGameId = -1
        team = Team(triCode: "", name: "", record: "")
        gameSections = []
    }
    
    init(defaultGameId: Int, team: Team, gameSections: [GameSection]) {
        self.defaultGameId = defaultGameId
        self.team = team
        self.gameSections = gameSections
    }
    
    init(from response: GameScheduleResponse) {
        self.defaultGameId = response.defaultGameId
        self.team = Team(from: response.team)
        self.gameSections = response.gameSections.map { GameSection(from: $0) }
    }

}
