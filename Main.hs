-- Apaga los warnings
{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
{-# OPTIONS_GHC -Wno-missing-signatures #-}
{-# OPTIONS_GHC -Wno-name-shadowing #-}
{-# OPTIONS_GHC -Wno-type-defaults #-}
{-# OPTIONS_GHC -Wno-unused-matches #-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use foldr" #-}
{-# HLINT ignore "Use map" #-}
{-# HLINT ignore "Eta reduce" #-}

-- --------------------------------
-- Clase 2
-- Ejercicio 1

-- t ese el tiempo que evaluamos la pelota
-- t lo ingresamos por consola ej: velocidadAlcanzada 5
-- en este caso seria que velocidad logra en 5 segundos de caida

-- 1) Que velocidad logra la pelota si se
-- la deja caer t tiempo
-- donde 9.8 es la gravedad y se usar la formula
-- velocidad = tiempo * gravedad

velocidadAlcanzada :: Double -> Double
velocidadAlcanzada t = t * 9.8

-- 2) Que distancia recorre la pelota si se
-- la deja caer t tiempo

-- La distancia la obtengo haciendo
-- d = velocidadaInicial * t + 1/2 * t^2 * aceleracion
-- donde a = (vf - vi) / t y vi = 0
-- despejo t con t^2
-- me queda d = 1/2 * t * vf

distanciaRecorrida :: Double -> Double
distanciaRecorrida t = 0.5 * t * velocidadAlcanzada t

-- 3) Si la pelota rebota contra el piso si se
-- la deja caer t tiempo

-- Si la distanciaRecorrida es menor a 80m no toca el suelo

rebotaEnElPiso :: Double -> Bool
rebotaEnElPiso t = (80 - distanciaRecorrida t) < 0

-- Transparencia Referencial: es la propiedad de las funciones de no depender de variables externas a ellas mismas, su comportamiento y resultado solo están determinados por sus argumentos.

-- Las funciones son como cajas negras que toman ciertos valores de entrada y producen un resultado predecible sin importar el contexto externo.

-- --------------------------------
-- Clase 3
-- Ejercicio 2

-- Definir nombreFormateado que toma un nombre y un apellido y devuelve el apellido, nombre

nombreFormateado :: String -> String -> String
nombreFormateado nombre apellido = apellido ++ ", " ++ nombre

-- Type Classes: son un mecanismo que permite definir comportamientos genéricos para tipos de datos específicos.

-- Se utilizan para establecer interfaces comunes entre distintos tipos de datos, sin necesidad de herencia.

-- Ejemplos son: Eq, Show, Num, Enum, Ord, Bounded, Read, Fractional, Real, Integral, Floating, RealFrac, RealFloat

-- --------------------------------
-- Ejercicio 3

-- Pattern Matching: Se utiliza de funciones para manejar diferentes casos frente a la considencia de valores. Haskell verifica exhaustivamente los patrones, garantizando que todos los casos sean cubiertos.

-- Mas consiso seria: Permite asignar comportamientos basados concidencias de valores, listas, etc.

-- Esto es fundamental para la escritura de funciones recursivas y la manipulación de datos en programas funcionales.

color :: String -> String
color "banana" = "amarillo"
color "manzana" = "rojo"
color "limon" = "amarillo"

-- Al ingresar:
-- color “banana”
-- En la consola, nos devolvera "Amarillo"

-- Al ingresar un color no definido ej:
-- color "naranja"
-- Devolvera Exception: app/Main.hs:(1,1)-(3,26): Non-exhaustive patterns in function color

-- A menos que introduzcamos un color que matchee todos los casos else

color cualquiera = "gris"

-- De ahora en adelante al colocar:
-- color "x"
-- La consola devolvera "gris" si no matcheaa con alguno declarado

-- El orden en el que se declara es importante, se va verificando de arriba hacia abajo hasta que se encuentra y se deja de verificar

-- ---------------------------------
-- Ejercicio 3

-- Type Classes restrictivo, (Num a) => a hace q a solo acepte Num

doble :: (Num a) => a -> a
doble x = 2 * x

-- ---------------------------------
-- Ejercicio 4

-- Inferencia
-- Se refiere a la capacidad del compilador o intérprete de deducir automáticamente el tipo de una expresión en función del contexto en el que se utiliza, sin necesidad de que el programador especifique explícitamente el tipo.

-- Definimos una funcion que nos diga si un numero y otro tienen una diferencia de 10 entre si como minimo.
-- Pero en este caso dejamos q infiera el tipo el interprete de haskell por lo cual solo definimos la funcion y ya

-- esmuchomayor :: (Ord a, Num a) => a -> a -> Bool
esMuchoMayor n m = abs (n - m) > 10

-- Tambien podemos aplicar inferencia en la declaracion de edad
-- edad :: String -> Int
edad "Mati" = 23

-- Tambien se podria con mas expresividad usando:
-- Variables de tipo
type Nombre = String

type Edad = Int

edad2 :: Nombre -> Edad
edad2 "Mati" = 23

-- ---------------------------------
-- Clase 4
-- Ejercicio 5

-- Precedencia de operadores
-- Las funciones prefijas tienen mas precedencia que los operadores o funciones infijas

-- En el siguiente ejemplo primero se hara length "mar" y luego se hara el > 10
precedencia1 = length "mar" > 10

-- Al igual que en el siguiente ejemplo se hara primero la multiplicacion y luego la suma
precedencia2 = 8 + 7 * 2

-- Para modificar este comportamiento por defecto, usar parentesis

-- ---------------------------------
-- Ejercicio 6

-- Dado un día y un booleano  que indica si es feriado o no , se desea saber el horario de cierre del supermercado:

-- Los domingos feriados cierra a las 13, y los sabados no feriado cierra a las 21

-- El resto de los feriados cierra a las 20, y el resto de los días cierra a las 12 + la cantidad de letras del día

type Dia = String

type Feriado = Bool

type Hora = Int

horarioDeCierre :: Dia -> Feriado -> Hora
horarioDeCierre "domingo" True = 13
horarioDeCierre "sabado" False = 21
-- Usando variable anónima "_"
horarioDeCierre _ True = 20
horarioDeCierre dia False = 12 + length dia

-- ---------------------------------
-- Ejercicio 7

-- Función Parcial
-- Está definida en una parte del dominio y no tiene valores asociados para elementos fuera de dicha parte

diaDeSemana :: Int -> String
diaDeSemana 1 = "Lunes"
diaDeSemana 2 = "Martes"
diaDeSemana 3 = "Miercoles"
diaDeSemana 4 = "Jueves"
diaDeSemana 5 = "Viernes"
diaDeSemana 6 = "Sabados"
diaDeSemana 7 = "Domingos"

-- Si se usa diaDeSemana 8 arrojara:
-- "*** Exception: app/Main.hs:(176,1)-(182,26): Non-exhaustive patterns in function diaDeSemana

-- Esto se da a causa de que Haskell no tiene un patron definido para el dia 8 o mejor dicho, no existe un pattern matching para el dia 8

-- Cuando definimos funciones en Haskell con patern matching es necesario incluir un caso por defecto o manejar todas las posibilidades ej:
-- diaDeSemana _ = "Número de día inválido"

-- Para resover esto de otra manera sino se puede implementar

-- Función Partida o con Guardas
f :: Int -> Int
f x
  | x < -1 = -1
  | -1 <= x && x <= 1 = 1
  | x > 1 = -1

-- O aun mejor usando otherwise
f1 :: Int -> Int
f1 x
  | -1 <= x && x <= 1 = 1
  | otherwise = -1

-- ---------------------------------
-- Ejercicio 8
-- Tuplas (define datos compuestos)
type Persona = (Nombre, Edad)

edadDePersona :: Persona -> Edad
-- En este caso seria igual que
-- edad :: (Nombre, Edad) -> Edad

-- Pattern Matching
-- edadDePersona (n, e) = e

-- Con “Variable Anónima” es preferible en este caso ya que solo usaremos la edad
edadDePersona (_, edadP) = edadP

-- ---------------------------------
-- Ejercicio 9
-- Data

-- Se utiliza para definir estructuras de datos complejos que contienen diferentes tipos de datos. Similar a la utilizacion de struct en C
-- Permiter agrupar múltiples variables o campos bajo un solo nombre para representar un concepto más complejo.

-- -- 

-- Se desea modelar estudiantes de quienes se conocen su nombre, legajo y nota.
-- Se necesita saber si un estudiante aprobó

-- Creacion del tipo Estudiante
-- donde UnEstudiante es el constructor y estudiante el data
data Estudiante = UnEstudiante
  { nombre2 :: String,
    legajo :: String,
    nota :: Int
  }
  deriving (Show, Eq)
-- Extensiones de Clases
-- Al usar deriving permite mostrar y comparar los datos de la clase con solo colocar: "juanita" en consola, o permite hacer "juanita == pedrito" lo que devolvera False

-- Asignacion de valores
pedrito :: Estudiante
pedrito = UnEstudiante "Pedrito" "123" 10

-- Asignacion usando Inferencia
juanita = UnEstudiante "Juanita" "456" 5

-- La asignacion de valores permite que ahora se pueda acceder por ejemplo a:
-- nombre :: Estudiante -> String
-- Por lo cual, al colocar en consola:
-- nombre juanita
-- Devolvera "Juanita"

-- ---------------------------------

-- Resolucion usando funcion partidas
queAlumno :: Estudiante -> String
queAlumno (UnEstudiante _ _ x)
  | 1 >= x && x <= 4 = "Regular"
  | x >= 5 && x <= 6 = "Bueno"
  | x == 7 = "Sabe Algo"
  | x > 7 && x <= 10 = "Muy Bueno"
  | otherwise = "Nota no valida"

-- Resolucion usando patter matching con inferencia
aprobo estudiante = nota estudiante >= 7

-- ---------------------------------
-- Tambien podemos definir una funcion que nos de el legajo y nombre con inferencia
legajoyNombre estudiante = legajo estudiante ++ ",  " ++ nombre2 estudiante

-- o de la siguiente manera sin inferencia
legajoyNombre2 :: Estudiante -> String
legajoyNombre2 (UnEstudiante nombre2 legajo _) = legajo ++ ",  "  ++ nombre2

-- ---------------------------------
-- Tambien podemos implementar una funcion que al pasarle 2 estudiantes nos diga si al primero le fue mejor que al segundo

-- Con pattern matching
lefueMejorA (UnEstudiante _ _ unaNota) (UnEstudiante _ _ otraNota) = unaNota > otraNota

-- Mas abstracta
lefueMejorA2 estudianteMejor estudianteNormal  = nota estudianteMejor > nota estudianteNormal

-- Se puede cambiar la nota de un alumno?
cambiarNota :: Int -> Estudiante -> Estudiante
cambiarNota nuevaNota  (UnEstudiante  nombre2 legajo _ ) = UnEstudiante nombre2 legajo nuevaNota

-- Al ejecutar
-- cambiarNota 10 juanita
-- En consola nos devolvera:
-- UnEstudiante {nombre2 = "Juanita", legajo = "456", nota = 10}

-- Pero si volvemos a ejecutar para corroborar
-- nota juanita
-- Nos devolvera nuevamente 5, la nota anterior

-- Lo mismo si hacemos una funcion que nos suba la nota, esta devolvera una juanita con la nota subida, pero juanita seguira teniendo su nota 5
subirNota :: Estudiante -> Estudiante
subirNota estudiante = cambiarNota (nota estudiante +1) estudiante

-- En Haskell, los valores son inmutables por defecto, lo que significa que una vez que se crea un valor utilizando un constructor, no se puede modificar.

-- Sin embargo, se pueden crear nuevas versiones de valores modificados a partir de valores existentes utilizando funciones y operaciones de datos.

-- Si en ejecutamos lo siguiente:
-- juanitaModificada = juanita {nota=10}

-- Estaremos creando una nueva juanita pero con la nota modificada

-- Para chequear, podemos ejecutar:
-- juanitaModificada

-- y nos deberia salir en consola lo siguiente:
-- UnEstudiante {nombre2 = "Juanita", legajo = "456", nota = 10}

-- De la misma manera si ejecutamos:

-- juanitaModificada2 = cambiarNota 10 juanita 
-- juanitaModificada3 = subirNota juanita 

-- Nos devolvera en consola:

-- juanitaModificada2
-- UnEstudiante {nombre2 = "Juanita", legajo = "456", nota = 10}

-- juanitaModificada3
-- UnEstudiante {nombre2 = "Juanita", legajo = "456", nota = 6}

-- ---------------------------------
-- Ejercicio 10 
-- Tipos y que muestran en consola

-- snd("hola", 1) 1
-- snd(3.4, 4.1) 4.1
-- snd("q", even) error, porque al devolver even le falta un nro
-- snd :: a -> b -> b
-- snd _ b = b

-- id "hola" "hola"
-- id 34 34
-- id even error
-- id:: a -> a
-- id a = a

-- length "hola" -> 4
-- length 7 -> error
-- length [even,odd] -> 2
-- length:: [a] -> Int

-- 2 : [3,4] -> [2,3,4]
-- 'a' : "loha" - > "aloha"
-- "a" : "loha" - > error
-- (:) :: a -> [a] -> [a]

-- 5.1 + 2.4 -> 7.5
-- 2.2 + length [] -> error, porque length no tiene def un nro
-- 'a' + 'b' -> error
-- (+) :: Num a => a -> a -> a

-- sum [2,3,4] -> 9
-- sum [1.2,3.4] -> 4.6
-- sum "hola" -> error
-- sum :: Num a => [a] -> a

-- True > False -> True
-- 'a' > "3" -> True
-- even > odd -> error
-- (>) :: Ord a => a -> a -> Bool

-- maximum "abc" -> c
-- maximum [3,4] -> 4
-- maximum [even, odd] -> error
-- maximum :: Ord a => [a] -> a

-- ---------------------------------
-- Clase 5
-- Ejercicio 11
-- Listas

-- Creacion del tipo Persona2
data Persona2 = UnaPersona2
  { nombre3 :: String,
    apellido :: String,
    edad3 :: Int,
    telefono :: String,
    direccion :: String,
    localidad :: String
  }
  deriving (Show, Eq)

-- Asignacion de valores
juan = UnaPersona2 "Juan" "Perez" 30 "111-222-333" "Calle A 123" "Ciudad X"
maria = UnaPersona2 "Maria" "Garcia" 25 "444-555-666" "Calle B #456" "Ciudad Y"
jose = UnaPersona2 "Jose" "Rodriguez" 40 "777-888-999" "Calle C #789" "Ciudad Z"

-- Creacion de la Lista
personas = [juan, maria, jose]

-- Funciones que se pueden aplicar a una lista:
-- last, head, maximum, ++, reverse, tail, a:[b,c], take n, lista||numero , minimum, sum,  sort

-- ---------------------------------
-- Aplicación Parcial
-- Ejercicio 12

-- Invocar a una función con menos parámetros que los declarados en su definición.

-- Esto resulta en la creación de una nueva función que acepta los argumentos restantes.

-- Ejemplo:

suma :: Int -> Int -> Int
suma x y = x + y

--Esta función suma toma dos argumentos x e y y devuelve su suma.

-- Ahora, si aplicamos suma a un solo argumento, como suma 3, obtenemos una nueva función que espera otro número para sumar:

sumaTres = suma 3

-- En este caso, sumaTres es una función parcialmente aplicada de suma que ahora podemos usar y al pasarle un solo argumento sumará ese argumento con 3

-- Por ejemplo, si aplicamos sumaTres 5, obtenemos el resultado 8.

-- ---------------------------------
-- Un ejemplo encadenando funciones seria:

esMenorAOcho x = x < 8

promociona estudiante = not (esMenorAOcho (nota estudiante))

-- Esto mismo pero usando composicion de funciones con . seria:
promociona2 = not . esMenorAOcho . nota

-- El operador punto (.) en Haskell se utiliza para realizar composición de funciones. Permite combinar dos funciones para crear una nueva función. La función resultante de la composición aplicará primero la segunda función y luego la primera.

-- Un ejemplo mas simple podria ser:
-- Tenemos las siguientes funciones que multiplican por 2 y la otra por su mismo valor

doble2 x = x * 2

cuadrado x = x * x

-- La composicion con . nos permitiria hacer:
dobleDelCuadrado = doble . cuadrado

-- Aquí, dobleDelCuadrado es una nueva función que primero calcula el cuadrado del número utilizando cuadrado y luego aplica el doble a ese resultado utilizando doble.

-- Tambien como se puede ver se elimina el parametro "x" o en el caso anterior, el parametro "estudiante", esto se denomina "Point Free"

-- ---------------------------------
-- Recursividad en funciones 

factorial :: Integer -> Integer
-- Seteamos que el factorial de 0 es 1
-- De otra manera al llegar al 0, seguiria restando en negativo al infinito
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- Esta función, factorial, toma un entero n como argumento y devuelve el factorial de ese número. La definición tiene dos casos:

-- El caso base: Si n es 0, entonces el factorial es 1. Esto es lo que se define con factorial 0 = 1.

-- El caso recursivo: Si n es cualquier otro número, el factorial se calcula multiplicando n por el factorial de n - 1. Esto se logra con factorial n = n * factorial (n - 1).

-- Cuando llamas a factorial con un número entero, la función se llama a sí misma repetidamente hasta que alcanza el caso base (cuando n es 0), y luego todas las llamadas recursivas se resuelven para obtener el resultado final.

-- ---------------------------------
-- Recursividad en Listas 

-- El patrón (x:xs) se utiliza comúnmente en Haskell para descomponer una lista en su primer elemento (x) y el resto de la lista (xs)

-- Calcular la longitud de una Lista

longitud :: [a] -> Int

-- caso base: la longitud de una lista vacía es 0
longitud [] = 0

-- caso recursivo: la longitud es 1 más la longitud del resto de la lista
longitud (x:xs) = 1 + longitud xs  

-- Caso base: Si la lista es vacía ([]), entonces la longitud es 0. Esta es la línea longitud [] = 0.

-- Caso recursivo: Si la lista no está vacía y tiene al menos un elemento (x), la longitud es 1 más la longitud del resto de la lista (xs).

-- Cuando llamas a longitud con una lista, la función se llama a sí misma recursivamente, pasando el resto de la lista cada vez, hasta que alcanza la lista vacía, momento en el que se detiene y devuelve 0. Luego suma los resultados a medida que regresa a través de las llamadas recursivas para obtener la longitud total.

-- ---------------------------------
-- Ejercicio 13

-- Genere función para encontrar los dobles de una lista
numeros :: [Int]
numeros = [1, 2, 3, 4, 5]

doblesDeLista :: [Int] -> [Int]
doblesDeLista [] = []
doblesDeLista (x : xs) = x * 2 : doblesDeLista xs

-- ---------------------------------

-- Genere función sumatoria de los elementos de una lista
sumatoriaDeLista :: [Int] -> Int
sumatoriaDeLista [] = 0
sumatoriaDeLista (x : xs) = x + sumatoriaDeLista xs

-- ---------------------------------

-- Genere la función longitud de una lista
longitudDeLista :: [Int] -> Int
longitudDeLista [] = 0
longitudDeLista (x : xs) = 1 + longitudDeLista xs

-- ---------------------------------

-- Genere la función numero elevado a otro numero
potencia :: Int -> Int -> Int
potencia _ 0 = 1
potencia x xs = x * potencia x (xs - 1)

-- ---------------------------------

-- Genere la función mientras no supera el tope muestra el elemento de la lista.
mostrarElementoNLista :: [Int] -> Int -> Int

-- Caso base: si la lista es vacía no devuelvo 0
mostrarElementoNLista [] _ = 0

mostrarElementoNLista (x : xs) n
-- Caso base adicional 1: si n es menor a 0 devuelvo 0
  | n <= 0 = 0
  
-- Caso base adicional 2: si n ayor al length de la lista, devuelve 0
  | n > length xs + 1 = 0

 -- Si n es igual a 1, devuelve el elemento de la lista
  | n == 1 = x

  -- Si n es mayor que 1, sigue buscando en el resto de la lista
  | otherwise = mostrarElementoNLista xs (n-1)  

-- ---------------------------------

-- Genere la función mostrar los n elementos primeros de la lista.
mostrarPrimerosLista :: [Int] -> Int -> [Int]

-- Caso base: si la lista es vacía, devuelve una lista vacía
mostrarPrimerosLista _ 0 = []

mostrarPrimerosLista (x : xs) n

-- Caso base adicional 1: si n es menor o igual a 0, devuelve una lista vacía
  | n <= 0 = []
  
-- Caso base adicional 2: si n es mayor al length de la lista, devuelve la lista completa
  | n > length xs + 1 = x:xs

-- Caso recursivo: añade el primer elemento a la lista de los primeros n-1 elementos de xs
  | otherwise = x : mostrarPrimerosLista xs (n - 1)


-- ---------------------------------
-- Clase 6

-- Orden superior

-- Se refiere a la capacidad de un lenguaje de tratar a las funciones como valores, lo que significa que puedes pasar funciones como argumentos a otras funciones o devolver funciones como resultados de otras funciones.

-- Supongamos que queremos definir una función llamada aplicarDosVeces que toma una función f y valor int x, y aplica la función f dos veces a x. Aquí está cómo podríamos implementarlo:

-- Definimos la función de orden superior aplicarDosVeces
aplicarDosVeces :: (a -> a) -> a -> a
aplicarDosVeces f x = f (f x)

-- Definimos una función de ejemplo que incrementa un número en 1
incrementar :: Int -> Int
incrementar n = n + 1

-- Probamos aplicarDosVeces con la función incrementar y el valor 3
resultado = aplicarDosVeces incrementar 3

-- Esto nos deberia dar como resultado 5, ya que, seria como hacer:
-- incrementar(incrementar 3)

-- ---------------------------------

-- Funcion "filter" es orden superior 

-- La función filter toma una función booleana y una lista como entrada, y devuelve una nueva lista que contiene solo los elementos de la lista original para los cuales la función booleana devuelve True.

-- Definimos una función booleana que verifica si un número es par
esPar :: Int -> Bool
esPar x = even x

-- definimos una funcion que toma una lista de nros y usamos la función filter para filtrar los números pares
numerosPares :: [Int] -> [Int]
numerosPares lista = filter esPar lista

-- Creamos la lista de nros
numeros2 :: [Int]
numeros2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

-- Al ejecutar:
-- numerosPares numeros2
-- Obtendremos una lista solo con los nros pares: [2, 4, 6, 8, 10]

-- ---------------------------------
-- Ejercicio 14
-- Utilizacion de filter y map en listas

-- Creacion de type class
type Alimento = String

-- Creacion de tipo InformacionNutricional
data InfoNutricional = UnaInfoNutricional
  { alimento :: Alimento,
    calorias :: Int,
    grasas :: Float,
    carbohidratos :: Float,
    proteinas :: Float
  }
  deriving (Show, Eq)

-- Asigna valores
infoManzana = UnaInfoNutricional "Manzana" 95 0.3 25.1 0.5
infoBanana = UnaInfoNutricional "Banana" 134 0.5 34.3 1.6
infoPera = UnaInfoNutricional "Pera" 101 0.2 27.1 0.6

-- Crea la lista
infosNutricionales = [infoManzana, infoBanana, infoPera]

-- ---------------------------------

-- Cuales de los alimentos tienen hasta 100 calorias
menorDe100Calorias :: InfoNutricional -> Bool
menorDe100Calorias a = calorias a > 100

-- Utilizacion de filter con map y composicion con .
menos100Calorias :: [InfoNutricional] -> [Alimento]
menos100Calorias = map alimento . filter menorDe100Calorias

-- ---------------------------------
-- Clase 7
-- Ejercicio 15
-- Utilizacion de any y elem

-- Creacion de type classes
type Titulo = String
type Autor = String

-- Creacion de tipo Obra
data Obra = UnaObra {
  titulo :: Titulo, 
  autores :: [Autor]
} deriving (Show, Eq)

-- Asigna valores
sandman = UnaObra "sandman" ["gaiman"]
socorro = UnaObra "socorro" ["ElsaBornemann"]
buenos = UnaObra "buenos presagios" ["gaiman", "pratchett"]

-- Crea la lista
todasLasObras :: [Obra]
todasLasObras = [sandman, socorro, buenos]

-- --------------------------------------------------

-- Una obra existe?
unaObraExiste :: String -> [Obra] -> Bool
unaObraExiste t = any (\obra -> titulo obra == t)

-- --------------------------------------------------

-- Que Obras escribio cierto autor
queObraAutorAux :: String -> Obra -> Bool
queObraAutorAux autorABuscar obra = autorABuscar `elem` autores obra

-- Cierta persona escribio alguna obra
escribioUnaObra :: String -> [Obra] -> Bool
escribioUnaObra autor = any (queObraAutorAux autor)

-- Tambien se puede hacer en una linea y sin funcion aux asi:
-- escribioUnaObra persona = any (\obras -> persona `elem` autores obras)

-- --------------------------------------------------

-- Que Obras escribio cierto autor
queObraAutor :: String -> [Obra] -> [Obra]
queObraAutor autor = filter (queObraAutorAux autor)
