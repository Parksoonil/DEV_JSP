CREATE TABLE board (
    board_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    content TEXT,
    writer VARCHAR(50) NOT NULL,
    reg_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    filename VARCHAR(200),
    filesize INT,
    downloads INT DEFAULT 0
); 