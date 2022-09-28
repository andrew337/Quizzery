//
//  Extensions.swift
//  Quiz Me
//
//  Created by Admin on 9/16/22.
//

import Foundation
import UIKit

extension UIPageViewController {
    
    func goToNextPage(animated: Bool = true, completion: ((Bool) -> Void)? = nil) {
            guard let currentPage = viewControllers?[0] else { return }
            guard let nextPage = dataSource?.pageViewController(self, viewControllerAfter: currentPage) else { return }
            
            setViewControllers([nextPage], direction: .forward, animated: animated, completion: completion)
        }
    func goToPreviousPage(animated: Bool = true, completion: ((Bool) -> Void)? = nil) {
           guard let currentPage = viewControllers?[0] else { return }
           guard let prevPage = dataSource?.pageViewController(self, viewControllerBefore: currentPage) else { return }
           
           setViewControllers([prevPage], direction: .forward, animated: animated, completion: completion)
       }
}

extension UIStackView {
    
    func removeFullyArrangedSubviews() {
        arrangedSubviews.forEach { view in
            removeFully(view: view)
        }
    }
    
    func removeFully(view : UIView) {
        removeArrangedSubview(view)
        view.removeFromSuperview()
    }
    
    func toggleUserPressed() {
        arrangedSubviews.forEach { button in
            button.isUserInteractionEnabled = false
        }
    }
}
