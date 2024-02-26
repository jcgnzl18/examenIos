//
//  ViewController.swift
//  Examen_240208
//
//  Created by Alfonso Marín on 7/2/24.
//

import UIKit

class UnoViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imag3: UIImageView!
    @IBOutlet weak var imag2: UIImageView!
    @IBOutlet weak var imag1: UIImageView!
    @IBOutlet weak var imgage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func pregunta(_ sender: Any) {
        let alertController = UIAlertController(title: "¿Estás seguro de guardar la imagen en la galería?", message: "Confirma porfavor", preferredStyle: .alert)
        
        let addAction = UIAlertAction(title: "Si", style: .default)
        let addAction2 = UIAlertAction(title: "No", style: .cancel)
        
        alertController.addAction(addAction)
        alertController.addAction(addAction2)
        
        present(alertController, animated: true, completion: nil)
        
        UIImageWriteToSavedPhotosAlbum(imag1.image! , self, #selector(imagen(_:didFinishSavingWithError:contextInfo:)), nil)
        
    }
    
    @IBAction func pregunta2(_ sender: Any) {
        let alertController = UIAlertController(title: "¿Estás seguro de guardar la imagen en la galería?", message: "Confirma porfavor", preferredStyle: .alert)
        
        let addAction = UIAlertAction(title: "Si", style: .default)
        let addAction2 = UIAlertAction(title: "No", style: .cancel)
        
        alertController.addAction(addAction)
        alertController.addAction(addAction2)
        
        present(alertController, animated: true, completion: nil)
        
        UIImageWriteToSavedPhotosAlbum(imag2.image! , self, #selector(imagen(_:didFinishSavingWithError:contextInfo:)), nil)
        
        
    }
    
    @IBAction func pregunta3(_ sender: Any) {
        let alertController = UIAlertController(title: "¿Estás seguro de guardar la imagen en la galería?", message: "Confirma porfavor", preferredStyle: .alert)
        
        let addAction = UIAlertAction(title: "Si", style: .default)
        let addAction2 = UIAlertAction(title: "No", style: .cancel)
        
        alertController.addAction(addAction)
        alertController.addAction(addAction2)
        
        present(alertController, animated: true, completion: nil)
        
        UIImageWriteToSavedPhotosAlbum(imag3.image! , self, #selector(imagen(_:didFinishSavingWithError:contextInfo:)), nil)
        
        
        
    }
    
    @IBAction func pregunta4(_ sender: Any) {
        let alertController = UIAlertController(title: "¿Estás seguro de guardar la imagen en la galería?", message: "Confirma porfavor", preferredStyle: .alert)
        
        let addAction = UIAlertAction(title: "Si", style: .default)
        let addAction2 = UIAlertAction(title: "No", style: .cancel)
        
        alertController.addAction(addAction)
        alertController.addAction(addAction2)
        
        present(alertController, animated: true, completion: nil)
        
        UIImageWriteToSavedPhotosAlbum(imgage.image! , self, #selector(imagen(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    
    
    @objc func imagen (_ image: UIImage, didFinishSavingWithError error: NSError?, contextInfo: UnsafeRawPointer){
        if let error = error {
            let ac = UIAlertController(title: "Error al guardar", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }else {
            let ac = UIAlertController(title: "Imagen guardada", message: "La imagen se ha guardado correctamente", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
    
}




