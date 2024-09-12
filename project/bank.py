from cs50 import SQL
from datetime import datetime
import bcrypt
import subprocess
import webbrowser
from tabulate import tabulate

#connect to database
db = SQL("sqlite:///bank.db")

print("-----welcome to our bank system-----")

def print_menu():
    print("Welcome to our bank system")
    print("1. Sign In")
    print("2. Log In")

def main():
    while True:
        print_menu()
        choice = input("Enter your choice (1 or 2): ")

        if choice == '1':
            sign_in()
        elif choice == '2':
            if log_in():
                logged_in_menu()
                break #Exit loop
        else:
            print("Invalid choice. Please enter 1 or 2.")

def sign_in():
    print("-----Sign In-----")
    # Collect user input for new user registration
    first_name = input("Enter first name: ")
    last_name = input("Enter last name: ")
    birth_date = input("Enter birth date (YYYY-MM-DD): ")
    address = input("Enter address: ")
    phone_number = input("Enter phone number: ")
    email = input("Enter email: ")
    weak_password = input("Enter password: ")
    password = bcrypt.hashpw(weak_password.encode('utf-8'), bcrypt.gensalt())
    join_date = datetime.now().strftime('%Y-%m-%d')
    # Insert data into the database
    db.execute('''
               insert into users(first_name, last_name, birth_date, address, phone_number, email, password, join_date)
               values(?, ?, ?, ?, ?, ?, ?, ?)
               ''', first_name, last_name, birth_date, address, phone_number, email, password, join_date
               )
    print("User created successfully!")

def log_in():
    print("Log In")
    email = input("Enter your email: ")
    password = input("Enter your password: ")

    # Fetch user from database
    user = db.execute('''
        select * from users where email = ?
    ''', email)

    if user:
        # Assuming the user table has only one matching row
        stored_hashed_password = user[0]['password']
        if bcrypt.checkpw(password.encode('utf-8'), stored_hashed_password):
            print(f"Login successful! You logged in as {user[0]['first_name']} {user[0]['last_name']}.")
            return True
        else:
            print("Invalid choice. Please enter 1 or 2.")
            return False
    else:
        print("Invalid email or password.")
        return False


def logged_in_menu():
    # Stay in the logged-in state until the user chooses to log out
    while True:
        print("\nWhat would you like to do?")
        print("1. Open SQLite shell (sqlite3 bank.db)")
        print("2. Go to SQL tutorial")
        print("3. View account details")
        print("4. Log out")

        action = input("Enter your choice: ")

        if action == '1':
            # Run the sqlite3 command to open the SQLite shell with the database
            subprocess.run(["sqlite3", "bank.db"])
        elif action == '2':
            # Open the SQL tutorial in the default web browser
            webbrowser.open("https://www.w3schools.com/sql/")
        elif action == '3':
            # Fetch and display user information based on email
            email = input("Enter your email to view account details: ")
            user_info = db.execute('''
                SELECT id, first_name, last_name, address, phone_number, join_date FROM users WHERE email = ?
            ''', email)

            if user_info:
                # Prepare data for tabulate
                headers = user_info[0].keys()
                rows = [user_info[0].values()]
                print("Account Details:")
                print(tabulate(rows, headers=headers, tablefmt="grid"))
            else:
                print("No user found with that email.")
        elif action == '4':
            print("Logging out...")
            break  # Exit the logged-in state
        else:
            print("Invalid choice. Please enter 1 or 2.")


if __name__ == "__main__":
    main()