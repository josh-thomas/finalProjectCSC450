//
//  UserfeedViewController.swift
//  finalProject
//
//  Created by Joshua Thomas on 2/25/18.
//  Copyright © 2018 jthomas. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class UserfeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var userList = [String]()
    var refHandle: DatabaseHandle?
    var cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        retrieveUsers()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath)
        cell.textLabel?.text = userList[indexPath.row]
//        cell.detailTextLabel?.text = userList[indexPat]
        
        
        return cell
    }
    
    func retrieveUsers(){
        //Retrieve the list of Users and listen for changes
        
        refHandle = Constants.refs.databaseUsers.observe(.childAdded, with: { (snapshot) in
            
            //Code to execute when a child is added under "posts"
            //Take the value from snapshot and add to the array userList
            
//            let user = snapshot.value as? String
            if let userName = snapshot.value as? String {
                //Add the name to the array
                self.userList.append(userName)
                
                //Reload the tableView to display any new users
               self.tableView.reloadData()
            }
            
        })
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
