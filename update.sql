ALTER TABLE cms1_feed CHANGE imageID imageID INT(10) NULL DEFAULT NULL;
UPDATE cms1_feed SET imageID = NULL WHERE imageID = 0;

ALTER TABLE cms1_feed ADD FOREIGN KEY (imageID) REFERENCES cms1_file (fileID) ON DELETE SET NULL;
