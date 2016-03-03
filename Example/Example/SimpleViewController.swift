//
//  SimpleViewController.swift
//  ViewModelKit
//
//  Created by Tongtong Xu on 16/2/21.
//  Copyright © 2016年 Tongtong Xu. All rights reserved.
//

import Foundation
import UIKit
import ViewModelKit

class SimpleViewController: ViewController, ControllerTypeAddition {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    typealias T = SimpleViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = viewModel.nameTitle
        
        NSNotificationCenter.defaultCenter().addObserverForName(UITextFieldTextDidChangeNotification, object: nil, queue: NSOperationQueue.mainQueue(), usingBlock: {  [weak self] in
            guard let textField = $0.object as? UITextField where textField == self?.nameTextField else { return }
            self?.viewModel.name = textField.text ?? ""
        })
        
        viewModel.validClosure = { [weak self] in    
            self?.errorMessageLabel.text = $0
        }
    }
}
