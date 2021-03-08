//
//  ContactDescriptionView.swift
//  ProfileApp
//
//  Created by Alex on 7.03.21.
//

import UIKit

@IBDesignable
class ContactDescriptionView: UIView {

    // MARK: - IBInspectable

    @IBInspectable
    var descriptionLabelText: String = "" {
        didSet {
            self.descriptionLabel.text = self.descriptionLabelText
        }
    }

    @IBInspectable
    var stringDescriptionLabelText: String = "" {
        didSet {
            self.stringDescriptionLabel.text = self.stringDescriptionLabelText
        }
    }

    @IBInspectable
    var icon: UIImage = UIImage(named: "skype.png")! {
        didSet {
            self.iconView.image = self.icon
        }
    }

    // MARK: - IBOutlet

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var stringDescriptionLabel: UILabel!

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
}
