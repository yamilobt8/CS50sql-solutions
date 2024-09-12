from cs50 import SQL

db = SQL("sqlite:///dont-panic.db")

new_password = input('enter a new password for the admin: ')

db.execute (
    """
    update users
    set password = ?
    where username = 'admin';
    """,
    new_password
)

print("Admin password has been updated!")
