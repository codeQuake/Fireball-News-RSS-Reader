<?php
namespace cms\data\feed;
use wcf\data\DatabaseObject;
use wcf\system\WCF;

/**
 * @author	Jens Krumsieck
 * @copyright	2014 codeQuake
 * @license	GNU Lesser General Public License <http://www.gnu.org/licenses/lgpl-3.0.txt>
 * @package	de.codequake.cms.news.rss
 */
class Feed extends DatabaseObject {

	protected static $databaseTableName = 'feed';

	protected static $databaseTableIndexName = 'feedID';

	public function __construct($id, $row = null, $object = null) {
		if ($id !== null) {
			$sql = "SELECT *
                    FROM " . static::getDatabaseTableName() . "
                    WHERE (" . static::getDatabaseTableIndexName() . " = ?)";
			$statement = WCF::getDB()->prepareStatement($sql);
			$statement->execute(array(
				$id
			));
			$row = $statement->fetchArray();
			
			if ($row === false) $row = array();
		}
		
		parent::__construct(null, $row, $object);
	}
}
