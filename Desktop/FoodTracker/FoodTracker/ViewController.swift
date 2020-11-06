//
//  ViewController.swift
//  FoodTracker
//
//  Created by Aleksandr Myasoedov on 05.11.2020.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
// Marc: Properties
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Handle the text field's users input through delegate callbacks!
        nameTextField.delegate = self
    }
//    Marc: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    
    @IBAction func selectImageFromPhotoLibrari(_ sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()
        let imagePickterController = UIImagePickerController()
        
        imagePickterController.sourceType = .photoLibrary
        imagePickterController.delegate = self
        present(imagePickterController, animated: true, completion: nil)
    }

//    Marc: UIImagePickcherControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        Dismiss the picker if the user canseled.
        dismiss(animated: true, completion: nil)
    }
    
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectImage = info[UIImagePickerController.InfoKey.originalImage.rawValue] as? UIImage else{
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
//        Set imageView to display the selected image.
        photoImageView.image = selectImage
//        Dismiss to picker
        dismiss(animated: true, completion: nil)
    }

}

