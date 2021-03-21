//
//  EditContactsViewController.swift
//  ProfileApp
//
//  Created by Alex on 16.03.21.
//

import UIKit

protocol EditContactsViewControllerDelegate: class {
    func phoneDidChanged(phone: String)
    func emailDidChanged(email: String)
    func skypeDidChanged(skype: String)
}

class EditContactsViewController: UIViewController, EditContactsViewControllerDelegate, UITextFieldDelegate {

    func phoneDidChanged(phone: String) {
        print("phoneDidChanged")
    }
    func emailDidChanged(email: String) {
        print("emailDidChanged")
    }
    func skypeDidChanged(skype: String) {
        print("skypeDidChanged")
    }
    weak var delegate: EditContactsViewControllerDelegate?

    // MARK: - IBOutlets

    @IBOutlet weak var saveButton: UIBarButtonItem! {
        didSet {
            self.saveButton.target = self
//            self.saveButton.action = #selector(self.saveButtonTapped)
        }
    }
    @IBOutlet weak var phoneView: EditContactsView! {
        didSet {
            self.phoneView.descriptionTextField.textContentType = .telephoneNumber
            self.phoneView.descriptionTextField.keyboardType = .numberPad
        }
    }
    @IBOutlet weak var emailView: EditContactsView! {
        didSet {
            self.emailView.descriptionTextField.textContentType = .emailAddress
            self.emailView.descriptionTextField.keyboardType = .emailAddress
        }
    }
    @IBOutlet weak var skypeView: EditContactsView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.phoneView.descriptionTextField.delegate = self
        self.emailView.descriptionTextField.delegate = self
        self.skypeView.descriptionTextField.delegate = self
    }

    // MARK: - actions

    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
    }

    private func textFieldDidEndEditing(_ textField: EditContactsView) {
        if textField == self.phoneView.descriptionTextField {
            self.delegate?.phoneDidChanged(phone: phoneView.descriptionTextField.text ?? "")
        }
        if textField == self.emailView.descriptionTextField {
            self.delegate?.emailDidChanged(email: emailView.descriptionTextField.text ?? "")
        }

        func textFieldShouldReturn (_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }

        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            if textField.textContentType == .some(.emailAddress) {
                print("I'm e-mail")
                return true
            } else if textField.textContentType == .some(.telephoneNumber) {
                let currentTextFieldText = textField.text ?? ""
                let resultText = (currentTextFieldText as NSString).replacingCharacters(in: range, with: string)
                if resultText.count >= 2 {
                    return false
                } else {
                    return true
                }
            } else {
                return true
            }
        }

//        if textField == self.emailView.descriptionTextField {
//            self.delegate?.emailDidChanged(email: emailView.descriptionTextField.text ?? "")
//        }
//        if textField == self.skypeView.descriptionTextField {
//            self.delegate?.skypeDidChanged(skype: skypeView.descriptionTextField.text ?? "")
//        }
   }

//    @objc func saveButtonTapped() {
//
//            self.dismiss(animated: true)
//    }

    @objc private func viewDidTapped() {
        self.view.endEditing(true)
    }
}
