//
//  AstronautListViewController.swift
//  astronauts
//
//  Created by Piotr Suwara on 30/9/2022.
//

import UIKit

class AstronautListViewController: UIViewController {
    // MARK: Model

    let viewModel: AstronautListViewModel = .init()

    // MARK: View

    let tableView = UITableView(frame: .zero, style: .plain)
    let refreshControl = UIRefreshControl()

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        style()
        configure()
    }

    private func style() {

    }

    private func configure() {
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
