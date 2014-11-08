DROP TABLE IF EXISTS cms1_feed;
CREATE TABLE cms1_feed (
	feedID INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(255) NOT NULL,
	feedUrl VARCHAR(255) NOT NULL,
	lastCheck INT(20),
	languageID INT(10),
	categoryID INT(10) NOT NULL,
	imageID INT (10) NOT NULL DEFAULT 0
);

-- foreign keys
ALTER TABLE cms1_feed ADD FOREIGN KEY (languageID) REFERENCES wcf1_language (languageID) ON DELETE SET NULL;
ALTER TABLE cms1_feed ADD FOREIGN KEY (categoryID) REFERENCES wcf1_category (categoryID) ON DELETE CASCADE;
