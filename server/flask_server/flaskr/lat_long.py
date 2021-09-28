import functools
from server.carbon_calc import format_data
from carbon_calc import *

from flask import (
    Blueprint, flash, g, redirect, render_template, request, session, url_for
)

bp = Blueprint('lat_long', __name__, url_prefix='/lat_long')

# handles the lat-long requests 
# uses the module to crop convert the coordinates to correct format
# module also passes the formated data to the ML 


@bp.route('/carbon', methods=('GET', 'POST'))
def carbon():
    if request.method == 'POST':
        format_data.crop_image(request.data) # ... ?
    return "HELLO"

