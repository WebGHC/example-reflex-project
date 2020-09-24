module Main where

import Reflex.Dom (mainWidget)
import qualified Frontend (mainWidget)

main = mainWidget Frontend.mainWidget
