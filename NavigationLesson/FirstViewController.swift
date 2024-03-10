//
//  ViewController.swift
//  NavigationLesson
//
//  Created by Nawaf Almutairi on 28/02/2024.
//

import UIKit
import SnapKit


class FirstViewController: UIViewController {
    
    let navigateButton = UIButton()
    let ImageTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "First VC"
        // Do any additional setup after loading the view.
        
        view.addSubview(navigateButton)
        view.addSubview(ImageTextField)

        setupUI()
        setupAutolayout()
        setupNavigationBar()
        
        navigateButton.addTarget(self, action: #selector(navigationButtonTapped), for:.touchUpInside )
        
    }
    
    //MARK: Functions
    
    func setupUI() {
        
        //MARK: Navigation Button
        navigateButton.setTitle("Go to the second view", for: .normal)
        navigateButton.backgroundColor = .systemBlue
        navigateButton.layer.cornerRadius = 10
        
        ImageTextField.placeholder = "Enter image name"
        
    }
    
    func setupAutolayout() {
        
        
        navigateButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
            
        }
        ImageTextField.snp.makeConstraints { make in
            make.top.equalTo(navigateButton.snp.bottom).offset(20)
        }
        
        
        
    }
    
    @objc func navigationButtonTapped() {
        print("Button Tapped 🛡️")
        
        // Navigation Code
        let secondVC = SecondViewController()
        
        secondVC.receviedData = "Hello from First VC"
        secondVC.imageString = ImageTextField.text
        self.navigationController?.pushViewController(secondVC, animated: true)
        
    }
    
    func setupNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }

}


#if canImport(SwiftUI) && DEBUG
struct ExampleViewControllerPreview: PreviewProvider {
    static var previews: some View {
        GenericViewControllerRepresentable(FirstViewController())
    }
}
#endif



#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct GenericViewControllerRepresentable<ViewController: UIViewController>: UIViewControllerRepresentable {
    
    let viewController: ViewController
    
    init(_ builder: @autoclosure @escaping () -> ViewController) {
        self.viewController = builder()
    }
    
    func makeUIViewController(context: Context) -> ViewController {
        viewController
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
    }
}
#endif

