//
//  FetchScheduleGamesUsecase.swift
//  ScheduleExercise
//
//  Created by Salmdo on 5/19/25.
//

import Combine

struct FetchScheduleGamesUsecase {
    private let repository: ScheduleGamesRepository
    
    init(repository: ScheduleGamesRepository) {
        self.repository = repository
    }
    
    func fetchData() -> AnyPublisher<GameSchedule, ServiceError> {
        repository.fetchScheduleGames()
    }
}
