module Personaje where


data Personaje
  = Personaje
  { nombre :: String
  , gafas :: Gafas
  , ropa :: Ropa
  }

data Ropa
  = Ropa
  { superior :: String
  , inferior :: String
  , calzado :: String
  , sombrero :: String
  }

data Gafas
  = Gafas
  { armazon :: Armazon
  , lentes :: Lentes
  , decoracion :: Decoracion
  }

data Lentes
  = Lente
  { material :: Material
  , graduacion :: Double
  }

data Armazon
  = Hierro
  | Oro
  | Plata

data Material
  = Cristal
  | Vidrio
  | Polimero

data Decoracion
  = Rubi
  | Zafiro
  | Esmeralda
