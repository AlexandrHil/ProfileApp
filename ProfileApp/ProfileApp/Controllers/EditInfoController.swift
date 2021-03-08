//
//  EditInfoController.swift
//  ProfileApp
//
//  Created by Alex on 4.03.21.
//

import UIKit

class EditInfoController: UIViewController {

    var userCardInfo: NPUserCardInfo?

    // MARK: - IBOutlets


    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var firstNameView: EditProfileView!
    @IBOutlet weak var aliasView: EditProfileView!
    @IBOutlet weak var lastNameView: EditProfileView!
    @IBOutlet weak var ageView: EditProfileView!
    @IBOutlet weak var positionView: EditProfileView!
    @IBOutlet weak var experienceView: EditProfileView!
    @IBOutlet weak var aboutView: EditProfileView!
    @IBOutlet weak var aboutTextView: UITextView!

    // MARK: - view life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

//        self.saveButton.addTarget(self, action: #selector(self.saveButtonTapped), for: .touchUpInside)

        self.saveButton.target(

        self.setViewData()
    }

    // MARK: - setting view data

    private func setViewData() {
        self.firstNameView.descriptionTextField.text = self.userCardInfo?.firstName
        self.aliasView.descriptionTextField.text = self.userCardInfo?.alias
        self.lastNameView.descriptionTextField.text = self.userCardInfo?.lastName
        self.ageView.descriptionTextField.text = self.userCardInfo?.age
        self.positionView.descriptionTextField.text = self.userCardInfo?.position
        self.experienceView.descriptionTextField.text = self.userCardInfo?.experience
        self.aboutTextView.text = self.userCardInfo?.about
    }

    private func setModelData() {
        guard let userModel =  self.userCardInfo else { return }

        userModel.firstName = self.firstNameView.descriptionTextField.text ?? ""
        userModel.alias = aliasView.descriptionTextField.text ?? ""
        userModel.lastName = lastNameView.descriptionTextField.text ?? ""
        userModel.age = ageView.descriptionTextField.text ?? ""
        userModel.position = positionView.descriptionTextField.text ?? ""
        userModel.experience = experienceView.descriptionTextField.text ?? ""
        userModel.about = self.aboutTextView.text ?? ""
    }

    // MARK: - actions

    @objc func saveButtonTapped() {
        self.setModelData()
        self.navigationController?.popViewController(animated: true)
    }
}
