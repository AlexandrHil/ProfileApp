//
//  ShowContactsViewController.swift
//  ProfileApp
//
//  Created by Alex on 10.03.21.
//

import UIKit

class ShowContactsViewController: UIViewController, EditContactsViewControllerDelegate {
    func phoneDidChanged(phone: String) {
    }

    func skypeDidChanged(skype: String) {
    }


    // MARK: - IBOutlets

    @IBOutlet weak var phoneLabel: ContactDescriptionView!
    @IBOutlet weak var emailLabel: ContactDescriptionView!
    @IBOutlet weak var skypeLabel: ContactDescriptionView!

    // MARK: - view life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }

    // MARK: - setting view data

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showContact":
            if let controller = segue.destination as? EditContactsViewController {
                controller.delegate = self
            }
        default:
            break
        }
    }

    @IBAction func unwindToCard(_ unwindSegue: UIStoryboardSegue) {
        print(unwindSegue.source)
        print(unwindSegue.description)
    }

    func emailDidChanged(email: String) {
        self.userCardInfo.email = email
    }
}
