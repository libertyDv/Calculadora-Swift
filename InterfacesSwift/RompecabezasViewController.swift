//
//  RompecabezasViewController.swift
//  InterfacesSwift
//
//  Created by dam2 on 22/11/23.
//

import UIKit

class RompecabezasViewController: UIViewController {

    @IBOutlet weak var botonUno: UIButton!
    @IBOutlet weak var botonDos: UIButton!
    @IBOutlet weak var botonTres: UIButton!
    @IBOutlet weak var botonCuatro: UIButton!
    @IBOutlet weak var botonCinco: UIButton!
    @IBOutlet weak var botonSeis: UIButton!
    @IBOutlet weak var botonSiete: UIButton!
    @IBOutlet weak var botonOcho: UIButton!
    @IBOutlet weak var botonVacio: UIButton!
    @IBOutlet weak var txtResultado: UILabel!
    
    var btnVacio = 0
    
    var botones: [UIButton] = []
    // array vacia para introducir los nums aleatorios
    var numerosAleatorios: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        botones = [botonUno, botonDos, botonTres, botonCuatro, botonCinco, botonSeis, botonSiete, botonOcho, botonVacio]
        
        numerosAleatorios = Array(0..<9)
        numerosAleatorios.shuffle()
        botones.shuffle()
        numsAleatorios()
        
        for (index, boton) in botones.enumerated() {
            boton.tag = index
        }
    }
    
    func moverBotonHacia(_ index: Int) {
        if puedeMoverse(index) {
            cambiarBotones(index, btnVacio)
            btnVacio = index

            if esResuelto() {
                txtResultado.text = "¡Has resuelto el rompecabezas!"
               }
           }
       }
    
    func numsAleatorios() {
        for (indice, boton) in
                botones.enumerated() {
            let numero = numerosAleatorios[indice]
            let texto = obtenerTxtNums(numero)
            boton.setTitle(texto, for: .normal)
        }
    }
    
    func obtenerTxtNums(_ numero: Int) -> String {
        if numero == 0 {
            return ""
        } else {
            return String(numero)
        }
    }
    
    func cambiarBotones(_ index1: Int, _ index2: Int) {
       
        let tempTitle = botones[index1].currentTitle
        let tempColor = botones[index1].backgroundColor
           
        botones[index1].setTitle(botones[index2].currentTitle, for: .normal)
        botones[index1].backgroundColor = botones[index2].backgroundColor
           
        botones[index2].setTitle(tempTitle, for: .normal)
        botones[index2].backgroundColor = tempColor
           
        // Actualizo la posición del botón vacío
        if index1 == btnVacio {
            btnVacio = index2
        } else if index2 == btnVacio {
            btnVacio = index1
        }
    }
    
    func puedeMoverse(_ index: Int) -> Bool {

        // Veo si el botón seleccionado es un botón con número y está al lado del botón vacío
        if let btnPulsadoIndex = botones.firstIndex(of: botones[index]),
           let btnVacioIndex = botones.firstIndex(of: botonVacio) {
               // Veo si el botón seleccionado está al lado del botón vacío en el array
            let filaVacio = btnVacioIndex % 3
            let columnaVacio = btnVacioIndex % 3
            let filaBoton = btnPulsadoIndex % 3
            let columnaBoton = btnPulsadoIndex % 3

            // Veo si el botón seleccionado está al lado botón vacío
            if filaBoton == filaVacio && columnaBoton - columnaVacio == 1 || columnaBoton == columnaVacio && filaBoton - filaVacio == 1 {
                return true
            }
        }
        return false
    }
    
    func esResuelto() -> Bool {
        for (index, boton) in botones.enumerated() {
            let num = index + 1
          // veo que el indice coincida con el txt dek boton
            if let numeroBoton = boton.titleLabel?.text, let numero = Int(numeroBoton), numero != num {
                return false
            }
        }
        return true
    }
    
    @IBAction func cambiarBotonVacio(_ sender: UIButton) {
        
        guard let indexBoton = botones.firstIndex(of: sender),
              let indexBotonVacio = botones.firstIndex(of: botonVacio) else { return }
            
            if puedeMoverse(indexBoton) {
                cambiarBotones(indexBoton, indexBotonVacio)
                btnVacio = indexBoton
                if esResuelto() {
                    txtResultado.text = "¡Has resuelto el rompecabezas!"
                }
            }
    }
    
    @IBAction func cambiarBotonOcho(_ sender: Any) {
        if let indexBotonOcho = botones.firstIndex(of: botonOcho),
           let indexBotonVacio = botones.firstIndex(of: botonVacio) {
            cambiarBotones(indexBotonOcho, indexBotonVacio)
            
            if puedeMoverse(indexBotonVacio) {
                cambiarBotones(indexBotonOcho, indexBotonVacio)
            }
        }
    }
    
    @IBAction func cambiarBotonSiete(_ sender: Any) {
        if let indexBotonSiete = botones.firstIndex(of: botonSiete),
           let indexBotonVacio = botones.firstIndex(of: botonVacio) {
            cambiarBotones(indexBotonSiete, indexBotonVacio)
            
            if puedeMoverse(indexBotonSiete) {
                cambiarBotones(indexBotonSiete, indexBotonVacio)
            }
        }
    }
    
    @IBAction func cambiarbotonSeis(_ sender: Any) {
        if let indexBotonSeis = botones.firstIndex(of: botonSeis),
           let indexBotonVacio = botones.firstIndex(of: botonVacio) {
            cambiarBotones(indexBotonSeis, indexBotonVacio)
            
            if puedeMoverse(indexBotonSeis) {
                cambiarBotones(indexBotonSeis, indexBotonVacio)
            }
        }
    }
    
    @IBAction func cambiarBotonCinco(_ sender: Any) {
        if let indexBotonCinco = botones.firstIndex(of: botonCinco),
           let indexBotonVacio = botones.firstIndex(of: botonVacio) {
            cambiarBotones(indexBotonCinco, indexBotonVacio)
            
            if puedeMoverse(indexBotonCinco) {
                cambiarBotones(indexBotonCinco, indexBotonVacio)
            }
        }
    }
    
    @IBAction func cambiarBotonCuatro(_ sender: Any) {
        if let indexBotonCuatro = botones.firstIndex(of: botonCuatro),
           let indexBotonVacio = botones.firstIndex(of: botonVacio) {
            cambiarBotones(indexBotonCuatro, indexBotonVacio)
            
            if puedeMoverse(indexBotonCuatro) {
                cambiarBotones(indexBotonCuatro, indexBotonVacio)
            }
        }
    }
    
    @IBAction func cambiarBotonTres(_ sender: Any) {
        if let indexBotonTres = botones.firstIndex(of: botonTres),
           let indexBotonVacio = botones.firstIndex(of: botonVacio) {
            cambiarBotones(indexBotonTres, indexBotonVacio)
            
            if puedeMoverse(indexBotonTres) {
                cambiarBotones(indexBotonTres, indexBotonVacio)
            }
        }
    }
    
    @IBAction func cambiarbotonDos(_ sender: Any) {
        if let indexBotonDos = botones.firstIndex(of: botonDos),
           let indexBotonVacio = botones.firstIndex(of: botonVacio) {
            cambiarBotones(indexBotonDos, indexBotonVacio)
            
            if puedeMoverse(indexBotonDos) {
                cambiarBotones(indexBotonDos, indexBotonVacio)
            }
        }
    }
    
    @IBAction func cambiarBotonUno(_ sender: Any) {
        if let indexBotonUno = botones.firstIndex(of: botonUno),
           let indexBotonVacio = botones.firstIndex(of: botonVacio) {
            if puedeMoverse(indexBotonUno) {
                cambiarBotones(indexBotonUno, indexBotonVacio)
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

}
