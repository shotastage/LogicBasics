//
//  FXAdaptor.swift
//  Tensorl
//
//  Created by Shota Shimazu on 2024/01/28.
//

import Combine

protocol FXAdaptor {
    associatedtype InputType
    associatedtype ResultType

    var name: String { get }
    var input: [InputType]? { get }
    var result: ResultType? { get set }

    init(input: [InputType])
    mutating func calc()
}
