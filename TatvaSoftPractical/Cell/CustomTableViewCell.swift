//
//  CustomTableViewCell.swift
//  TatvaSoftPractical
//
//  Created by Dipali Rajbanshi on 26/03/22.
//

import UIKit
protocol CustomTableViewCellDelegate: AnyObject {
    func updateTitle()
}
class CustomTableViewCell: UITableViewCell {

    @IBOutlet var storyTitle: UILabel!
    
    @IBOutlet var createdAt: UILabel!
    
    @IBOutlet var switchBtn: UISwitch!
    
    weak var delegate: CustomTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        switchBtn.isOn = false
        
    }
    @IBAction func handleSwitchChangeState(_ sender: UISwitch) {
        
        if switchBtn.isOn {
            //print("True")
            contentView.backgroundColor = .gray
            ViewController.count += 1
            

        }else{
            //print("False")
            contentView.backgroundColor = .clear
            ViewController.count -= 1
        }
        
        delegate?.updateTitle()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
