{-# OPTIONS -fglasgow-exts #-}
-----------------------------------------------------------------------------------------
{-| Module      :  WXH
    Copyright   :  (c) Daan Leijen 2003
    License     :  wxWindows

    Maintainer  :  daan@cs.uu.nl
    Stability   :  provisional
    Portability :  portable

    Main import module. Re-exports functionality and defines the 'run' function.
-}
-----------------------------------------------------------------------------------------
module Graphics.UI.WXH
        (
        -- * Re-exports
          module Graphics.UI.WXH.WxcDefs
        , module Graphics.UI.WXH.WxcClasses
        , module Graphics.UI.WXH.WxcClassTypes
        , module Graphics.UI.WXH.Types
        , module Graphics.UI.WXH.Process
        , module Graphics.UI.WXH.Draw
        , module Graphics.UI.WXH.Events
        , module Graphics.UI.WXH.Frame
        , module Graphics.UI.WXH.Dialogs
        , module Graphics.UI.WXH.Controls
        , module Graphics.UI.WXH.Layout
        , module Graphics.UI.WXH.Image

        -- * Run
        , run
        ) where

import System.Mem( performGC )

import Graphics.UI.WXH.WxcDefs
import Graphics.UI.WXH.WxcClasses
import Graphics.UI.WXH.WxcClassTypes

import Graphics.UI.WXH.Types
import Graphics.UI.WXH.Process
import Graphics.UI.WXH.Events
import Graphics.UI.WXH.Draw
import Graphics.UI.WXH.Frame
import Graphics.UI.WXH.Dialogs
import Graphics.UI.WXH.Controls
import Graphics.UI.WXH.Layout
import Graphics.UI.WXH.Image

-- | Start the event loop. Takes an initialisation action as argument.
-- Except for 'run', the functions in the WXH library can only be called
-- from this intialisation action or from event handlers, or otherwise bad
-- things will happen :-)
run :: IO a -> IO ()
run init
  = do appOnInit (do wxcAppInitAllImageHandlers
                     init
                     return ())
       performGC