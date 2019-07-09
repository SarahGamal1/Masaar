//
//  FacilitiesVC+CollectionView.swift
//  Masar
//
//  Created by Sarah Gamal on 7/8/19.
//  Copyright © 2019 Sarah Gamal. All rights reserved.
//

import UIKit


extension FacilitiesVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func setupCollectionView() {
        collectionView.register(FacilitiesCell.nib, forCellWithReuseIdentifier: FacilitiesCell.cellId)
        collectionView.dataSource = self
        collectionView.delegate   = self
        collectionView.refreshControl = refreshControl
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return presenter.numberOfRows
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FacilitiesCell.cellId, for: indexPath) as! FacilitiesCell
        
        presenter.configureCell(cell: cell, with: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let facilityDetailsVC = storyboard.instantiateViewController(withIdentifier: "FacilityDetailsVC") as! FacilityDetailsVC
        facilityDetailsVC.facility = presenter.selectedItem(for: indexPath.item)
        navigationController?.pushViewController(facilityDetailsVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.item == presenter.numberOfRows - 1, isPaginating {
            currentPage += 1
            presenter.getData(page: currentPage)
        }
        
        if indexPath.item < 4  {
            cellDidAnimate(cell)
        }
    }
    
    fileprivate func cellDidAnimate(_ cell: UICollectionViewCell) {
        cell.alpha = 0
        let transform = CATransform3DTranslate(CATransform3DIdentity, 0, -350, 0)
        cell.layer.transform = transform
        UIView.animate(withDuration: 1.0) {
            cell.alpha = 1
            cell.layer.transform = CATransform3DIdentity
        }
    }
    
}

extension FacilitiesVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath:
        IndexPath) -> CGSize {
        
        let width = collectionView.bounds.width - 32
        let height = (collectionView.bounds.height - 40) / 4
        let cellSize = CGSize(width: width , height: height)
        return cellSize
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        let sectionInset = UIEdgeInsets(top: 24, left: 0, bottom: 0, right: 0)
        return sectionInset
    }
    
}
