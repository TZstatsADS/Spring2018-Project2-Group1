
shinyUI(

  div(id="canvas",
      
  navbarPage(strong("Fire & Rescue NYC",style="color: white;"), theme = "styles.css",
 
  # 1.INTRO TAB
  tabPanel("Intro",
    mainPanel(width=12,
      h1(strong("Project: Open Data NYC - an RShiny app development project"),
         style = "color:white; "),
      br(),
      br(),
      p(strong("Do you know on average each year there are 134 millions fire incidents happening in the New York, sixty three hundred firefighter's injuries and death recorded, with direct property damages over 14 billions?",
               style = "color:white; font-size:16pt"),
      br(),
      br(),
      p(strong("Indeed, fire loss is devastating!"),
        style = "color:white; font-size:16pt"),
      br(),
      br(),
      p(strong("In this project, we have developed an App using R Shiny to visualize NYC fire incident data. This App can not only help the government and FDNY to have better policy-makings, provide useful information for insurance companies to design more profitable quotes regarding the property insurance and guide the residents to get access to those fire incidents in NYC.",
               style = "color:white; font-size:16pt")))
      )
  ),

  # 2.Map  
  tabPanel("Map",
           sidebarPanel(
             checkboxGroupInput("enable_marker4", "Add Markers for: ",
                                choices = c("Fire Station" = 1,
                                            "Incidents" = 2),
                                selected = 2),
             checkboxGroupInput("Borough_selected2", "Select Borough: ",
                                choices = c( "BRONX"=1,
                                             "BROOKLYN"=2,
                                             "MANHATTAN"=3,
                                             "QUEENS"=4,
                                             "RICHMOND"=5),
                                selected = 1:4),
             
             dateRangeInput('dateRange',
                            label = 'Date range input: yyyy-mm-dd',
                            start = '2013-01-01', end = '2016-12-31',
                            width = '300px'
             ),
             
             checkboxGroupInput("Class_selected3", "Select incident type: ",
                                choices = c( "School Fire"=1,
                                             "Store Fire"=2,
                                             "Hospital Fire"=3,
                                             "Private Dwelling Fire"=4,
                                             "Automobile Fire"=5,
                                             "Other Commercial Building Fire"= 6),
                                selected = 1:6)
             
           ),
           mainPanel(leafletOutput("map4", width = "100%", height = "800px"))
           
  ),
  
   # 3.STAT TAB
   tabPanel("Statistics",
      wellPanel(style = "overflow-y:scroll; height: 850px; max-height: 750px; background-color: #ffffff;",
      tabsetPanel(type="tabs", 
                  tabPanel(title="Fire Incident Types",
                           style = "background-color: #ffffff;",
                           img(src="cooledited.gif", width = "900px")
                  ),
                  tabPanel(title="Facilities in Each Borough",
                           style = "background-color: #ffffff;",
                           includeHTML("./data/Facilities_in_Each_Borough.html")                            
                           ),
                  tabPanel(title="Alarm Sources",
                           style = "background-color: #ffffff;",
                           includeHTML("./data/Alarm_sources.html")
                  ),
                  tabPanel(title="Incidents in Each Borough",
                           style = "background-color: #ffffff;",
                           includeHTML("./data/Incidents_in_Each_Borough-copy.html")
                  ),
                  tabPanel(title="Fire House Response Time",
                           style = "background-color: #ffffff;",
                           img(src="response time.jpeg")
                  
                  )
                  )
  ))
  

           
  )
   
))
