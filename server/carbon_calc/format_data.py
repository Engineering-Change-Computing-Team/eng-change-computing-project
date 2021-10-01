from .ML import *
#from osgeo import gdal
#import pandas as pd



"""
def crop_image(
    xmin, ymin, xmax, ymax,
    path_to_outputs = "/Users/kobikelemen/flutter/packages/gdal_outputs", 
    path_to_terrence = "/Users/kobikelemen/Carbon-Trading-Verfication",
    ):
   gdal.UseExceptions()
   rasin = gdal.Open(
    path_to_terrence + "/scotland_carbon/data/MODEL_H_EVAL.tif")
   rasout = path_to_outputs + "/output1.tif"
   # Define clipping extent
   # INSERT HERE THE CORRECT COORDINATES
   result = gdal.Warp(rasout, rasin, outputBounds=(xmin, ymin, xmax, ymax))
   xyz = gdal.Translate(
    path_to_outputs + "/outputXYZ.xyz", rasout)
   xyz = None
   df = pd.read_csv(
    path_to_outputs + "/outputXYZ.xyz", sep=" ", header=None)
   df.columns = ["x", "y", "value"]
   df.to_csv(
    path_to_outputs + "/outputCSV.csv", index=False)
   finalCSV = path_to_outputs + "/outputCSV.csv"
   return finalCSV 
"""