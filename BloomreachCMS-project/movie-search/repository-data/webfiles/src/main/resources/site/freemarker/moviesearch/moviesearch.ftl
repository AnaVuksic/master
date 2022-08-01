<!doctype html>
<#include "../include/imports.ftl">
<head xmlns="http://www.w3.org/1999/html">

</head>
<div class="container-fluid">
        <#if document??>
            <h3>${document.title?html}</h3>

            <div class="row">
                    <div class="col-md-9">
                        <input type="text" class="form-control" placeholder="Search for...." aria-describedby="button-addon2">
                    </div>
                    <div class="col-md-3">
                        <button class="btn btn-outline-secondary" type="button" id="button-addon2">Search</button>
                    </div>
            </div>

            <#list movies as item>
                <div class="container">
                    <div class="row">
                        <div class="col-md-3">
                            <img src="https://img.freepik.com/premium-vector/clapper-film-movie-icon-design_24877-23150.jpg" class="img-thumbnail" alt="...">
                        </div>
                        <div class="col-md-6">
                            <a href="movie?id=${item.imdb_title_id}"><h3>${item.original_title}</h3></a>
                           <!-- ${item.title}<br/> - ${item.year}<br/> -->
                            ${item.description}
                            <br>
                            <br>
                            <br>
                        </div>
                        <div class="col-md-2">

                        </div>
                    </div>
                </div>

            </#list>
            <div>
                <@hst.html hippohtml=document.content />
            </div>
        <#else>
            <h1>Goodbye? cruel world</h1>
        </#if>

            </div>
<#--
            ${item.imdb_title_id} <br/>
            ${item.title}<br/>
            ${item.original_title}<br/>
            ${item.country}<br/>
            ${item.language}<br/>
            Genre: ${item.genre}<br/>
            ${item.duration}<br/>
            ${item.avg_vote}<br/>
            ${item.votes}<br/>
            ${item.reviews}<br/>
            ${item.actors}<br/>
            ${item.budget}<br/>
            ${item.date_published}<br/>
            ${item.description}<br/>
            ${item.director}<br/>
            ${item.host}<br/>
            ${item.metascore}<br/>
            ${item.production_company}<br/>
            ${item.usa_gross_income}<br/>
            ${item.worlwide_gross_income}<br/>
            ${item.writer}<br/>
            ${item.year}<br/>-->


