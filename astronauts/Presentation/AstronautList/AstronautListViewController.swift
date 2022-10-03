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
    let loadingView = UIView()
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
        self.view.addSubview(tableView)

        // Setup TableView
        tableView.edgesToSuperview()
        tableView.allowsSelection = false
        tableView.estimatedRowHeight = 140
        tableView.estimatedSectionHeaderHeight = 60

        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension

        tableView.separatorStyle = .none

        // Setup LoadingView


        title = "ASTRONAUTS"
    }

    private func configure() {
        // Setup data bindings and registrations
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(AstronautTableViewCell.self, forCellReuseIdentifier: AstronautTableViewCell.identifier)

        refreshControl.attributedTitle = NSAttributedString(string: "Pull to reload")
        refreshControl.addTarget(self, action: #selector(reload), for: UIControl.Event.valueChanged)
        tableView.addSubview(refreshControl)

        viewModel.delegate = self
    }

    // MARK: Load

    @objc
    private func reload(sender: AnyObject) {
        viewModel.load()
        self.refreshControl.endRefreshing()
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

// MARK: View Model Delegate

extension AstronautListViewController: AstronautListViewModelDelegate {
    func startLoading() {
        tableView.isHidden = true
        loadingView.isHidden = false
    }

    func didLoadData() {
        tableView.reloadData()
        tableView.isHidden = false
        loadingView.isHidden = true
    }
}
