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
            case .header: return LayoutSectionFactory.header()
            case .SearchBar: return LayoutSectionFactory.SearchBar()
            case .promotion: return LayoutSectionFactory.promotion()
            case .categories: return LayoutSectionFactory.categories()
            case .categoriesItems: return LayoutSectionFactory.categoriesItem()
            case .popularheader: return LayoutSectionFactory.popularheader()
            case .populardeals: return LayoutSectionFactory.populardeals()
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
        let cells: [RegisterableView] = [
            .nib(HeaderCell.self),
            .nib(SearchBarCell.self),
            .nib(PromotionCell.self),
            .nib(CategoriesCell.self),
            .nib(CategoriesItemsCell.self),
            .nib(PopularDealsCell.self)
        ]
        
        
        collectionView.delegate = self
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
        let sb = UIStoryboard(name: "Detail", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
        
        
    }
}
