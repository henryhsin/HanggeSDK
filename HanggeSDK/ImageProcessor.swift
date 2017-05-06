//
//  ImageProcessor.swift
//  HanggeSDK
//
//  Created by 辛忠翰 on 2017/5/6.
//  Copyright © 2017年 辛忠翰. All rights reserved.
//

import Foundation
public class ImageProcessor{
    var image: UIImage?
    var context: CIContext{
        return CIContext(options: nil)
    }
    public init(image: UIImage){
        self.image = image
    }
    
    //像素化的圖片
    public func pixellated(scale: Int = 30) -> UIImage?{
        guard (image != nil) else {
            return nil
        }
        let inputImage = CIImage(image: image!)
        let filter = CIFilter(name: "CIPixellate")!
        filter.setValue(inputImage, forKey: kCIInputImageKey)
        filter.setValue(scale, forKey: kCIInputScaleKey)
        let fullPixellatedImage = filter.outputImage
        let cgImage = context.createCGImage(fullPixellatedImage!, from: fullPixellatedImage!.extent)
        return UIImage(cgImage: cgImage!)
    }
    
    //高斯模糊後的圖片
    public func blurred(radius: Int = 40) -> UIImage?{
        guard (image != nil) else {
            return nil
        }
        let inputImage = CIImage(image: image!)
        let filter = CIFilter(name: "CIGaussianBlur")!
        filter.setValue(inputImage, forKey: kCIInputImageKey)
        filter.setValue(radius, forKey: kCIInputRadiusKey)
        let blurredImage = filter.outputImage
        let cgImage = context.createCGImage(blurredImage!, from: blurredImage!.extent)
        return UIImage(cgImage: cgImage!)
        
    }
    
    
    
}
