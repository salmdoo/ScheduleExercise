//
//  ScheduleGamesViewModel.swift
//  ScheduleExercise
//
//  Created by Salmdo on 5/20/25.
//

import Combine
import Observation

@Observable
class ScheduleGamesViewModel {
    var gameSchedule: GameSchedule
    var errorMessage: String?
    var loadingIndicator: ScheduleGameLoadingStatus
    
    private var usecase: FetchScheduleGamesUsecase
    private var cancellables = Set<AnyCancellable>()
    
    init(usecase: FetchScheduleGamesUsecase) {
        self.usecase = usecase
        self.loadingIndicator = .none
        self.gameSchedule = GameSchedule()
        self.errorMessage = nil
    }
    
    func fetchSchedule() {
        self.loadingIndicator = .loading
        usecase.fetchData()
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.errorMessage = error.message
                    self?.loadingIndicator = .finished
                }
            }, receiveValue: { [weak self] response in
                self?.gameSchedule = response
                self?.loadingIndicator = .finished
                self?.errorMessage = nil
            })
            .store(in: &cancellables)
    }
}
