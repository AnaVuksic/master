package org.example.beans;

import org.onehippo.cms7.essentials.dashboard.annotations.HippoEssentialsGenerated;
import org.hippoecm.hst.content.beans.Node;
import org.hippoecm.hst.content.beans.standard.HippoHtml;
import org.hippoecm.hst.content.beans.standard.HippoGalleryImageSet;
import org.hippoecm.hst.content.beans.standard.HippoBean;
import org.example.beans.Imageset;

@HippoEssentialsGenerated(internalName = "moviesearch:bannerdocument")
@Node(jcrType = "moviesearch:bannerdocument")
public class Banner extends BaseDocument {
    @HippoEssentialsGenerated(internalName = "moviesearch:title")
    public String getTitle() {
        return getSingleProperty("moviesearch:title");
    }

    @HippoEssentialsGenerated(internalName = "moviesearch:content")
    public HippoHtml getContent() {
        return getHippoHtml("moviesearch:content");
    }

    @HippoEssentialsGenerated(internalName = "moviesearch:link")
    public HippoBean getLink() {
        return getLinkedBean("moviesearch:link", HippoBean.class);
    }

    @HippoEssentialsGenerated(internalName = "moviesearch:image")
    public Imageset getImage() {
        return getLinkedBean("moviesearch:image", Imageset.class);
    }
}
