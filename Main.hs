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

pause = do
      applyChange id
      applyChange id
      applyChange id
      applyChange id




dance :: State [Pose] Int
dance = do
      pause
      
      applyChange (turn (- 30) Y)
      pause

      applyChange (turn (- 30) Y)
      pause

      applyChange (turn 30 Y)
      pause

      applyChange (turn 30 Y)

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


main = do
     generateHTML 800 800 "main"
     writeFile "actionList.js" javascript
     putStrLn "Done"

