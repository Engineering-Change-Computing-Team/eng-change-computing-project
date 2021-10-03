import functools
import sys
from flask import send_file

#sys.path.append('/Users/david/FlutterProjects/EngChange/SndRepo/eng-change-computing-project/server/')
sys.path.append('/Users/kobikelemen/flutter/packages/eng-change-computing-project/server/')
from carbon_calc import format_data
sys.path.append('/Users/kobikelemen/flutter/packages/eng-change-computing-project/server/carbon_calc/ML/Carbon-Trading-Verfication/scotland_carbon/src/')
from carbon_maps import main
sys.path.append('/Users/kobikelemen/flutter/packages/eng-change-computing-project/server/carbon_calc/')
from format_data import crop_image
from flask import (
    Blueprint, flash, g, redirect, render_template, request, session, url_for
)

bp = Blueprint('lat_long', __name__, url_prefix='/lat_long')

@bp.route('/carbon', methods=('GET', 'POST'))
def carbon():

    # latitude is y, longitude is x
    print(' ---- request.form[top_l_lat] ---- ', request.form['top_l_lat'])
    print(' ---- request.form[top_l_long] ---- ', request.form['top_l_long'])
    print(' ---- request.form[btm_r_lat] ---- ', request.form['btm_r_lat'])
    print(' ---- request.form[btm_r_long] ---- ', request.form['btm_r_long'])

    path_to_rasterio = crop_image(
        float(request.form['top_l_lat']),
        float(request.form['top_l_long']),
        float(request.form['btm_r_lat']),
        float(request.form['btm_r_long'])
        )
    path_to_rasterio = '/Users/kobikelemen/flutter/packages/gdal_outputs/output1.tif'
    main(
        path_to_rasterio,
        float(request.form['top_l_long']),
        float(request.form['btm_r_long']),
        float(request.form['top_l_lat']),
        float(request.form['btm_r_lat'])
        )
    # print('---------------')
    # print('REQUEST.FORM: ')
    # print(request.form)
    # print('---------------')
    # return request.form
    return send_file('/Users/kobikelemen/flutter/packages/eng-change-computing-project/server/flask_server/carbon_prediction_images/graph_1.png', mimetype='image/png')

