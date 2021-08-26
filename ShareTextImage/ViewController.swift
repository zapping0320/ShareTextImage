//
//  ViewController.swift
//  ShareTextImage
//
//  Created by DONGHYUN KIM on 2021/08/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textfieldForShare: UITextField!
    
    
    @IBOutlet weak var imageForShare: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //for test
        textfieldForShare.text = "https://www.naver.com/"
    }
    
    func popupMessage(_ title:String, _ message:String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "확인",
                                          style: .default, handler: {result in
                                           
                                          })
        alert.addAction(confirmAction)
        self.present(alert, animated: true, completion: nil)
    }

    @IBAction func selectImage(_ sender: Any) {
        
    }
    
    @IBAction func shareTextImageAction(_ sender: Any) {
        if textfieldForShare.text?.isEmpty == true {
            popupMessage("","공유할 문자열을 입력해주세요")
            return
        }
        
        var objectsToShare = [String]()
        if let text = textfieldForShare.text {
            objectsToShare.append(text)
            print("[INFO] textField's Text : ", text)
        }
        
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        
        // 공유하기 기능 중 제외할 기능이 있을 때 사용
        //activityVC.excludedActivityTypes = [UIActivity.ActivityType.print]
        self.present(activityVC, animated: true, completion: nil)
    }
}

