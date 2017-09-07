library(httr)
library(httpuv)
library(jsonlite)

oauth_endpoints("github")

myapp <- oauth_app("github",
  key = "your_key",
  secret = "your_secret")

github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)

json1 = content(req)
json2 = jsonlite::fromJSON(toJSON(json1))

json2[json2$html_url == "https://github.com/jtleek/datasharing",]$created_at
