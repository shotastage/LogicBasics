//
//  RandSecure.swift
//  Tensorl
//
//  Created by Shota Shimazu on 2024/01/28.
//

import DataLogic

struct FXRandSecure: FXAdaptor {
    var name: String = "RANDSECURE"
    
    var input: [Any]
    
    var res: Any?
    
    init(input: [Any]) {
        self.input = []
    }
    
    mutating func calc() {
        let res = OnChipTRNG(length: 100)
        res = Double.random(in: 0...1)
    }
}
