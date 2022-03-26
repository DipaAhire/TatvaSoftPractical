//
//  CustomTableViewCell.swift
//  TatvaSoftPractical
//
//  Created by Dipali Rajbanshi on 26/03/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet var storyTitle: UILabel!
    
    @IBOutlet var createdAt: UILabel!
    
    @IBOutlet var switchBtn: UISwitch!
    
    var count: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        switchBtn.isOn = false
        
    }
    @IBAction func handleSwitchChangeState(_ sender: UISwitch) {
        
        if switchBtn.isOn {
            print("True")
            contentView.backgroundColor = .gray
            count += 1
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
