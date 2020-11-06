//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Aleksandr Myasoedov on 06.11.2020.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    
//    Marc: Properties
    private var ratingButton = [UIButton]()
    var rating = 0{
        didSet{
            updateButtonSelectionState()
        }
    }
   @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0){
        didSet{
            setupButton()
        }
    }
  @IBInspectable  var starCount: Int = 5{
        didSet{
            setupButton()
        }
    }
    
//    Marc: Button Action
    private func setupButton(){
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named: "emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named: "highlightedStar", in: bundle, compatibleWith: self.traitCollection)
        
        for _ in 0..<starCount{
            let button = UIButton()
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])
            
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTaped(button:)), for: .touchUpInside)
            button.accessibilityLabel = "Set star rating."
            
            addArrangedSubview(button)
            ratingButton.append(button)
        }
        updateButtonSelectionState()
    }
    
//    Marc: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }

//   Marc: Button Action
    @objc func ratingButtonTaped(button: UIButton){
        guard let index = ratingButton.firstIndex(of: button) else{
            fatalError("The button, \(button), is nnot in the ratinngButtons array: \(ratingButton)")
        }
//        Calculate the rating of the selected button
        let selectedRating = index + 1
        if selectedRating == rating{
//            If the selected star represents the current rating, reset the rating to 0.
            rating = 0
        }else{
//            Otherwise set the rating to the selected star
            rating = selectedRating
        }
    }
    private func updateButtonSelectionState(){
        for (index, button) in ratingButton.enumerated(){
            button.isSelected = index < rating
            let hintString: String?
            if rating == index + 1{
                hintString = "Tap to reset rating to zero."
            }else{
                hintString = nil
            }
            let valueString: String
            switch(rating){
            case 0:
                valueString = "No rating set."
            case 1:
                valueString = "1 star set."
            default:
                valueString = "\(rating) star set."
            }
            button.accessibilityHint = hintString
            button.accessibilityValue = valueString
        }
    }

}
