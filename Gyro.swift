//
//  ViewController.swift
//  Swift Sleep
//
//  Created by 沖 隼佑 on 2015/05/15.
//  Copyright (c) 2015年 沖 隼佑. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    //CMmotionManagerのインスタンス生成
    lazy var motionManager = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if motionManager.gyroAvailable{
            
            //センサーの更新間隔の指定
            motionManager.gyroUpdateInterval = 30
            
            //ハンドラを設定し、加速度の取得開始
            let queue = NSOperationQueue()
            motionManager.startGyroUpdatesToQueue(queue, withHandler:
                {(data: CMGyroData!, error: NSError!) in
                    
                    //画面に表示
                    println("X = \(data.rotationRate.x)")
                    println("Y = \(data.rotationRate.y)")
                    println("Z = \(data.rotationRate.z)")
                    
                }
            )
            //(不必要になったら)センサーの停止
            if (motionManager.gyroActive) {
                motionManager.stopGyroUpdates()
            }
        }
    }
}


