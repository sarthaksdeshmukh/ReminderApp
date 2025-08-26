//
//  CustomOperator.swift
//  RemindersApp
//
//  Created by Sarthak Deshmukh on 03/08/25.
//

import Foundation
import SwiftUI

public func ??<T>(lhs: Binding<Optional<T>>, rhs: T) -> Binding<T> {
    Binding (
        get: { lhs.wrappedValue ?? rhs },
        set: { lhs.wrappedValue = $0 }
    )
}
