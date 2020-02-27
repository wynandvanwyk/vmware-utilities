WITH RECURSIVE entity_tree (id, name, folder, level, parent_node_id)
AS (
SELECT id,'' || NAME, '', 0, parent_id
FROM vpx_entity
WHERE parent_id is NULL

UNION ALL

SELECT
	ent.id,
	ent.name,
	tree.folder || '/' || ent.name,
	tree.level + 1,
	tree.id
FROM vpx_entity ent, entity_tree tree
WHERE ent.parent_id = tree.id
)
SELECT h.name AS host,t.NAME AS vm_name,replace(r.name,'Resources','') AS resource_pool, t.folder,v.local_file_name AS vmx_path
FROM entity_tree  t
INNER JOIN vpx_vm v ON v.id = t.id
INNER JOIN vpx_entity r ON  v.resource_group_id = r.id
INNER JOIN vpxv_hosts h ON v.host_id = h.hostid
WHERE v.agent_id = 0