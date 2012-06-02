module Moves where
import Dancer

initialPose  = Dancer {
       neckAngleX = 0,
       neckAngleY = 90,
       neckAngleZ =  90,

       backBoneAngleX = 0,
       backBoneAngleY =  90,
       backBoneAngleZ =  90,

       backBonePositionX = 0,
       backBonePositionY =  0,
       backBonePositionZ =  0,

       upperLeftArmAngleX = 0,
       upperLeftArmAngleY =  90,
       upperLeftArmAngleZ =  210,

       upperRightArmAngleX = 0,
       upperRightArmAngleY =  90,
       upperRightArmAngleZ =  -30,

       lowerLeftArmAngleX = 0,
       lowerLeftArmAngleY =  90,
       lowerLeftArmAngleZ =  -90,

       lowerRightArmAngleX = 0,
       lowerRightArmAngleY =  90,
       lowerRightArmAngleZ =  -90,

       upperLeftLegAngleX = 0,
       upperLeftLegAngleY =  90,
       upperLeftLegAngleZ =  210,

       upperRightLegAngleX = 0,
       upperRightLegAngleY =  90,
       upperRightLegAngleZ =  -30,

       lowerLeftLegAngleX = 0,
       lowerLeftLegAngleY =  90,
       lowerLeftLegAngleZ =  -90,

       lowerRightLegAngleX = 0,
       lowerRightLegAngleY =  90,
       lowerRightLegAngleZ =  -90

       }

moveUpperLeftArmZ :: Double -> Dancer -> Dancer
moveUpperLeftArmZ diff d  = d {upperLeftArmAngleZ  = (upperLeftArmAngleZ d) + diff}

moveUpperRightArmZ :: Double -> Dancer -> Dancer
moveUpperRightArmZ diff d = d {upperRightArmAngleZ = (upperRightArmAngleZ d) - diff}



turn :: Double -> Dancer -> Dancer
turn diff d = d {
       neckAngleY          = (neckAngleY d)          - diff,
       backBoneAngleY      = (backBoneAngleY d)      - diff,
       upperLeftArmAngleY  = (upperLeftArmAngleY d)  - diff,
       upperRightArmAngleY = (upperRightArmAngleY d) - diff,
       lowerLeftArmAngleY  = (lowerLeftArmAngleY d)  - diff,
       lowerRightArmAngleY = (lowerRightArmAngleY d) - diff,
       upperLeftLegAngleY  = (upperLeftLegAngleY d)  - diff,
       upperRightLegAngleY = (upperRightLegAngleY d) - diff,
       lowerLeftLegAngleY  = (lowerLeftLegAngleY d)  - diff,
       lowerRightLegAngleY = (lowerRightLegAngleY d) - diff
          }


