module Moves where
import Pose
import Geometry

initialPose  = Pose {
       neckAngle          = (0, 0, 0),
       backBoneAngle      = (-90, 0, 0),
       backBonePosition   = (0, 0, 0),
       upperLeftArmAngle  = (-135 , 0, 0),
       upperRightArmAngle = (135, 0, 0),
       lowerLeftArmAngle  = (0, 0, 0),
       lowerRightArmAngle = (0, 0, 0),
       upperLeftLegAngle  = (120, 0, 0),
       upperRightLegAngle = (60, 0, 0),
       lowerLeftLegAngle  = (0, 0, 0),
       lowerRightLegAngle = (0, 0, 0)
       }


moveUpperLeftArm :: Double -> Axis -> Pose -> Pose
moveUpperLeftArm diff axis pose = pose { upperLeftArmAngle = modifyCoordinate3D axis (upperLeftArmAngle pose) (+ diff) }

moveUpperRightArm :: Double -> Axis -> Pose -> Pose
moveUpperRightArm diff axis pose = pose { upperRightArmAngle = modifyCoordinate3D axis (upperRightArmAngle pose) (+ diff) }


turn :: Double -> Axis -> Pose -> Pose
turn diff axis pose = pose {
       neckAngle          = modifyCoordinate3D axis (neckAngle pose)          (+ diff),
       backBoneAngle      = modifyCoordinate3D axis (backBoneAngle pose)      (+ diff),
       upperLeftArmAngle  = modifyCoordinate3D axis (upperLeftArmAngle pose)  (+ diff),
       upperRightArmAngle = modifyCoordinate3D axis (upperRightArmAngle pose) (+ diff),
       lowerLeftArmAngle  = modifyCoordinate3D axis (lowerLeftArmAngle pose)  (+ diff),
       lowerRightArmAngle = modifyCoordinate3D axis (lowerRightArmAngle pose) (+ diff),
       upperLeftLegAngle  = modifyCoordinate3D axis (upperLeftLegAngle pose)  (+ diff),
       upperRightLegAngle = modifyCoordinate3D axis (upperRightLegAngle pose) (+ diff),
       lowerLeftLegAngle  = modifyCoordinate3D axis (lowerLeftLegAngle pose)  (+ diff),
       lowerRightLegAngle = modifyCoordinate3D axis (lowerRightLegAngle pose) (+ diff)}

modifyCoordinate3D :: Axis -> Coordinates3D -> (Double -> Double)  -> Coordinates3D
modifyCoordinate3D axis (x, y, z) f = case axis of
                                X -> (f x, y, z)
                                Y -> (x, f y, z)
                                Z -> (x, y, f z)