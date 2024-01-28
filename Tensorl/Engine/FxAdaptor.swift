//
//  FxAdaptor.swift
//  Tensorl
//
//  Created by Shota Shimazu on 2024/01/28.
//

import Combine


class FxAdaptor {
    var name: String = "NUL"
    let inputArray: [Any]
    var result: Any? = nil

    init(input: [Any], name: String) {
        inputArray = input
    }

    func register(name: String) {
        self.name = name
    }

    func calc() {}
}
