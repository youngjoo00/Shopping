//
//  VIewModelType.swift
//  SwiftUI_Shopping
//
//  Created by youngjoo on 5/10/24.
//

import Combine

protocol ViewModelType: AnyObject, ObservableObject {
    
    associatedtype Input
    associatedtype Output
    
    var cancellables: Set<AnyCancellable> { get }
    var input: Input { get }
    var output: Output { get }
    
    func transform()
}

