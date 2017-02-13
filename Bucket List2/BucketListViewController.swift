//
//  ViewController.swift
//  Bucket List2
//
//  Created by Das Beard on 2/13/17.
//  Copyright © 2017 dasBeard. All rights reserved.
//

import UIKit

class BucketListViewController: UITableViewController, AddItemTableViewControllerDelegate {

    var items = ["Go To The Moon", "Eat a Candybar", "Swim in the Amazon", "Some other stuff"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Loaded")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListItemCell", for: indexPath)
        
        cell.textLabel?.text = items[indexPath.row]
        return cell
        
        
    }
    
    
    
    // Swipe to delete
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        items.remove(at: indexPath.row)
        tableView.reloadData()
        
    }
    
    
    
    
    
    // Use accessory button to edit
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "EditItemSegue", sender: indexPath)
    }
    
    
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddItemSegue"{
            let navigationController = segue.destination as! UINavigationController
            let addItemTabelViewController = navigationController.topViewController as! AddItemTableViewController
            addItemTabelViewController.delegate = self
        
        } else if segue.identifier == "EditItemSegue"{
            let navigationController = segue.destination as! UINavigationController
            let addItemTabelViewController = navigationController.topViewController as! AddItemTableViewController
            addItemTabelViewController.delegate = self
            
            
            let indexPath = sender as! NSIndexPath
            let item = items[indexPath.row]
            addItemTabelViewController.item = item
            addItemTabelViewController.indexPath = indexPath
        }
        
        
        
    }
    
    func cancelButtonPressed(by controller: AddItemTableViewController) {
//        print("Im the hidden controller")
        dismiss(animated: true, completion: nil)
    }
    
    
    func itemSaved(by controller: AddItemTableViewController, with text: String, at indexPath: NSIndexPath?) {
        
        if let ip = indexPath{
        
            items[ip.row] = text
        
        } else {
            
            items.append(text)
        
        }
        
//        print("Input Received from top view: \(text)")
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
}

