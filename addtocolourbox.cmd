@echo off 
:: This script only works when you are logged in as a user.
:: It is a solution to add a list of colourbox images to a collection without having to search and click every single image by hand. Colourbox don't offer a solution.
::
:: You need to find your sessionID and CartID information and replace the information in the script.
:: You get the collectionID after creating a new collection.
::
:: A parameter is needed in order to work. A comma-seperated CSV-File. First column picture ID
:: 
set sessionID=bd7i7qk4g7vbtk3e1htvvs43jm
set cartID=61a4ce55e2b99
set collectionID=2001275

IF [%1]==[] GOTO NoFileSelected

echo Add to collection on colourbox.de...

for /f "usebackq tokens=1-2 delims=," %%a in (%1) do (
      curl "https://www.colourbox.com/account/collections-api/add-media" -X POST -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:94.0) Gecko/20100101 Firefox/94.0" -H "Accept: application/json, text/javascript, */*; q=0.01" -H "Accept-Language: de,en-US;q=0.7,en;q=0.3" -H "Referer: https://www.colourbox.com/image/tea-cup-beverage-image-1057845" -H "Content-Type: application/x-www-form-urlencoded; charset=UTF-8" -H "X-Requested-With: XMLHttpRequest" -H "Origin: https://www.colourbox.com" -H "DNT: 1" -H "Connection: keep-alive" -H "Cookie: __CBX_UI_FONT_LOADER_ACTIVE__=true; PHPSESSID="%sessionID%"; language=en; __CBX_CART_ID__="%sessionID%"; plan_preselected=notSelected; cookie_consent_necessary=1; __CBX_CMS_SEARCH_RESULT_THUMBNAIL_VIEW_SIZE__=medium; __stripe_mid=3bb89315-02e5-4ecc-9da4-7d054bc58e42975df3; __stripe_sid=9a53de58-30b6-4b0d-b6f7-eb36b9f7ec5239a6ed" -H "Sec-Fetch-Dest: empty" -H "Sec-Fetch-Mode: cors" -H "Sec-Fetch-Site: same-origin" -H "Sec-GPC: 1" -H "TE: trailers" --data-raw "media_id="%%a"&collection_id="%collectionID%"&search=&csrf=46159e46cec1f013759f463e778ae42e"
      )
goto:eof

:NoFileSelected
echo Error: CSV-File as parameter needed. I.e. addtoclourbox colourbox.csv
