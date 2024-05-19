//
//  MoreViewController.swift
//  WeatherAPP
//
//  Created by Eljan on 19.05.24.
//

import UIKit

class MoreViewController: UIViewController {
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var searchButton: UIButton!
    @IBOutlet private weak var textField: UITextField!
    private var hideSearchField: Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        collectionView.registerNib(with: "MoreCollectionViewCell")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func searchButtonAction(_ sender: Any) {
        
        hideSearchField.toggle()
        UIView.transition(
            with: textField,
            duration: 0.5,
            options: .transitionFlipFromTop,
            animations: { [weak self] in
                guard let self = self else {return}
                self.textField.isHidden = self.hideSearchField
            })
        
    }
    
    fileprivate func setupView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
    
}

extension MoreViewController: UICollectionViewDataSource,
                              UICollectionViewDelegate,
                              UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoreCollectionViewCell", for: indexPath) as! MoreCollectionViewCell
        return cell
        
    }
    
    
}
