//
//  ViewController.swift
//  Ridelytic
//
//  Created by Satnam Singh on 18/07/17.
//  Copyright © 2017 Silver Seahog. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    //  get current text box when user Begin editing
    @IBOutlet weak var activeTextField: UITextField? //deliberately left and is optional
    
    override func viewWillAppear(_ animated: Bool) {
        // call method for keyboard notification
        self.setNotificationKeyboard()
    }
    
    // Notification when keyboard show
    func setNotificationKeyboard ()  {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(notification:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(notification:)), name: .UIKeyboardWillHide, object: nil)
    }
    
    // get current text field
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeTextField = textField;
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        activeTextField = nil
    }
    // when show keyboard increase height of scroll view
    func keyboardWasShown(notification: NSNotification)
    {
        var info = notification.userInfo!
        let keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size
        let contentInsets : UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize!.height+10, 0.0)
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
        var aRect : CGRect = self.view.frame
        aRect.size.height -= keyboardSize!.height
        if let activeField = self.activeTextField
        {
            if (!aRect.contains(activeField.frame.origin))
            {
                self.scrollView.scrollRectToVisible(activeField.frame, animated: true)
            }
        }
    }
    // when keyboard hide reduce height of scroll view
    func keyboardWillBeHidden(notification: NSNotification){
        let contentInsets : UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0,0.0, 0.0)
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Try to find next responder
        // Try to find next responder
        if let nextField = textField.superview?.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
        }
        
        return false
    }
    
}
