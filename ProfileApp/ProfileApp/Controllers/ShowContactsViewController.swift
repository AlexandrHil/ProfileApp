//
//  ShowContactsViewController.swift
//  ProfileApp
//
//  Created by Alex on 10.03.21.
//

import UIKit

class ShowContactsViewController: UIViewController {

    var userContactInfo = PAUserContactInfo()

    // MARK: - IBOutlets

    @IBOutlet weak var phoneLabel: ContactDescriptionView!
    @IBOutlet weak var emailLabel: ContactDescriptionView!
    @IBOutlet weak var skypeLabel: ContactDescriptionView!

    // MARK: - view life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setViewData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.setViewData()
    }

    // MARK: - setting view data

    private func setViewData() {
        self.phoneLabel.descriptionLabelText = self.userContactInfo.phoneInfo
        self.emailLabel.descriptionLabelText = self.userContactInfo.emailInfo
        self.skypeLabel.descriptionLabelText = self.userContactInfo.skypeInfo
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "editContact":
            if let controller = segue.destination as? EditContactsViewController {
                controller.userContactInfo = self.userContactInfo
            }
        default:
            break
        }
    }
}
