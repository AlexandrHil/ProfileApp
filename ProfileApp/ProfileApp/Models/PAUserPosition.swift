//
//  PAPosition.swift
//  ProfileApp
//
//  Created by Alex on 14.03.21.
//

import Foundation

enum PAUserPosition: String, CaseIterable {
    case musiсian,
         writer,
         singer,
         scientist,
         manager,
         engineer

    static var stringPosition: [String] {
        PAUserPosition.allCases.map { (position) -> String in
            return position.rawValue.capitalized
        }
    }
}
