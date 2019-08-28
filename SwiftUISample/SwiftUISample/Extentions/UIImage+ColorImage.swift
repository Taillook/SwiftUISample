//
//  UIImage+ColorImage.swift
//  SwiftUISample
//
//  Created by Taillook on 2019/08/26.
//  Copyright © 2019 Taillook. All rights reserved.
//

import UIKit

extension UIImage {
    class func clearImage(size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        context.setFillColor(UIColor.clear.cgColor)
        let rect = CGRect(origin: .zero, size: size)
        context.fill(rect)
        let toumeiImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        guard let image = toumeiImage else {
            return nil
        }
        return image
    }
}
