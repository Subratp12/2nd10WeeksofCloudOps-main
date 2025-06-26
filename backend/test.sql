-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS test;

-- Use the test database
USE test;

-- Create the books table if it doesn't exist
CREATE TABLE IF NOT EXISTS books (
  id INT(11) NOT NULL AUTO_INCREMENT,
  title VARCHAR(300) NOT NULL,
  description VARCHAR(500) NOT NULL,
  price FLOAT NOT NULL,
  cover VARCHAR(500) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Insert sample books only if they don't already exist
INSERT INTO books (id, title, description, price, cover) VALUES
(1, 'MultiCloud', 'this is multicloud with devops course by Veera sir NareshIT', 2343.2, 'https://docs.multy.dev/assets/images/multi-cloud-314609adeec670988dff0882a93fdcb0.png'),
(2, 'DevOps', 'if you understand the devops it is very easy', 2342.3, 'https://media.licdn.com/dms/image/v2/D5612AQHsA9dJVtZRdw/article-cover_image-shrink_720_1280/article-cover_image-shrink_720_1280/0/1730826289071?e=2147483647&v=beta&t=JGr0gJH6RE9b1Dk7nHAYF14Kmv96Gm519UOy_rSa3xE')
ON DUPLICATE KEY UPDATE
  title = VALUES(title),
  description = VALUES(description),
  price = VALUES(price),
  cover = VALUES(cover);

-- Set the password and privileges for the 'cloud' user
ALTER USER 'cloud'@'%' IDENTIFIED WITH mysql_native_password BY 'Devops123';
FLUSH PRIVILEGES;
