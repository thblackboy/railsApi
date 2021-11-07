# README

<h2>POST Method </h2>
<h3>POST /urls/</h3> 
(example post .../urls/
data { "urls":  { "link": "google.com" } })
<br>
Method will return short_link for posted link <br>
(example { short_link:"kgskt" }) <br>
<h2>GET Methods</h2>
<h3>GET /urls/short_link </h3>
(example get .../urls/kgskt )
<br>
Method will return original link and riseup click_count by  1<br>
({ link:"google.com" }) 
<h3>GET /urls/short_link/stats</h3>
(example get .../urls/kgskt/stats )
<br>
Method will return hom many times users have used short_link
<br>
({click_count:5} )
<br>

<h3>POST data was init as raw JSON</h3>
For manual tests I have used postman.co
For auto tests I have used Rspec


