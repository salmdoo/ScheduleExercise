//
//  TeamInfoView.swift
//  ScheduleExercise
//
//  Created by Salmdo on 5/22/25.
//

import SwiftUI

struct GameView: View {
    private let game: Game
    private let team: Team
    
    init(team: Team, game: Game) {
        self.game = game
        self.team = team
    }
    
    private let columns = [
        GridItem(.flexible(), alignment: .leading),
        GridItem(.flexible()),
        GridItem(.flexible(), alignment: .trailing)
    ]
    
    private let singleColumn = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: game.isByeGame ? singleColumn : columns) {
            if game.isByeGame {
                ByeGameView(game: game)
            } else if game.isGameHasScore {
                regularGameHasScoreView
            } else {
                regularGameHasRecordView
            }
        }
        .padding(EdgeInsets(top: Theme.Size.CGFloat10, leading: Theme.Size.CGFloat10, bottom: Theme.Size.CGFloat5, trailing: Theme.Size.CGFloat10))
    }
}

//Mark - GameView extention views
extension GameView {
    
    private var homeTeamIconUrl: String {
        game.isHome ? team.iconUrl : game.opponent?.iconUrl ?? ""
    }
    
    private var awayTeamIconUrl: String {
        game.isHome ? game.opponent?.iconUrl ?? "" : team.iconUrl
    }
    
    @ViewBuilder
    private var regularGameHasScoreView: some View {
        if game.isHome {
            TeamInfoScoreView(name: team.name, score: game.awayScore, note: game.datetime, alignment: .leading)
            TeamIconView(homeTeamIconUrl: homeTeamIconUrl, awayTeamIconUrl: awayTeamIconUrl, game: game)
            TeamInfoScoreView(name: game.opponent?.name ?? "", score: game.homeScore, note: game.type.value, alignment: .trailing)
        } else {
            TeamInfoScoreView(name: game.opponent?.name ?? "", score: game.awayScore, note: game.datetime, alignment: .leading)
            TeamIconView(homeTeamIconUrl: homeTeamIconUrl, awayTeamIconUrl: awayTeamIconUrl, game: game)
            TeamInfoScoreView(name: team.name, score: game.homeScore, note: game.type.value, alignment: .trailing)
        }
    }
    
    @ViewBuilder
    private var regularGameHasRecordView: some View {
        if game.isHome {
            TeamInfoRecordView(name: team.name, record: team.record, note: game.datetime, alignment: .leading)
            TeamIconView(homeTeamIconUrl: homeTeamIconUrl, awayTeamIconUrl: awayTeamIconUrl, game: game)
            TeamInfoRecordView(name: game.opponent?.name ?? "", record: game.opponent?.record ?? "", note: game.time, alignment: .trailing)
        } else {
            TeamInfoRecordView(name: game.opponent?.name ?? "", record: game.opponent?.record ?? "", note: game.datetime, alignment: .leading)
            TeamIconView(homeTeamIconUrl: homeTeamIconUrl, awayTeamIconUrl: awayTeamIconUrl, game: game)
            TeamInfoRecordView(name: team.name, record: team.record, note: game.time, alignment: .trailing)
        }
    }
}

struct TeamInfoScoreView: View {
    let name: String
    let score: String
    let note: String
    let alignment: HorizontalAlignment
    
    var body: some View {
        VStack(alignment: alignment, spacing: Theme.Size.CGFloat8) {
            Text(name)
                .font(Theme.Font.medium16)
            
            Text(score)
                .font(Theme.Font.semibold30)
                .padding(.top, Theme.Size.CGFloat4)
            Spacer()
            
            Text(note)
                .font(alignment == .trailing ? Theme.Font.regular14 : Theme.Font.regular13)
        }
    }
}

struct TeamIconView: View {
    let homeTeamIconUrl: String
    let awayTeamIconUrl: String
    let game: Game
    
    var body: some View {
        VStack(spacing: Theme.Size.CGFloat4) {
            HStack(spacing: Theme.Size.CGFloat4) {
                ImageView(url: homeTeamIconUrl, width: Theme.Size.CGFloat40, height: Theme.Size.CGFloat40)
                
                Text("@")
                    .font(Theme.Font.font16)
                    .foregroundColor(Theme.Color.gray)
                
                
                ImageView(url: awayTeamIconUrl, width: Theme.Size.CGFloat40, height: Theme.Size.CGFloat40)
            }
            
            Text(game.week)
                .font(Theme.Font.regular14)
                .foregroundColor(Theme.Color.gray)
        }
    }
}

struct TeamInfoRecordView: View {
    let name: String
    let record: String
    let note: String
    let alignment: HorizontalAlignment
    
    var body: some View {
        VStack(alignment: alignment, spacing: Theme.Size.CGFloat10) {
            Text(name)
                .font(Theme.Font.medium16)
            Spacer()
            Text(record)
                .font(Theme.Font.bold16)
                .foregroundColor(Theme.Color.gray)
            Spacer()
            Text(note)
                .font(alignment == .trailing ? Theme.Font.regular14 : Theme.Font.regular13)
        }
    }
}

struct ByeGameView: View {
    let game: Game
    
    var body: some View {
        VStack(alignment:.center, spacing: Theme.Size.CGFloat4) {
            Text(game.type.value)
                .font(Theme.Font.medium45)
                .foregroundColor(Theme.Color.gray)
            
            Text(game.week)
                .font(Theme.Font.regular18)
                .foregroundColor(Theme.Color.gray)
        }.frame(height: Theme.Size.CGFloat100)
    }
}

#Preview {
    GameView(team: Team.defaultValue(), game: Game.defaultValue())
}
