#!/usr/local/bin/python

from PIL import Image

def get_num_pixels(filepath):
    width, height = Image.open(filepath).size
    return width*height

if __name__ == "__main__":
    print(get_num_pixels("/Users/kobikelemen/flutter/packages/gdal_outputs/output1.tif"))
    print(get_num_pixels('/Users/kobikelemen/flutter/packages/eng-change-computing-project/server/carbon_calc/ML/Carbon-Trading-Verfication/scotland_carbon/data/MODEL_H_EVAL.tif'))