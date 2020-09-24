{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE OverloadedStrings #-}
module Frontend where

import Control.Monad.IO.Class
import Control.Lens
import Reflex.Dom.Core

mainWidget :: Widget t ()
mainWidget = do
  el "h2" $ text "Example Reflex App"

  el "div" $ do
    display . value =<< inputElement def

  return ()

data MyData = MyData
  { _someInt :: Int
  , _someString:: String
  }

makeLenses ''MyData
