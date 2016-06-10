//
//  AutoLayoutViewController.swift
//  Animation
//
//  Created by Jeremy Petter on 2016-06-06.
//  Copyright © 2016 JeremyPetter. All rights reserved.
//

import UIKit

class AutoLayoutViewController: UIViewController {

    @IBOutlet weak var redBox: UIView!
    @IBOutlet weak var redBoxTopConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = doneButton
    }

    // MARK: Actions

    @IBAction func changeConstraints(sender: AnyObject) {
        redBoxTopConstraint.active = false
        redBox.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor, constant: -200).active = true

        UIView.animateWithDuration(1.0) { 
            self.view.layoutIfNeeded()
        }
    }

    func done() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    // MARK: Lazy Loaders

    lazy var doneButton:UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: #selector(done))
        return barButtonItem
    }()
}
