//
//  ViewController.swift
//  TableView
//
//  Created by Cindy Royal on 4/27/19.
//  Copyright © 2019 Cindy Royal. All rights reserved.
//
import UIKit
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    var newsItems = ["News 1", "News 2", "News 3"]
    @IBOutlet weak var theNews: UITableView!


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsItems.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell")
        cell?.textLabel?.text = newsItems[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let selection = newsItems[indexPath.row]
        if (selection == "News 1") {
            performSegue(withIdentifier: "News1Segue", sender: self)
        }
        else if (selection == "News 2") {
            performSegue(withIdentifier: "News2Segue", sender: self)
        }
        else if (selection == "News 3") {
            performSegue(withIdentifier: "News3Segue", sender: self)
        }
    }
    
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        theNews.delegate = self
        theNews.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
}

