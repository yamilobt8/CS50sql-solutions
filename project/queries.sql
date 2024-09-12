-- users table
INSERT INTO users (first_name, last_name, birth_date, address, phone_number, email, password, join_date)
VALUES
('John', 'Doe', '1985-02-15', '123 Elm Street, Springfield', '555-1234', 'john.doe@example.com', 'hashedpassword1', '2024-01-01'),
('Jane', 'Smith', '1990-06-23', '456 Oak Avenue, Springfield', '555-5678', 'jane.smith@example.com', 'hashedpassword2', '2024-01-02'),
('Emily', 'Johnson', '1987-11-30', '789 Pine Road, Springfield', '555-8765', 'emily.johnson@example.com', 'hashedpassword3', '2024-01-03');

-- accounts table
INSERT INTO accounts (user_id, type, balance, date_opened)
VALUES
(1, 'Checking', 1500.00, '2024-01-01'),
(1, 'Savings', 3000.00, '2024-01-01'),
(2, 'Checking', 1200.00, '2024-01-02'),
(3, 'Savings', 2500.00, '2024-01-03');

-- transactions table
INSERT INTO transactions (from_account_id, to_account_id, type, amount, transfer_date)
VALUES
(1, 3, 'Transfer', 200.00, '2024-01-10'),
(2, 1, 'Transfer', 100.00, '2024-01-15'),
(3, 2, 'Transfer', 50.00, '2024-01-20');

-- cards table
INSERT INTO cards (user_id, account_id, number, type, expiration_date, card_limit)
VALUES
(1, 1, '1234-5678-9012-3456', 'Visa', '2026-12-31', 5000.00),
(1, 2, '2345-6789-0123-4567', 'MasterCard', '2025-11-30', 3000.00),
(2, 3, '3456-7890-1234-5678', 'Amex', '2024-09-30', 4000.00),
(3, 4, '4567-8901-2345-6789', 'Discover', '2026-06-30', '3500.00');

-- user_logs table
-- for this one i created a trigger that automatically do the job for you
