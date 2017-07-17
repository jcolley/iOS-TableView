//
//  ViewController.swift
//  iOS-TableView
//
//  Created by John Colley on 7/16/17.
//  Copyright © 2017 John Colley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tasks = [String]()
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self as UITableViewDataSource
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func beastButtonPressed(_ sender: UIButton) {
        if tasks.contains(textField.text!) {
            let idx = tasks.index(of: textField.text!)
            let indexPath = IndexPath(row: idx!, section: 0)
            tableView.selectRow(at: indexPath, animated: true, scrollPosition: .bottom)
            tableView.delegate?.tableView!(tableView, didSelectRowAt: indexPath)
            
            textField.textColor = UIColor.red
        } else {
            tasks.append(textField.text!)
            tableView.reloadData()
            textField.text = ""
        }
    }

    @IBAction func textFieldChanged(_ sender: UITextField) {
        textField.textColor = UIColor.black
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }
    
    
}
