//
//  Friend.swift
//  Birthdays
//
//  Created by Caleb Wolfe on 9/20/25.
//

import Foundation
import SwiftData

@Model
class Friend{
    var name :String
    var birthday :Date
    var isBirthdayToday: Bool{
        Calendar.current.isDateInToday(birthday)
    }
    
    init(name: String, birthday: Date){
        self.name = name
        self.birthday = birthday
    }
}
