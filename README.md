# IceBreak-Performance
Applications and test scripts for performance test



IceBreak is a powerful Web application server that provides a highly reliable, manageable, and scalable Web application infrastructure for the IBM i™. IceBreak runs natively on IBM i™ in the ILE environment - NOT using Apache, WebSphere, node.js or any other moving parts.

This repo is about testing some of the performance scenarios    

# Install IceBreak
First you need the IceBreak server for RPG / ILE. You can download the latest stable community edition from the official site:

https://www.system-method.com/en/download-icebreakce

Or you can find the bleeding edge versions here:

http://webfiles.system-method.com/download/IceBreak/?C=M;O=D


You need FTP open on your IBM and the install script runs only from Windows.

# Install the performance scenarios 


Before you can clone this git repo - you first need to have git on your IBM i:

1) Open ACS and click on "Tools"
2) Click on "Open Source Package Management"
3) Open the "Available packages" tab
4) Click "git" and "Install"

You need to ensure that the ssh daemon is running on your IBM i. So from a IBM i menu prompt start the SSH daemon:

```
===> STRTCPSVR *SSHD
```

Now back to your ACS:

1) Click SSH Terminal in ACS ( or use your default terminal like putty) 

(or you can use call qp2term – but I suggest that you get use to ssh)

2) From the terminal. You can also install git with yum from the command line if you don't like the above:  
```
ssh MY_IBM_I
PATH=/QOpenSys/pkgs/bin:$PATH
yum install git
```
And now in the same ssh session - clone the performance scenarios repo 
```
cd /www
git -c http.sslVerify=false clone https://github.com/NielsLiisberg/IceBreak-Performance.git
```
As you can see - you have to adjust your path to use yum, git and other opens source tooling  

Go back to a 5250 prompt
```
GO ICEBREAK 
CALL QCMD
ADDICESVR SVRID(ICEPERF) TEXT('IceBreak Performance') 
    SVRPORT(60080) HTTPPATH('/www/icebreak-performance') 
    WWWDFTDOC('default.html') DISPTHRMTH(*SHAREDPOOL)         
STRICESVR ICEPERF
WRKICESBS 
```
You will see the performance scenarios server running in the IceBreak subsystem. Now we need to compile some of the performance scenarios ( still in the 5250 with ICEBREAK on the library list):

```
RUNSQLSTM SRCSTMF('/www/IceBreak-Performance/sql/perflog.sql') COMMIT(*NONE)                                      
CRTICEPGM STMF('/www/icebreak-performance/services/perform02.rpgle') SVRID(ICEPERF)
CRTICEPGM STMF('/www/icebreak-performance/services/sleep.rpgle') SVRID(ICEPERF)
```

# Run the first scenario
Now it is time to test the sample:

1) Open your browser
2) In the URL type [http://MY_IBM_I:60080](http://MY_IBM_I:60080)  Where MY_IBM_I is the TCP/IP address or name of your IBM i. Or even add the name MY_IBM_I to your ```hosts``` file on your PC 
[Edit host file](https://www.howtogeek.com/howto/27350/beginner-geek-how-to-edit-your-hosts-file/)


# Using VSCode as you IDE
The Sitemule team has made a cool plugin for VSCode so you can edit and compile RPG code.

In your browser open, download and install VSCode 

https://code.visualstudio.com/download


When you open VSCode then:

Open "Extensions" and search for "RPG".
Click on "RPG for IBM i" and you have installed what you need.

If you now map a network drive to the /www/icebreak-performance folder and "drag" that into the VSCode editor - it will open it as workspace (a project) and now the IceBreak compiler is available.

When you click and open a file with RPGLE or SQLRPGLE extension then you can press "Shift-Cmd-B" for build. Or find the build task in the menu.


The "router" program is always called if the URL begins with "router". It is a regex set in the webconfig.xml. The router parses the URL, parse the input JSON and call the required service. Finally the router serializes the object graph into JSON for the HTTP client.

Take a look at "webconfig.xml" and "perform02.rpgle" - they carry the whole secret!



Have fun - and keep me posted :)




