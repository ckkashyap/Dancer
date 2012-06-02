module HTML where

mainHTML :: Int -> Int -> String -> String -- generate the main HTML file with a canvas of given width and height
mainHTML width height javascriptFileName = 
       "<!doctype html>\n"
    ++ "<html lang=\"en\">\n"
    ++ "<head charset=\"UTF-8\">\n"
    ++ "<title>This is my first canvas</title>\n"
    ++ "</head>\n"
    ++ "<body>\n"
    ++ "  <div style=\"position: absolute; top: 50px; left: 50px\">\n"
    ++ "    <canvas id=\"canvasOne\" width=\"" ++(show width) ++ "\" height=\""++(show height) ++"\">\n"
    ++ "      Your browser does not support HTML5 canvas!\n"
    ++ "    </canvas>\n"
    ++ "  </div>\n"
    ++ "</body>\n"
    ++ "<script type=\"text/javascript\" src=\"" ++ javascriptFileName ++ ".js\"></script>\n"
    ++ "<script type=\"text/javascript\" src=\"actionList.js\"></script>\n"
    ++ "</html>\n"

mainJS :: Int -> String -- Return a JS that loops through the action list once in given number of milliseconds
mainJS milliSecondInterval =
      "var theCanvas;\n"
   ++ "var theContext;\n"
   ++ "window.onload = function() {\n"
   ++ "    canvasApp();\n"
   ++ "}\n"
   ++ "\n"
   ++ "function canvasApp() {\n"
   ++ "    function drawScreen() {\n"
   ++ "    theCanvas = document.getElementById(\"canvasOne\");\n"
   ++ "    theContext = theCanvas.getContext(\"2d\");\n"
   ++ " if (!canvasSupport) {\n"
   ++ "     alert(\"Could not get the canvas!\");\n"
   ++ "     return;\n"
   ++ " }\n"
   ++ "\n"
   ++ " setInterval(animator, " ++ (show milliSecondInterval) ++ ");\n"
   ++ "    }\n"
   ++ "\n"
   ++ "    var ctr=0;\n"
   ++ "    function animator(){\n"
   ++ " theContext.clearRect(0,0,500,500);\n"
   ++ " theCanvas.width=theCanvas.width;\n"
   ++ " theContext.lineWidth=2;\n"
   ++ " actionList[ctr](theContext);\n"
   ++ " theContext.stroke();\n"
   ++ " ctr++;\n"
   ++ " if(ctr==actionList.length)ctr=0;\n"
   ++ " \n"
   ++ "    }\n"
   ++ "\n"
   ++ "    function canvasSupport() {\n"
   ++ " return !!document.createElement(\"testCanvas\").getContext;\n"
   ++ "    }\n"
   ++ "\n"
   ++ "    drawScreen();\n"
   ++ "}\n"


generateHTML :: Int -> Int -> String -> IO ()
generateHTML width height htmlFileName = do
             writeFile (htmlFileName ++ ".html") (mainHTML width height htmlFileName)
             writeFile (htmlFileName ++ ".js") (mainJS 100)



