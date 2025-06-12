//
//  GameScheduleView.swift
//  ScheduleExercise
//
//  Created by Salmdo on 5/24/25.
//
import SwiftUI

struct GameScheduleView: View {
    
    var scheduleGamesVM: ScheduleGamesViewModel
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                if let errorMessage = scheduleGamesVM.errorMessage {
                    errorView(errorMessage: errorMessage)
                } else if scheduleGamesVM.loadingIndicator == .loading {
                    loadingView
                } else {
                    gameView
                }
            }
            .onAppear {
                scheduleGamesVM.fetchSchedule()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("SCHEDULE")
                        .font(.system(size: 23, weight: .medium))
                        .foregroundColor(.white)
                }
            }
            .toolbarBackground(Theme.Color.darkGreen, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
    

}

extension GameScheduleView {
    private var gameView: some View {
        List {
            ForEach(scheduleGamesVM.gameSchedule.gameSections, id: \.id) { gameSection in
                Section {
                    ForEach(gameSection.games, id: \.id) { game in
                        GameView(team: scheduleGamesVM.gameSchedule.team, game: game)
                            .overlay(rowSeparator, alignment: .bottom)
                    }
                } header: {
                    headerLabelView(text: gameSection.heading)
                }.listRowInsets(EdgeInsets())
                    .listRowSeparator(.hidden)
            }
        }
        .listStyle(.plain)
        .listRowInsets(EdgeInsets())
        .listRowSeparator(.hidden)
    }
    
    private func errorView(errorMessage: String) -> some View {
        Text(errorMessage)
    }
    
    private func headerLabelView(text: String) -> some View {
        Text(text)
            .font(Theme.Font.semibold14)
            .foregroundColor(Theme.Color.gray)
            .frame(height: Theme.Size.CGFloat30)
            .frame(maxWidth: .infinity)
            .background(Theme.Color.lightGray)
    }
    
    private var rowSeparator: some View {
        Rectangle()
            .frame(height: 1)
            .foregroundColor(Theme.Color.gray)
    }
    
    private var loadingView: some View {
        VStack(spacing: 5) {
            Text("Schedule is loading")
            Image(systemName: "goforward")
        }
    }
}

#Preview {
    let localRepository = ScheduleGamesRepositoryLocalImp()
    
    let usecase = FetchScheduleGamesUsecase(repository: localRepository)
    let viewModel = ScheduleGamesViewModel(usecase: usecase)
    
    GameScheduleView(scheduleGamesVM: viewModel)
}
