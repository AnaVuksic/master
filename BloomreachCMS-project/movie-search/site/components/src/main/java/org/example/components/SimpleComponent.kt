package org.example.components

import com.example.controller.MovieSearchController
import com.example.model.MovieDescription
import org.apache.http.HttpHost
import org.elasticsearch.action.search.SearchRequest
import org.elasticsearch.client.RequestOptions
import org.elasticsearch.client.RestClient
import org.elasticsearch.client.RestHighLevelClient
import org.elasticsearch.index.query.QueryBuilders
import org.elasticsearch.search.builder.SearchSourceBuilder
import org.hippoecm.hst.component.support.bean.BaseHstComponent
import org.hippoecm.hst.core.component.HstComponentException
import org.hippoecm.hst.core.component.HstRequest
import org.hippoecm.hst.core.component.HstResponse
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Autowired
import java.io.IOException

class SimpleComponent: BaseHstComponent() {

    @Throws(HstComponentException::class)
    override fun doBeforeRender(request: HstRequest, response: HstResponse) {
        super.doBeforeRender(request, response)
        val ctx = request.requestContext

        val result = MovieSearchController().searchMovie(ctx.baseURL.getParameter("name"))

        // Retrieve the document based on the URL
        val document = ctx.contentBean
        println("document"+document)
        if (document != null) {
            // Put the document on the request
            request.setAttribute("document", document)
            request.setAttribute("movies", result)
        }
    }


    companion object {
        val log = LoggerFactory.getLogger(SimpleComponent::class.java)
    }
}