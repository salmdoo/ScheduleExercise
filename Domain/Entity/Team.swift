//
//  Team.swift
//  ScheduleExercise
//
//  Created by Salmdo on 5/19/25.
//

struct Team {
    let triCode: String
    let name: String
    let record: String
    
    init(triCode: String, name: String, record: String) {
        self.triCode = triCode
        self.name = name
        self.record = record
    }
    
    init(from response: TeamResponse) {
        self.triCode = response.triCode
        self.name = response.name
        self.record = response.record
        
        print("team icon: \(iconUrl)")
    }
    
    var iconUrl: String {"\(APIEndpoint.imageUrl)nfl_\(triCode.lowercased())_light.png"}
    
}
extension Team {
    static func defaultValue() -> Team {
        Team(triCode: "GB", name: "PACKERS", record: "10-12")
    }
}
