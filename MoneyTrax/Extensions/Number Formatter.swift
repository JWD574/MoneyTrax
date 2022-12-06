//
//  Number Formatter.swift
//  MoneyTrax
//
//  Created by Joseph  DeWeese on 12/6/22.
//

import Foundation

extension NumberFormatter {
    
    static var currency: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
}
