//
//  User.swift
//  tableViewProjectV2
//
//  Created by Светлана Сенаторова on 01.08.2022.
//


struct User {
    var data: [String: [Pet]]
    
    static func getUserList() -> [User] {
        let userList: [User] = []
        return userList
    }
}

struct Pet {
    var animalType: AnimalType
    var name: String = ""
    var breed: String = ""
    var age: String = ""
    var vaccinations: [String] = []
    
    static func getPetList() -> [Pet] {
        let petList: [Pet] = []
        return petList
    }
}

enum AnimalType {
    case dog
    case cat
}
