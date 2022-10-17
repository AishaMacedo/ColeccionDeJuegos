//
//  JuegosViewController.swift
//  MacedoColeccionDeJuegos
//
//  Created by Aisha Belen Macedo Zeballos on 17/10/22.
//

import UIKit

class JuegosViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBAction func fotosTapped(_ sender: Any) {
        imagePicked.sourceType = .photoLibrary
        present(imagePicked, animated: true, completion: nil)
    }
    @IBAction func camaraTapped(_ sender: Any) {
    }
    @IBAction func agregarTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let juego = Juego(context: context)
        juego.titulo = tituloTextField.text
        juego.imagen = s.image?.jpegData(compressionQuality: 0.50)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet weak var s: UIImageView!
    @IBOutlet weak var tituloTextField: UITextField!
    
    var imagePicked = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicked.delegate = self
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let imagenSleccionada = info[.originalImage] as? UIImage
        s.image = imagenSleccionada
        imagePicked.dismiss(animated: true, completion: nil)
    }
}
