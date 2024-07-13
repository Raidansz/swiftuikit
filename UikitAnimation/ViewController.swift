//
//  ViewController.swift
//  UikitAnimation
//
//  Created by Raidan on 30/06/2024.
//

import UIKit
import SwiftUI


class ViewController: UIViewController {
    let transitionDelegate = TransitioningDelegate()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        let button = UIButton(type: .system)
        button.setTitle("Show SwiftUI View", for: .normal)
        button.addTarget(self, action: #selector(showSwiftUIView), for: .touchUpInside)
        
        button.backgroundColor = UIColor.systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func showSwiftUIView() {
        let swiftUIView = SecondView()
        let hostingController = UIHostingController(rootView: swiftUIView)
        hostingController.modalPresentationStyle = .fullScreen
        hostingController.transitioningDelegate = transitionDelegate
        present(hostingController, animated: true, completion: nil)
    }
}
