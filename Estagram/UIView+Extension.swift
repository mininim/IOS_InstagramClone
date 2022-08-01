//
//  UIView+Extension.swift
//  Estagram
//
//  Created by 이민섭 on 2022/04/05.
//

import UIKit

extension UIView{
    @IBInspectable var cornerRadius: CGFloat{
        get{
            return layer.cornerRadius
        }
        set{
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
