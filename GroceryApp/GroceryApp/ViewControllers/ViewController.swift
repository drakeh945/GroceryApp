//
//  ViewController.swift
//  GroceryApp
//
//  Created by Drake Herring on 11/30/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    private var dataSource: UICollectionViewDiffableDataSource <Section,Item>!
    private var snapshot = NSDiffableDataSourceSnapshot <Section,Item>()
    
    lazy var collectionViewLayout: UICollectionViewLayout = {
        
        let layout = UICollectionViewCompositionalLayout { [weak self] (sectionIndex, enviroment) -> NSCollectionLayoutSection? in
            guard let self = self else {return nil}
            
            let snapshot = self.dataSource.snapshot()
            let sectionType = snapshot.sectionIdentifiers[sectionIndex].type
            
            switch sectionType {
            case .header:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(118))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(375), heightDimension: .absolute(118))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10)
                
                let section = NSCollectionLayoutSection(group:group)
                section.orthogonalScrollingBehavior = .groupPaging
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0)
                
                return section
                
                
            case .SearchBar:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(54))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(318), heightDimension: .absolute(54))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10)
                
                let section = NSCollectionLayoutSection(group:group)
                section.orthogonalScrollingBehavior = .groupPaging
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 24, bottom: 5, trailing: 0)
                
                return section
                
            case .promotion:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(312), heightDimension: .absolute(168))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10)
                
                let section = NSCollectionLayoutSection(group:group)
                section.orthogonalScrollingBehavior = .groupPagingCentered
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0)
                
                return section
                
            case .categories:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(70))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                
                let section = NSCollectionLayoutSection(group:group)
                section.orthogonalScrollingBehavior = .groupPagingCentered
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                
                return section
                
            case .categoriesItems:
                let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(92), heightDimension: .fractionalHeight(1))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 12)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(97))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0)
                
                let section = NSCollectionLayoutSection(group:group)
                section.orthogonalScrollingBehavior = .groupPagingCentered
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0)
                
                return section
                
            case .popularheader:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(70))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                
                let section = NSCollectionLayoutSection(group:group)
                section.orthogonalScrollingBehavior = .groupPagingCentered
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                
                return section
                
            case .populardeals:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(261))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
               
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
                
                
                let groupSizeH = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(265))
                let groupSizeV = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))

                
                let groupH = NSCollectionLayoutGroup.horizontal(layoutSize: groupSizeH, subitem: item, count: 2)
                let groupV = NSCollectionLayoutGroup.vertical(layoutSize: groupSizeV, subitem: groupH, count: 3)

                
                groupV.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 28, bottom: 0, trailing: 28)
                
                let section = NSCollectionLayoutSection(group:groupV)
               
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 28)
                section.orthogonalScrollingBehavior = .groupPaging
                return section
                
                
            default: return nil
                
                
            }
        }
        return layout
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        
        // Do any additional setup after loading the view.
    }
    func initialize(){
        setupCollectionView()
        configureDataSource()
    }
    
    private func setupCollectionView(){
        collectionView.register(UINib(nibName: "HeaderCell", bundle: .main), forCellWithReuseIdentifier: "HeaderCell")
        
        collectionView.register(UINib(nibName: "SearchBarCell", bundle: .main), forCellWithReuseIdentifier: "SearchBarCell")
        
        collectionView.register(PromotionCell.nib, forCellWithReuseIdentifier: PromotionCell.reuseIdentifier)
       
        collectionView.register(CategoriesCell.nib, forCellWithReuseIdentifier: CategoriesCell.reuseIdentifier)
        collectionView.register(CategoriesItemsCell.nib, forCellWithReuseIdentifier: CategoriesItemsCell.reuseIdentifier)
        collectionView.register(PopularDealsCell.nib, forCellWithReuseIdentifier: PopularDealsCell.reuseIdentifier)
        
       
        
       
        collectionView.collectionViewLayout=collectionViewLayout
        
    }
    
    
    private func configureDataSource(){
        dataSource = UICollectionViewDiffableDataSource<Section,Item>(collectionView:collectionView){[weak self]
            (collectionView,indexPath,item) in
            guard let self = self else {return UICollectionViewCell()}
            
            let snapshot = self.dataSource.snapshot()
            let sectionType = snapshot.sectionIdentifiers[indexPath.section].type
            
            switch sectionType{
            case .header:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderCell", for: indexPath)
                return cell
            case .SearchBar:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchBarCell", for: indexPath)
                return cell
            case .promotion:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PromotionCell.reuseIdentifier, for: indexPath)
                return cell
            case .categories:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCell.reuseIdentifier, for: indexPath)
                return cell
            case .categoriesItems:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesItemsCell.reuseIdentifier, for: indexPath)
                return cell
            case .popularheader:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCell.reuseIdentifier, for: indexPath) as! CategoriesCell
                cell.header("Popular Deals")
                return cell
            case .populardeals:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularDealsCell.reuseIdentifier, for: indexPath)
                return cell
            
            
            
            
            default:return nil
            }
        }
        
        let sections = [
            Section(type: .header, items: [
            Item()
            ]),
            Section(type: .SearchBar, items: [
            Item()
            ]),
            Section(type: .promotion, items: [Item(),Item(),Item()]),
            Section(type: .categories, items: [Item()]),
            Section(type: .categoriesItems, items: [Item(),Item(),Item(),Item(),Item(),Item()]),
            Section(type: .popularheader, items: [Item()]),
            Section(type: .populardeals, items: [Item(),Item(),Item(),Item(),Item(),Item()])
            
        ]
        
        var snapshot = NSDiffableDataSourceSnapshot<Section,Item>()
        snapshot.appendSections(sections)
        sections.forEach {snapshot.appendItems($0.items, toSection: $0)}
        dataSource.apply(snapshot,animatingDifferences: false)
    }
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "DetailViewController")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
        
        
    }
}
