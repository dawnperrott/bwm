from flask import Flask, Blueprint, render_template, request, make_response, url_for
import sqlite3
from werkzeug.exceptions import abort

import db
from flaskr.auth import login_required
from flaskr.db import get_db

bp = Blueprint('searchbar', __name__)

# @bp.route('/searches')  # , methods=['GET', 'POST'])
# @login_required
# def searches():
# form = SearchForm()
# if request.method == 'POST' and form.validate_on_submit():
# return redirect((url_for('search_results', query=form.search.data)))
#    return render_template('searchbar/searches.html')


#
#def getbeers(search):
#    conn = sqlite3.connect(dbFILE)
#    cursor = conn.cursor()
#    cursor.execute(
#       "SELECT * FROM `user` WHERE `name` LIKE ? OR `password` LIKE ?",
#        ("%" + search + "%", "%" + search + "%",)
#    )
#    results = cursor.fetchall()
#    conn.close()
#    return results


#
@bp.route("/searches", methods=["GET", "POST"])
def searches():
    #  SEARCH FOR beers
 #    if request.method == "POST":
 #       data = dict(request.form)
  #      user = getbeers(data["search"])
  #  else:
  #      user = []

    return render_template("searchbar/searches.html")  #, usr=user)


