# Create resource
curl -X PUT http://localhost:8983/fedora/rest/dev/obj1

# Give it a title
curl -X PATCH -H "Content-type: application/sparql-update" --data-binary\
 "insert data { <> <http://purl.org/dc/elements/1.1/title> 'title 1' }"\
  http://localhost:8983/fedora/rest/dev/obj1

# call it ver1
curl -X POST -H "Slug: ver1" http://localhost:8983/fedora/rest/dev/obj1/fcr:versions

# change the title
curl -X PATCH -H "Content-type: application/sparql-update" --data-binary\
 "insert data { <> <http://purl.org/dc/elements/1.1/title> 'title 2' }"\
  http://localhost:8983/fedora/rest/dev/obj1

# call it ver2
curl -X POST -H "Slug: ver2" http://localhost:8983/fedora/rest/dev/obj1/fcr:versions

# restore ver1
curl -X PATCH http://localhost:8080/rest/obj1/fcr:versions/ver1

# call it ver3
curl -X POST -H "Slug: ver3" http://localhost:8983/fedora/rest/dev/obj1/fcr:versions
