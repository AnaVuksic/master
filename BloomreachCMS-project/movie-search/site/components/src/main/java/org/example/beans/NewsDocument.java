package org.example.beans;

import java.util.Calendar;
import org.hippoecm.hst.content.beans.Node;
import org.hippoecm.hst.content.beans.standard.HippoDocument;
import org.hippoecm.hst.content.beans.standard.HippoGalleryImageSet;
import org.hippoecm.hst.content.beans.standard.HippoHtml;
import org.onehippo.cms7.essentials.dashboard.annotations.HippoEssentialsGenerated;
import org.example.beans.Imageset;

@HippoEssentialsGenerated(internalName = "moviesearch:newsdocument")
@Node(jcrType = "moviesearch:newsdocument")
public class NewsDocument extends HippoDocument {
    /** 
     * The document type of the news document.
     */
    public static final String DOCUMENT_TYPE = "moviesearch:newsdocument";
    private static final String TITLE = "moviesearch:title";
    private static final String DATE = "moviesearch:date";
    private static final String INTRODUCTION = "moviesearch:introduction";
    private static final String IMAGE = "moviesearch:image";
    private static final String CONTENT = "moviesearch:content";
    private static final String LOCATION = "moviesearch:location";
    private static final String AUTHOR = "moviesearch:author";
    private static final String SOURCE = "moviesearch:source";

    /** 
     * Get the title of the document.
     * @return the title
     */
    @HippoEssentialsGenerated(internalName = "moviesearch:title")
    public String getTitle() {
        return getSingleProperty(TITLE);
    }

    /** 
     * Get the date of the document.
     * @return the date
     */
    @HippoEssentialsGenerated(internalName = "moviesearch:date")
    public Calendar getDate() {
        return getSingleProperty(DATE);
    }

    /** 
     * Get the introduction of the document.
     * @return the introduction
     */
    @HippoEssentialsGenerated(internalName = "moviesearch:introduction")
    public String getIntroduction() {
        return getSingleProperty(INTRODUCTION);
    }

    /** 
     * Get the main content of the document.
     * @return the content
     */
    @HippoEssentialsGenerated(internalName = "moviesearch:content")
    public HippoHtml getContent() {
        return getHippoHtml(CONTENT);
    }

    /** 
     * Get the location of the document.
     * @return the location
     */
    @HippoEssentialsGenerated(internalName = "moviesearch:location")
    public String getLocation() {
        return getSingleProperty(LOCATION);
    }

    /** 
     * Get the author of the document.
     * @return the author
     */
    @HippoEssentialsGenerated(internalName = "moviesearch:author")
    public String getAuthor() {
        return getSingleProperty(AUTHOR);
    }

    /** 
     * Get the source of the document.
     * @return the source
     */
    @HippoEssentialsGenerated(internalName = "moviesearch:source")
    public String getSource() {
        return getSingleProperty(SOURCE);
    }

    @HippoEssentialsGenerated(internalName = "moviesearch:image")
    public Imageset getImage() {
        return getLinkedBean("moviesearch:image", Imageset.class);
    }
}
