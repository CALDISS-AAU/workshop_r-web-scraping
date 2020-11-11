library(dplyr)
library(httr)
library(rvest)

# Loading raw html (the "verbose" )
request <- GET("https://www.imdb.com/")
status_code(request)

imdb_content <- content(request, as = "text")

# Scraping "Breach" IMDb page
breach_html <- read_html("https://www.imdb.com/title/tt9820556/?ref_=tt_mv_close") #read_html combines GET() and content() and returns an html object

breach_title <- html_nodes(breach_html, "h1") # Extract the h1 tag (containing the title)
title_text <- html_text(breach_title, trim = TRUE) # Extracts the texual content of the tag (the title itself)

html_attrs(breach_title) # Extracting attributes from the tag

# Getting year link (the "2020" link in the movie title linking to other movies released in 2020)
year_link <- html_nodes(breach_title, "a")
year_link <- html_attr(year_link, "href")
year_link <- paste0("https://www.imdb.com", year_link)

# Getting year link - Using dplyr
year_link <- breach_title %>%
  html_nodes("a") %>%
  html_attr("href")
year_link


# Exercise 2
coming_html <- read_html("https://www.imdb.com/movies-coming-soon/?ref_=nv_mv_cs")
first_title <- html_nodes(coming_html, "h4")
title_text <- html_text(first_title, trim = TRUE)


# Director for Breach using CSS selector
breach_director <- html_nodes(breach_html, "div.credit_summary_item h4.inline:contains(Director) + a") %>%
  html_text()


# Exercise 5: Top of cast list
top_cast <- html_nodes(breach_html, "tr td[class != primary_photo] a")
cast_members <- html_text(top_cast, trim = TRUE) # This returns all cast members listed on the page
cast_members[1] # Prints the first value of the vector


# Exercise 6: Scraping upcoming movies (titles, directors, stars)
movie_nodes <- html_nodes(coming_html, "td.overview-top")

titles <- movie_nodes %>%
  html_nodes("h4 a") %>%
  html_text(trim = TRUE)

directors <- movie_nodes %>%
  html_nodes("div.txt-block h5.inline:contains(Director) + span") %>%
  html_text(trim = TRUE)

stars <- list()

for (i in 1:length(movie_nodes)){
  movie_stars <- movie_nodes[i] %>%
    html_nodes("div.txt-block h5.inline:contains(Stars) ~ a") %>%
    html_text(trim = TRUE)
  stars[[i]] <- movie_stars
}

# Combine to a data frame
upcoming_df <- data.frame(titles, directors)
upcoming_df$stars <- stars

