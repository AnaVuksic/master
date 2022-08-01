<#assign hst=JspTaglibs["http://www.hippoecm.org/jsp/hst/core"] >
<body>
<div id="site-content">
    <main class="main-content">
        <div class="container">
            <div class="page">
                <#if document??>
                    <h1>${document.title?html}</h1>
                    <div>
                        <@hst.html hippohtml=document.content />
                    </div>
                <#else>
                    <h1>Goodbye? cruel world</h1>
                </#if>

                <div class="breadcrumbs">
                    <a href="index.html">Home</a> >
                    <#if movie.original_title?has_content>
                    <span>${movie.original_title}</span>
                        <#else >
                        d
                    </#if>
                </div>

                <div class="content">
                    <div class="row">
                        <div class="col-md-6">
                            <figure class="movie-poster"><img style="height: 300px" src="https://icon-library.com/images/icon-for-movie/icon-for-movie-0.jpg" alt="#"></figure>
                        </div>
                        <div class="col-md-6">
                            <#if movie.title?has_content>
                                <h2 class="movie-title"> ${movie.original_title} ( ${movie.title} )<br/></h2>
                            </#if>

                            <div class="movie-summary" style="margin-bottom: 20px">
                                <#if movie.description?has_content>
                                ${movie.description} <br>
                                </#if>
                            </div>
                            <ul class="movie-meta">
                                <#if movie.avg_vote?has_content><li><strong>Rating:</strong><strong >${movie.avg_vote}</strong> out of 10, voted:  ${movie.votes}</li> </#if>
                                <#if movie.duration?has_content><li><strong>Length:</strong> ${movie.duration} min</li> </#if>
                                <#if movie.date_published?has_content><li><strong>Premiere:</strong> ${movie.date_published} </li> </#if>
                                <#if movie.genre?has_content><li><strong>Category:</strong> ${movie.genre}</li> </#if>
                            </ul>

                            <ul class="starring">
                                <#if movie.director?has_content><li><strong>Director/s:</strong> ${movie.director}</li></#if>
                                <#if movie.writer?has_content><li><strong>Writers:</strong> ${movie.writer}</li></#if>
                                <#if movie.production_company?has_content><li><strong>Production company:</strong>  ${movie.production_company}</li></#if>

                                <#if movie.actors?has_content><li><strong>Stars:</strong> ${movie.actors} </li></#if>

                                <#if movie.country?has_content><li><strong>Country:</strong> ${movie.country} </li></#if>
                                <#if movie.language?has_content><li><strong>Language:</strong> ${movie.language} </li></#if>

                                <#if movie.budget?has_content><li><strong>budget:</strong>${movie.budget}  </li></#if>
                                <#if movie.metascore?has_content><li><strong>metascore:</strong>${movie.metascore} </li></#if>
                                <#if movie.year?has_content><li><strong>year:</strong> ${movie.year} </li></#if>
                            </ul>
                        </div>
                    </div> <!-- .row -->
                    <div class="entry-content">
                        You can find more on this <a href="https://www.imdb.com/title/${movie.imdb_title_id}/">link</a>.dd
                        <#if movie.reviews?has_content>
                        <h2>Current number of reviews is ${movie.reviews?size}</h2>
                        <#list movie.reviews as item>


                        <#if item.user?length != 0 >  <h3> User: ${item.user} </h3></#if>
                        <#if item.review?length != 0 >  <h4> Review:  ${item.review}</h4></#if> <br/>
                        </#list>
                        </#if>
                        <!--<form action="movie?id=${movie.imdb_title_id}" method="post">
                            <fieldset>
                                <label for="comment">Leave a comment</label>
                                <input id="user" type="text" name="user" placeholder="User name...">

                                <textarea name="review" cols="20" rows="5" id="review"></textarea>
                                <input name="submit" type="submit" value="Submit Review!">
                            </fieldset>
                        </form>-->
                        ${movie.imdb_title_id}${item.imdb_title_id}
                        <form autocomplete="off" action="movie?id=${movie.imdb_title_id}" target="_self">
                            <div class="autocomplete" style="width:auto;">
                                <input id="id" type="text" name="id" hidden value="${movie.imdb_title_id}" placeholder="Search movie...">

                                <input id="user" type="text" name="user" placeholder="Username...">
                                <textarea id="review" type="text" name="review" placeholder="Write a review..."></textarea>
                            </div>
                            <input type="submit" value="Submit review!">
                        </form>

                        <div id="previewbox"></div>
                    </div>
                </div>
            </div>
        </div> <!-- .container -->
    </main>
</div>
</body>