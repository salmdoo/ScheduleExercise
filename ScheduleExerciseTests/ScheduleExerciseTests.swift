//
//  ScheduleExerciseTests.swift
//  ScheduleExerciseTests
//
//  Created by Salmdo on 5/22/25.
//

import Testing
import Combine
@testable import ScheduleExercise

struct ScheduleExerciseTests {
    
    // MARK: - Test Properties
    private var cancellables = Set<AnyCancellable>()
    let jsonString = """
    {
        "DefaultGameId": 2023091000,
        "Team": {
            "TriCode": "GB",
            "Name": "PACKERS",
            "Record": "8-9"
        },
        "GameSection": [
            {
                "Heading": "REGULAR SEASON",
                "Game": [
                    {
                        "Id": 2023091000,
                        "Week": "Week 1",
                        "AwayScore": "38",
                        "HomeScore": "20",
                        "IsHome": true,
                        "Type": "F",
                        "Date": {
                            "Timestamp": "2023-09-10T17:00:00Z",
                            "Time": "1:00 PM"
                        },
                        "Opponent": {
                            "TriCode": "CHI",
                            "Name": "BEARS",
                            "Record": "7-10"
                        }
                    }
                ]
            }
        ]
    }
    """
    
    // MARK: - Test Cases
    
    @Test func testFetchScheduleSuccess() {
        // Given
        let mockService = MockScheduleGamesService()
        
        let viewModel = ScheduleGamesViewModel(scheduleGamesService: mockService)
        let expectedSchedule = GameSchedule(
            defaultGameId: 2023091000,
            team: Team(triCode: "GB", name: "PACKERS", record: "8-9"),
            gameSections: [
                GameSection(
                    heading: "REGULAR SEASON",
                    games: [
                        Game(
                            id: 2023091000,
                            week: "Week 1",
                            awayScore: "38",
                            homeScore: "20",
                            isHome: true,
                            type: .F,
                            opponent: Team(triCode: "CHI", name: "BEARS", record: "7-10"),
                            datetime: "2023-09-10",
                            time: "1:00 PM"
                        )
                    ]
                )
            ]
        )
        mockService.jsonString = jsonString
        
        // When
        viewModel.fetchSchedule()
        
        // Then
        #expect(viewModel.loadingIndicator == .finished)
        #expect(viewModel.errorMessage == nil)
        #expect(viewModel.gameSchedule.defaultGameId == expectedSchedule.defaultGameId)
        #expect(viewModel.gameSchedule.team.triCode == expectedSchedule.team.triCode)
        #expect(viewModel.gameSchedule.gameSections.first?.games.first?.id == expectedSchedule.gameSections.first?.games.first?.id)
    }
    
    @Test func testFetchScheduleFailureInvalidURL() {
        // Given
        let mockService = MockScheduleGamesService()
        mockService.shouldFailInvalidURL = true
        let viewModel = ScheduleGamesViewModel(scheduleGamesService: mockService)
        
        // When
        viewModel.fetchSchedule()
        
        // Then
        #expect(viewModel.loadingIndicator == .finished)
        #expect(viewModel.errorMessage == ServiceError.invalidURL.message)
    }
}
