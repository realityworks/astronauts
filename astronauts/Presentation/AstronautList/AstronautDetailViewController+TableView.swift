//
//  AstronautDetailViewController+TableView.swift
//  astronauts
//
//  Created by Piotr Suwara on 30/9/2022.
//

import UIKit

extension AstronautListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfAstronaughts
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // Get a cell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AstronautTableViewCell.identifier) as? AstronautTableViewCell else {
            return UITableViewCell()
        }

        if let astronaut = viewModel.astronautAt(index: indexPath.row) {
            cell.update(with: astronaut)
        }

        // Update from model
        return cell
    }
}

extension AstronautListViewController: UITableViewDelegate {

}
