module Terraria
  ( module Personaje
  , setGraduacion
  , setLentes
  , setGafas
  , setGraduacionGafas
  , cambiarPersonaje
  , graduacionPersonaje
  )
where

import           Personaje

setGraduacion :: Double -> Lentes -> Lentes
setGraduacion graduacion l = l { graduacion = graduacion }

setLentes :: Lentes -> Gafas -> Gafas
setLentes lentes g = g { lentes = lentes }

setGafas :: Gafas -> Personaje -> Personaje
setGafas gafas p = p { gafas = gafas }

setGraduacionGafas :: Double -> Gafas -> Gafas
setGraduacionGafas graduacion g =
  g { lentes = setGraduacion graduacion . lentes $ g }

cambiarPersonaje :: Double -> Personaje -> Personaje
cambiarPersonaje graduacion p =
  p { gafas = setGraduacionGafas graduacion . gafas $ p }

graduacionPersonaje :: Personaje -> Double
graduacionPersonaje = graduacion . lentes . gafas
