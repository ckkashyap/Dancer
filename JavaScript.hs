module JavaScript where

import Geometry

data JSFunction = MoveTo | LineTo

jsFunction :: JSFunction -> String
jsFunction j = case j of 
                    MoveTo -> "moveTo"
                    LineTo -> "lineTo"

point2js :: JSFunction -> Point2D -> String
point2js jsf (x,y) = f ++ "(" ++ (show x) ++ ", " ++ (show y) ++ ");\n"
         where f = "\tctx." ++ jsFunction jsf

triangle2js :: Triangle2D -> String
triangle2js (p1, p2, p3) = triangle2js' (take 4 (cycle [p1, p2, p3])) where
            triangle2js' (_p1:_p2:[]) = str _p1 _p2
            triangle2js' (_p1:_p2:ps) = (str _p1 _p2) ++ (triangle2js' (_p2:ps))
            str _p1 _p2               = (point2js MoveTo _p1) ++ (point2js LineTo _p2)

frame2JS :: Frame -> String
frame2JS frame = "function (ctx) {\n" ++ (frame2JS' frame2D)  ++ "}\n"
 where
  frame2D = map projectTriangle frame
  frame2JS' [] = ""
  frame2JS' (t:ts) = triangle2js t ++ frame2JS' ts


animation2JS :: Animation -> String
animation2JS animation = "var actionList = [\n" ++ (foldr f [] (map frame2JS (reverse animation))) ++ "]\n" where
             f sceneJS []   = sceneJS
             f sceneJS rest =  sceneJS ++ ",\n" ++ rest
