//
//  ComicPageViewController.swift
//  pageControl&CollectionViewCell
//
//  Created by jr on 2022/9/13.
//

import UIKit

class ComicPageViewController: UIViewController {
    
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    let comics = [Comic(pic: "pic1_1"),Comic(pic: "pic1_2"),Comic(pic: "pic1_3"),Comic(pic: "pic1_4"),Comic(pic: "pic1_5"),Comic(pic: "pic1_6"),Comic(pic: "pic1_7"),Comic(pic: "pic1_8"),Comic(pic: "pic1_9"),]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
  

}

extension ComicPageViewController:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return comics.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ComicCollectionViewCell.self)", for: indexPath) as! ComicCollectionViewCell
        let comic = comics[indexPath.item]
        cell.imageView.image = UIImage(named: comic.pic)
        return cell
    }
}

extension ComicPageViewController:UIScrollViewDelegate{
   
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.bounds.width
        pageControl.currentPage = Int(pageNumber)
    }
}
