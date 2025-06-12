//
//  Game.swift
//  ScheduleExercise
//
//  Created by Salmdo on 5/19/25.
//
import Foundation

struct Game {
    let id: Int
    let week: String
    let awayScore: String
    let homeScore: String
    let isHome: Bool
    let type: GameType
    let opponent: Team?
    private(set) var datetime: String
    let time: String
    
    init(id: Int, week: String, awayScore: String, homeScore: String, isHome: Bool, type: GameType, opponent: Team, datetime: String, time: String) {
        self.id = id
        self.week = week
        self.awayScore = awayScore
        self.homeScore = homeScore
        self.isHome = isHome
        self.type = type
        self.opponent = opponent
        self.datetime = datetime
        self.time = time
    }
    
    init(from response: GameResponse) {
        self.id = response.id
        self.week = response.week
        self.awayScore = response.awayScore ?? ""
        self.homeScore = response.homeScore ?? ""
        self.isHome = response.isHome
        self.type = GameType(rawValue: response.type) ?? .B
        self.opponent = response.opponent.map { Team(from: $0) }
        self.time = response.time ?? ""
        self.datetime = ""
        self.datetime = gameDateConverted(dateTimestamp: response.dateTimestamp)
        
    }
    
    private func gameDateConverted(dateTimestamp: String?) -> String {
        let isoFormatter = ISO8601DateFormatter()
        
        guard let dateTimestamp,
              let date = isoFormatter.date(from: dateTimestamp)
        else { return "" }
        
        let dateFormatter = DateFormatter()
        let localeFormat = DateFormatter.dateFormat(fromTemplate: "EEEdMMM", options: 0, locale: Locale.current)
        dateFormatter.dateFormat = localeFormat
        
        return dateFormatter.string(from: date)
    }
    
    var isGameHasScore: Bool { !(awayScore.isEmpty || homeScore.isEmpty) }
    var isByeGame: Bool { type == .B }
    
}

extension Game {
    static func defaultValue() -> Game {
        return Game(
            id: 2020091306,
            week: "Week 1",
            awayScore: "2",
            homeScore: "54",
            isHome: true,
            type: .F,
            opponent: Team.defaultValue(),
            datetime: "2020-09-13",
            time: "13:20 PM"
        )
    }
}
