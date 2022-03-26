//
//  CustomTableViewCell.swift
//  TatvaSoftPractical
//
//  Created by Dipali Rajbanshi on 26/03/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet var title: UILabel!
    
    @IBOutlet var createdAt: UILabel!
    
    @IBOutlet var switchBtn: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        switchBtn.isOn = false
    }
    @IBAction func handleSwitchChangeState(_ sender: UISwitch) {
        
        if switchBtn.isOn {
            print("True")
            contentView.backgroundColor = .gray
        }else{
            print("False")
            contentView.backgroundColor = .clear
        }
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
