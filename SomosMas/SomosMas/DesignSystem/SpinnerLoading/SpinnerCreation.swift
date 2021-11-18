//
//  SpinnerCreation.swift
//  Somosmas
//
//  Created by Nahuel Paez on 14/10/2021.
//

import UIKit

class RotatingCirclesView : UIView {
    
    private let square = UIView(frame: CGRect(x: 20, y: 20, width: 60, height: 60))
    private let circle = UIView(frame: CGRect(x: 120, y: 20, width: 60, height: 60))
    private let triangle = UIView(frame: CGRect(x: 70, y: -50, width: 60, height: 60))
    
    private let positions: [CGRect] = [CGRect(x: 30, y: 20, width: 60, height: 60),
                               CGRect(x: 60, y: 15, width: 70, height: 70),
                               CGRect(x: 110, y: 20, width: 60, height: 60),
                               CGRect(x: 60, y: 25, width: 50, height: 50)]
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.configure()
        self.setDownTriangle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("error")
    }
    
     private func configure(){
        translatesAutoresizingMaskIntoConstraints = false
         
        // cuadrado
        square.backgroundColor = UIColor.yellow.withAlphaComponent(0.9)
        square.layer.zPosition = 2
        
        // circulo
        circle.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.9)
        circle.layer.cornerRadius = circle.frame.width / 2
        circle.layer.zPosition = 1
        
        addSubview(square)
        addSubview(circle)
        addSubview(triangle)
        
    }
    
    private func setDownTriangle(){
        let frame = triangle.frame.size
        let path = CGMutablePath()

        path.move(to: CGPoint(x: frame.width/2, y: 0))
        path.addLine(to: CGPoint(x:frame.width, y: frame.height))
        path.addLine(to: CGPoint(x:0 ,y:frame.height))
         
       let shape = CAShapeLayer()
          shape.path = path
          shape.fillColor = UIColor.red.cgColor

          triangle.layer.insertSublayer(shape, at: 0)
      }
    
    func starAnimation() {
        self.animate(self.square, counter: 1)
        self.animate(self.circle, counter: 3)
    }
    
    func endAnimation() {
        self.square.layer.removeAllAnimations()
        self.circle.layer.removeAllAnimations()
    }

    private func animate(_ circle: UIView , counter : Int){
        var counter = counter
        
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveLinear) {
            
            circle.frame = self.positions[counter]
            
            switch counter {
                case 1: if circle == self.square{ self.square.layer.zPosition = 2}
                case 3 : if circle == self.circle { self.circle.layer.zPosition = 0 }
                default: break
            }
            
        } completion: { completed in
            
            if completed {
                switch counter {
                    case 0...2 : counter += 1
                    case 3 : counter = 0
                    default: break
                }
                self.animate(circle, counter: counter)
            }
        }
    }
}
