//
//  ViewController.swift
//  tabledelegate
//
//  Created by J on 7/06/2018.
//  Copyright © 2018 Jman. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    var tasks = ["something cool", "this is cool", "blahblah"]
    
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func beastButtonPressed(_ sender: UIButton) {
        print("pressed button")
        if (taskTextField.text?.count)! < 1 { return } // dont append if nothing in text
        tasks.append(taskTextField.text!)
        print(tasks)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    // how many cells are we going to need?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print("inside func tableView numOfRowsInSection")
        // return an int that indicates how mnay rows (cells) to draw
        return tasks.count
    }
    
    // how should i create each cell?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        print("inside func tableView cellForRowAt indexPath...")
        // get the UITableViewCell and create/populate it with data then return it
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Section: \(indexPath.section) and Row: \(indexPath.row)")
        tasks.remove(at: indexPath.row)
        print("new tasks after remove =>", tasks)
        tableView.reloadData()
    }
}






