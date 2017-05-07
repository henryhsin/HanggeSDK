
//  ImageProcessor.swift
//  HanggeSDK
//
//  Created by 辛忠翰 on 2017/5/6.
//  Copyright © 2017年 辛忠翰. All rights reserved.


import Foundation

extension UIImage{
    //像素化的圖片
    public func pixellated(scale: Int = 30) -> UIImage?{
        let inputImage = CIImage(image: self)
        let filter = CIFilter(name: "CIPixellate")!
        filter.setValue(inputImage, forKey: kCIInputImageKey)
        filter.setValue(scale, forKey: kCIInputScaleKey)
        let fullPixellatedImage = filter.outputImage
        let cgImage = CIContext().createCGImage(fullPixellatedImage!, from: fullPixellatedImage!.extent)
        return UIImage(cgImage: cgImage!)
    }
    
    //高斯模糊後的圖片
    public func blurred(radius: Int = 40) -> UIImage?{
        let inputImage = CIImage(image: self)
        let filter = CIFilter(name: "CIGaussianBlur")!
        filter.setValue(inputImage, forKey: kCIInputImageKey)
        filter.setValue(radius, forKey: kCIInputRadiusKey)
        let blurredImage = filter.outputImage
        let cgImage = CIContext().createCGImage(blurredImage!, from: blurredImage!.extent)
        return UIImage(cgImage: cgImage!)
    }
}


