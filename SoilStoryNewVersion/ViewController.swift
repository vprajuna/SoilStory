//
//  ViewController.swift
//  SoilStoryNewVersion
//
//  Created by Megan Shah on 10/27/22.
//

import UIKit
import AVFoundation
import SwiftUI
import CoreML

    /*func testModel()-> Soil_ClassifierOutput? {
    do {
        let config = MLModelConfiguration()
        
       let model = try Soil_Classifier(configuration: config)
        
        let prediction = try model.prediction(image: 1)
        return prediction
        
    }
    
    catch {
        
    }
    return nil
}
     */


class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var button: UIButton!
    
    
     @IBAction func Button1Clicked(_ sender: Any) {
        print("Button 1 is clicked")
         let picker = UIImagePickerController()
         picker.sourceType = .camera
         picker.allowsEditing = true
         picker.delegate = self
         present(picker, animated: true)
         
    }
    
    @IBAction func importImage(_sender: AnyObject) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        image.allowsEditing = false
        self.present(image, animated: true)
        {
            //After it is complete
            print("complete")
        }
}
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = (info[UIImagePickerController.InfoKey.originalImage.rawValue] as? UIImage) {
            imageView.image = image
        }
        
        else {
            print("Error")
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    
    /*extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        func imagePickerControllerDidCancel( picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
        }
        
        func imagePickerController( picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            picker.dismiss(animated: true, completion: nil)
            
            guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
            else{
                return
            }
            imageView.image = image
        }
     */
        
        /*static func createImageClassifier() -> VNCoreMLModel {
            // Use a default model configuration.
            let defaultConfig = MLModelConfiguration()

            // Create an instance of the image classifier's wrapper class.
            let imageClassifierWrapper = try? MobileNet(configuration: defaultConfig)

            guard let imageClassifier = imageClassifierWrapper else {
                fatalError("App failed to create an image classifier model instance.")
            }

            // Get the underlying model instance.
            let imageClassifierModel = imageClassifier.model

            // Create a Vision instance using the image classifier's model instance.
            guard let imageClassifierVisionModel = try? VNCoreMLModel(for: imageClassifierModel) else {
                fatalError("App failed to create a `VNCoreMLModel` instance.")
            }

            return imageClassifierVisionModel
        }
         */
        
        
    
}

