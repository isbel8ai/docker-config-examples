##### Web configuration - HTTP only
#Set($WebDomain, 'localhost');

#$WebPort
# If we're running as a superuser, run on port 80. Otherwise, pick a high port for this user.
# 443 is default port for https protocol.
Set($WebPort, '8280');

#Set($WebBaseURL, 'http://localhost:8280');  

#$DatabaseType
# Database driver being used; case matters. Valid types are "mysql", "Oracle", and "Pg". "SQLite" is also available for non-production use.
Set($DatabaseType, 'Pg');

#$DatabaseHost, $DatabaseRTHost
# The domain name of your database server. If you're running MySQL and on localhost, leave it blank for enhanced performance.
# DatabaseRTHost is the fully-qualified hostname of your RT server, for use in granting ACL rights on MySQL.
Set($DatabaseHost, 'postgres');

#$DatabasePort
# The port that your database server is running on. Ignored unless it's a positive integer. It's usually safe to leave this blank; RT will choose the correct default.
Set($DatabasePort, '5432');

#$DatabaseUser
# The name of the user to connect to the database as.
Set($DatabaseUser, 'rtuser');

#$DatabasePassword
# The password the $DatabaseUser should use to access the database.
Set($DatabasePassword, 'rtpass');

#$DatabaseName
# The name of the RT database on your database server. For Oracle, the SID and database objects are created in $DatabaseUser's schema.
Set($DatabaseName, 'requesttracker');

