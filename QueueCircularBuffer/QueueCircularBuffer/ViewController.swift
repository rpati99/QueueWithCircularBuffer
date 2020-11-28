//
//  ViewController.swift
//  QueueCircularBuffer
//
//  Created by Rachit Prajapati on 27/11/20.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    // MARK: - UIViews
    @IBOutlet weak var v1: UIView!
    @IBOutlet weak var v2: UIView!
    @IBOutlet weak var v3: UIView!
    @IBOutlet weak var v4: UIView!
    @IBOutlet weak var v5: UIView!
    
    // MARK: - Arrow Constraints
    @IBOutlet weak var readArwConstraint: NSLayoutConstraint!
    @IBOutlet weak var writeArwConstraint: NSLayoutConstraint!
    
    // MARK: - Buttons
    @IBOutlet weak var enQueueBtn: UIButton!
    @IBOutlet weak var deQueueBtn: UIButton!
    
    // MARK: - Labels
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    @IBOutlet weak var lbl4: UILabel!
    @IBOutlet weak var lbl5: UILabel!
    
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        changeViewBackground(of: v1)
        changeViewBackground(of: v2)
        changeViewBackground(of: v3)
        changeViewBackground(of: v4)
        changeViewBackground(of: v5)
        presentBoxes()
        hideLbl()
        
    }
    
    //MARK: - Button methods
    @IBAction func enqueueBtnTapped(_ sender: Any) {
        moveWriteArrow()
        enqueueCalc()
    }
    @IBAction func dequeueBtnTapped(_ sender: Any) {
        moveReadArrow()
        dequeueCalc()
    }
    
    // MARK: - Helper functions
    private func changeViewBackground(of view: UIView) {
        view.layer.borderColor = UIColor.orange.cgColor
        view.layer.borderWidth = 3.0
        
    }
    
    private func moveReadArrow() {
        UIView.animate(withDuration: 1.0) {
            if self.readArwConstraint.constant <= 314 {
                self.readArwConstraint.constant += 70
            } else {
                self.readArwConstraint.constant = 104
            }
            self.view.layoutIfNeeded()
        }
    }
    
    private func moveWriteArrow() {
        UIView.animate(withDuration: 1.0) {
            if self.writeArwConstraint.constant <= 259 {
                self.writeArwConstraint.constant += 70
                self.view.layoutIfNeeded()
            } else if self.writeArwConstraint.constant > 259 {
                UIView.animate(withDuration: 3.0) {
                    self.writeArwConstraint.constant += 70
                    self.view.layoutIfNeeded()
                } completion: { (true) in
                    UIView.animate(withDuration: 3.0) {
                        self.writeArwConstraint.constant = 119
                        self.view.layoutIfNeeded()
                    }
                }
            }
        }
    }
    
    private func presentBoxes() {
        UIView.animate(withDuration: 0.3) {
            self.viewTransform(of: self.v1)
            self.v1.transform = CGAffineTransform.identity
        } completion: { (true) in
            UIView.animate(withDuration:0.3) {
                self.viewTransform(of: self.v2)
                self.v2.transform = CGAffineTransform.identity
            } completion: { (true) in
                UIView.animate(withDuration: 0.3) {
                    self.viewTransform(of: self.v3)
                    self.v3.transform = CGAffineTransform.identity
                } completion: { (true) in
                    UIView.animate(withDuration: 0.3) {
                        self.viewTransform(of: self.v4)
                        self.v4.transform = CGAffineTransform.identity
                    } completion: { (true) in
                        UIView.animate(withDuration: 0.3) {
                            self.viewTransform(
                                of: self.v5)
                            self.v5 .transform = CGAffineTransform.identity
                        }
                    }
                }
            }
        }
    }
    
    private func enqueueCalc() {
        UIView.animate(withDuration: 0.5) {
            if self.lbl1.alpha == 0 {
                self.lbl1.alpha = 1
            } else if self.lbl2.alpha == 0 {
                self.lbl2.alpha = 1
            } else if self.lbl3.alpha == 0 {
                self.lbl3.alpha = 1
            } else if self.lbl4.alpha == 0 {
                self.lbl4.alpha = 1
                UIView.animate(withDuration: 1.0) {
                    self.lbl5.alpha = 1
                }
            } else if self.lbl1.alpha == 0 {
                self.lbl1.alpha = 1
                self.lbl1.text = "99"
            }
        }
    }
    
    private func dequeueCalc() {
        UIView.animate(withDuration: 0.5) {
            if self.lbl1.alpha == 1 {
                self.lbl1.alpha = 0
            } else if self.lbl2.alpha == 1 {
                self.lbl2.alpha = 0
            } else if self.lbl3.alpha == 1 {
                self.lbl3.alpha = 0
            } else if self.lbl4.alpha == 1{
                self.lbl4.alpha = 0
            } else if self.lbl5.alpha == 1 {
                self.lbl5.alpha = 0
            }
        }
    }
    private func hideLbl() {
        lbl1.alpha = 0
        lbl2.alpha = 0
        lbl3.alpha = 0
        lbl4.alpha = 0
        lbl5.alpha = 0
    }
    
    private func viewTransform(of views: UIView) {
        views.transform = CGAffineTransform(scaleX: 3, y: 3)
        
    }
    
    
    
    
}


