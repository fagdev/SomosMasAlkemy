//
//  OnBoardingViewController.swift
//  Somosmas
//
//  Created by Lucas Di Lorenzo on 15/10/2021.
//

import UIKit

class OnBoardingViewController: UIViewController{
    
    var arrSlide: [Slide] = []
    private var auxArrayContentPVC: [ContentPVC] = []
    private var descript: String = ""
    
    private func procesarArraySlide(arraySlide:[Slide])-> [ContentPVC]{
        for element in arraySlide{
            self.descript = element.description.removeEspecialCharacters
            self.auxArrayContentPVC.append(ContentPVC(titulo: element.name, descrip: descript, imagName: element.image))
        }
        return auxArrayContentPVC
    }
    
    lazy var onboardingAdapter:onBoardingAdapter = {
        let adapter = onBoardingAdapter()
        adapter.arrayContentPVC = procesarArraySlide(arraySlide: arrSlide)
        return adapter
    }()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.onboardingAdapter.setPageController()
        guard let isToken = UserDefaults.standard.object(forKey: "token") as? String else {return}
        print(isToken)
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        self.onboardingAdapter.nextPage()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let controller = segue.destination as? UIPageViewController {
            self.onboardingAdapter.setPageViewController(controller)
            let pc = self.onboardingAdapter.configurePageControl()
            self.view.addSubview(pc)
        }
    }
    
}



 

