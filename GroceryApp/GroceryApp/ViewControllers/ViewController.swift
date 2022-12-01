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
                
            default:return nil
            }
        }
        
        let sections = [
            Section(type: .header, items: [
            Item()
            ]),
            Section(type: .SearchBar, items: [
            Item()
            ])
            
        ]
        
        var snapshot = NSDiffableDataSourceSnapshot<Section,Item>()
        snapshot.appendSections(sections)
        sections.forEach {snapshot.appendItems($0.items, toSection: $0)}
        dataSource.apply(snapshot,animatingDifferences: false)
    }
}

