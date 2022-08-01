<#include "../include/imports.ftl">

<#-- @ftlvariable name="menu" type="org.hippoecm.hst.core.sitemenu.HstSiteMenu" -->
<#-- @ftlvariable name="editMode" type="java.lang.Boolean"-->

<#--<nav>
    <ul class="navigation" id="main-navigation">
        <li><a href="index.html" class="activelink"><span class="label-nav">Home</span> </a></li>
        <li><a href="news.html"><span class="label-nav">News</span></a></li>
        <li><a href="blogs.html"><span class="label-nav">Blogs</span></a></li>
        <li><a href="events.html"><span class="label-nav">Events</span></a></li>
        <li><a href="products.html"><span class="label-nav">Products</span></a></li>
        <li><a href="about.html"><span class="label-nav">About</span></a></li>
    </ul>
</nav>-->

<#include "../include/imports.ftl">
<#if menu??>
    <#if menu.siteMenuItems??>
        <nav>
            <ul class="navigation" id="main-navigation">
                <#list menu.siteMenuItems as item>
                    <#if item.selected || item.expanded>
                        <li><a href="<@hst.link link=item.hstLink/>" class="activelink"><span class="label-nav">${item.name?html}</span> </a></li>
                    <#else>
                        <li><a href="<@hst.link link=item.hstLink/>"><span class="label-nav">${item.name?html}</span></a></li>
                    </#if>
                </#list>
            </ul>
        </nav>
    </#if>
    <@hst.cmseditmenu menu=menu/>
<#else>
    <#if editMode>
        <h5>[Menu Component]</h5>
        <sub>Click to edit Menu</sub>
    </#if>
</#if>

<#--
<#if menu??>
<div class="has-edit-button">
  <#if menu.siteMenuItems??>
    <ul class="nav nav-pills">
      <#list menu.siteMenuItems as item>
        <#if !item.hstLink?? && !item.externalLink??>
          <#if item.selected || item.expanded>
            <li class="active"><div style="padding: 10px 15px;">${item.name?html}</div></li>
          <#else>
            <li><div style="padding: 10px 15px;">${item.name?html}</div></li>
          </#if>
        <#else>
          <#if item.hstLink??>
            <#assign href><@hst.link link=item.hstLink/></#assign>
          <#elseif item.externalLink??>
            <#assign href>${item.externalLink?replace("\"", "")}</#assign>
          </#if>
          <#if  item.selected || item.expanded>
            <li class="active"><a href="${href}">${item.name?html}</a></li>
          <#else>
            <li><a href="${href}">${item.name?html}</a></li>
          </#if>
        </#if>
      </#list>
    </ul>
  </#if>
  <@hst.cmseditmenu menu=menu/>
</div>
</#if>-->