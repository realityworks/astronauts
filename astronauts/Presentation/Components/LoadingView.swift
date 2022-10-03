//
//  LoadingView.swift
//  astronauts
//
//  Created by Piotr Suwara on 30/9/2022.
//

import UIKit
import TinyConstraints

class LoadingView: UIView {
    private let activityIndicator: UIActivityIndicatorView = .init()

    var active: Bool = false {
        didSet {
            if active {
                activityIndicator.startAnimating()
            } else {
                activityIndicator.stopAnimating()
            }
        }
    }

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        configureView()
        layoutView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureView() {
        clipsToBounds = false
        backgroundColor = .white

        if #available(iOS 13.0, *) {
            activityIndicator.style = .large
        } else {
            activityIndicator.style = .whiteLarge
        }
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
    }

    private func layoutView() {
        addSubview(activityIndicator)
        activityIndicator.centerInSuperview()
    }
}
