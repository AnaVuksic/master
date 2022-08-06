package org.example.controller


import com.example.controller.MovieByIdController
import org.apache.http.HttpHost
import org.elasticsearch.client.RequestOptions
import org.elasticsearch.client.RestClient
import org.elasticsearch.client.RestHighLevelClient
import org.elasticsearch.index.query.TermQueryBuilder
import org.elasticsearch.index.reindex.BulkByScrollResponse
import org.elasticsearch.index.reindex.UpdateByQueryRequest
import org.elasticsearch.script.Script
import org.elasticsearch.script.ScriptType
import java.io.IOException
import java.util.*


class AddReviewController {

    fun add(id: String, user: String, review: String) {

        val client = RestHighLevelClient(
                RestClient.builder(
                        HttpHost("localhost", 9200, "http"),
                        HttpHost("localhost", 9201, "http")))

        val updateMap2: MutableMap<String, Any> = HashMap()
        updateMap2["review"] = review
        updateMap2["user"] = user

        val updateByQueryRequest = UpdateByQueryRequest("movies")
        updateByQueryRequest.setConflicts("proceed")

        updateByQueryRequest.setQuery(TermQueryBuilder("imdb_title_id", id))

        val script = Script(ScriptType.INLINE, "painless", "ctx._source.review.add(params)", updateMap2)
        updateByQueryRequest.script = script

        try {
            val bulkResponse: BulkByScrollResponse = client.updateByQuery(updateByQueryRequest, RequestOptions.DEFAULT)
            val totalDocs = bulkResponse.total
            println("updated response id: $totalDocs")
        } catch (e: IOException) {
            e.printStackTrace()
        }


    }

}