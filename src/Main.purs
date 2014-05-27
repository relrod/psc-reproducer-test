module Main where

import Debug.Trace

import Control.Monad.Eff

import WebSocket

foreign import alert :: forall eff. String -> Eff eff {}

main = do
  socket <- newWebSocket "ws://echo.websocket.org/"
  addEventListenerWS socket "onmessage" (\msg -> trace "This should get printed once after we send!")
  --addEventListenerWS socket "onmessage" (\msg -> alert "This works though.")
  sendWS socket "testing"
  trace "hi"
