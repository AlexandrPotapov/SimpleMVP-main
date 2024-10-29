//
//  ModuleGammaView.swift
//  SimpleMVP
//
//  Created by Alexander on 29.10.2024.
//

import UIKit

final class ModuleGammaView: UIView {
    
    struct Model {
        let text: String
        let image: String
    }
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit    
        return imageView
    }()
    
    private let presenter: ModuleGammaPresenterProtocol
    
    init(presenter: ModuleGammaPresenterProtocol) {
        self.presenter = presenter
        super.init(frame: .zero)
        commonInit()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(model: ModuleGammaView.Model) {
        label.text = model.text
        let configuration = UIImage.SymbolConfiguration(pointSize: 24, weight: .regular)
        imageView.image = UIImage(systemName: model.image, withConfiguration: configuration)
    }
}


private extension ModuleGammaView {
    
    func commonInit() {
        backgroundColor = .white
        setupSubviews()
        setupConstraints()
    }
    
    func setupSubviews() {
        addSubview(label)
        addSubview(imageView)
    }
    
    func setupConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            imageView.topAnchor.constraint(equalTo: label.topAnchor, constant: 40),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
        ])
    }
}
