//
//  TransactionCell.swift
//  Maexpense
//
//  Created by Ilyas Bintang Prayogi on 18/03/24.
//

import UIKit

class TransactionCell: UICollectionViewCell {
    
    static let identifier = "transaction-cell"
    
    @IBOutlet weak var lb_nominal: UILabel!
    @IBOutlet weak var lb_date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        roundCorner()
    }

}
