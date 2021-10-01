import functools
import sys
from flask import send_file

#sys.path.append('/Users/david/FlutterProjects/EngChange/SndRepo/eng-change-computing-project/server/')
sys.path.append('/Users/kobikelemen/flutter/packages/eng-change-computing-project/server/')
from carbon_calc import format_data
sys.path.append('/Users/kobikelemen/flutter/packages/eng-change-computing-project/server/carbon_calc/ML/Carbon-Trading-Verfication/scotland_carbon/src/')
from carbon_maps import main
from flask import (
    Blueprint, flash, g, redirect, render_template, request, session, url_for
)

bp = Blueprint('lat_long', __name__, url_prefix='/lat_long')

@bp.route('/carbon', methods=('GET', 'POST'))
def carbon():
    #if request.method == 'POST':
    #    format_data.crop_image(request.data)

    # latitude is y, longitude is x
    print(' ---- request.form[top_l_lat] ---- ', request.form['top_l_lat'])
    print(' ---- request.form[top_l_long] ---- ', request.form['top_l_long'])
    print(' ---- request.form[btm_r_lat] ---- ', request.form['btm_r_lat'])
    print(' ---- request.form[btm_r_long] ---- ', request.form['btm_r_long'])
    main(
        float(request.form['top_l_long']),
        float(request.form['btm_r_long']),
        float(request.form['top_l_lat']),
        float(request.form['btm_r_lat'])
        )
    # return request.form
    return send_file('/Users/kobikelemen/flutter/packages/eng-change-computing-project/server/flask_server/carbon_prediction_images/graph.png', mimetype='image/png')

