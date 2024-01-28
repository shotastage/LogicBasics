//
//  Rand.swift
//  Tensorl
//
//  Created by Shota Shimazu on 2024/01/28.
//

import Foundation


class RandFx: FxAdaptor {
    
    override init(input: [Any]) {
        super.init(input: input)
        
        self.name = "RAND"
    }

    override func calc() {
        self.result = Double.random(in: 0...1)
    }
}
