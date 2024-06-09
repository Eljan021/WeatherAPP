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
    
    var searchList: [ResultSC]?
    var weatherList: WeatherModel?
    private var hideSearchField: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
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
                setupView()
            })
    }
    
    fileprivate func setupView() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerNib(with: "MoreHeaderCell")
        collectionView.register(
            UINib(
                nibName: "MoreCollectionViewCell",
                bundle: nil),
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "MoreCollectionViewCell")
        
    }
    
    
    fileprivate func reloadCollectionView() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    fileprivate func getSearchList() -> [ResultSC]? {
        return searchList ?? nil
    }
    
    fileprivate func getSearchCount() -> Int{
        return searchList?.count ?? 0
    }
}

extension MoreViewController: UICollectionViewDataSource,
                              UICollectionViewDelegate,
                              UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return getSearchCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeCell(cellClass: MoreHeaderCell.self, indexPath: indexPath)
        let model = getSearchList()?[indexPath.row]
        cell.configureCellCity(title: model?.cityname ?? "")
        cell.configureCellCounrty(title: model?.country ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width:collectionView.frame.width, height: 120)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Home", bundle: Bundle.main).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        navigationController?.pushViewController(vc!, animated: true)
    
    }
    
    
}

extension MoreViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else {return}
        SearchManager.shared.getSearchList(query: text) {[weak self] response, error in
            guard let self = self else {return}
            if let error = error {
                print(#function, error)
            } else if let response = response?.results {
                self.searchList = response
                self.reloadCollectionView()
            }
            
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else {return}
        WeatherManager.shared.getTemperature(
            latitude: String(searchList?.first?.latitude ?? 40.49),
            longitude: String(searchList?.first?.longitude ?? 49.49)
        ) { [weak self] response, error in
            guard let self = self else {return}
            if let error = error {
                print(#function, error)
            }else if let response = response {
                self.weatherList = response
                self.reloadCollectionView()
            }
        }
    }
}




