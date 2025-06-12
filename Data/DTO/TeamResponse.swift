//
//  Team.swift
//  ScheduleExercise
//
//  Created by Salmdo on 5/19/25.
//

struct TeamResponse: Decodable {
    let triCode: String
    let name: String
    let record: String
    
    enum CodingKeys: String, CodingKey {
        case triCode = "TriCode"
        case name = "Name"
        case record = "Record"
    }
}
