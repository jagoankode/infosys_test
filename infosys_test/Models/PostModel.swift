//
//  PostModel.swift
//  infosys_test
//
//  Created by Brillian Andrie on 14/11/25.
//

import Foundation

struct PostModel: Codable, Identifiable, Equatable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
