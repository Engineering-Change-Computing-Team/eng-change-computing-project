import functools
import sys
#sys.path.append("...")
#from ...carbon_calc import format_data

# REALLY WERID BECAUSE SEEMS TO FIND URL WITH LINE 6, BUT NOT WHEN ERROR RESOLVED WITH LINE 10

sys.path.append('/Users/david/FlutterProjects/EngChange/SndRepo/eng-change-computing-project/server/')
from carbon_calc import format_data
from flask import (
    Blueprint, flash, g, redirect, render_template, request, session, url_for
)

bp = Blueprint('lat_long', __name__, url_prefix='/lat_long')

# handles the lat-long requests 
# uses the module to crop convert the coordinates to correct format
# module also passes the formated data to the ML 


@bp.route('/carbon', methods=('GET', 'POST'))
def carbon():
    #if request.method == 'POST':
    #    format_data.crop_image(request.data)
    t = {
        "name": "JERRY",
        "job": "PLUMBER",
        "id": "20",
        "createdAt": "1"
        }
    return t

