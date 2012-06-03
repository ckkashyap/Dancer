module Moves where
import Pose
import Geometry

initialPose  = Pose {
       neckAngle          = (0, 0, 0),
       backBoneAngle      = (-90, 0, 0),
       backBonePosition   = (0, 0, 0),

       upperLeftArmAngle  = (-150 , 0, 0),
       lowerLeftArmAngle  = (-30, 0, 0),

       upperRightArmAngle = (150, 0, 0),
       lowerRightArmAngle = (30, 0, 0),

       upperLeftLegAngle  = (100, 0, 0),
       lowerLeftLegAngle  = (-10, 0, 0),

       upperRightLegAngle = (80, 0, 0),
       lowerRightLegAngle = (10, 0, 0)
       }


moveUpperLeftArm :: Double -> Axis -> Pose -> Pose
moveUpperLeftArm diff axis pose = pose { upperLeftArmAngle = modifyCoordinate3D axis (upperLeftArmAngle pose) (+ diff) }

moveLowerLeftArm :: Double -> Axis -> Pose -> Pose
moveLowerLeftArm diff axis pose = pose { lowerLeftArmAngle = modifyCoordinate3D axis (lowerLeftArmAngle pose) (+ diff) }

moveUpperRightArm :: Double -> Axis -> Pose -> Pose
moveUpperRightArm diff axis pose = pose { upperRightArmAngle = modifyCoordinate3D axis (upperRightArmAngle pose) (+ diff) }

moveLowerRightArm :: Double -> Axis -> Pose -> Pose
moveLowerRightArm diff axis pose = pose { lowerRightArmAngle = modifyCoordinate3D axis (lowerRightArmAngle pose) (+ diff) }

moveUpperLeftLeg :: Double -> Axis -> Pose -> Pose
moveUpperLeftLeg diff axis pose = pose { upperLeftLegAngle = modifyCoordinate3D axis (upperLeftLegAngle pose) (+ diff) }

moveLowerLeftLeg :: Double -> Axis -> Pose -> Pose
moveLowerLeftLeg diff axis pose = pose { lowerLeftLegAngle = modifyCoordinate3D axis (lowerLeftLegAngle pose) (+ diff) }

moveUpperRightLeg :: Double -> Axis -> Pose -> Pose
moveUpperRightLeg diff axis pose = pose { upperRightLegAngle = modifyCoordinate3D axis (upperRightLegAngle pose) (+ diff) }

moveLowerRightLeg :: Double -> Axis -> Pose -> Pose
moveLowerRightLeg diff axis pose = pose { lowerRightLegAngle = modifyCoordinate3D axis (lowerRightLegAngle pose) (+ diff) }


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




