package com.example.controller

import com.example.model.Review
import com.example.model.MovieDescription
import org.apache.http.HttpHost
import org.elasticsearch.action.search.SearchRequest
import org.elasticsearch.client.RequestOptions
import org.elasticsearch.client.RestClient
import org.elasticsearch.client.RestHighLevelClient
import org.elasticsearch.index.query.QueryBuilders
import org.elasticsearch.search.SearchHit
import org.elasticsearch.search.builder.SearchSourceBuilder
import org.hippoecm.hst.component.support.bean.BaseHstComponent
import java.io.IOException
import java.time.LocalDate


class MovieByIdController: BaseHstComponent() {

    fun searchMovieById(id:String?): MovieDescription?{
        val client = RestHighLevelClient(
                RestClient.builder(
                        HttpHost("localhost", 9200, "http"),
                        HttpHost("localhost", 9201, "http")))

        val searchRequest = SearchRequest("movies")
        val searchSourceBuilder = SearchSourceBuilder()
        searchSourceBuilder.size(1)
        //searchSourceBuilder.sort(new FieldSortBuilder("id").order(SortOrder.ASC));
        searchSourceBuilder.query(QueryBuilders.matchQuery("imdb_title_id", id+"*"))
        searchRequest.source(searchSourceBuilder)

        val result = mutableListOf<MovieDescription>()

        try {
            val searchResponse = client.search(searchRequest, RequestOptions.DEFAULT)
            val values = searchResponse.hits.hits

            if (values.size > 0) {
                for (s in values) {
                    mapReviews(s)
                    println(s.sourceAsString)
                    result.add(mapMovie(s.getSourceAsMap(), s.id))
                }
            } else {
                println("No results found!")
            }
        } catch (e: IOException) {
            e.printStackTrace()
        }

        client.close()
        return result.firstOrNull()

    }

    fun mapMovie(sourceAsMap: MutableMap<String, Any>, id: String): MovieDescription {

        return MovieDescription(
                document_id = id,
                imdb_title_id = sourceAsMap["imdb_title_id"].toString(),
                title = sourceAsMap["title"].toString(),
                original_title = sourceAsMap["original_title"].toString(),
                country = sourceAsMap["country"].toString(),
                language = sourceAsMap["language"].toString(),
                genre = sourceAsMap["genre"].toString(),
                duration = sourceAsMap["duration"].toString().toIntOrNull(),
                avg_vote = sourceAsMap["avg_vote"].toString().toFloatOrNull(),
                votes = sourceAsMap["votes"].toString().toIntOrNull(),
                reviews = sourceAsMap["review"] as List<Review>?,
                actors = sourceAsMap["actors"].toString(),
                budget = sourceAsMap["budget"].toString().toLongOrNull(),
                date_published = LocalDate.parse(sourceAsMap["date_published"].toString()),
                description = sourceAsMap["description"].toString(),
                director = sourceAsMap["director"].toString(),
                host = sourceAsMap["host"].toString(),
                message = sourceAsMap["message"].toString(),
                metascore = sourceAsMap["metascore"].toString().toIntOrNull(),
                production_company = sourceAsMap["production_company"].toString(),
                usa_gross_income = sourceAsMap["usa_gross_income"].toString().toIntOrNull(),
                worlwide_gross_income = sourceAsMap["worlwide_gross_income"].toString().toIntOrNull(),
                writer = sourceAsMap["writer"].toString(),
                year = sourceAsMap["year"].toString().toIntOrNull()

        )
    }

    private fun mapReviews(m: SearchHit) {
        println("Sourrce as string")
        val users = m.sourceAsMap["review"] as List<Review>?
        println(m.sourceAsMap["review"])
        println("m.sourceAsMap["+ users?.size)
    }

}