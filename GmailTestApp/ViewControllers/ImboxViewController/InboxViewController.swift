//
//  InboxViewController.swift
//  GmailTestApp
//
//  Created by sose yeritsyan on 2/25/23.
//

import UIKit

class InboxViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var user: UserModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    func setupUI() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
}

extension InboxViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.user?.mailArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let mailArray = self.user?.mailArray else { return UITableViewCell() }
        if let cell = self.tableView.dequeueReusableCell(withIdentifier: MailTableViewCell.cellID) as? MailTableViewCell {
            cell.configure(mail: mailArray[indexPath.row], indexpath: indexPath)
            cell.delegate = self
            return cell

        }
                
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
}

extension InboxViewController: ImportantEmailDelegate {
    func markAsImportant(_ indexPath: IndexPath?) {
        guard let index = indexPath?.row else { return }
        self.user?.mailArray?[index].isStarred?.toggle()
        print("hjfjshdhfj")
        self.tableView.reloadData()
    }
    
}
