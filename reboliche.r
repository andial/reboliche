rebol [
author: andial
]

if 2 <> length? system/options/args [ print "sintaxis: reboliche msg user" quit ]

do/args http://reb4.me/r/twitter context [
    Consumer-Key: #0fzQ8VaSztpz7waHWXUW1TEQE
    Consumer-Secret: #UDgQpxJLjuHv2fpnCHhv6Tn8zh3kHNr49Jb3BxbGZu26mtUl5H
    User-Store: %./TwitterUsers.r
]

twitter/as second system/options/args

menciones: load %mentions.txt

msg: first system/options/args

foreach m menciones [ tuit: replace copy msg "$" join "@" m twitter/update tuit ]
