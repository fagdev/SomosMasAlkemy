//
//  onBoardingAdapter.swift
//  Somosmas
//
//  Created by Lucas Di Lorenzo on 15/10/2021.
//

import UIKit

class onBoardingAdapter : NSObject {
    
    var pageControl = UIPageControl()
    private unowned var pageViewController:UIPageViewController?
    var arrayContentPVC: [ContentPVC] = []
    var currentIndex = 0
    
    func setPageViewController(_ pageViewController:UIPageViewController) {
        pageViewController.delegate = self
        pageViewController.dataSource = self
        self.pageViewController = pageViewController
    }
    
    func configurePageControl() -> UIPageControl{
         pageControl = UIPageControl(frame: CGRect(x: 0,y: UIScreen.main.bounds.maxY - 50,width: UIScreen.main.bounds.width,height: 50))
         self.pageControl.numberOfPages = arrayContentPVC.count
         self.pageControl.currentPage = 0
         self.pageControl.tintColor = UIColor.black
         self.pageControl.pageIndicatorTintColor = UIColor.systemGray2
         self.pageControl.currentPageIndicatorTintColor = UIColor.black
         return pageControl
     }
    
   func nextPage () {
        self.currentIndex = self.currentIndex == (self.arrayContentPVC.count - 1) ? 0 : (self.currentIndex + 1)
        let contentPVC = self.arrayContentPVC[self.currentIndex]
        self.pageControl.currentPage = currentIndex
        self.createController(contentPVC, withDirection: .forward, animated: true)

    }
    
    func setPageController(){
        guard let contentPVC = self.arrayContentPVC.first else { return }
        self.createController(contentPVC)
    }
    
    private func createController(_ contentPVC: ContentPVC, withDirection direction: UIPageViewController.NavigationDirection = .forward, animated: Bool = false) {
        let controller = ContentPVCViewController.buildWithContentPVC(contentPVC)
        self.pageViewController?.setViewControllers([controller], direction: direction, animated: animated, completion: nil)
    }

}

extension onBoardingAdapter: UIPageViewControllerDataSource{
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let controller = viewController as? ContentPVCViewController else {return nil }
        guard let index = self.arrayContentPVC.firstIndex(where: {$0.titulo == controller.contentPVC.titulo}) else {return nil }
        if index == 0{
            return ContentPVCViewController.buildWithContentPVC( self.arrayContentPVC[self.arrayContentPVC.count-1] )
        }
        else{
            return ContentPVCViewController.buildWithContentPVC( self.arrayContentPVC[index - 1] )
        }
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let controller = viewController as? ContentPVCViewController else {return nil }
        guard let index = self.arrayContentPVC.firstIndex(where: {$0.titulo == controller.contentPVC.titulo}) else {return nil }
        if index == (self.arrayContentPVC.count - 1) {
            return ContentPVCViewController.buildWithContentPVC( self.arrayContentPVC[0] )
        }
        else{
            return ContentPVCViewController.buildWithContentPVC( self.arrayContentPVC[index + 1] )
        }
    }
}

extension onBoardingAdapter: UIPageViewControllerDelegate{
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            guard let controller = pageViewController.viewControllers?.first as? ContentPVCViewController else { return }
            guard let index = self.arrayContentPVC.firstIndex(where: { $0.titulo ==  controller.contentPVC.titulo }) else { return }
            self.currentIndex = index
            self.pageControl.currentPage = currentIndex
        }
    }
}


