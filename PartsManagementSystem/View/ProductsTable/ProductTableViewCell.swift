//
//  ProductTableViewCell.swift
//  PartsManagementSystem
//
//  Created by Łukasz Sypniewski on 08/03/2018.
//  Copyright © 2018 Łukasz Sypniewski. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var netPriceLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    
    var name: String? { didSet {nameLabel.text = name} }
    var type: String? { didSet {typeLabel.text = type} }
    var netPrice: String? { didSet {netPriceLabel.text = netPrice} }
    var productImage: UIImage? { didSet {productImageView.image = productImage} }
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
