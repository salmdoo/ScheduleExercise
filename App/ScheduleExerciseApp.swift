//
//  ScheduleExerciseApp.swift
//  ScheduleExercise
//
//  Created by Salmdo on 5/22/25.
//

import SwiftUI

@main
struct ScheduleExerciseApp: App {
    
    var body: some Scene {
        WindowGroup {
            let hTTPServiceImp = HTTPServiceImp(url: APIEndpoint.url)
            let repository = ScheduleGamesRepositoryHttpImp(serviceRequest: hTTPServiceImp)
            let localService = ScheduleGamesRepositoryLocalImp()
            
            let usecase = FetchScheduleGamesUsecase(repository: repository)
            let viewModel = ScheduleGamesViewModel(usecase: usecase)
            
            GameScheduleView(scheduleGamesVM: viewModel)
        }
    }
}
