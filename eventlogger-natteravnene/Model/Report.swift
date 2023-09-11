//
//  Report.swift
//  theEventLogger
//
//  Created by Lotte Stubdal on 14/08/2023.
//

import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift

struct Report: Identifiable, Codable {
    var id = UUID() // automatic generated id
    var logger: String
    var age: Int
    var gender: String
    var assistance: String
    var charactheristics: String
    var description: String
    var numberOfPeople: Int
    var observation: String
}
