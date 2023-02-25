//
//  MailTableViewCell.swift
//  GmailTestApp
//
//  Created by sose yeritsyan on 2/25/23.
//

import UIKit

protocol ImportantEmailDelegate: AnyObject {
    func markAsImportant(_ indexPath: IndexPath?)
}

class MailTableViewCell: UITableViewCell {
    
    static let cellID = "mailCell"
    weak var delegate: ImportantEmailDelegate?
    
    @IBOutlet weak var senderBackgroundView: UIView!
    @IBOutlet weak var senderNameFirstLetter: UILabel!
    
    @IBOutlet weak var senderLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mailTextLabel: UILabel!
    @IBOutlet weak var starButton: UIButton!
    
    var indexpath: IndexPath?
    
    func configure(mail: MailModel, indexpath: IndexPath) {
        self.indexpath = indexpath
        let letter = mail.sender?.first?.description
        self.senderNameFirstLetter.text = letter
        self.senderLabel.text = mail.sender
        self.titleLabel.text = mail.title
        self.mailTextLabel.text = mail.mailText
        self.starButton.isSelected = mail.isStarred ?? false
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.senderBackgroundView.layer.cornerRadius = 20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }
    @IBAction func markAsImportantAction(_ sender: UIButton) {
        delegate?.markAsImportant(self.indexpath)
    }
    
}
