# How to run the website

1. Download the "Review-website" folder and website.db file onto your device 
2. Download MySQL through [this link](https://dev.mysql.com/downloads/installer/). In the installer, when prompted, choose 'custom setup' and download both the most recent MySQL server version in 'MySQL Servers' and the most recent version of MySQL Workbench in 'Applications
3. Launch MySQL Workbench and click the + sign next to "MySQL Connections" to create a connection
4. Set hostname to localhost, username to root and do not set password* 
5. Click into the connection, opening a query.
6. Click 'file' on the top left, followed by 'Run SQL script'
7. Find the attached sql file, then run it 
8. This website runs on python, so you will need to install the latest version of python
9. Upon installation, make sure to add pip as path
10. Open up the Review-website folder in vscode, and type cd [full path name] in the terminal at the bottom (e.g. cd c:\\Users\\kc610\\Downloads\\Review-website)
11. Then type pip install requirements in that same terminal 





*To reset password, type ALTER USER 'root'@'localhost' IDENTIFIED BY '';  into a query, then clicking the lightning icon to excecute. 




