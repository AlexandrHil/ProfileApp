//
//  EditContactsViewController.swift
//  ProfileApp
//
//  Created by Alex on 16.03.21.
//

import UIKit

class EditContactsViewController: UIViewController {

    var userContactInfo: PAUserContactInfo?

    // MARK: - IBOutlets

    @IBOutlet weak var saveButton: UIBarButtonItem! {
        didSet {
            self.saveButton.target = self
            self.saveButton.action = #selector(self.saveButtonTapped)
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

        let tapgest = UITapGestureRecognizer(target: self, action: #selector(taptoend))
        self.view.addGestureRecognizer(tapgest)

        self.view.endEditing(true)

        self.setViewData()
    }

    // MARK: - setting view data

    private func setViewData() {
        self.phoneView.descriptionTextField.text = self.userContactInfo?.phoneInfo
        self.emailView.descriptionTextField.text = self.userContactInfo?.emailInfo
        self.skypeView.descriptionTextField.text = self.userContactInfo?.skypeInfo
    }

    private func setModelData() {
        guard let userContact =  self.userContactInfo else { return }

        userContact.phoneInfo = self.phoneView.descriptionTextField.text ?? ""
        userContact.emailInfo = emailView.descriptionTextField.text ?? ""
        userContact.skypeInfo = skypeView.descriptionTextField.text ?? ""
    }

    // MARK: - actions

    @objc func saveButtonTapped() {
        self.setModelData()
        self.navigationController?.popViewController(animated: true)
    }

    @objc func taptoend() {
        self.view.endEditing(true)
    }
}
