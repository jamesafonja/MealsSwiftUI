//
//  BaseViewModel.swift
//  MealsSwiftUI
//
//  Created by Revive on 11/6/22.
//

import Foundation

protocol BaseViewModel: ObservableObject {
    
    var service: APIService { get }
    var urlString: String { get }
    var hasError: Bool { get set }
    var statusMessage: String { get set }
    
    func setStatus(message: String, error: Error?)
}

extension BaseViewModel {
    
    func setStatus(message: String, error: Error?) {
        self.hasError = true
        self.statusMessage = message
        
        if let error = error {
            self.statusMessage += "\(error)"
        }
    }
    
}
