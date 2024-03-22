UPDATE bp SET
	alias=cat.alias,
	bp.MasterCategory=cat.MasterName,
FROM businessproperties bp
INNER JOIN dbcategories cat ON bp.tier=cat.tier