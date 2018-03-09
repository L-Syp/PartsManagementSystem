//
//  ProductsViewController.swift
//  PartsManagementSystem
//
//  Created by Łukasz Sypniewski on 08/03/2018.
//  Copyright © 2018 Łukasz Sypniewski. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
       // tableView.rowHeight = UITableViewAutomaticDimension
       // tableView.estimatedRowHeight = 90
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
