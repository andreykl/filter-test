{-# OPTIONS_GHC -Wno-tabs #-}

module Main where

import Lib

import Graphics.UI.Gtk
import Graphics.UI.Gtk.Selectors.FileChooserDialog

outEmails = "/tmp/output-emails.txt"
outNumbersRu = "/tmp/output-numbers-ru.txt"

main = do
  initGUI
  window <- windowNew
  runFEmailsBtn <- buttonNewWithLabel "Click to filter emails"
  runFNumbersRuBtn <- buttonNewWithLabel "Click to filter numbers (ru)"
  chooserBtn <- fileChooserButtonNew "Please choose a file" FileChooserActionOpen
  hBox <- hBoxNew True 0
  boxPackStartDefaults hBox chooserBtn
  boxPackStartDefaults hBox runFEmailsBtn
  boxPackStartDefaults hBox runFNumbersRuBtn
  runFEmailsBtn `on` buttonActivated $ 
    fileChooserGetFilename chooserBtn >>= runFilterEmails outEmails
  runFNumbersRuBtn `on` buttonActivated $
    fileChooserGetFilename chooserBtn >>= runFilterNumbersRu outNumbersRu
    
  --create the main window
  set window [containerChild := hBox, windowTitle := "File filter test"]
  onDestroy window mainQuit
  --start the application
  widgetShowAll window
  mainGUI
