//
//  ViewController.swift
//  landmark
//
//  Created by Kohei Hayashi on 2021/09/09.
//

import UIKit
import RealityKit

final class ViewController: UIViewController {
    @IBOutlet var arView: ARView!
    private let addObjectButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addObjectButton.apply {
            $0.layer.borderWidth = 3
            $0.layer.borderColor = UIColor.systemOrange.cgColor
            $0.setTitle("add object", for: .normal)
            $0.setTitleColor(.systemOrange, for: .normal)
            $0.addTarget(self, action: #selector(addObject), for: .touchUpInside)
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                $0.widthAnchor.constraint(equalToConstant: 200),
                $0.heightAnchor.constraint(equalToConstant: 44),
                $0.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                $0.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
            ])
        }
    }

    @objc private func addObject() {
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()

        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
    }
}
