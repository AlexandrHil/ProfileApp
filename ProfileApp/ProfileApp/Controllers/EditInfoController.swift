//
//  EditInfoController.swift
//  ProfileApp
//
//  Created by Alex on 4.03.21.
//

import UIKit

protocol EditInfoControllerDelegate: class {
    func ageChanged(picker: UIDatePicker, age: Date)
}

class EditInfoController: UIViewController {

//    weak var delegate: EditInfoControllerDelegate?

    var userCardInfo: PAUserCardInfo?

    // MARK: - IBOutlets

    @IBOutlet weak var saveButton: UIBarButtonItem! {
        didSet {
            self.saveButton.target = self
            self.saveButton.action = #selector(self.saveButtonTapped)
        }
    }
    @IBOutlet weak var firstNameView: EditProfileView!
    @IBOutlet weak var aliasView: EditProfileView!
    @IBOutlet weak var lastNameView: EditProfileView!
    @IBOutlet weak var ageView: EditProfileView! {
        didSet {
            self.ageView.descriptionTextField.inputView = self.ageDatePicker
        }
    }
    @IBOutlet weak var positionView: EditProfileView!
    @IBOutlet weak var experienceView: EditProfileView! {
        didSet {
            self.experienceView.descriptionTextField.inputView = self.experienceDatePicker
        }
    }
    @IBOutlet weak var aboutView: EditProfileView!
    @IBOutlet weak var aboutTextView: UITextView!

    private lazy var ageDatePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .wheels
        picker.maximumDate = Date()
        picker.addTarget(self, action: #selector(ageDatePickerValueChanged),
                         for: .valueChanged)

        return picker
    }()

    private lazy var experienceDatePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .wheels
        picker.maximumDate = Date()
        picker.addTarget(self, action: #selector(experienceDatePickerValueChanged),
                         for: .valueChanged)

        return picker
    }()

    // MARK: - view life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

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

    @objc private func ageDatePickerValueChanged(_ ageDatePicker: UIDatePicker) {
        self.ageView.descriptionTextField.text = "\(ageDatePicker.date.ageInYears) years"
    }

    @objc private func experienceDatePickerValueChanged(_ experienceDatePicker: UIDatePicker) {
        self.experienceView.descriptionTextField.text = "\(experienceDatePicker.date.ageInYears)"
    }
}
