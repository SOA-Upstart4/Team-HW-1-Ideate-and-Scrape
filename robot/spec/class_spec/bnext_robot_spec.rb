require 'minitest/autorun'
require 'vcr'
require 'webmock/minitest'
require 'yaml'
require_relative '../../lib/ext_class/bnext_robot'

day_rank = [
  "郭台銘投資製造的雲馬X1被爆抄很大，雲造科技回應：並無專利侵權行為: http://www.bnext.com.tw/article/view/id/37685",
  "各位低持股的老闆皮緊一點！狼來了-談矽品案: http://www.bnext.com.tw/article/view/id/37666",
  "Facebook開暗門，透過背景重新整理功能榨乾iPhone電力: http://www.bnext.com.tw/article/view/id/37684",
  "高招！矽品提收購無效之訴，訴訟若拖2~3年不利日月光: http://www.bnext.com.tw/article/view/id/37672",
  "台灣首次大型VR娛樂應用登場！中華職棒總冠軍賽，Lamigo桃猿熱鬧開打！: http://www.bnext.com.tw/article/view/id/37683",
  "Gogoro創辦人陸學森：過去20年來，我學會的10件事。: http://www.bnext.com.tw/article/view/id/37688",
  "被雷軍及郭台銘都看好的智慧電動車雲馬X1！90後創業家玩出新設計: http://www.bnext.com.tw/article/view/id/37663",
  "台積電版 iPhone 秒殺三星版？別急，來看看這個測試: http://www.bnext.com.tw/ext_rss/view/id/1010354"
]

week_rank = [
  "台積電勝三星？iPhone 6s 的 A9處理器事件總整理: http://www.bnext.com.tw/ext_rss/view/id/996449",
  "Excel記帳雲端進化！Google表單比記帳App還好用: http://www.bnext.com.tw/ext_rss/view/id/955360",
  "一台iPhone 6s竟有16種版本？性能有差異，消費者只能認了？: http://www.bnext.com.tw/ext_rss/view/id/1002363",
  "傳華碩不滿？微軟自製筆電買氣旺、OEM廠或遭消滅？: http://www.bnext.com.tw/article/view/id/37652",
  "蘋果穩居冠軍、Facebook強勢增長、Paypal首度進榜！解讀2015全球百大品牌: http://www.bnext.com.tw/article/view/id/37607",
  "圖解行動支付兩大模式，你的錢未來這樣用！: http://www.bnext.com.tw/article/view/id/37609",
  "韓流退燒？LG：韓企全球地位動搖、市佔全面敗退: http://www.bnext.com.tw/article/view/id/37624",
  "消費者眼球都在哪？世界即時通訊及社群媒體使用情形分析: http://www.bnext.com.tw/article/view/id/37667"
]

tech_listfeed = [
  "/article/view/id/37672",
  "/article/view/id/37664",
  "/article/view/id/37663",
  "/article/view/id/37666",
  "/article/view/id/37662",
  "/article/view/id/37660",
  "/article/view/id/37661",
  "/article/view/id/37659",
  "/article/view/id/37652",
  "/article/view/id/37649",
  "/article/view/id/37635",
  "/article/view/id/37637",
  "/article/view/id/37634",
  "/article/view/id/37633",
  "/article/view/id/37631",
  "/article/view/id/37630",
  "/article/view/id/37629",
  "/article/view/id/37612",
  "/article/view/id/37624",
  "/article/view/id/37604"
]

bnext_feed_details = {
  "title"=>"高招！矽品提收購無效之訴，訴訟若拖2~3年不利日月光",
  "author"=>"撰文者：MoneyDJ",
  "date"=>"發表日期：2015/10/16",
  "content"=>
  "\r\n            矽品精密15日上午在臨時股東會沒通過引進鴻海成為結盟股東的議案，矽品才敗下陣來；晚間突公告已於今日上午同步在高雄地方法院確認日月光請求於股東名簿登載為矽品股東的請求權不存在，即向法院請求日月光公開收購無效。熟悉法條的台灣科技業法務主管表示，矽品此舉為高招，因法院接受該案後，雙方在司法訴訟上你來我往、至少耗費2~3年時間，屆時整個半導體環境都已轉變，日月光也會失去尋求併購矽品的最佳時機。\n\n\n\n矽品臨時股東會中，兩個議案都未獲得股東過半同意，「鴻矽戀」確定破局；日月光今日上午才「風光」在股權爭奪案中確定第一大股東身份，才高興不到半天，馬上面臨收購無效的訴訟，明天日月光股價可能會有反壓。\n\n（一）矽品提收購無效之訴，以拖待變：\n\n竹科的法務主管指出，相對日月光之前提出的「假處分」阻止或延後臨時股東會的召開。矽品此次提收購無效訴訟案，比日月光更為高招。\n\n假處分只是法院的「程序」，法院的決定時間很短，而收購無效訴訟為實質興訟，通常這一類民事案件一走就是2年起跳，可能還會拖個3年時間。\n\n提起訴訟，可以替矽品爭取到2~3年的時間，讓矽品可以找到更多的「白衣騎士」等外援，改變股權結構的反擊手段將會更為完善。\n\n（二）矽品提收購無效之訴，能伺機再結盟鴻海：\n\n矽品目前最主要盟友是鴻海精密。提起該訴訟之後，「鴻矽戀」將可以以不同型態再續前緣。\n\n只要雙方有默契，矽品可以讓鴻海以更高的價格「公開收購」其他75%的部份股權，還是有機會讓「白衣騎士」的鴻海取得更多的股權來牽制日月光。\n\n（三）矽品、日月光已進入訴訟階段，整併的可能性已低：\n\n券商分析師則認為，從今日矽品臨時股東會員工的抗議，還有矽品董事長林文伯的發言「會堅持到底、繼續抗爭下去。」到今日晚間公告將走到法律訴訟的「魚死網破」態度。\n\n國內分析師斷言，矽品經營層完全無心與日月光整併，未來時間一拖長，整個紅色供應鏈與台廠互動關係、還有美、日、歐等半導體競爭環境已轉變了，日月光是否還有時間等待完成收購矽品，都充滿了不確定因素。\n\n日月光也回應，待收到法院正式函文，再予回應。\n\n文章出處：MoneyDJ 財經知識庫\n\r\n        ",
  "tags"=>["鴻海", "購併", "矽品", "日月光"]
}

VCR.configure do |config|
    config.cassette_library_dir = '../testfiles/vcr_cassettes'
    config.hook_into :webmock
end

VCR.use_cassette('bnext_mainpage') do
  bnext_robot = BNextRobot.new

  describe "Get correct day rank articles" do

    it 'has the right number of daily articles' do
      bnext_robot.day_rank_feeds.size.must_equal day_rank.size
    end

    it 'has the right content' do
      content = bnext_robot.day_rank_feeds.map { |feed| "#{feed.title.force_encoding("utf-8")}: #{feed.link.force_encoding("utf-8")}" }
      content.must_equal day_rank
    end
  end

  describe "Get correct week rank articles" do

    it 'has the right number of daily articles' do
      bnext_robot.week_rank_feeds.size.must_equal week_rank.size
    end

    it 'has the right content' do
      content = bnext_robot.week_rank_feeds.map { |feed| "#{feed.title.force_encoding("utf-8")}: #{feed.link.force_encoding("utf-8")}" }
      content.must_equal week_rank
    end
  end
end

VCR.use_cassette('bnext_techpage') do
  bnext_robot = BNextRobot.new.get_feeds("tech", 1)
  describe "Get correct list of each category" do

    it 'get right number of feeds' do
      bnext_robot.size.must_equal 20
    end
  end
end
