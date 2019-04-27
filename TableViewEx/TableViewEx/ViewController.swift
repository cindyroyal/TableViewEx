//
//  ViewController.swift
//  FoodTracker
//
//  Created by Cindy Royal on 4/27/19.
//  Copyright © 2019 Cindy Royal. All rights reserved.
//
import UIKit
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    var newsItems = ["News 1", "News 2", "News 3"]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsItems.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell")
        cell?.textLabel?.text = newsItems[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (newsItems[indexPath.row] == "News 1") {
            performSegue(withIdentifier: "News1Segue", sender: self)
        }
        if (newsItems[indexPath.row] == "News 2") {
            performSegue(withIdentifier: "News2Segue", sender: self)
        }
        if (newsItems[indexPath.row] == "News 3") {
            performSegue(withIdentifier: "News3Segue", sender: self)
        }
    }
    //Additional TableView functions to allow for editing/deleting
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            theNews.beginUpdates()
            theNews.deleteRows(at: [indexPath], with: .automatic)
            newsItems.remove(at: indexPath.row)
            theNews.endUpdates()
            
        }
    }

    

    

    
    @IBOutlet weak var theNews: UITableView!
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        theNews.delegate = self
        theNews.dataSource = self
    theNews.allowsMultipleSelectionDuringEditing = true
        // Do any additional setup after loading the view, typically from a nib.
    }


}

