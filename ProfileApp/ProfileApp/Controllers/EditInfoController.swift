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

class EditInfoController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var userCardInfo: PAUserCardInfo?

    // MARK: - IBOutlets

    @IBOutlet weak var saveButton: UIBarButtonItem! {
        didSet {
            self.saveButton.target = self
            self.saveButton.action = #selector(self.saveButtonTapped)
        }
    }
    @IBOutlet weak var firstNameView: EditContactsView!
    @IBOutlet weak var aliasView: EditContactsView!
    @IBOutlet weak var lastNameView: EditContactsView!
    @IBOutlet weak var ageView: EditContactsView! {
        didSet {
            self.ageView.descriptionTextField.inputView = self.ageDatePicker
        }
    }
    @IBOutlet weak var positionView: EditContactsView! {
        didSet {
            self.positionView.descriptionTextField.inputView = self.positionPicker
        }
    }
    @IBOutlet weak var experienceView: EditContactsView! {
        didSet {
            self.experienceView.descriptionTextField.inputView = self.experienceDatePicker
        }
    }
    @IBOutlet weak var aboutView: EditContactsView!
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

    private lazy var positionPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        picker.translatesAutoresizingMaskIntoConstraints = false
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

        let tapgest = UITapGestureRecognizer(target: self, action: #selector(taptoend))
        self.view.addGestureRecognizer(tapgest)

        self.setViewData()
    }

    // MARK: - setting view data

    private func setViewData() {
        self.firstNameView.descriptionTextField.text = self.userCardInfo?.firstName
        self.aliasView.descriptionTextField.text = self.userCardInfo?.alias
        self.lastNameView.descriptionTextField.text = self.userCardInfo?.lastName
        self.ageView.descriptionTextField.text = self.userCardInfo?.age
        self.positionView.descriptionTextField.text = self.userCardInfo?.position.rawValue
        self.experienceView.descriptionTextField.text = self.userCardInfo?.experience
        self.aboutTextView.text = self.userCardInfo?.about
    }

    private func setModelData() {
        guard let userModel =  self.userCardInfo else { return }

        userModel.firstName = self.firstNameView.descriptionTextField.text ?? ""
        userModel.alias = aliasView.descriptionTextField.text ?? ""
        userModel.lastName = lastNameView.descriptionTextField.text ?? ""
        userModel.age = ageView.descriptionTextField.text ?? ""
        userModel.position = PAUserPosition(rawValue: positionView.descriptionTextField.text?.lowercased() ?? "") ?? .engineer
        userModel.experience = experienceView.descriptionTextField.text ?? ""
        userModel.about = self.aboutTextView.text ?? ""
    }

    // MARK: - actions

    @objc func saveButtonTapped() {
        self.setModelData()
        self.navigationController?.popViewController(animated: true)
    }

    @objc func taptoend() {
        self.view.endEditing(true)
    }

    @objc private func ageDatePickerValueChanged(_ ageDatePicker: UIDatePicker) {
        self.ageView.descriptionTextField.text = "\(ageDatePicker.date.ageInYears) years"
    }

    @objc private func experienceDatePickerValueChanged(_ experienceDatePicker: UIDatePicker) {
        self.experienceView.descriptionTextField.text = "\(experienceDatePicker.date.ageInYears)"
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return PAUserPosition.allCases.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return PAUserPosition.stringPosition[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.positionView.descriptionTextField.text = PAUserPosition.stringPosition[row]
    }
}
