<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  
  <xsl:output method="html" omit-xml-declaration="no" />

  <xsl:template match="resume">
    <html>
      <head>
        <xsl:comment>Note: generated from XML/XSL source documents</xsl:comment>
        <title>Harlan T Wood's Resume</title>
        <style type="text/css">
          
          <!-- note for programmer types: the css is inside the xsl so it gets embedded in the generated html
               so that the whole resume can be sent as an email attachment if desired. -->
               
          <xsl:comment>

            body
            {
              font-family: Verdana, Arial, Helvetica, sans-serif;
              margin: 3em;
            }
            
            body, body table tr td div
            {
              font-size: 75%;
            }            
            
            h2 
            {
              font-size: 1.5em;
              font-weight: bold;
              text-transform: uppercase;
              padding-top: .2em;
              padding-bottom: .2em;
              border-top: 2px dotted #AAAAAA;
              border-bottom: 2px dotted #AAAAAA;
              margin-top: 2em;
              margin-bottom: .75em;
            }
        
            h3 
            {
              font-size: 1em;
              font-weight: bold;
              margin-top: 0em;
              margin-bottom: .3em;
            }
        
            ul
            {
              margin-top: 0em;
              margin-bottom: 1em;
            }
            
            li
            {
              margin-bottom: .5em;
            }
            
            td.name
            {
              font-size: 1.5em;
              font-weight: bold;
            }
            
            div.email, div.phone, div.location, div.availability
            {
              margin-bottom: .3em;
            }
            
            div.phone
            {
              font-weight: bold;
            }
            
            a
            {
              color: darkblue;
              text-decoration: underline;
            }
            
            div.job
            {
              margin-top: 1em;
              margin-bottom: 1em;
            }
            
            div.jobDetails
            {
              /* font-size: 1.2em; */
              font-weight: bold;
              padding: .15em;
              border: 1px solid #AAAAAA;
              margin-bottom: .5em;
            }
            
            span.role
            {
              font-weight: bold;
            }
            
            span.company
            {
            }
            
            div.jobSummary
            {
              font-style: italic;              
              margin-left: 0em;
              margin-bottom: .5em;
            }
            
            div.task
            {
              margin-left: 0em;
              margin-bottom: .5em;
            }
            
            span.trainingType
            {
              font-weight: bold;
            }
            
            div.testimonialText
            {
            }
            
            div.testimonialByLine
            {
              margin-top: .25em;
              margin-left: 2em;
              margin-bottom: 2em;
              /* font-style: italic; */
            }
            
            span.attention
            {
              font-weight: bold;
            }

            .new
            {
              color: #B00;
            }
          </xsl:comment>
        </style>
      </head>
      <body>
        <xsl:apply-templates select="contact" />
        <xsl:apply-templates select="section|technologies" />
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="contact">
    <table width="100%"  border="0">
      <tr> 
        <td valign="top" class="name"><xsl:value-of select="@name" /></td>
        <td align="right"> 
          <!-- <div class="phone"><xsl:value-of select="@phone" /></div> -->
          <div class="email"><a class="email" href="mailto:{@email}"><xsl:value-of select="@email" /></a></div>
          <!-- <div class="availability">Available: <xsl:value-of select="@availability" /></div> -->
          <div class="location"><xsl:value-of select="@location" /></div>
        </td>
      </tr>
    </table>
  </xsl:template>
  
  <xsl:template match="section">
    <a name="{@name}" />
    <h2><xsl:apply-templates select="@name" /></h2>
    <xsl:apply-templates select="*" />
  </xsl:template>
  
  <xsl:template match="subsection">
    <h3><xsl:apply-templates select="@name" /></h3>
    <xsl:apply-templates select="*" />
  </xsl:template>
  
  <xsl:template match="technologies">
    <h2><xsl:value-of select="@name" /></h2>
    <xsl:apply-templates select="level" />
  </xsl:template>
  
  <xsl:template match="level">
    <p><b><xsl:value-of select="@name" /></b> in<xsl:text> </xsl:text><xsl:apply-templates select="technology" /></p>
  </xsl:template>
  
  <xsl:template match="technology">
    <xsl:value-of select="node()" /><xsl:if test="following-sibling::technology"><xsl:text>, </xsl:text></xsl:if>
  </xsl:template>
  
  <xsl:template match="level/points">
    <xsl:apply-templates select="level/points/point" />
    <xsl:if test="following-sibling::page">&#160;&#160;|&#160;&#160;</xsl:if>
  </xsl:template>
  
  <xsl:template match="text">
    <p><xsl:apply-templates /></p>
  </xsl:template>
  
  <xsl:template match="link">
    <a href="{@href}"><small><xsl:value-of select="node()" /></small></a>
  </xsl:template>
  
  <xsl:template match="points">
    <ul>
      <xsl:apply-templates select="point" />    
    </ul>
  </xsl:template>
  
  <xsl:template match="point">
    <li>
      <xsl:apply-templates />
    </li>
  </xsl:template>
  
  <xsl:template match="em">
    <b><xsl:apply-templates /></b>
  </xsl:template>
  
  <xsl:template match="strong">
    <i><xsl:apply-templates /></i>
  </xsl:template>
  
  <!--xsl:template match="added">
    <! - - todo - check for latest date, only color those "new" - - >
    <div class="new"><xsl:apply-templates /> &#160; <i>[new]</i></div>
  </xsl:template-->
  
  <xsl:template match="job">
    <div class="{name()}">
      <div class="jobDetails">
        <xsl:apply-templates select="title" /> &#8212;
        <xsl:apply-templates select="company" /> &#8212;
        <xsl:apply-templates select="location" /> &#8212;
        <xsl:apply-templates select="startDate" /> to <xsl:apply-templates select="endDate" />
      </div>
      <xsl:apply-templates select="points" />
    </div>
  </xsl:template>
  
  <xsl:template match="title">
		<xsl:call-template name="spanClassEqualsTag" />
  </xsl:template>
  
  <xsl:template match="company">
		<xsl:call-template name="spanClassEqualsTag" />
  </xsl:template>
  
  <xsl:template match="location">
		<xsl:call-template name="spanClassEqualsTag" />
  </xsl:template>
  
  <xsl:template match="startDate">
		<xsl:call-template name="spanClassEqualsTag" />
  </xsl:template>
  
  <xsl:template match="endDate">
		<xsl:call-template name="spanClassEqualsTag" />
  </xsl:template>
  
  <xsl:template match="role">
    <xsl:apply-templates />    
  </xsl:template>
  
  <xsl:template match="task">
    <div class="{name()}">
      <xsl:apply-templates select="taskSummary" />: 
      <xsl:apply-templates select="taskText" />&#160;<xsl:apply-templates select="taskExample" />
    </div>
  </xsl:template>
  
  <xsl:template match="trainingType">
    <span class="{name()}"><xsl:value-of select="." /> - </span>
  </xsl:template>
  
  <xsl:template match="trainingDetails">
    <xsl:call-template name="spanClassEqualsTag" />
  </xsl:template>
  
  <xsl:template match="taskExample">
    <small>[<a href="javascript:void(0)" onclick="javascript:window.open('{@url}','Example_From_Resume_HKW','toolbar=1,location=1,directories=0,status=0,1enubar=0,1crollbars=1,resizable=1,width={@width},height={@height}');"><xsl:apply-templates select="@linkText" /></a>]</small>
  </xsl:template>
  
  <xsl:template match="testimonial">
    <xsl:apply-templates select="testimonialText" />
    <div class="testimonialByLine">
      - 
      <xsl:apply-templates select="clientName" />, 
      <xsl:apply-templates select="clientTitle" />, 
      <xsl:apply-templates select="company" />  
      &#160;
      <xsl:apply-templates select="link" />  
    </div>
  </xsl:template>

  <xsl:template match="testimonialText">
    <div class="{name()}"><xsl:apply-templates select="*" /></div>
  </xsl:template>
  
  <xsl:template match="attention">
    <xsl:call-template name="spanClassEqualsTag" />
  </xsl:template>
  
  <!-- Utility templates -->
  
  <xsl:template name="spanClassEqualsTag">
    <span class="{name()}"><xsl:apply-templates /></span>
  </xsl:template>

  <xsl:template name="divClassEqualsTag">
    <div class="{name()}"><xsl:apply-templates /></div>
  </xsl:template>

</xsl:stylesheet>
