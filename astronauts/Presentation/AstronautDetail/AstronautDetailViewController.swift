//
//  AstronautDetailViewController.swift
//  astronauts
//
//  Created by Piotr Suwara on 30/9/2022.
//

import UIKit

class AstronautDetailViewController: UIViewController {

    let viewModel = AstronautDetailViewModel()

    // Views
    private let nameLabel = UILabel()
    private let biographyLabel = UILabel()
    private let dateOfBirthLabel = UILabel()
    private let loadingView = LoadingView()

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

        viewModel.loadSelectedAstronaut()
    }

    private func style() {
        // Setup view
        view.backgroundColor = .white

        // Setup Name
        view.addSubview(nameLabel)

        nameLabel.font = .boldSystemFont(ofSize: 24)
        nameLabel.numberOfLines = 1

        nameLabel.leftToSuperview(offset: 16)
        nameLabel.rightToSuperview(offset: -16)
        nameLabel.height(30)
        nameLabel.topToSuperview(offset: 36, usingSafeArea: true)

        // Setup Date of Birth
        view.addSubview(dateOfBirthLabel)

        dateOfBirthLabel.font = .boldSystemFont(ofSize: 20)
        dateOfBirthLabel.numberOfLines = 1

        dateOfBirthLabel.leftToSuperview(offset: 16)
        dateOfBirthLabel.rightToSuperview(offset: -16)
        dateOfBirthLabel.height(30)
        dateOfBirthLabel.topToBottom(of: nameLabel)

        // Setup Bio
        view.addSubview(biographyLabel)
        biographyLabel.font = .systemFont(ofSize: 18)
        biographyLabel.topToBottom(of: dateOfBirthLabel)
        biographyLabel.leftToSuperview(offset: 16)
        biographyLabel.rightToSuperview(offset: -16)
        biographyLabel.lineBreakMode = .byWordWrapping
        biographyLabel.numberOfLines = 0

        // Setup loading view
        view.addSubview(loadingView)
        loadingView.edgesToSuperview()
    }

    private func configure() {
        viewModel.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        viewModel.delegate = self
    }

    override func viewWillDisappear(_ animated: Bool) {
        viewModel.delegate = nil
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

extension AstronautDetailViewController: AstronautDetailViewModelDelegate {
    func startLoading() {
        loadingView.isHidden = false
        loadingView.active = true
    }

    func didLoadData() {
        nameLabel.text = viewModel.name
        dateOfBirthLabel.text = viewModel.dateOfBirth
        biographyLabel.text = viewModel.bio
        loadingView.isHidden = true
        loadingView.active = false
    }

    func failedLoading() {
        // Do nothing
    }
}
