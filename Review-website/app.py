from flask import Flask, render_template, redirect, request, session, url_for
from flask_mysqldb import MySQL
import MySQLdb.cursors, re, hashlib
from datetime import datetime


app = Flask(__name__)

app.secret_key = 'kevin'


app.config['MYSQL_HOST'] = 'localhost'
app.config["MYSQL_USER"] = 'root'
app.config["MYSQL_PASSWORD"] = ''
app.config["MYSQL_DB"] = 'accounts'


mysql = MySQL(app)





#homepage
@app.route('/', methods=['POST', 'GET'])    
def home():

    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('SELECT * FROM reviews') 
    rows = cursor.fetchall()


    if rows:                   
        reviews = [{
        'review_id': row['review_id'],
        'moviename': row['moviename'],
        'username': row['username'],
        'review': row['review'],
        'reviewdate': row['reviewdate'],
        'time_ago': get_time_ago(row['reviewdate']),
        'likes': row['likes']
        }
        
        
        for row in rows
        ]

        if 'loggedin' in session:
            username = session['username']

            return render_template('Homepage.html', reviews=reviews, username=username)
        else: 
            return render_template('Homepage.html', reviews=reviews)
    else: 
        
        if 'loggedin' in session:
            username = session['username']
            return render_template('Homepage.html', error="no reviews", username=username)

        return render_template('Homepage.html', error="no reviews")

def get_time_ago(review_date):
    """Converts a date string into a 'time ago' format."""
    # Convert date string to datetime object
     # Adjust format to match your database
    now = datetime.now()
    difference = now - review_date

    seconds = difference.total_seconds()
    minutes = seconds / 60
    hours = minutes / 60
    days = hours / 24
    weeks = days / 7
    months = days / 30
    years = days / 365

    if seconds < 60:
        return f"{int(seconds)} seconds ago"
    elif minutes < 60:
        return f"{int(minutes)} minutes ago"
    elif hours < 24:
        return f"{int(hours)} hours ago"
    elif days < 7:
        return f"{int(days)} days ago"
    elif weeks < 4:
        return f"{int(weeks)} weeks ago"
    elif months < 12:
        return f"{int(months)} months ago"
    else:
        return f"{int(years)} years ago"




@app.route('/Review', methods = ['POST', 'GET'])
def review_info():
    if request.method == 'POST':
        review_id = request.form['review_id']
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM reviews WHERE review_id = %(review_id)s;', {'review_id': review_id}) 
        mysql.connection.commit()
        row = cursor.fetchone()
        

        if not row : #checks if movie exists 
            return render_template('Review.html', error="Review not found")
        else:
            review_info = {
            'review_id': row['review_id'],
            'moviename': row['moviename'],
            'username': row['username'],
            'review': row['review'],
            'reviewdate': row['reviewdate'],
            'likes': row['likes'],
            }

            if 'loggedin' in session:
                username = session['username']

                return render_template('Review.html', review_info=review_info, username=username) 
            else: 
                return render_template('Review.html', review_info=review_info)



                
    return render_template('Review.html') 






@app.route('/Movies', methods = ['POST', 'GET'])
def movie():
    if request.method == 'POST':
        moviename = request.form['moviename']
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM movies WHERE moviename = %(moviename)s;', {'moviename': moviename}) 
        mysql.connection.commit()
        row = cursor.fetchone()

        if not row : #checks if movie exists 
            return render_template('MovieInfo.html', error="Movie not found")
        else:
            movie_info = {
            'movie_id': row['movie_id'],
            'moviename': row['moviename'],
            'runtime': row['runtime'],
            'movielink': row['movielink'],
            'releasedate': row['releasedate'],
            'likes': row['likes'],
            }

            cursor.execute('SELECT * FROM reviews WHERE moviename = %(moviename)s;', {'moviename': moviename}) 
            rows = cursor.fetchall()

            if not rows : #checks if review exists 
                return render_template('MovieInfo.html', movie=movie_info, error="No reviews yet. Be the first to review!")
            
            else: 
                reviews = [{
                'review_id': row['review_id'],
                'moviename': row['moviename'],
                'username': row['username'],
                'review': row['review'],
                'reviewdate': row['reviewdate'],
                'likes': row['likes']
                }
                for row in rows
                ]

                if 'review' in request.form:
                    if 'loggedin' in session:
                        username = session['username']
                        review = request.form['review']  # Get the review from the form

                        cursor.execute('''
                            INSERT INTO reviews(moviename, username, review, reviewdate) 
                            VALUES(%s, %s, %s, NOW());
                        ''', (moviename, username, review))
                        mysql.connection.commit()

                        # Redirect back to the movie page with a success message
                        return render_template('MovieInfo.html', movie=movie_info, reviews=reviews, success="Successfully added your review!")

                return render_template('MovieInfo.html', movie=movie_info, reviews=reviews)
            
    return render_template('MovieInfo.html', movie=movie_info, reviews=reviews)
        


# code snippet (insert review into db): INSERT INTO reviews(movie_id, user_id, review, reviewdate, likes) VALUES(102, 1, "test", CURRENT_DATE(), 0);



@app.route('/Search', methods = ['POST', 'GET'])
def search():
    if request.method == 'POST':
        query = request.form['query']
        search_query = f"{query}%"
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM movies WHERE moviename LIKE %(query)s;', {'query': search_query}) 
        mysql.connection.commit()
        rows = cursor.fetchall()


        if not rows : #checks if movie exists 
            return render_template('Search.html', error="No movies found")
        else:
            results = [{
            'moviename': row['moviename'],
            'movielink': row['movielink'],
            }
            for row in rows]

            return render_template('Search.html', results=results) 

    return render_template('Search.html') 



@app.route('/Filter', methods = ['POST', 'GET'])
def filter():
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('SELECT * FROM movies;') 
    rows = cursor.fetchall()


    if not rows : #checks if movies exist 
        return render_template('Filter.html', error="No movies found")
    results = [{
    'moviename': row['moviename'],
    'movielink': row['movielink'],
    }
    for row in rows]


    if request.method == 'POST':
        selected_filters = request.form.getlist('filter') # will be sent back to page so the checkboxes can retain their checked state

        selected_genres = request.form.getlist('filter')  #Obtains the selected genre 
        placeholders = ', '.join(['%s'] * len(selected_genres))
        #Obtains the movie data for movies which posses all selected genres 
        query = f'''
        SELECT m.moviename, m.movielink
        FROM movies m
        JOIN movie_genres mg ON m.movie_id = mg.movie_id
        WHERE mg.genre IN ({placeholders})
        GROUP BY m.movie_id
        HAVING COUNT(DISTINCT mg.genre) = %s;
        '''
        
        # Execute the query with the selected genres and their count
        cursor.execute(query, selected_genres + [len(selected_genres)])
        rows = cursor.fetchall()

        if not rows : #checks if movie exists 
            return render_template('Filter.html', error="No movies found", selected_filters=selected_filters)
        else:
        
            results = [{
            'moviename': row['moviename'],
            'movielink': row['movielink'],
            }for row in rows]
        
            return render_template('Filter.html', results=results, selected_filters=selected_filters) 


    return render_template('Filter.html', results=results) 



@app.route('/Profile', methods = ['POST', 'GET'])

def profile():


    if request.method == 'POST':
        username = request.form['username']        
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)



        cursor.execute('SELECT * FROM accounts WHERE username = "%(username)s";',{'username' : username}) 
        row = cursor.fetchone()


        if row:                   
            user_info = {  
            'user_id': row['user_id'],
            'username': row['username'],
            'displayname': row['displayname'],
            'joindate': row['joindate'],
            'pfp': row['pfp']
            }
            
            
            

            return render_template('Profile.html', user_info=user_info, username=username)
        else: 

            return render_template('Profile.html', error="Profile not found")
        
    return render_template('Profile.html') 




@app.route('/MyProfile', methods = ['POST', 'GET'])

def myprofile():


    if 'loggedin' in session:
        username = session['username']
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)

        cursor.execute('SELECT * FROM accounts WHERE username = "%(username)s";',{'username' : username}) 
        rows = cursor.fetchall()


        if rows:                   
            user_info = [{  
            'user_id': row['user_id'],
            'username': row['username'],
            'displayname': row['displayname'],
            'joindate': row['joindate'],
            'pfp': row['pfp']
            }
            
            
            for row in rows
            ]

            return render_template('Profile.html', user_info=user_info, username=username)
        else: 

            return render_template('Profile.html', error="Profile not found", username=username)
    else: 

        return render_template('Profile.html', error="You need to be logged in to see your Profile!")



@app.route('/Settings', methods = ['POST', 'GET'])

def settings():


    if 'loggedin' in session:
        username = session['username']
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)

        cursor.execute('SELECT * FROM accounts WHERE username = "%(username)s";',{'username' : username}) 
        rows = cursor.fetchall()


        if rows:                   
            user_info = [{  
            'user_id': row['user_id'],
            'username': row['username'],
            'displayname': row['displayname'],
            'joindate': row['joindate'],
            'pfp': row['pfp']
            }
            
            
            for row in rows
            ]

            return render_template('Settings.html', user_info=user_info, username=username)
        else: 

            return render_template('Settings.html', error="Profile not found", username=username)
    else: 

        return render_template('Settings.html', error="You need to be logged in to see your Profile!")




@app.route('/MyReviews', methods = ['POST', 'GET'])
def myreviews():


    if 'loggedin' in session:
        username = session['username']
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)

        cursor.execute('SELECT * FROM reviews WHERE username = %(username)s;',{'username' : username}) 
        rows = cursor.fetchall()


        if rows:                   
            reviews = [{  
            'review_id': row['review_id'],
            'moviename': row['moviename'],
            'username': row['username'],
            'review': row['review'],
            'reviewdate': row['reviewdate'],
            'time_ago': get_time_ago(row['reviewdate']),
            'likes': row['likes']
            }
            
            
            for row in rows
            ]

            return render_template('MyReviews.html', reviews=reviews, username=username)
        else: 

            return render_template('MyReviews.html', error="no reviews", username=username)
    else: 

        return render_template('MyReviews.html', error="You need to be logged in to see your reviews!")














@app.route('/Register', methods = ['POST', 'GET'])
def register():
     
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        cursor = mysql.connection.cursor()

        cursor.execute('SELECT * FROM accounts WHERE username = %(username)s;', {'username': username}) 
        mysql.connection.commit()
        row = cursor.fetchall()

        if row:
            return render_template('Register.html', error = "Username is Taken!") 

        else: 
            hash = password + app.secret_key
            hash = hashlib.sha1(hash.encode())
            password = hash.hexdigest()
            cursor.execute(''' INSERT INTO accounts(username, password, joindate) VALUES("%s", "%s", NOW());''',(username,password))
            mysql.connection.commit()
            cursor.close()
            return render_template('Register.html', Success = "Account successfully created. Log in now!") 

    
    
    return render_template('Register.html') 


    
@app.route('/Login', methods = ['POST', 'GET'])
def login(): 
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']

        hash = password + app.secret_key
        hash = hashlib.sha1(hash.encode())
        password = hash.hexdigest()

        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM accounts WHERE username = "%(username)s" AND password = "%(password)s"', {'username': username, 'password': password}) 
        row = cursor.fetchone()

        
        if not row : #checks if account exists 
            return render_template('Login.html', error="Invalid username or password.")
        else:
            session['loggedin'] = True
            session['user_id'] = row['user_id']
            session['username'] = username
            # Redirect to home page
            return redirect(url_for('home'))
            
        
    
    return render_template('Login.html') 




@app.route('/Logout')
def logout():
    # Remove session data, this will log the user out
   session.pop('loggedin', None)
   session.pop('user_id', None)
   session.pop('username', None)
   # Redirect to login page
   return redirect(url_for('home'))







if __name__ in "__main__": 
    app.run( debug=True)

