//
//  User.swift
//  tableViewProjectV2
//
//  Created by Светлана Сенаторова on 01.08.2022.
//


struct User {
    var username: String
    var password: String
    var pets: [Animal: [Info]] = [:]
    
    static func getUserList() -> [User] {
        let userList: [User] = []
        return userList
    }
}

enum Animal {
    case dog
    case cat
}

struct Info {
    var name: String = ""
    var breed: String = ""
    var age: Int = 0
    var vaccinations: [String] = []
}
