//
//  ScheduleGamesRepositoryHttpImp.swift
//  ScheduleExercise
//
//  Created by Salmdo on 5/20/25.
//

import Foundation
import Combine

struct ScheduleGamesRepositoryHttpImp: ScheduleGamesRepository {
    
    private var serviceRequest: ServiceRequest
    
    init(serviceRequest: ServiceRequest) {
        self.serviceRequest = serviceRequest
    }
    
    func fetchScheduleGames() -> AnyPublisher<GameSchedule, ServiceError> {
        serviceRequest.fetchData()
            .map { GameSchedule(from: $0) }
            .eraseToAnyPublisher()
    }
}
