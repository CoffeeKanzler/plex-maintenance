DELETE FROM media_streams WHERE id IN (SELECT media_streams.id FROM media_streams LEFT JOIN media_items ON (media_streams.media_item_id = media_items.id) WHERE media_items.id IS NULL OR deleted_at IS NOT NULL);

DELETE FROM media_items WHERE deleted_at IS NOT NULL;

UPDATE metadata_items SET deleted_at = NULL WHERE deleted_at IS NOT NULL;

DELETE FROM media_items WHERE id IN (SELECT media_items.id FROM media_items LEFT JOIN media_parts ON (media_items.id = media_parts.media_item_id) WHERE media_parts.media_item_id IS NULL);
