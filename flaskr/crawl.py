from flask import (
    Blueprint, flash, g, redirect, render_template, request, url_for
)
from werkzeug.exceptions import abort

from flaskr.auth import login_required
from flaskr.db import get_db

bp = Blueprint('crawl', __name__)


@bp.route('/pubs')
def pubs():
    return render_template("crawl/pubs.html")



