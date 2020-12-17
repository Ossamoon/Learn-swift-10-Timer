//
//  ViewController.swift
//  Timer
//
//  Created by 齋藤修 on 2020/12/17.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var timer = Timer()
    
    var count = Int()
    
    var imageArray = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        count = 0
        stopButton.isEnabled = false
        
        for i in 0..<8{
            let image = UIImage(named: "\(i)")
            imageArray.append(image!)
        }
        
        imageView.image = UIImage(named: "0")
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true){
            _ in
            self.count += 1
            if(self.count > 7){
                self.count = 0
            }
            self.imageView.image = self.imageArray[self.count]
        }
        
    }
    
//    @objc func timerUpdate(){
//        count += 1
//        if(count > 7){
//            count = 0
//        }
//        imageView.image = imageArray[count]
//    }

    @IBAction func start(_ sender: Any) {
        startButton.isEnabled = false
        stopButton.isEnabled = true
        startTimer()
    }
    
    @IBAction func stop(_ sender: Any) {
        startButton.isEnabled = true
        stopButton.isEnabled = false
        timer.invalidate()
    }
}

