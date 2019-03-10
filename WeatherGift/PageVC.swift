//
//  PageVC.swift
//  WeatherGift
//
//  Created by John Connolly on 3/9/19.
//  Copyright © 2019 John Connolly. All rights reserved.
//

import UIKit

class PageVC: UIPageViewController {
    
    var currentPage = 0
    var locationsArray = ["Local City", "Sydney, Australia", "San Francisco, USA", "Parma, Italy"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        dataSource = self
        setViewControllers([createDetailVC(forPage: 0)], direction: .forward, animated: false, completion: nil)
        

        // Do any additional setup after loading the view.
    }
    
    func createDetailVC(forPage page: Int) -> DetailVC {
        currentPage = min(max(0, page), locationsArray.count-1)
        
        let detailVC = storyboard!.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        detailVC.locationsArray = locationsArray
        detailVC.currentPage = currentPage
        return detailVC
        
    }

}


extension PageVC: UIPageViewControllerDataSource, UIPageViewControllerDelegate{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let currentViewController = viewController as? DetailVC {
            if currentViewController.currentPage < locationsArray.count-1 {
                return createDetailVC(forPage: currentViewController.currentPage+1)
            }
            
        }
        return nil
        
        
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let currentViewController = viewController as? DetailVC {
            if currentViewController.currentPage > 0 {
                return createDetailVC(forPage: currentViewController.currentPage-1)
            }
        }
        return nil
        
    }
    
    
    
    
    
}





















