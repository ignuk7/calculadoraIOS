//
//  ViewController.swift
//  Calculadora
//
//  Created by CETYS on 26/09/17.
//  Copyright © 2017 CETYS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pantalla: UILabel!
    
    
    
    var elUsuarioEstaEnMedioDeLaEscrituraDeUnNumero : Bool = false
    
    var operando1 : Double = 0
    var operando2 : Double = 0
    var operando3 : Double = 3.14159
    var operando4 : Double = 180
    var operacion : String = ""
    
    @IBAction func operacionPlusada(_ sender: UIButton) {
        let numero : NSString =  pantalla.text! as NSString
        operando1 = numero.doubleValue
        
        //guardo la operacion puelsada
        operacion = sender.currentTitle!
        
        //guardo el numero en la minipantalla
        miniPantalla.text = pantalla.text
        
        //pongo un 0 en la pantalla para escribir el 2 operando
        pantalla.text = "0"
        elUsuarioEstaEnMedioDeLaEscrituraDeUnNumero = false
        
        
    }
    
    @IBAction func enterPulsado() {
        let numero : NSString =  pantalla.text! as NSString
        operando2 = numero.doubleValue
        
        let resultado = realizaOperacion()
        pantalla.text = String(format: "%g", resultado)
        
        
    }
    
    @IBAction func borrarNumero(_ sender: AnyObject) {
        pantalla.text = "0"
        elUsuarioEstaEnMedioDeLaEscrituraDeUnNumero = false
    }
    
    @IBOutlet weak var miniPantalla: UILabel!
    
    @IBAction func numeroPulsado(_ sender: UIButton) {
        
        let digito : String! = sender.currentTitle
        
        if elUsuarioEstaEnMedioDeLaEscrituraDeUnNumero {
            pantalla.text = pantalla.text! + digito
        }
        else{
            pantalla.text = digito
            elUsuarioEstaEnMedioDeLaEscrituraDeUnNumero = true
        }
        
        print(digito)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func realizaOperacion() -> Double{
        var resultado : Double = 0
        //codigo para la suma
        if operacion == "+"{
            resultado = operando1 + operando2
        }
        //codigo para la resta
        if operacion == "-"{
            resultado = operando1 - operando2
        }
        //codigo para la multiplicacion
        if operacion == "*"{
            resultado = operando1 * operando2
        }
        //codigo para la division
        if operacion == "/"{
            resultado = operando1 / operando2
        }
        //codigo para la raiz cuadrada
        if operacion == "√"{
            resultado = sqrt(operando1)
        }
        //codigo para la x elebado a x
        if operacion == "x×"{
            resultado = pow(operando1, operando2)
        }
        //codigo para la x elebado a -x
        if operacion == "x-×"{
            resultado = pow(operando1, (-operando2))
        }
        //codigo para el seno(
        if operacion == "sen("{
            resultado = sin(operando1 / operando4 * operando3)
        }
        //codigo para el coseno(
        if operacion == "cos("{
            resultado = cos(operando1 / operando4 * operando3)
        }
        //codigo para la tangente(
        if operacion == "tan("{
            resultado = tan(operando1 / operando4 * operando3)
        }
        //codigo para el numero PI (π)
        if operacion == "π"{
            resultado = (operando1 * operando3)
        }

        elUsuarioEstaEnMedioDeLaEscrituraDeUnNumero = false
        return resultado
    }



}







