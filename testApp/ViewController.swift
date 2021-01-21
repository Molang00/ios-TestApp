//
//  ViewController.swift
//  testApp
//
//  Created by 김병수 on 2021/01/19.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet weak var mainButton2: UIButton!
    
    var mainLabel2: UILabel!
    
    @IBAction func setText(_ sender: UIButton) {
        if sender.isEqual(mainButton){
            callCurrentTime()
        } else {
            mainLabel.text = "fail"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mainLabel.text = "Test"
        mainButton.setTitle("buttonTest", for: .highlighted)
        mainButton2.setTitle("buttonTest2", for: .highlighted)
        
        mainLabel2 = UILabel(frame: CGRect(x: 150,
                                           y: 150,
                                           width: 30,
                                           height: 30))
        view.addSubview(mainLabel2)
        mainLabel2.backgroundColor = UIColor.green
        
        mainLabel2.text = "hi"
    }
    
    func callCurrentTime() {
        AF.request("https://google.com").responseString() { response in
            switch response.result {
            case .success:
                self.mainLabel.text = try! response.result.get()
            case .failure(let error):
                print(error)
                return
            }
        }
    }


}

