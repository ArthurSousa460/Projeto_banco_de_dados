from flask import Flask, render_template
from flask_mysqldb import MySQL

app = Flask(__name__)
app.config['MYSQL_HOST'] = 'Localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'recursos_humanos'
mysql = MySQL(app)


def query(sql):
    cursor = mysql.connection.cursor()
    cursor.execute(sql)
    data = cursor.fetchall()
    cursor.close()
    return data


@app.get('/departament')
def get_departements():
    data = query('SELECT * FROM departamento')
    return render_template('departamentos.html', data= data)

@app.get('/employe')
def get_employes():
    data = query('SELECT * FROM empregado')
    return render_template('empregados.html', data= data)

@app.get('/project')
def get_projects():
    data = query('SELECT * FROM projeto')
    return render_template('projetos.html', data=data)