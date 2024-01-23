//
//  Item.swift
//  Tensorl
//
//  Created by Shota Shimazu on 2024/01/16.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date

    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
