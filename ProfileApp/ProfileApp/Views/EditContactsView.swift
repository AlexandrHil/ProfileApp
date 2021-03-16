//
//  EditProfileView.swift
//  ProfileApp
//
//  Created by Alex on 5.03.21.
//

import UIKit

@IBDesignable
class EditContactsView: UIView {

    // MARK: - IBInspectable

    @IBInspectable
    var titleText: String = "" {
        didSet {
            self.titleLabel.text = self.titleText
        }
    }

    @IBInspectable
    var descriptionText: String = "" {
        didSet {
            self.descriptionTextField.text = self.descriptionText
        }
    }

    // MARK: - IBOutlet

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextField: UITextField!

    // MARK: - initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.initView()
    }

    func initView() {
        self.loadFromNib()
    }

    // MARK: - actions

    @IBAction func endTyping(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
}
