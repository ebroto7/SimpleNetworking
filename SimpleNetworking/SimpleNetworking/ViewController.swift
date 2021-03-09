//
//  ViewController.swift
//  SimpleNetworking
//
//  Created by Enric Broto Hernandez on 9/3/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    @IBAction func refreshLondonUsers(_ sender: Any) {
        print("Refresh users in London")
    }
    @IBAction func refreshUsers(_ sender: Any) {
        print("Refresh users")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

