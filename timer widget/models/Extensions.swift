//
//  ListItems.swift
//  timer widget
//
//  Created by Olivér Ungváry on 05/06/2024.
//
import UIKit


extension String {
    func image() -> UIImage? {
        let size = CGSize(width: 300, height: 300)
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { (context) in
            UIColor.clear.set()
            let rect = CGRect(origin: .zero, size: size)
            UIRectFill(rect)
            
            // Get the size of the emoji
            let font = UIFont.systemFont(ofSize: 200)
            let attributes: [NSAttributedString.Key: Any] = [.font: font]
            let emojiSize = (self as NSString).size(withAttributes: attributes)
            
            // Calculate the center point for drawing
            let centerX = rect.midX
            let centerY = rect.midY
            let emojiRect = CGRect(x: centerX - emojiSize.width / 2, y: centerY - emojiSize.height / 2, width: emojiSize.width, height: emojiSize.height)
            
            (self as AnyObject).draw(in: emojiRect, withAttributes: attributes)
        }
    }
}
