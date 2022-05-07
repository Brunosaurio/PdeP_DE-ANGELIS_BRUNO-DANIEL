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
walter = UnaPersona "Walter" 41 52 [] ["Kjiro"]
ringo = UnaPersona "Rigoberta" 31 60 [] ["Stacy"]
--Punto1--

amigospar persona = even (length (amigues persona))

scoring persona | amigospar persona = (edad persona) * (stress persona)
                | edad persona > 40 = length (amigues persona) * (edad persona)
                |otherwise = length (nombre persona) * 2 

--Punto2a--

nombreFirme persona = head (nombre persona) == 'p'

--Punto2b--

personaInteresante persona = length (amigues persona) >= 2

--Punto3--