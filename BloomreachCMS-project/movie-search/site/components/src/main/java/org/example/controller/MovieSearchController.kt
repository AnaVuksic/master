package com.example.controller

import com.example.model.MovieDescription
import org.apache.http.HttpHost
import org.elasticsearch.action.search.SearchRequest
import org.elasticsearch.client.RequestOptions
import org.elasticsearch.client.RestClient
import org.elasticsearch.client.RestHighLevelClient
import org.elasticsearch.index.query.QueryBuilders
import org.elasticsearch.search.builder.SearchSourceBuilder
import org.hippoecm.hst.component.support.bean.BaseHstComponent
import java.io.IOException
import java.time.LocalDate

class MovieSearchController: BaseHstComponent() {

    fun searchMovie(name:String?): List<MovieDescription>{
        val client = RestHighLevelClient(
                RestClient.builder(
                        HttpHost("localhost", 9200, "http"),
                        HttpHost("localhost", 9201, "http")))

        val searchRequest = SearchRequest("test1")
        val searchSourceBuilder = SearchSourceBuilder()
        searchSourceBuilder.size(10)
        //searchSourceBuilder.sort(new FieldSortBuilder("id").order(SortOrder.ASC));
        searchSourceBuilder.query(QueryBuilders.matchQuery("original_title", name+"*").fuzziness(0.8))
        searchRequest.source(searchSourceBuilder)

        val result = mutableListOf<MovieDescription>()

        try {
            val searchResponse = client.search(searchRequest, RequestOptions.DEFAULT)
            val values = searchResponse.hits.hits
            println("ceo response"+searchResponse.hits.hits.size)

            if (values.size > 0) {
                for (s in values) {
                    println(s.sourceAsString)
                    result.add(mapMovie(s.getSourceAsMap()))
                }
            } else {
                println("No results found!")
            }
        } catch (e: IOException) {
            e.printStackTrace()
        }

        client.close()
        return result

    }

    fun mapMovie(sourceAsMap: MutableMap<String, Any>): MovieDescription {
        return MovieDescription(
                document_id = null,
                imdb_title_id = sourceAsMap["imdb_title_id"].toString(),
                title = sourceAsMap["title"].toString(),
                original_title = sourceAsMap["original_title"].toString(),
                country = sourceAsMap["country"].toString(),
                language = sourceAsMap["language"].toString(),
                genre = sourceAsMap["genre"].toString(),
                duration = sourceAsMap["duration"].toString().toIntOrNull(),
                avg_vote = sourceAsMap["avg_vote"].toString().toFloatOrNull(),
                votes = sourceAsMap["votes"].toString().toIntOrNull(),
                reviews = null,
                actors = sourceAsMap["actors"].toString(),
                budget = sourceAsMap["budget"].toString().toLongOrNull(),
                date_published = LocalDate.parse("2003-05-10"),
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

}