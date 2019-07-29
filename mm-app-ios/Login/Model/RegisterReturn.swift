//
//  RegisterReturn.swift
//  mm-app-ios
//
//  Created by Megaleios DEV on 29/07/19.
//  Copyright © 2019 Megaleios DEV. All rights reserved.
//

import Foundation

// MARK: - RegisterReturn
struct RegisterReturn: Codable {
    let data: TokenCodable?
    let erro: Bool?
    let message: String?
    let messageEx: String?
}

// MARK: - DataClass
struct TokenCodable: Codable {
    let accessToken, refreshToken: String?
    let expiresIn: Int?
    let expires, expiresType: String?
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
        case expiresIn = "expires_in"
        case expires
        case expiresType = "expires_type"
    }
}
