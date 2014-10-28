curl -X DELETE "http://localhost:8983/fedora/rest/dev"
curl -X DELETE "http://localhost:8983/fedora/rest/dev/fcr:tombstone"
curl -X POST "http://localhost:8983/fedora/rest" -H "Slug: dev"