DROP TABLE IF EXISTS cms1_feed;
CREATE TABLE cms1_feed (
	feedID int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	title varchar(255) NOT NULL,
	feedUrl varchar(255) NOT NULL,
	lastCheck int(20),
	languageID int(10),
	categoryID int(10) NOT NULL,
	imageID int(10)
);

-- foreign keys
ALTER TABLE cms1_feed ADD FOREIGN KEY (languageID) REFERENCES wcf1_language (languageID) ON DELETE SET NULL;
ALTER TABLE cms1_feed ADD FOREIGN KEY (categoryID) REFERENCES wcf1_category (categoryID) ON DELETE CASCADE;
ALTER TABLE cms1_feed ADD FOREIGN KEY (imageID) REFERENCES cms1_file (fileID) ON DELETE SET NULL;
