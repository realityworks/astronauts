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

        // Setup Bio
        view.addSubview(biographyLabel)
        biographyLabel.font = .systemFont(ofSize: 18)
        biographyLabel.centerInSuperview(offset: .init(x: 0, y: -30))
        biographyLabel.width(250)
        biographyLabel.lineBreakMode = .byWordWrapping
        biographyLabel.numberOfLines = 0
        biographyLabel.text = "asdasd asd asd asd asdas dasdahsd oasdh asiudhasiu dhasiudh asiudh asiudh asiudh aisudh asiudhas iudasiduasiuhd as"

        // Setup Date of Birth

        // Setup Name
        view.addSubview(nameLabel)

        nameLabel.font = .boldSystemFont(ofSize: 24)
        nameLabel.numberOfLines = 1

        nameLabel.left(to: biographyLabel)
        nameLabel.right(to: biographyLabel)
        nameLabel.height(30)
        nameLabel.bottomToTop(of: biographyLabel)
    }

    private func configure() {
        viewModel.delegate = self
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

extension AstronautDetailViewController: AstronautListViewModelDelegate {
    func startLoading() {

    }

    func didLoadData() {

    }

    func failedLoading() {

    }
}
