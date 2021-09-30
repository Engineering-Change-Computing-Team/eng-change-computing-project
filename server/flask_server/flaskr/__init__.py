import os 
from flask import Flask

# RUN THESE COMMANDS IN 'flask_server' DIRECTORY TO RUN SERVER:

# export FLASK_APP=flaskr
# export FLASK_ENV=development
# flask run


def create_app(test_config=None):
    app = Flask(__name__, instance_relative_config=True)
    
    app.config.from_mapping(
        SECRET_KEY='dev',
        #DATABASE=os.path.join(app.instance_path, 'flaskr.sqlite'),
    )

    if test_config is None:
        app.config.from_pyfile('config.py', silent=True)
    else:
        app.config.from_mapping(test_config)

    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass

    @app.route('/hello')
    def hello():
        return 'Helloooooo'
    from . import lat_long
    app.register_blueprint(lat_long.bp)
    return app
