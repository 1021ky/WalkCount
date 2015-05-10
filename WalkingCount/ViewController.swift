//
//  ViewController.swift
//  WalkingCount
//
//  Created by 山中 啓祐 on 2015/05/10.
//  Copyright (c) 2015年 山中 啓祐. All rights reserved.]
//  ref https://github.com/TokuhiroYui/CountWalk
//

import UIKit
import CoreMotion


class ViewController: UIViewController {
    
    private var label:UILabel!
    let pedometer  = CMPedometer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        self.startStepCounting()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // UIの初期化
    func setUpUI() {
        self.label = UILabel()
        self.label.frame = CGRectMake(self.view.center.x - 100, self.view.center.y + 50, 200, 100)
        self.label.backgroundColor = UIColor.blueColor()
        self.label.text = "Steps: 0"
        self.view.addSubview(label)
    }
    
    func startStepCounting() {
        if !CMPedometer.isStepCountingAvailable() {
            return
        }
        
        pedometer.startPedometerUpdatesFromDate(NSDate(), withHandler: {
            data, error in dispatch_async(dispatch_get_main_queue(), {
                // 歩数
                let steps = data.numberOfSteps
                // 結果を出力
                self.label.text = "Steps: \(steps)"
            })
        })
        
    }
    
}

