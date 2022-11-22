from flask import (
    Blueprint, flash, g, redirect, render_template, request, url_for
)
from werkzeug.exceptions import abort

from flaskr.auth import login_required
from flaskr.db import get_db

bp = Blueprint('searchbar', __name__)


@bp.route('/searches')  # , methods=['GET', 'POST'])
# @login_required
def searches():
    # form = SearchForm()
    # if request.method == 'POST' and form.validate_on_submit():
    # return redirect((url_for('search_results', query=form.search.data)))
    return render_template('searchbar/searches.html')
