//
//  main.swift
//  week3_project
//
//  Created by playhong on 2023/07/24.
//

import Foundation

class RecruitmentService {
    
    private let developers = DeveloperManager.shared.getDevelopers()
    private let recruitManger = RecruitManager.shared
    private var isRunning = true
    
    func run() {
        while isRunning {
            showMenu()
        }
    }
    
    private func showMenu() {
        print(Constant.welcomeMessage)
        printDeveloperList()
        print("           [ 채용 메뉴 ]")
        print("")
        print(" 9. 채용 명단 보기")
        print(Constant.divisionLine)
        print(" 0. 종 료")
        getNumber()
    }
    
    private func printDeveloperList() {
        if developers.isEmpty {
            print(" 등록된 개발자가 없습니다.")
        } else {
            var index = 0
            for developer in developers {
                index += 1
                print(" \(index). \(developer.name)")
            }
        }
    }
    
    private func getNumber() {
        print(Constant.divisionLine)
        print(" 원하시는 개발자의 번호를 입력해주세요.")
        guard let input = readLine() else { return }
        guard let number = Int(input)
        else {
            print(" 번호를 입력해주세요.")
            sleep(1)
            return
        }
        selectMenu(number: number)
    }
    
    func selectMenu(number: Int) {
        switch number {
        case 0:
            isRunning = false
        case ...developers.count:
            showDetailPage(index: number - 1)
        case 9:
            if recruitManger.getEmploymentList().isEmpty {
                print(" 채용 명단이 비어있습니다.")
                sleep(2)
            } else {
                showEmploymentList()
                sleep(2)
            }
        default:
            print(" 잘못된 번호를 입력하셨습니다.")
            sleep(2)
        }
    }
    
    private func showDetailPage(index: Int) {
        let developer = developers[index]
        print(Constant.divisionLine)
        print("[ \(developer.name) 님의 상세페이지 ]")
        print("이름 : \(developer.name)")
        print("희망 연봉 : \(developer.salary) 원")
        print("드림카 : \(developer.dreamCar)")
        print("드림하우스 : \(developer.dreamHouse)")
        print(Constant.divisionLine)
        print("0. 뒤로가기")
        print("1. 채용 명단에 추가하기")
        if let input = readLine() {
            selectDetailPageMenu(number: input, index: index, developer: developer)
        }
    }
    
    func selectDetailPageMenu(number: String, index: Int, developer: Developer) {
        switch number {
        case "0":
            showMenu()
        case "1":
            recruitManger.add(developer: developer)
            sleep(2)
        default:
            print("번호를 다시 입력해주세요.")
            sleep(2)
            showDetailPage(index: index)
        }
    }
    
    func showEmploymentList() {
        print("           [ 채용 명단 ]")
        print("")
        let employmentList = recruitManger.getEmploymentList()
        var index = 0
        for developer in employmentList {
            index += 1
            print(" \(index). \(developer.name) | 희망 연봉: \(developer.salary)")
        }
    }
}

RecruitmentService().run()
