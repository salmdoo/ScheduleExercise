//
//  ScheduleGamesService.swift
//  ScheduleExercise
//
//  Created by Salmdo on 5/19/25.
//

import Combine

protocol FetchScheduleGamesUsecase {
    func fetchData() -> AnyPublisher<GameScheduleResponse, ServiceError>
}
