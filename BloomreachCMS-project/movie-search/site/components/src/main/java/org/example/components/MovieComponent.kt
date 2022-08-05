package org.example.components

import com.example.controller.MovieByIdController
import org.example.controller.AddReviewController
import org.hippoecm.hst.component.support.bean.BaseHstComponent
import org.hippoecm.hst.component.support.forms.FormMap
import org.hippoecm.hst.component.support.forms.FormUtils
import org.hippoecm.hst.core.component.HstComponentException
import org.hippoecm.hst.core.component.HstRequest
import org.hippoecm.hst.core.component.HstResponse
import org.slf4j.LoggerFactory


class MovieComponent : BaseHstComponent() {
    @Throws(HstComponentException::class)
    override fun doBeforeRender(request: HstRequest, response: HstResponse) {
        super.doBeforeRender(request, response)
        val ctx = request.requestContext

        val user = ctx.baseURL.getParameter("user")
        val review = ctx.baseURL.getParameter("review")
        val id = ctx.baseURL.getParameter("id")

        if(!user.isNullOrEmpty() && !review.isNullOrEmpty()){
            AddReviewController().add(id, user, review)
        }

        val result = MovieByIdController().searchMovieById(ctx.baseURL.getParameter("id"))

        // Retrieve the document based on the URL
        val document = ctx.contentBean
        if (document != null) {
            // Put the document on the request
            request.setAttribute("movie", result)
            request.setAttribute("document", document)
        }
    }

    companion object {
        val log = LoggerFactory.getLogger(MovieComponent::class.java)
    }
}