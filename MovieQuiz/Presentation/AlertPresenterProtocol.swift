//
//  AlertPresenter.swift
//  MovieQuiz
//
//  Created by ALeXzZzAy on 05.07.23.
//

import Foundation
import UIKit

protocol AlertPresenterProtocol {
    
    func show(alertModel: AlertModel)
}

final class AlertPresenterProtocolImpl {
    private weak var viewController: UIViewController?
    
    init(viewController: UIViewController? = nil) {
        self.viewController = viewController
    }
}

extension AlertPresenterProtocolImpl: AlertPresenterProtocol {
    func show (alertModel: AlertModel) {
        let alert = UIAlertController(
            title: alertModel.title,
            message: alertModel.message,
            preferredStyle: .alert
        )
        
        let action = UIAlertAction(title: alertModel.buttonText, style: .default) { _ in
         alertModel.buttonAction()
        }
        
        alert.addAction(action)
        
        viewController?.present(alert, animated: true)
    }
}
