# Business Next Scraper [![Build Status](https://travis-ci.org/SOA-Upstart4/Team-HW-1-Ideate-and-Scrape.svg?branch=dev)](https://travis-ci.org/SOA-Upstart4/Team-HW-1-Ideate-and-Scrape)
##Overview
This is a scraper that collects articles and article-related information from the website 
[Business Next](http://www.bnext.com.tw/).

* `show_day_rank` : show the top ranked articles within one day.
* `show_week_rank` : show the top ranked articles within one week.
* `extract_feed_path` : extract paths of each feed in a certain category/page.
* `extract_feed` : extract feed details of a certain feed.

##Repository structure
```
├── README.md
├── init_lib_struct.py
└── robot
    ├── Gemfile
    ├── Gemfile.lock
    ├── lib
    │   ├── ext_class
    │   │   ├── bnext_robot.rb
    │   │   ├── inside_robot.rb
    │   │   ├── mngrtoday_robot.rb
    │   │   └── newslens_robot.rb
    │   ├── int_class
    │   │   ├── feed.rb
    │   │   └── filter_condition.rb
    │   ├── int_module
    │   │   ├── crawl_runner.rb
    │   │   └── feeds_filter.rb
    │   ├── robot_main.rb
    │   └── tool
    │       └── search_feeds.rb
    └── spec
        ├── class_spec
        │   ├── bnext_robot_spec.rb
        │   ├── inside_robot_spec.rb
        │   ├── mngrtoday_robot_spec.rb
        │   └── newslens_robot_spec.rb
        ├── robot_spec.rb
        ├── testfiles
        │   ├── gather_data.rb
        │   └── mainpage
        │       ├── bnext_mainpage.html
        │       ├── inside_mainpage.html
        │       ├── managertoday_mainpage.html
        │       └── thenewslens_mainpage.html
        └── tool_spec
            └── search_feeds_spec.rb

```
##Usage of scraper
###1. Initialize a scrapy robot

```ruby
bot = BNextRobot.new
```

###2. Call the class methods

```ruby 
bot.show_day_rank
# It will return *titles* and the *links* of daily hot news.


bot.show_week_rank
# It will return *titles* and the *links* of weekly hot news.
```

### ※ Sample results of show_day_rank

```
專業，就是用對方聽得懂的話，去告訴他不懂的事情: http://www.bnext.com.tw/article/view/id/37573
Surface名氣愈來愈旺！微軟趁勝追擊推出首款自家筆電Surface Book: http://www.bnext.com.tw/article/view/id/37578
蘋果iPhone在美市佔續增，Android陣營當心: http://www.bnext.com.tw/article/view/id/37581
打入Tesla 生態圈，網路第一代創業家賀元再現江湖 !: http://www.bnext.com.tw/article/view/id/37580
棉花糖系統開放更新！Now on Tap秘密武器正式出關！: http://www.bnext.com.tw/article/view/id/37568
Evernote的啟示：少了這個前提，商業計畫再完美也沒用！: http://www.bnext.com.tw/ext_rss/view/id/985113
賈伯斯去世4年了！為了紀念他，庫克寫了封email給員工: http://www.bnext.com.tw/ext_rss/view/id/988425
你真的知道Retina是什麼嗎？那些蘋果創造出來的技術名詞，你知道多少？: http://www.bnext.com.tw/ext_rss/view/id/985760

```
### ※ Sample results of extract_feed
```
{:title=>"向網路新金融升級！阿里集團螞蟻金服啟動互聯網推進器計畫", :author=>"許文貞", :date=>"2015/10/16", :content=>"\r\n            2014年10月16日才正式從中國阿里巴巴集團獨立出來的「螞蟻金服」，包含阿里巴巴過去知名的支付寶、餘額寶等各項金融業務，在成立滿一週歲的今（16）日，正式公開奠基於阿里雲之上的「螞蟻金融雲」服務及其下30種金融產品。螞蟻金服集團總裁井賢棟表示，「金融雲」所提供的雲端計算能力將成為新的基礎設施。此外，螞蟻金服也於昨日宣布投資中國的創業生態服務平台「36氪」，未來將合作打造中國最大的私募股權投資平台，投資金額外傳為1.5億美金。\n\n\n（圖說：成立滿一週年的螞蟻金服，在今日推出「螞蟻金融雲」的30種金融產品，未來除了自營金融商品，也將提供平台化的金融技術服務。圖片來源：許文貞攝影。）\n\n井賢棟在今日的螞蟻金服分享日活動中表示，中國必須要接受兩個新的經濟趨勢，一是經濟趨緩的新常態，二是「互聯網＋」帶來的力量，讓傳統經濟轉變為新經濟，而新經濟就需要新的金融體系支撐。他指出，在9月宣布啟動的「互聯網推進器」計畫幫助下，未來5年內要讓1000家金融機構向新金融升級。而6月底成立的網商銀行，目前也已經有超過18萬家的小型微型企業成功獲得網商銀行總額超過30億人民幣的融資。\n\n\n  目前互聯網推進器的進展：\n  * 超過200家銀行使用快捷支付，支付成功率超過95％。\n  * 和60多家保險公司推出超過2000款保險服務。\n  * 和90多家基金公司推出超過1600款基金產品。\n  * 有70多家金融機構加入招財寶（螞蟻金服的理財產品），理財金額高達3400億。\n  * 和20多家財產保險公司合作，融資擔保額高達1500億。\n  * 超過38家金融機構和維他命數據平台（大數據分析）合作。\n\n\n今日開放的螞蟻金融雲將提供四種不同層面的服務：\n1.奠基底層架構的IAAS（Infrastructure as a Service），有8項產品；\n2.給開發者使用的開發平台PAAS（Platform as a Service），有17項產品；\n3.以數據計算分析為主的DAAS（Data as a Service），有5項產品；\n4.面向消費者的SAAS（Software as a Service），例如支付寶、餘額寶等商品。\n\n網路帶來從電商到金融的改變\n\n螞蟻金服首席技術架構師胡喜將從阿里巴巴到螞蟻金服至今10多年的業務發展分成三個階段：\n\n第一階段：2005-2007年\n業務範圍主要在網路電子商務和支付，每日交易筆數從幾萬筆大幅增加到幾百萬筆。當時的服務仍然是以IBM、Oracle、EMC等美商公司提供的集中式架構（統稱IOE）加上其他的開源程式。第一階段的產品包含擔保交易、CTU等。\n\n第二階段：2008-2010年\n業務範圍仍然是以網路電商支付為主，每日交易筆數從幾百萬筆增加到幾千萬筆，每日數據處理量也從TB增加到PB（petabyte，等於1024TB）。服務架構在技術平台上仍以IOE和螞蟻金服自行開發的中間軟體為主，數據平台則從RAC轉變為GP。第二階段的產品包含快捷支付、螞蟻小貸等。\n\n第三階段：2010-2014年\n業務範圍已經從電子商務拓展至網路金融，每日交易筆數從幾千萬到幾億筆，每日數據處理量從PB增加到EB（exabyte，等於1024PB）。服務架構在技術平台上已不再依賴IOE，以雲端計算、螞蟻中間軟體、阿里數據庫和大數據，提供ODPS開放數據處理服務。此時期的產品有餘額寶、網商銀行、芝麻信用等。\n\n而從2015年起的第四階段，螞蟻金服將成為提供金融商品，也提供背後分布式金融技術平台服務的公司。螞蟻金服執行長彭蕾也表示，自營和平台不是絕對的非此即彼的關係，不存在球員兼裁判的矛盾。另外，做平台的核心價值，除了保護資訊安全，將用戶價值最大化，更重要的就是將從阿里巴巴到螞蟻金服在電商到金融上累積的經驗和能力，轉為商業價值，向外輸出。\n\n\n（圖說：左為螞蟻金服集團總裁井賢棟，右為螞蟻金服執行長彭蕾。圖片來源：許文貞攝影。）\n\n\n（圖說：螞蟻金服高層一字排開接受媒體提問。圖片來源：許文貞攝影。）\n\n另外，由於阿里巴巴集團主席馬雲所提出，中國會有愈來愈多的中產階級，經濟將轉為內需消費為主的型態，彭蕾認為螞蟻金服不會「為了金融而做金融」，會繼續跟著人的需求而走。過去以小資族作為主要客群提出餘額寶等產品，未來也可能針對愈來愈多的中產階級提出對應的產品，例如做全球化的資產配置。\n\n投資36氪，合力打造中國最大私募股權投資平台\n\n螞蟻金服也在昨日宣布投資中國創業生態服務平台36氪。36氪最早在2010年是科技協作部落格，創辦人劉成誠表示，現在36氪的業務範圍包含融資平台「36氪融資」、「36氪媒體」報導創業相關資訊、位於北京中關村創業大街的「氪空間」等，雖然有融資平台，但過去是讓創業公司在平台上刊登融資資訊，是「網路資訊」而非「網路金融」，目前已服務超過33000家創業公司，有超過4400家公司刊登融資資訊，每天也有超過2000為專業機構投資人到平台上尋找適合投資的公司。\n\n\n（圖說：36氪創辦人劉成誠現身14日的螞蟻金服生態論壇，特別發表獲得螞蟻金服投資。圖片來源：許文貞攝影。）\n\n然而劉成誠指出，若創業公司只依賴機構的募資，募資來源單一，就容易受到股市等環境因素影響，造成融資困難。他也認為，當中國中產階級人數增加，要從中產階級到高資產階級的最好途徑就是透過股權投資。因此決定做網路網路股權類金融平台，轉做網路金融，不只能將資金配置到有前景的行業來投資，也能少量投資，分散風險。\n\r\n        ", :tags=>["阿里巴巴", "支付寶", "36氪", "網路金融", "FinTech", "螞蟻金服", "金融科技"], :imgs=>["https://3.bp.blogspot.com/-XBdLIajQDlU/ViDa_yn77bI/AAAAAAABUwc/o8EZd8oqAz8/s600/IMG_5650.JPG", "https://3.bp.blogspot.com/-oMExH2XI8RM/ViDb0fa9jwI/AAAAAAABUww/J5WlVRvTXGI/s600/IMG_5657.JPG", "https://3.bp.blogspot.com/-CBLEZs23d18/ViDcHiBG0LI/AAAAAAABUxE/sUgpZt_siNE/s600/IMG_5655.JPG", "https://3.bp.blogspot.com/-xUEjAIXg92w/ViDcnwwxJpI/AAAAAAABUxc/BWI8Jki6dL8/s600/IMG_5641.JPG"]}

```

## Test the scraper

```
$ ruby bnext_robot_spec.rb

```


