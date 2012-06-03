module Moves where
import Pose
import Geometry

initialPose  = Pose {
       neckAngle          = (0, 90, 90),
       backBoneAngle      = (0, 90, 90),
       backBonePosition   = (0, 0, 0),
       upperLeftArmAngle  = (0, 90, 210),
       upperRightArmAngle = (0, 90, -30),
       lowerLeftArmAngle  = (0, 90, -90),
       lowerRightArmAngle = (0, 90, -90),
       upperLeftLegAngle  = (0, 90, 210),
       upperRightLegAngle = (0, 90, -30),
       lowerLeftLegAngle  = (0, 90, -90),
       lowerRightLegAngle = (0, 90, -90)
       }


{-

moveUpperLeftArmZ :: Double -> Pose -> Pose
moveUpperLeftArmZ diff d  = d {upperLeftArmAngleZ  = (upperLeftArmAngleZ d) + diff}

moveUpperRightArmZ :: Double -> Pose -> Pose
moveUpperRightArmZ diff d = d {upperRightArmAngleZ = (upperRightArmAngleZ d) - diff}

-}

turn :: Double -> Axis -> Pose -> Pose
turn diff axis pose = pose {
       neckAngle          = modifyCoordinate3D axis (neckAngle pose)          ((-) diff),
       backBoneAngle      = modifyCoordinate3D axis (backBoneAngle pose)      ((-) diff),
       upperLeftArmAngle  = modifyCoordinate3D axis (upperLeftArmAngle pose)  ((-) diff),
       upperRightArmAngle = modifyCoordinate3D axis (upperRightArmAngle pose) ((-) diff),
       lowerLeftArmAngle  = modifyCoordinate3D axis (lowerLeftArmAngle pose)  ((-) diff),
       lowerRightArmAngle = modifyCoordinate3D axis (lowerRightArmAngle pose) ((-) diff),
       upperLeftLegAngle  = modifyCoordinate3D axis (upperLeftLegAngle pose)  ((-) diff),
       upperRightLegAngle = modifyCoordinate3D axis (upperRightLegAngle pose) ((-) diff),
       lowerLeftLegAngle  = modifyCoordinate3D axis (lowerLeftLegAngle pose)  ((-) diff),
       lowerRightLegAngle = modifyCoordinate3D axis (lowerRightLegAngle pose) ((-) diff)}

modifyCoordinate3D :: Axis -> Coordinates3D -> (Double -> Double)  -> Coordinates3D
modifyCoordinate3D axis (x, y, z) f = case axis of
                                                             X -> (f x, y, z)
                                                             Y -> (x, f y, z)
                                                             Z -> (x, y, f z)