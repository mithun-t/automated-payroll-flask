import os
from flask import *
import pymysql
from werkzeug.utils import secure_filename

app = Flask(__name__)
app.secret_key="qqqq"
con = pymysql.connect(host="localhost", user="root", password="", port=3306, db="automatedpayroll")
cmd = con.cursor()
@app.route('/login',methods={'get','post'})
def login():

    username=request.form['username']
    password=request.form['password']
    print(username,password)
    cmd.execute("select*from login where username='"+username+"' and password='"+password+"'")
    s=cmd.fetchone()
    if s is None:
        return ''' <script>alert("login faild");window.location='/'</script> '''
    else:
        if s[3]=="admin":
            return '''<script>alert("login successfull");window.location='/adminhome'</script>'''
        elif s[3]=="HR":
            session['lid']=s[0]
            return '''<script>alert("login successfull");window.location='/hrhome'</script>'''
        else:
            return '''<script>alert{"loginfaild"};window.location='/'<script>'''




@app.route('/')
def admin():
    return render_template('login.html')

@app.route('/adminhome')
def adminhome():
    return render_template('admin home.html')
@app.route('/addhr')
def addhr():
    return render_template('ADD HR.html')
@app.route('/hradd', methods=['get','post'])
def hradd():
 try:
    Fname=request.form['fname']
    Lname=request.form['lname']
    Gender=request.form['gender']
    Phone=request.form['phone']
    Place=request.form['place']
    Post=request.form['post']
    Pin=request.form['pin']
    username=request.form['username']
    password=request.form['password']
    file=request.files['file']
    img=secure_filename(file.filename)
    file.save(os.path.join("static/phtos",img))
    cmd.execute("insert into login values(null,'"+username+"','"+password+"','HR')")
    id=con.insert_id()
    cmd.execute("insert into employee values(null,'"+Fname+"','"+Lname+"','"+Gender+"','"+Phone+"','"+Place+"','"+Post+"','"+Pin+"','"+img+"','"+str(id)+"')")
    con.commit()
    return '''<script>alert("registration successfull");window.location="/adminhome"</script>'''
 except Exception as e:
     print(e)
     return '''<script>alert("registration unsuccessfull");window.location="/adminhome"</script>'''


@app.route('/edithr')
def edithr():
    cmd.execute("SELECT `employee`.* FROM `login` JOIN `employee` ON `employee`.`loginid`=`login`.`LoginId` AND `login`.`type`='HR'")
    s=cmd.fetchall()
    return render_template('edit hr.html',val=s)

@app.route('/edithr1',methods=['post','get'])
def edithr1():
    id=request.args.get('id')
    session['id']=id
    cmd.execute("select * from employee where loginid='"+str(id)+"'")
    s=cmd.fetchone()
    return render_template('updateAdd HR.html',val=s)
@app.route('/updatehr',methods=['get','post'])
def updatehr():
    Fname = request.form['fname']
    Lname = request.form['lname']
    Gender = request.form['gender']
    Phone = request.form['phone']
    Place = request.form['place']
    Post = request.form['post']
    Pin = request.form['pin']
    cmd.execute("update employee set Fname='"+Fname+"',Lname='"+Lname+"',Gender='"+Gender+"',Phno='"+Phone+"',Place='"+Place+"',Post='"+Post+"',PIN='"+Pin+"' where loginid='"+str(session['id'])+"' ")
    con.commit()
    return '''<script>alert("updated successfully");window.location="/edithr"</script>'''
@app.route('/editphoto',methods=['get','post'])
def editphoto():
    idd=request.args.get('id')
    session['id']=idd
    return render_template("changephoto.html")




@app.route('/changephoto',methods=['get','post'])
def changephoto():
    file = request.files['file']
    img = secure_filename(file.filename)
    file.save(os.path.join("static/phtos", img))
    cmd.execute("update employee set photo='"+img+"' where loginid='"+str(session['id'])+"'")
    con.commit
    return '''<script>alert("photo updated successfully");window.location="/edithr"</script>'''
@app.route('/deletehr',methods=['get','post'])
def deletehr():
    id=request.args.get('id')
    cmd.execute("delete from employee where HRid='"+str(id)+"'")
    con.commit()
    return '''<script>alert("deleted successfully");window.location="/edithr"</script>'''


@app.route('/feedback')
def feedback():
    cmd.execute("SELECT `feedback`.*,`employee`.`Fname`,`employee`.`Lname` FROM `employee` JOIN `feedback` ON `feedback`.`UserId`=`employee`.`loginid`")
    s = cmd.fetchall()
    return render_template('feedback.html', val=s)


@app.route('/hrhome')
def hrhome():
    return render_template('HR HOME.html')

@app.route('/addemployee')
def addemployee():
        return render_template('Add Employee.html')
@app.route('/empadd', methods=['get','post'])
def empadd():
 try:
    Fname=request.form['fname']
    Lname=request.form['lname']
    Gender=request.form['gender']
    Phone=request.form['phone']
    Place=request.form['place']
    Post=request.form['post']
    Pin=request.form['pin']
    username=request.form['username']
    password=request.form['password']
    file=request.files['file']
    img=secure_filename(file.filename)
    file.save(os.path.join("static/phtos",img))
    cmd.execute("insert into login values(null,'"+username+"','"+password+"','Employee')")
    id=con.insert_id()
    cmd.execute("insert into employee values(null,'"+Fname+"','"+Lname+"','"+Gender+"','"+Phone+"','"+Place+"','"+Post+"','"+Pin+"','"+img+"','"+str(id)+"')")
    con.commit()
    return '''<script>alert("registration successfull");window.location="/hrhome"</script>'''
 except Exception as e:
    return '''<script>alert("registration unsuccessfull");window.location="/hrhome"</script>'''
@app.route('/editemployee')
def editemployee():
    cmd.execute("SELECT * FROM `employee` where loginid in (select loginid from login where type='Employee')")
    s = cmd.fetchall()
    return render_template('edit employee.html',val=s)

@app.route('/editemployee1')
def editemployee1():
    id = request.args.get('id')
    session['id'] = id
    cmd.execute("select * from employee where loginid='" + str(id) + "'")
    s = cmd.fetchone()
    return render_template('edit emp.html',val=s)

@app.route('/updateemployee', methods=['get', 'post'])
def updateemp():
    Fname = request.form['fname']
    Lname = request.form['lname']
    Gender = request.form['gender']
    Phone = request.form['phone']
    Place = request.form['place']
    Post = request.form['post']
    Pin = request.form['pin']
    cmd.execute(

        "update employee set Fname='" + Fname + "',Lname='" + Lname + "',Gender='" + Gender + "',Phno='" + Phone + "',Place='" + Place + "',Post='" + Post + "',PIN='" + Pin + "' where loginid='" + str(
            session['id']) + "' ")
    con.commit()
    return '''<script>alert("updated successfully");window.location="/editemployee"</script>'''

@app.route('/editeempphoto', methods=['get', 'post'])
def editeempphoto():
    idd = request.args.get('id')
    session['id'] = idd
    return render_template("changeempphoto.html")

@app.route('/changeempphoto', methods=['get', 'post'])
def changeempphoto():
    file = request.files['file']
    img = secure_filename(file.filename)
    file.save(os.path.join("static/phtos", img))
    cmd.execute("update employee set photo='" + img + "' where loginid='" + str(session['id']) + "'")
    con.commit()
    return '''<script>alert("photo updated successfully");window.location="/editemployee"</script>'''

@app.route('/deleteemp', methods=['get', 'post'])
def deleteemp():
    id = request.args.get('id')
    cmd.execute("delete from login where LoginId='" + str(id) + "'")
    cmd.execute("delete from employee where loginid='" + str(id) + "'")
    con.commit()
    return '''<script>alert("deleted successfully");window.location="/editemployee"</script>'''


@app.route('/assignwork')
def addwork():
    cmd.execute("SELECT * FROM `employee`")
    s = cmd.fetchall()
    return render_template('add work.html', val=s)
@app.route('/addworks',methods=['get', 'post'])
def addworks():
    userid = request.form['name']
    location = request.form['location']
    work = request.form['workdetails']
    cmd.execute("insert workassign values(null,'"+userid+"','"+location+"','"+work+"','pending',curdate())")
    con.commit()
    return '''<script>alert("registration successfull");window.location="/assignwork"</script>'''

@app.route('/trackemployee')
def trackemployee():
    cmd.execute("SELECT `employee`.*,`locations`.* FROM `locations` JOIN `employee` ON `employee`.`loginid`=`locations`.`userid`")
    s = cmd.fetchall()

    return render_template('Track employee.html',val=s)

@app.route('/track')
def track():
    id=request.args.get('id')
    session['emid']=id
    return render_template('track.html')
@app.route('/location')
def location():

    cmd.execute("SELECT*FROM locations where userid='"+str(session['emid'])+"'")
    s=cmd.fetchall()
    return render_template('location.html', val=s)

@app.route('/message')
def message():

    cmd.execute("SELECT*FROM message where userid='"+str(session['emid'])+"'")
    s=cmd.fetchall()
    return render_template('messages.html', val=s)
@app.route('/salery')
def salery():


    return render_template('salery.html')

@app.route('/checksalary',methods=['get', 'post'])
def checksalary():
    month = request.form['select']
    cmd.execute(" SELECT HOUR(TIMEDIFF(`ExitTime`,`EnterTime`))*10 hr, (MINUTE(TIMEDIFF(`ExitTime`,`EnterTime`) )*10)/60 mint,userid ,`employee`.`Fname`,`Lname`FROM `attendance` JOIN`employee` ON `employee` .`loginid`=`attendance`.`UserId` WHERE MONTH(DATE)='"+month+"' GROUP BY userid")
    s=cmd.fetchall()
    # for i in s:
    #     hour=i[0]
    #     minute=i[1]
    #     price=(hour*10)+(minute*10/60)

    return render_template('salery.html',val=s)

# @app.route('/addemployee')
# def addemployee():
#     return render_template('Add Employee.html')

@app.route('/calls')
def calls():

    cmd.execute("SELECT*FROM calls where userid='"+str(session['emid'])+"'")
    s=cmd.fetchall()
    return render_template('calls.html', val=s)


if __name__ == "__main__":
    app.run(debug=True)
