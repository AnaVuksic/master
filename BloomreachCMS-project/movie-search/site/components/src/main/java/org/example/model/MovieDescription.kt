package com.example.model

import com.example.model.Review
import java.time.LocalDate


class MovieDescription(
        val document_id: String?,
        val imdb_title_id: String?,
        val title: String?,
        val original_title: String?,
        val country: String?=null,
        val language: String?=null,
        val genre: String?=null,
        val duration: Int?=null,
        val avg_vote: Float? =null,
        val votes: Int? =null,
        val reviews: List<Review>? = null,
        val actors: String? = null,
        val budget: Long?=null,
        val date_published: LocalDate? = null,
        val description: String? = null,
        val director: String? = null,
        val host: String? = null,
        val message: String? = null,
        val metascore: Int? = null,
        val production_company: String? = null,
        val usa_gross_income: Int? = null,
        val worlwide_gross_income: Int? = null,
        val writer: String? = null,
        val year: Int? = null
)