//
//  ViewController.swift
//  StopWatch
//
//  Created by 高橋　龍 on 2021/08/18.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    var count: Float = 0.0
    
    var timer: Timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @objc func up() {
        count += 0.01
        //float型をString型に変換しているので、特殊な指定方法になっている
        label.text = String(format: "%.2f", count)
    }

    @IBAction func start() {
        
        //タイマーが動作していなかったら
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 0.01,
                                         target: self,
                                         selector: #selector(self.up),
                                         userInfo: nil,
                                         repeats: true)
        }
    }
    
    @IBAction func stop() {
        if timer.isValid {
            //invalidate = 無効にする
            timer.invalidate()
        }
    }
    
    @IBAction func reset() {
        stop()
        
        count = 0.0
        label.text = String(format: "%.2f", count)
    }
    
}

