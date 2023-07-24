//
//  RecruitManager.swift
//  week3_project
//
//  Created by playhong on 2023/07/24.
//

import Foundation

final class RecruitManager {
    
    static let shared = RecruitManager()
    private let developerManager = DeveloperManager.shared
    private var employmentList: [Developer] = []
    
    private init() {}
    
    func add(developer: Developer) {
        let isDuplicate = employmentList.contains { dev in
            dev.name == developer.name
        }
        if isDuplicate {
            print("이미 채용 명단에 추가되어있습니다.")
        } else {
            employmentList.append(developer)
            print("\(developer.name) 님이 채용 명단에 추가되었습니다.")
        }
    }
    
    func getEmploymentList() -> [Developer] {
        return employmentList
    }
}
