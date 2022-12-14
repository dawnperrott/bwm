from flask import Flask, render_template


def create_app(test_config=None):
    # create and configure the app
    app = Flask(__name__, instance_relative_config=True)
    app.config.from_mapping(
        SECRET_KEY='dev',
        DATABASE=os.path.join(app.instance_path, 'flaskr.sqlite'),
    )

    if test_config is None:
        # load the instance config, if it exists, when not testing
        app.config.from_pyfile('config.py', silent=True)
    else:
        # load the test config if passed in
        app.config.from_mapping(test_config)

    # ensure the instance folder exists
    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass

    # homepage
    @app.route('/')
    def index():
        return render_template('index.html')

    @app.route('/limerick')
    def limerick():
        return render_template('limerick.html')

    @app.route('/contact')
    def contact():
        return render_template('contact.html')

    from . import searchbar
    app.register_blueprint(searchbar.bp)

    from . import db
    db.init_app(app)

    from . import auth
    app.register_blueprint(auth.bp)

    from . import crawl
    app.register_blueprint(crawl.bp)

    from . import blog
    app.register_blueprint(blog.bp)
    app.add_url_rule('/beverage', endpoint='beverage')

    return app


if __name__ == "__main__":
    app.run(host='0.0.0.0' , port=8080)
