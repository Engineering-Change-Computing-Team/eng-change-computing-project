from osgeo import gdal
import pandas as pd
from OSGridConverter import latlong2grid

def crop_image(
    tl_lat, tl_long, br_lat, br_long,
    path_to_outputs = "/Users/kobikelemen/flutter/packages/gdal_outputs", 
    path_to_terrence = "/Users/kobikelemen/Carbon-Trading-Verfication",
    ):
   gdal.UseExceptions()
   rasin = gdal.Open(
    path_to_terrence + "/scotland_carbon/data/MODEL_H_EVAL.tif")
   rasout = path_to_outputs + "/output1.tif"
   # Define clipping extent
   # INSERT HERE THE CORRECT COORDINATES
   # RASTER IMAGE PATH RETURNED
   top_l = latlong2grid(tl_lat, tl_long)
   btm_r = latlong2grid(br_lat, br_long)
   print(' ------------------------------------- ')
   print(' TOP_L.E: ' ,top_l.E, '  BTM_R.N: ', btm_r.N, '  BTM_R.E: ', btm_r.E, '  TOP_L.N: ', top_l.N)
   print(' ------------------------------------- ')
   #result = gdal.Warp(rasout, rasin, outputBounds=(xmin, ymin, xmax, ymax))
   result = gdal.Warp(rasout, rasin, outputBounds=(top_l.E, btm_r.N, btm_r.E, top_l.N), xRes = 800, yRes=800)#, width=2000, height=3000)
   return rasout

"""
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
if __name__ == '__main__':

   path = crop_image(
      55.623897157178575, 
      -3.156345784664154, 
      55.58755107155721, 
      -3.1074367091059685
      )