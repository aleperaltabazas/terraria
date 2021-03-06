{-# LANGUAGE RankNTypes #-}

module TerrariaSetter
  ( module Personaje
  , Setter
  , setter
  , setGraduacion
  , setLentes
  , setGafas
  , graduacionPersonaje
  , cambiarGraduacion
  )
where

import           Personaje

type Setter a b = (b -> b) -> a -> a

setter :: (a -> b) -> (a -> b -> a) -> (b -> b) -> a -> a
setter accessor modify update a = modify a . update . accessor $ a

setGraduacion :: Setter Lentes Double
setGraduacion =
  setter graduacion (\lentes graduacion -> lentes { graduacion = graduacion })

setLentes :: Setter Gafas Lentes
setLentes = setter lentes (\gafas lentes -> gafas { lentes = lentes })

setGafas :: Setter Personaje Gafas
setGafas = setter gafas (\personaje gafas -> personaje { gafas = gafas })

graduacionPersonaje :: Setter Personaje Double
graduacionPersonaje = setGafas . setLentes . setGraduacion

cambiarGraduacion :: Double -> Personaje -> Personaje
cambiarGraduacion graduacion = graduacionPersonaje (const graduacion)
