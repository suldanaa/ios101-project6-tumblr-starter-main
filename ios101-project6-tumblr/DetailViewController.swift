//
//  DetailViewController.swift
//  ios101-project6-tumblr
//
//  Created by Suldana Afrah on 7/24/25.
//

import UIKit
import NukeExtensions

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailLabel: UILabel!
    
    var post: Post?
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    private func configureView() {
        guard let post = post else { return }
        detailLabel.attributedText = formatCaption(post.caption)
        
        // Unwrap the optional photo
        if let photo = post.photos.first {
            let imageUrl = photo.originalSize.url
            NukeExtensions.loadImage(with: imageUrl, into: detailImage)
        }
    }
    private func formatCaption(_ caption: String) -> NSAttributedString {
        let data = caption.data(using: .utf8)!
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]
        do {
            return try NSAttributedString(data: data, options: options, documentAttributes: nil)
        } catch {
            return NSAttributedString(string: caption) // Fallback to plain text
        }
    }
}
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */


