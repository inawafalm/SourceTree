//
//  SecondViewController.swift
//  NavigationLesson
//
//  Created by Nawaf Almutairi on 28/02/2024.
//

import UIKit
import SnapKit


class SecondViewController: UIViewController {

    var receviedData: String?
    var receivedData2: Int?
    
    var name: String?
    var imageString: String?

    
    private let nameLabel = UILabel()
    private let profileImage = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBrown
        title = "Second VC"
        print(receviedData ?? "Nothing Received")
        
        view.addSubview(profileImage)
        
        profileImage.image = UIImage(named: imageString ?? "")
        profileImage.contentMode = .scaleAspectFit
        // Do any additional setup after loading the view.
        
        autolayout()
    }
    
    
    func autolayout() {
        
        profileImage.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(250)
        }
        
    }


}
