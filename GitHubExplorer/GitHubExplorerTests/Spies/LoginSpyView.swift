//
//  LoginViewMock.swift
//  GitHubExplorerTests
//
//  Created by Nikola Shopov on 29.05.22.
//

import Foundation
import XCTest


public class LoginSpyView: LoginView {
    public var loginCompletedSuccessfully = false
    public var errorMessageShown = false
    public var clearHasBeenCalled = false
    public var theExpectation: XCTestExpectation?
    
    func showLoadingStatus() {
            
    }
    
    func hideLoadingStatus() {
            
    }
    
    func loginCompleted(_ userResponse: UserDTO) {
        if let id = userResponse.id {
            loginCompletedSuccessfully = true
            if let theExpectation = theExpectation {
                theExpectation.fulfill()
            }
        }
    }
    
    func showErrorMessage(_ message: String) {
        self.errorMessageShown = true
        if let theExpectation = theExpectation {
            theExpectation.fulfill()
        }
    }
    
    func clear() {
        self.clearHasBeenCalled = true
    }
}
