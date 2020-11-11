# Content: Web Scraping with R



- What is web scraping?
  - Why web scraping?
  - Types of web scraping
    - "Raw"
    - Crawlers
    - Spiders
    - API-based
- A note on the legality of web scraping
- How the internet and browsers work (lightning fast edition)
- The internet through R (`httr` `GET()`, `rvest`/`xml2` `read_html()`)
- A quick introduction to HTML
  - Tags
  - Attributes
    - id, class, href
  - Tree-like structure - siblings and children
- Simple extraction using `rvest`
  - `html_nodes()`
  - `html_name()`
  - `html_text()`
  - `html_attr()`
- Complex extraction using `rvest` and CSS selectors
  - `html_nodes()`
  - Siblings, children, attribute (starts with, ends with, wildcards), class, id
  - contains(text)
  - https://flukeout.github.io/
- Other tools:
  - `Rcrawler`: https://github.com/salimk/Rcrawler





**Packages used:**

- `rvest`: https://rvest.tidyverse.org/
- `dplyr`: https://dplyr.tidyverse.org/
- `httr`: https://httr.r-lib.org/





