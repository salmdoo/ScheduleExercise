//
//  ScheduleGamesRepository.swift
//  ScheduleExercise
//
//  Created by Salmdo on 6/11/25.
//
import Combine

protocol ScheduleGamesRepository {
    func fetchScheduleGames() -> AnyPublisher<GameSchedule, ServiceError>
}
