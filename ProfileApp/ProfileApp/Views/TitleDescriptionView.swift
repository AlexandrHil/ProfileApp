//
//  TitleDescriptionView.swift
//  ProfileApp
//
//  Created by Alex on 4.03.21.
//

import UIKit

@IBDesignable
class TitleDescriptionView: UIView {

    // MARK: - IBInspectable

    @IBInspectable
    var positionText: String = "" {
        didSet {
            self.positionLabel.text = self.positionText
        }
    }

    // MARK: - IBOutlet

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

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
