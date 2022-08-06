# Web application for movie search and exchange of movie reviews

This web application is developed as a part of master thesis. It will showcase interaction between Bloomreach experience manager and Elasticsearch.
Users will be able to search movies, read news and leave reviews on movie page. On the other side we will have authors that will be able to create and maintain news on the website using Bloomreach CMS.

How to run this web application:

Prerequests:

- Maven 3+
- Java 8+

For data part of the project we also need to have Elasticsearch, Logstash and Kibana(optional) on our machine.

Links for downloading this applications:

- Elasticsearch: https://www.elastic.co/downloads/elasticsearch
- Logstash: https://www.elastic.co/downloads/logstash
- Kibana: https://www.elastic.co/downloads/kibana

Importing the data:

1. Download and unzip Elasticsearch
2. Open command line in Elasticsearch folder
3. Run Elasticsearch (./bin/elasticsearch)
4. Download and unzip Logstash
5. Open command line in Logstash folder
6. Put logstash-movies.conf file in Logstash's config folder
7. Change path in logstash-movies.conf to match where IMDBmovies.csv is
8. Run Logstash with (bin/logstash -f config/logstash-movies.conf)
9. (optional) Download and run Kibana

Now we should have all of our data in database.

Steps for running our web application are:
1. Position command line in BloomreachCMS-project
2. mvn clean verify
3. mvn -Pcargo.run -Drepo.path=./storage

Now we should be able to access all parts of our application:

- CMS: http://localhost:8080/cms/
- Console: http://localhost:8080/cms/console
- Essentials: http://localhost:8080/essentials/
- Repository: http://localhost:8080/cms/repository
- Website: http://localhost:8080/site/
- Kibana: http://localhost:5601/
