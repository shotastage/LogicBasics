//
//  RandSecure.swift
//  Tensorl
//
//  Created by Shota Shimazu on 2024/01/28.
//

import DataLogic
import Engine

struct FXRandSecure: FXAdaptor {
    typealias InputType = Double
    typealias ResultType = Double

    var name: String
    var input: [Double]?
    var result: Double?

    init(input: [Double]) {
        name = "RANDSECURE"
        self.input = input
    }

    mutating func calc() {
        if let secureTRNG = SecureTRNG(range: 0.0 ... 1.0) {
            switch secureTRNG.value {
                case let .value(randomValue):
                    switch randomValue {
                        case let .double(doubleValue):
                            result = doubleValue
                        default:
                            print("RandomValueはDouble型ではありません。")
                    }
                case .void:
                    print("値は存在しません。")
            }
        }
    }
}
