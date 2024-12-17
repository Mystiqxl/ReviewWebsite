# How to run the website

1. Download the "Review-website" folder and website.db file onto your device 
2. Download MySQL through [this link](https://dev.mysql.com/downloads/installer/). In the installer, when prompted, choose 'custom setup' and download both the most recent MySQL server version in 'MySQL Servers' and the most recent version of MySQL Workbench in 'Applications
3. Launch MySQL Workbench and click the + sign next to "MySQL Connections" to create a connection
4. Set hostname to localhost, username to root and do not set password* 
5. Click into the connection, opening a query.
6. Click 'server' on the top menu, followed by 'Data Import'
7. Select "Import from Self-Contained file", then attach the file, and import (in the "import progress" tab)
8. This website runs on python, so you will need to install the latest version of python
  


Run the PWA app in Visual studio code with a virtual environment (to not worry about dependencies) 
To activate the virtual environment, insert .venv\Scripts\activate 

If it does not work: 
- try download the dependencies manually (as per requirements.txt) with pip install 
- do cd [exact path] to enter cmds directly into that path




*To reset password, type ALTER USER 'root'@'localhost' IDENTIFIED BY '';  into a query, then clicking the lightning icon to excecute. 




