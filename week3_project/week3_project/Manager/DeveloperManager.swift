//
//  DeveloperManager.swift
//  week3_project
//
//  Created by playhong on 2023/07/24.
//

import Foundation

final class DeveloperManager {
    
    static let shared = DeveloperManager()
    
    private init() {}
    
    func getDevelopers() -> [Developer] {
        let developers = [
            Developer(name: "최홍식", dreamCar: "트위지", dreamHouse: "PH129", salary: 150000000),
            Developer(name: "김귀아", dreamCar: "토요타 캠리", dreamHouse: "PH129", salary: 50000000),
            Developer(name: "박인수", dreamCar: "모닝", dreamHouse: "PH129", salary: 1000000000),
            Developer(name: "박서영", dreamCar: "포르쉐 카이엔", dreamHouse: "PH129", salary: 60000000)
            ]
        return developers
    }
}
