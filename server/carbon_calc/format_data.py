from .ML import *
from osgeo import gdal
import pandas as pd


def crop_image():
   gdal.UseExceptions()
   rasin = gdal.Open(
    "C:\\Users\david\PythonProjects\EngChange\Carbon-Trading-Verfication\scotland_carbon\data\MODEL_H_EVAL.tif")
   rasout = "C:\\Users\david\PythonProjects\EngChange\Outputs\output1.tif"
   # Define clipping extent
   # INSERT HERE THE CORRECT COORDINATES
   xmin, ymin, xmax, ymax = (314560.6555, 636806.3658, 338644.7862, 620042.962)
   result = gdal.Warp(rasout, rasin, outputBounds=(xmin, ymin, xmax, ymax))
   xyz = gdal.Translate(
    "C:/Users/david/PythonProjects/EngChange/Outputs/outputXYZ.xyz", rasout)
   xyz = None
   df = pd.read_csv(
    "C:/Users/david/PythonProjects/EngChange/Outputs/outputXYZ.xyz", sep=" ", header=None)
   df.columns = ["x", "y", "value"]
   df.to_csv(
    "C:/Users/david/PythonProjects/EngChange/Outputs/outputCSV.csv", index=False)
   finalCSV = "C:/Users/david/PythonProjects/EngChange/Outputs/outputCSV.csv"
   return finalCSV