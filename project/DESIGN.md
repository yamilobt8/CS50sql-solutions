# Design Document

By YOUR NAME HERE: Khalid Azaanoun

Video overview: <https://youtu.be/YmcN8SberAc>

## Scope

* What is the purpose of your database?
    * Manage financial accounts and transactions.
* Which people, places, things, etc. are you including in the scope of your database?
    * Users, accounts, transactions, cards, logs.
* Which people, places, things, etc. are *outside* the scope of your database?
    * External financial systems, global currencies.

## Functional Requirements

* What should a user be able to do with your database?
    * Manage accounts, transactions, and cards.
* What's beyond the scope of what a user should be able to do with your database?
    * Modify database schema, external integrations.

## Representation

### Entities

* Which entities will you choose to represent in your database?
    * Users, accounts, transactions, cards, logs.
* What attributes will those entities have?
    * Users: ID, first name, last name, birth date, address, phone number, email, password, join date.
    * Accounts: ID, user ID, type, balance, date opened.
    * Transactions: ID, from account ID, to account ID, type, amount, transfer date.
    * Cards: ID, user ID, account ID, number, type, expiration date, card limit.
    * Logs: ID, user ID, old password, new password, IP address, log date.
* Why did you choose the types you did?
    * Text for names, addresses, and passwords for flexibility.
    * Date for dates to handle date operations.
    * Real for amounts and balances for precision.
    * Integer for IDs for uniqueness and indexing.
* Why did you choose the constraints you did?
    * Primary Key ensures unique identification.
    * Foreign Key maintains referential integrity.
    * Unique prevents duplicate entries.
    * Not Null ensures essential data presence.

### Relationships

* Users and Accounts:

    * One-to-Many: One user can have multiple accounts.
    * Key: user_id in accounts references id in users.

* Accounts and Transactions:

    * One-to-Many: One account can be involved in multiple transactions (both as sender and receiver).
    * Keys: from_account_id and to_account_id in transactions reference id in accounts.

* Users and Cards:

    * One-to-Many: One user can have multiple cards.
    * Key: user_id in cards references id in users.

* Accounts and Cards:

    * One-to-Many: One account can be linked to multiple cards.
    * Key: account_id in cards references id in accounts.

* Users and Users Logs:

    * One-to-Many: One user can have multiple password change logs.
    * Key: user_id in users_logs references id in users.


## Optimizations

* Which optimizations (e.g., indexes, views) did you create? Why?

    * View accounts_transfers:
        * Description: Shows account details and transaction history.
        * Reason: To provide a consolidated view of transactions involving accounts, simplifying data retrieval and analysis.
    * Trigger for users_logs:
        * Description: Logs password changes in the users_logs table.
        * Reason: To maintain a history of password changes for security and auditing purposes.

## Limitations

* What are the limitations of your design?
* What might your database not be able to represent very well?

1. **Scalability Concerns:**
   - **Large Data Volumes:** Handling high volumes of transactions or user data might impact performance without further optimization.

2. **Complex Queries:**
   - **Complex Joins:** Multiple joins in queries could become inefficient as the database grows, affecting performance.

3. **Data Redundancy:**
   - **Limited Normalization:** Potential for redundancy if the design does not fully normalize data or if future requirements necessitate additional fields.

4. **Limited Historical Data:**
   - **Historical Tracking:** The current schema does not include extensive historical tracking or versioning of data beyond password changes.

5. **User-Specific Customization:**
   - **Custom Features:** The design does not account for user-specific customization or preferences beyond basic user details and transactions.
