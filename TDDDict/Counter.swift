//
//  Counter.swift
//  TDDDict
//
//  Created by Zhiwei Yu on 3/11/21.
//

import Foundation

protocol CounterProtocol {
    func count() -> [Character: Int]
}

struct Counter: CounterProtocol {
    let str: String
    
    func count() -> [Character: Int] {
        var dict = [Character: Int]()
        for char in str {
            if let currentValue = dict[char] {
                dict.updateValue(currentValue + 1, forKey: char)
            } else {
                dict.updateValue(1, forKey: char)
            }
        }
        return dict
    }
}
