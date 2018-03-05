//
//  ViewController.swift
//  finalProject
//
//  Created by Joshua Thomas on 2/25/18.
//  Copyright © 2018 jthomas. All rights reserved.
//

import UIKit
import CBPinEntryView
import Firebase

class ViewController: UIViewController {

    var refHandle: UInt!
    var dataDict: [String: Any]!
    var eventPin: String!
    var name: String!
    
    @IBOutlet weak var mainTextLabel: UILabel!
    @IBOutlet weak var pinEntryView:  CBPinEntryView!
//        didSet {
//            pinEntryView.delegate = self as? CBPinEntryViewDelegate
//                 }
//    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        if let _: Any = dataDict[pinEntryView.getPinAsString()] {
            name = self.dataDict[pinEntryView.getPinAsString()] as! String
            print(name)
            performSegue(withIdentifier: "pinSegue", sender: (Any).self)
        } else {
            mainTextLabel.text = "Incorrect Pin, Try Again."
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Set the refHandle to observe the dataBase and take a snapshot
        
        refHandle = Constants.refs.databaseEvents.observe(DataEventType.value, with: { (snapshot) in
                self.dataDict = snapshot.value as! [String: Any]
                print(self.dataDict)
                print("Got Here")
            })
        
    }
    
//    extension ViewController: CBPinEntryViewDelegate {
//        func entryChanged(_ completed: Bool) {
//            if completed {
//                print(pinEntryView.getPinAsString())
//            }
//        }
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

