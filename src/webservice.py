import os
import pymysql
from flask import *
import cv2
from werkzeug.utils import secure_filename
path=r".\static\photos"
app=Flask(__name__)
con=pymysql.connect(host='localhost',user='root',password='',port=3306,db="automatedpayroll")
cmd=con.cursor()
from  src.encode_faces import enf
@app.route('/login',methods=['POST'])
def login():
    con = pymysql.connect(host='localhost', user='root', password='', port=3306, db="automatedpayroll")
    cmd = con.cursor()

    uname=request.form['uname']
    password=request.form['pass']
    # print(uname)
    # print(password)
    cmd.execute("select * from login where username='" + uname + "' and password='"+password+"'  and type='Employee' ") #double Quots only give for the variables
    s = cmd.fetchone()
    if s is None:
        return jsonify({'task': "invalid"}) #jsonify also used to make key word for the variable in python file also it can be transfer as json object file.
    else:
        return jsonify({'task': s[0]})
@app.route('/feedback', methods=['POST'])
def feedback():
    con = pymysql.connect(host='localhost', user='root', password='', port=3306, db="automatedpayroll")
    cmd = con.cursor()

    feedback = request.form['feedback']
    uid = request.form['userid']
    cmd.execute("insert into feedback values(null,'" + feedback + "','" + str(uid) + "',curdate())")
    con.commit()
    return jsonify({'task': "success"})

@app.route('/location', methods=['POST'])
def updatelocation():
    con = pymysql.connect(host='localhost', user='root', password='', port=3306, db="automatedpayroll")
    cmd = con.cursor()

    userid = request.form['userid']
    latitude = request.form['latt']
    longitude = request.form['long']
    place = request.form['place']
    print(userid)
    cmd.execute("insert into locations values(null,'" + str(userid) + "','" +latitude+ "','" +longitude+ "',now(),'" +place+ "')")
    con.commit()
    return jsonify({'task': "success"})

@app.route('/c_fetchcall', methods=['POST'])
def calls():
    con = pymysql.connect(host='localhost', user='root', password='', port=3306, db="automatedpayroll")
    cmd = con.cursor()

    userid = request.form['userid']
    phone = request.form['phnum']
    type = request.form['type']
    # date= request.form['date']

    print(phone)
    cmd.execute("insert into calls values(null,'" +str(userid)+ "','" +phone+ "','" +type+ "',curdate(),now())")
    con.commit()
    return jsonify({'task': "success"})

@app.route('/viewwork', methods=['POST'])
def viewwork():
    con = pymysql.connect(host='localhost', user='root', password='', port=3306, db="automatedpayroll")
    cmd = con.cursor()

    userid = request.form['lid']
    cmd.execute("SELECT * FROM  workassign WHERE UserId='" + userid + "' AND  status='pending'")
    s = cmd.fetchall()
    print(s)
    row_headers = [x[0] for x in cmd.description]
    json_data = []
    for result in s:
        json_data.append(dict(zip(row_headers, result)))
    return jsonify(json_data)

@app.route('/c_fetchmessage', methods=['POST'])
def smsout():
    con = pymysql.connect(host='localhost', user='root', password='', port=3306, db="automatedpayroll")
    cmd = con.cursor()

    userid = request.form['uid']
    message = request.form['message']
    phone = request.form['phone']
    # type = request.form['type']
    # date = request.form['date']
    # time = request.form['time']
    print(message)
    cmd.execute("insert into message values(null,'" +str(userid)+ "','" +message+ "','" +phone+ "','incoming',curdate(),curtime())")
    con.commit()
    return jsonify({'task': "Success"})
@app.route('/c_fetchmessage1', methods=['POST'])
def smsout1():
    con = pymysql.connect(host='localhost', user='root', password='', port=3306, db="automatedpayroll")
    cmd = con.cursor()

    userid = request.form['userid']
    message = request.form['message']
    phone = request.form['phone']
    # type = request.form['type']
    # date = request.form['date']
    # time = request.form['time']
    print(message)
    cmd.execute("insert into message values(null,'" +str(userid)+ "','" +message+ "','" +phone+ "','outgoing',curdate(),curtime())")
    con.commit()
    return jsonify({'task': "Success"})


@app.route('/capturedframe', methods=['POST'])
def capturedframe():
    con = pymysql.connect(host='localhost', user='root', password='', port=3306, db="automatedpayroll")
    cmd = con.cursor()

    try:
        print(request.form)
        pic=request.files['files']
        # place=request.form['location']
        place="Kozhikode"
        file=secure_filename(pic.filename)
        print(file)
        pic.save(os.path.join("static/captured_image",file))

        srcc=cv2.imread(os.path.join("static/captured_image",file))

        srcc=cv2.rotate(srcc,cv2.cv2.ROTATE_90_COUNTERCLOCKWISE)
        cv2.imwrite(os.path.join("static/captured_image",file),srcc)



        result=enf(file);
        print("result",result)
        if(result=="no user" or result=='na'):
            return jsonify({'task': "no user"})
        else:
            print("SELECT * FROM `workassign` WHERE location='"+place+"'")
            cmd.execute("SELECT * FROM `workassign` WHERE location='"+place+"'")
            s=cmd.fetchone()
            if s is not None:
                cmd.execute("SELECT * FROM `attendance` WHERE `UserId`='"+str(result)+"' AND `Date`=CURDATE()")
                s=cmd.fetchone()
                if s is None:

                    cmd.execute("insert into attendance values(null,'" +str(result) + "',curdate(),curtime(),curtime())")
                    con.commit()
                    return jsonify({'task': 'success'})
                else:
                    cmd.execute("UPDATE `attendance` SET `ExitTime`=curtime() WHERE `AttId`="+str(s[0]))
                    con.commit()
                    return jsonify({'task': 'success'})
            else:
                return jsonify({'task': 'not alloted'})
    except Exception as e:
        print(e)
        return jsonify({'task': 'Error'})
@app.route('/salary', methods=['POST'])
def salary():
    # con = pymysql.connect(host='localhost', user='root', password='', port=3306, db="automatedpayroll")
    # cmd = con.cursor()

    userid = request.form['lid']
    mnth = request.form['mnth']
    cmd.execute(" SELECT HOUR(TIMEDIFF(`ExitTime`,`EnterTime`))*10 hr, floor((MINUTE(TIMEDIFF(`ExitTime`,`EnterTime`) )*10)/60) mint,userid ,`employee`.`Fname`,`Lname`FROM `attendance` JOIN`employee` ON `employee` .`loginid`=`attendance`.`UserId` WHERE MONTH(DATE)='"+mnth+"' AND userid='" +str(userid) + "' GROUP BY userid ")
    s = cmd.fetchall()
    print(s)
    row_headers = [x[0] for x in cmd.description]
    json_data = []
    for result in s:
        json_data.append(dict(zip(row_headers, result)))
    print(json_data)
    return jsonify(json_data)

@app.route('/Forgotpassword', methods=['POST'])
def Forgotpassword():
    # con = pymysql.connect(host='localhost', user='root', password='', port=3306, db="automatedpayroll")
    # cmd = con.cursor()

    number = request.form['number']
    # uid = request.form['userid']
    cmd.execute("SELECT login.`Password` FROM employee  JOIN `login` ON `login`.`LoginId`=`employee`.`loginid` WHERE phno='"+number+"'")
    s=cmd.fetchone()
    if s is not None:
        return jsonify({'task': s[0]})
    else:
        return jsonify({'task': "invalid"})


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
