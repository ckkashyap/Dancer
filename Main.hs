import Pose
import JavaScript
import HTML
import Moves
import Geometry
import Control.Monad.State

type MyState = State [Pose] Int

applyChange f = do
             (step:steps) <- get
             let newStep = f step
             put (newStep:step:steps)
             return 0

repeatAction action 0 = return 0
repeatAction action n = do
             action
             repeatAction action (n - 1)
             

pause = repeatAction (applyChange id)




clap = do
     repeatAction (applyChange (moveUpperLeftArm 10 X)) 36
 --    repeatAction (applyChange (moveUpperRightArm (-40) X)) 9




dance :: State [Pose] Int
dance = do
      pause 4
      clap
      pause 4

{-
      applyChange ((turn 20).(liftRightUpperArm 5).(liftLeftUpperArm 15))
      applyChange ((turn 20).(liftRightUpperArm 5).(liftLeftUpperArm 15))
      applyChange ((turn 20).(liftRightUpperArm 5).(liftLeftUpperArm 15))

      applyChange ((turn (-20)).(liftRightUpperArm (-5)).(liftLeftUpperArm (-15)))
      applyChange ((turn (-20)).(liftRightUpperArm (-5)).(liftLeftUpperArm (-15)))
      applyChange ((turn (-20)).(liftRightUpperArm (-5)).(liftLeftUpperArm (-15)))
      applyChange ((turn (-20)).(liftRightUpperArm (5)).(liftLeftUpperArm (15)))
      applyChange ((turn (-20)).(liftRightUpperArm (5)).(liftLeftUpperArm (15)))
      applyChange ((turn (-20)).(liftRightUpperArm (5)).(liftLeftUpperArm (15)))

      applyChange ((turn 20).(liftRightUpperArm (-5)).(liftLeftUpperArm (-15)))
      applyChange ((turn 20).(liftRightUpperArm (-5)).(liftLeftUpperArm (-15)))
      applyChange ((turn 20).(liftRightUpperArm (-5)).(liftLeftUpperArm (-15)))
-}

danceMoves = execState dance [initialPose]
javascript = animation2JS (map dancer2triangles danceMoves)

t1 = ((0,0,0), (50, 0, 0), (25,-25,0))


p1 = (0,0,0)
p2 = otherEnd p1 (0, 0, 0) 100
p3 = otherEnd p1 (-90, 0, 0) 100


--javascript = animation2JS [[(p1,p2,p3)]]


main = do
     generateHTML 800 800 "main"
     writeFile "actionList.js" javascript
     putStrLn "Done"

