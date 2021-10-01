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

    print(' REQUEST: ')
    print(request.form)
    main()
    # return request.form
    return send_file('/Users/kobikelemen/flutter/packages/eng-change-computing-project/server/flask_server/carbon_prediction_images/graph.png', mimetype='image/png')

