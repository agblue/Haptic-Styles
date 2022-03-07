//
//  ViewController.swift
//  Haptic Styles
//
//  Created by Danny Tsang on 10/26/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        view.backgroundColor = UIColor.white
        title = "Haptic Styles"
        
        setupViews()

    }

    func setupViews() {

        var buttonConfig = UIButton.Configuration.filled()
        buttonConfig.titleAlignment = .center
        buttonConfig.cornerStyle = .medium
        
        let button1 = UIButton(frame: .zero)
        button1.configuration = buttonConfig
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button1.setTitle("Success", for: .normal)
        button1.tag = 1
        
        let button2 = UIButton(frame: .zero)
        button2.configuration = buttonConfig
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button2.setTitle("Warning", for: .normal)
        button2.tag = 2
        
        let button3 = UIButton()
        button3.configuration = buttonConfig
        button3.translatesAutoresizingMaskIntoConstraints = false
        button3.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button3.setTitle("Error", for: .normal)
        button3.tag = 3

        let button4 = UIButton()
        button4.configuration = buttonConfig
        button4.translatesAutoresizingMaskIntoConstraints = false
        button4.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button4.setTitle("Light", for: .normal)
        button4.tag = 4
        
        let button5 = UIButton()
        button5.configuration = buttonConfig
        button5.translatesAutoresizingMaskIntoConstraints = false
        button5.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button5.setTitle("Medium", for: .normal)
        button5.tag = 5
        
        let button6 = UIButton()
        button6.configuration = buttonConfig
        button6.translatesAutoresizingMaskIntoConstraints = false
        button6.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button6.setTitle("Heavy", for: .normal)
        button6.tag = 6
        
        let button7 = UIButton()
        button7.configuration = buttonConfig
        button7.translatesAutoresizingMaskIntoConstraints = false
        button7.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button7.setTitle("Rigid", for: .normal)
        button7.tag = 7
        
        let button8 = UIButton()
        button8.configuration = buttonConfig
        button8.translatesAutoresizingMaskIntoConstraints = false
        button8.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button8.setTitle("Soft", for: .normal)
        button8.tag = 8
        
        let button9 = UIButton()
        button9.configuration = buttonConfig
        button9.translatesAutoresizingMaskIntoConstraints = false
        button9.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button9.setTitle("Selection", for: .normal)
        button9.tag = 9
        
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 4.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(button1)
        stackView.addArrangedSubview(button2)
        stackView.addArrangedSubview(button3)
        stackView.addArrangedSubview(button4)
        stackView.addArrangedSubview(button5)
        stackView.addArrangedSubview(button6)
        stackView.addArrangedSubview(button7)
        stackView.addArrangedSubview(button8)
        stackView.addArrangedSubview(button9)
        
        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
        ])
        
    }

    @objc func buttonTapped(sender: UIButton) {
        let tag = sender.tag

        print("Firing Haptic: \(tag)")

        switch tag {
        case 1:
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.success)
        case 2:
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.warning)
        case 3:
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.error)
        case 4:
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
        case 5:
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()
        case 6:
            let generator = UIImpactFeedbackGenerator(style: .heavy)
            generator.impactOccurred()
        case 7:
            let generator = UIImpactFeedbackGenerator(style: .rigid)
            generator.impactOccurred()
        case 8:
            let generator = UIImpactFeedbackGenerator(style: .soft)
            generator.impactOccurred()
        case 9:
            let generator = UISelectionFeedbackGenerator()
            generator.selectionChanged()
        default:
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.error)
        }
    }
}

final class Haptic {

    static func notificationOccurred(_ notificationType: UINotificationFeedbackGenerator.FeedbackType) {
        DispatchQueue.main.async {
            var haptic: UINotificationFeedbackGenerator? = UINotificationFeedbackGenerator()
            haptic?.prepare()
            haptic!.notificationOccurred(notificationType)
            haptic = nil
        }
    }

    static func impactOccurred(_ impact: UIImpactFeedbackGenerator.FeedbackStyle) {
        DispatchQueue.main.async {
            var haptic: UIImpactFeedbackGenerator? = UIImpactFeedbackGenerator(style: impact)
            haptic?.prepare()
            haptic!.impactOccurred()
            haptic = nil
        }
    }

    static func selectionOccured() {
        DispatchQueue.main.async {
            var haptic: UISelectionFeedbackGenerator? = UISelectionFeedbackGenerator()
            haptic?.prepare()
            haptic!.selectionChanged()
            haptic = nil
        }
    }

}
