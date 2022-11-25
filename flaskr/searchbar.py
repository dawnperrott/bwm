from flask import Flask, Blueprint, render_template, request, make_response, url_for

import sqlite3

from werkzeug.exceptions import abort

from flaskr.db import get_db

bp = Blueprint('searchbar', __name__)


@bp.route("/searches", methods=('GET', 'POST'))
def searches():
    pub = ""
    if request.method == 'POST':
        searched = request.form['searched']
        db = get_db()
        error = None

        if not searched:
            error = 'Search is required.'

        pub = db.execute(
            'SELECT * FROM pub WHERE pub_name LIKE ?', (searched,)
        ).fetchall()
        if pub:
            print(pub[0][0])
            print(pub[0][1])
            print(pub[0][2])
            print(pub[0][3])
        else:
            beer = db.execute(
                'SELECT * FROM beer WHERE beer_name LIKE ?', (searched,)
            ).fetchall()
            if beer:
                print(beer[0][0])
                print(beer[0][1])
                print(beer[0][2])
            pub = beer

        db.close()

    return render_template("searchbar/searches.html", rows=pub)
