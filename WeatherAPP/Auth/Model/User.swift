//
//  User.swift
//  WeatherAPP
//
//  Created by Eljan on 05.05.24.
//

import Foundation
import RealmSwift
 
class User: Object {
    @Persisted var username: String?
    @Persisted var surname: String?
    @Persisted var email: String?
    @Persisted var password: String?
    @Persisted var userId: String?
    
    override static func primaryKey() -> String? {
        return "userId"}
}
