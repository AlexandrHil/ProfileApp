//
//  Date+Ex.swift
//  ProfileApp
//
//  Created by Alex on 10.03.21.
//

import Foundation

extension Date {
    var ageInYears: Int { Calendar.current.dateComponents([.year], from: self, to: Date()).year! }
}

let dob = DateComponents(calendar: .current).date!
let ageInYears = dob.ageInYears
