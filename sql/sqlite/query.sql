-- name: GetProviders :many
SELECT * FROM providers ORDER BY id;

-- name: AddProvider :one
INSERT INTO providers (type, url) VALUES (?, ?) RETURNING *;

-- name: GetLLMs :many
SELECT * FROM llms ORDER BY id;

-- name: AddLLM :one
INSERT INTO llms (string, name, provider_id, context_size) VALUES (?, ?, ?, ?) RETURNING *;

-- name: GetUserByID :one
SELECT * FROM users WHERE id = ? LIMIT 1;

-- name: GetUserByEmail :one
SELECT * FROM users WHERE email = ? LIMIT 1;

-- name: GetConversationByID :one
SELECT * FROM conversations WHERE id = ? LIMIT 1;

-- name: GetConversationByUUID :one
SELECT * FROM conversations WHERE uuid = ? LIMIT 1;

-- name: GetConversationsByUserID :many
SELECT * FROM conversations WHERE user_id = ? ORDER BY created_at;

-- name: AddConversation :one
INSERT INTO conversations (user_id, uuid) VALUES (?, ?) RETURNING *;

-- name: UpdateConversationTitle :exec
UPDATE conversations set title = ?, updated_at = unixepoch('now') WHERE uuid = ?;
