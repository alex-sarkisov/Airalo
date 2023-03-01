//
//  LoginView.swift
//  Airalo
//
//  Created by Alex Sarkisov on 01.03.23.
//

import UIKit

class LoginNavigationView: UIView {

    // MARK: - Private properties
    
    private lazy var airmoneyImageView: UIImageView = makeAirmoneyImageView()
    private lazy var airmoneyLabel: UILabel = makeAirmoneyLabel()
    private lazy var airmoneyStackView: UIStackView = makeAirmoneyStackView()
    private lazy var loginButton: UIButton = makeLoginButton()
    private lazy var contentStackView: UIStackView = makeContentStackView()
    
    // MARK: - Lazy initialization
    
    private func makeAirmoneyImageView() -> UIImageView {
        let image = UIImage(named: Images.Common.airmoney)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
    
    private func makeAirmoneyLabel() -> UILabel {
        let label = UILabel()
        label.font = .medium(size: 13)
        label.textColor = .content1
        label.text = "Airmoney"
        return label
    }
    
    private func makeAirmoneyStackView() -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [airmoneyImageView, airmoneyLabel])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 3
        return stackView
    }
    
    private func makeLoginButton() -> UIButton {
        let button = UIButton(type: .system)
        let attributedTitle = NSAttributedString(string: "LOG IN", attributes: [
            .font: UIFont.semiBold(size: 11),
            .foregroundColor: UIColor.content1,
            .kern: 1
        ])
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.content3.cgColor
        return button
    }
    
    private func makeContentStackView() -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [airmoneyStackView, loginButton])
        stackView.axis = .vertical
        stackView.alignment = .trailing
        stackView.spacing = 1
        return stackView
    }
    
    // MARK: - Public functions
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setAirmoneyHidden(_ hidden: Bool) {
        guard airmoneyStackView.isHidden != hidden else {
            return
        }
        UIView.animate(withDuration: 0.1) {
            self.airmoneyStackView.isHidden = hidden
        }
    }
    
    // MARK: - Private fuctions
    
    private func initialSetup() {
        addContentStackView()
        setupAirmoneyImageViewSize()
        setupButtonSize()
    }
    
    private func addContentStackView() {
        addSubview(contentStackView)
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: topAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func setupAirmoneyImageViewSize() {
        airmoneyImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            airmoneyImageView.widthAnchor.constraint(equalToConstant: 16),
            airmoneyImageView.heightAnchor.constraint(equalToConstant: 12)
        ])
    }
    
    private func setupButtonSize() {
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginButton.widthAnchor.constraint(equalToConstant: 80),
            loginButton.heightAnchor.constraint(equalToConstant: 28)
        ])
    }
}
