//
//  DetailViewController.swift
//  GroceryApp
//
//  Created by Drake Herring on 12/3/22.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var dataSource: UICollectionViewDiffableDataSource <Section,Item>!
    private var snapshot = NSDiffableDataSourceSnapshot <Section,Item>()
    
    lazy var collectionViewLayout: UICollectionViewLayout = {
        
        let layout = UICollectionViewCompositionalLayout { [weak self] (sectionIndex, enviroment) -> NSCollectionLayoutSection? in
            guard let self = self else {return nil}
            
            let snapshot = self.dataSource.snapshot()
            let sectionType = snapshot.sectionIdentifiers[sectionIndex].type
            
            switch sectionType {
            case .fruitCell:
                return LayoutSectionFactory.fruitCell() 
            case .desriptionCell:
                return LayoutSectionFactory.descriptionCell()
            case .priceCell:
                return LayoutSectionFactory.priceCell()
            case .cartCell:
                return LayoutSectionFactory.cartCell()
            default: return nil
            }
        }
        return layout
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      initialize()
    }
    func initialize(){
        setupCollectionView()
        configureDataSource()
    }
    
    private func setupCollectionView(){
        let cells: [RegisterableView] = [
            .nib(FruitsCell.self),
            .nib(DescriptionCell.self),
            .nib(PriceCell.self),
            .nib(CartCell.self),
        ]
        
        
       
        collectionView.register(cells: cells)
        collectionView.collectionViewLayout=collectionViewLayout
        
    }
    
    
    
    private func configureDataSource(){
    dataSource = UICollectionViewDiffableDataSource<Section,Item>(collectionView:collectionView){[weak self]
            (collectionView,indexPath,item) in
            guard let self = self else {return UICollectionViewCell()}
            
            let snapshot = self.dataSource.snapshot()
            let sectionType = snapshot.sectionIdentifiers[indexPath.section].type
            
            switch sectionType{
            case .fruitCell:
                let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "FruitsCell", for: indexPath)
                return cell
            case .desriptionCell:
                let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "DescriptionCell", for: indexPath)
                return cell
             
            case .priceCell:
                let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "PriceCell", for: indexPath)
                return cell
            case .cartCell:
                let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "CartCell", for: indexPath)
                return cell
            default:return nil
            }
        }
        
        let sections = [
            Section(type:.fruitCell,items: [Item()]),
            Section(type:.desriptionCell,items: [Item()]),
            Section(type:.priceCell,items: [Item()]),
            Section(type:.cartCell,items: [Item()]),
        ]
        
          
        var snapshot = NSDiffableDataSourceSnapshot<Section,Item>()
        snapshot.appendSections(sections)
        sections.forEach {snapshot.appendItems($0.items, toSection: $0)}
        dataSource.apply(snapshot,animatingDifferences: false)
    }
}
