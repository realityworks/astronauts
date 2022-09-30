//
//  AstronautDetailViewController+TableView.swift
//  astronauts
//
//  Created by Piotr Suwara on 30/9/2022.
//

import UIKit

extension AstronautListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension AstronautListViewController: UITableViewDelegate {

}
