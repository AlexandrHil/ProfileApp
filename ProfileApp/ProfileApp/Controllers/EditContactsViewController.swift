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

class EditContactsViewController: UIViewController, UITextFieldDelegate {

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

        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                              action: #selector(viewDidTapped)))

    }

    // MARK: - actions

    private func textFieldDidEndEditing(_ textField: EditContactsView) {
        if textField == self.phoneView.descriptionTextField {
            self.delegate?.phoneDidChanged(phone: phoneView.descriptionTextField.text ?? "")
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
