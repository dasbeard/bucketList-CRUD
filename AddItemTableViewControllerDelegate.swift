//
//  AddItemTableViewControllerDelegate.swift
//  Bucket List2
//
//  Created by Das Beard on 2/13/17.
//  Copyright © 2017 dasBeard. All rights reserved.
//

import Foundation

protocol AddItemTableViewControllerDelegate {
    
    
    func itemSaved(by controller: AddItemTableViewController, with text: String, at indexPath: NSIndexPath?)
    
    
    
    func cancelButtonPressed(by controller: AddItemTableViewController)
 
    
    
}
