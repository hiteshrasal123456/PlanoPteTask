//
//  TimerVc.swift
//  PlanoPteTask
//
//  Created by apple on 27/04/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class TimerVc: UIViewController {
    @IBOutlet weak var lblTimer: UILabel!
    var timer = Timer()
    var hrs = 0
    var min = 0
    var sec = 0
    var milliSecs = 0
    var backIdefTask : UIBackgroundTaskIdentifier!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(activateTimerWhenBackground(noti:)), name: .UIApplicationDidEnterBackground, object: nil)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startTimerAction(_ sender: Any) {
        self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: (#selector(self.updateLabels(timerObj:))), userInfo: nil, repeats: true)
    }
    
    @objc func activateTimerWhenBackground(noti: Notification) {
        var app = UIApplication.shared
        self.backIdefTask = app.beginBackgroundTask {
            app.endBackgroundTask(self.backIdefTask)
        }
        self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: (#selector(self.updateLabels(timerObj:))), userInfo: nil, repeats: true)
    }
    
    
    
    @objc func updateLabels(timerObj: Timer) {
        if(self.milliSecs == 59) {
            self.sec += 1
            self.milliSecs = 0
            if (self.sec == 60) {
                self.min += 1
                self.sec = 0
                if (self.min == 60) {
                    self.hrs += 1
                    self.min = 0
                }
            }
        } else {
            self.milliSecs += 1
        }
        self.lblTimer.text = String(format: "%02d : %02d : %02d : %02d", self.hrs, self.min, self.sec, self.milliSecs)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
