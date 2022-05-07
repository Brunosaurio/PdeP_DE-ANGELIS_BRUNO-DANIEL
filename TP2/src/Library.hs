module Library where
import PdePreludat

doble :: Number -> Number
doble numero = numero + numero

data Persona = UnaPersona {
    nombre :: String,
    edad :: Number,
    stress :: Number,
    preferencias :: [String],
    amigues :: [String]
} deriving Show


bruno = UnaPersona {nombre = "Bruno", edad = 25, stress = 10, preferencias = ["voley", "prima de ludmi", "comida"], amigues = ["Walter","Ludmi"]}
walter = UnaPersona "Walter" 41 40 [] []
ringo = UnaPersona "Rigoberta" 31 60 [] ["Stacy"]
tony = UnaPersona "Antonio" 25 75 [] []
juancho = UnaPersona "Juan" 37 80 [] [] 
--Punto1--

amigospar persona = even (length (amigues persona))

scoring persona  | amigospar persona = (edad persona) * (stress persona)
                | edad persona > 40 = length (amigues persona) * (edad persona)
                |otherwise = length (nombre persona) * 2 

--Punto2a--

nombreFirme persona = head (nombre persona) == 'p'

--Punto2b--

personaInteresante persona = length (amigues persona) >= 2

--Punto3--

mes x = x <= 2     --Devuelve True si el mes es menor o igual que dos
plata x = x == 0   --Devuel true si va SIN plata

marDelPlata parametro persona   | mes parametro = persona {stress = (stress persona) + 10}
                                |otherwise = persona {stress = max ((stress persona) - min (edad persona) 20) 0}

lasToninas parametro persona | plata parametro = marDelPlata 5 persona
                             |otherwise = persona {stress = (stress persona)/2}

puertoMadryn persona = persona {stress = 0, amigues = (amigues persona) ++ ["Juan"] }                    