//
//  FxAdaptor.swift
//  Tensorl
//
//  Created by Shota Shimazu on 2024/01/28.
//

import Combine

protocol FXAdaptor {
    var name: String { get }
    var input: [Any] { get }
    var res: Any? { get set }
    init(input: [Any])
    mutating func calc() -> Void
}
