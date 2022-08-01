<#include "../include/imports.ftl">
<div class="body-wrapper">
  <div class="container">
    <div class="row">
      <#if document??>
        <@hst.link var="link" hippobean=document/>
        <div class="col-md-9 col-sm-9 has-edit-button">
          <@hst.manageContent hippobean=document />
          <h2>${document.title?html}</h2>
          <p>${document.introduction?html}</p>
          <@hst.html hippohtml=document.content/>
        </div>
      <#elseif editMode>
        <div class="has-edit-button">
          <img src="<@hst.link path="/images/essentials/catalog-component-icons/simple-content.png" />"> Click to edit Simple Content
          <@hst.manageContent templateQuery="new-content-document" rootPath="content"/>
        </div>
      </#if>
    </div>
  </div>
</div>
<#-- @ftlvariable name="document" type="org.example.beans.ContentDocument"
<#if document??>
  <article class="has-edit-button">
    <@hst.manageContent hippobean=document />
    <h3>${document.title?html}</h3>
    <#if document.publicationDate??>
      <p>
        <@fmt.formatDate value=document.publicationDate.time type="both" dateStyle="medium" timeStyle="short"/>
      </p>
    </#if>
    <#if document.introduction??>
      <p>
      ${document.introduction?html}
      </p>
    </#if>
    <@hst.html hippohtml=document.content/>
  </article>-->
<#-- @ftlvariable name="editMode" type="java.lang.Boolean"
<#elseif editMode>
  <div class="has-edit-button">
    <img src="<@hst.link path="/images/essentials/catalog-component-icons/simple-content.svg" />"> Click to edit Simple Content
    <@hst.manageContent documentTemplateQuery="new-content-document" parameterName="document" rootPath="content"/>
  </div>
</#if>-->