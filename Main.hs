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
             
addPosition p = do
            ps <- get
            put (p:ps)
            return 0

repeatAction action 0 = return 0
repeatAction action n = do
             action
             repeatAction action (n - 1)
             

pause :: Int -> State [Pose] Int
pause = repeatAction (applyChange id)

swingArmsAndLegs :: Bool -> Pose -> Pose
swingArmsAndLegs b = ((moveUpperLeftArm  d_positive Z)
                     .(moveUpperRightArm d_negetive Z)
                     .(moveUpperLeftLeg d_negetive Z)
                     .(moveUpperRightLeg d_positive Z))
                 where 
                       (d_positive, d_negetive) = if b then (10, -10) else (-10,10)

walk :: State [Pose] Int
walk = do
     repeatAction (applyChange (swingArmsAndLegs True)) 5
     repeatAction (applyChange (swingArmsAndLegs False)) 5
     repeatAction (applyChange (swingArmsAndLegs False)) 5
     repeatAction (applyChange (swingArmsAndLegs True)) 5


dance :: State [Pose] Int
dance = do
      walk

danceMoves = execState dance [initialPose]
javascript = animation2JS (map dancer2triangles danceMoves)


main = do
     generateHTML 800 800 "main"
     writeFile "actionList.js" javascript
     putStrLn "Done"

