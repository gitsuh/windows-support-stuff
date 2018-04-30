When domain trust is lost it can be reestablished using the proper credentials and the 


Test-ComputerSecureChannel -repair -credential (get-credential)

----

netdom.exe resetpwd /s:<server> /ud:<user> /pd:*
<server> = a domain controller in the joined domain
<user> = DOMAIN\User format with rights to change the computer password
