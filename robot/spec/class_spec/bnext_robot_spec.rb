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

first_feed = {
  "title"=>"管中閔談數位時代的政策形成：「自己的國家自己救，自己的政策自己修」",
  "author"=>"James Huang",
  "date"=>"2015/10/18",
  "tags"=>["TEDxTAIPEI", "管中閔", "群眾智慧", "政府公開資料", "TEDxTAIPEI Big Bang", "vTaiwan", "資訊公開"],
  "link"=>"http://www.bnext.com.tw/article/view/id/37693",
  "content"=>"\r
            TED X Taipei 2015 今日上午展開第二天的議程：「群」。「群」從談數位時代的公民教育作為開場，談人的選擇如何驅動了社會、談網路如何翻轉媒體、談群眾參與的力量將如何驅動社會價值觀，但可能也如何有限。



下台後在臉書上遠比在台上時活躍，也擁有巨大網民人氣，人稱管爺的前經建會、改制後的國發會主委管中閔首先詢問觀眾，許多文章談蔣經國，回憶那個時代的美好，但我們最該問問為什麼今天沒有尹仲容、李國鼎、孫運璿？

尹仲容曾經掌管二戰後的台灣經濟，但已經過世超過 50 年，李國鼎、孫運璿在政府財經、科技相關工作都超過 8 年以上，分別帶領台灣經濟成長與經濟轉型，重要政策曾經包含有成立加工出口區、產業的二次替代與成立科學園區發展半導體產業等形成台灣今日產業面貌的重要經濟決策。管中閔觀察，過去人民因為資訊傳播速度與品質有限，社會非常仰賴菁英的決策，政府政策有賴高層菁英的策略思考來推動，因此政策的推動通常由行政機關的高層告訴你要怎麼做來決定，進一步推往立法機關，並透過公聽會、工會、公會代表、立法院委員會的參與來宣導與溝通。



但網際網路所帶來的資訊開放與效率，可能打破了這種政策決策形成過程，「家父長式的政策決議」已經無法說服一般人民。管中閔以自己任內推動，最後宣告失敗的「自由經濟示範區」政策為例，說明政府目前政策決策形成過程的巨大困境。政府目前多數的政策決策方式，還是依賴行政部門高層的思考，發給行政部門的基層或周遭的智庫組織形成政策建議，透過傳統媒體與電子媒體的訪問或說明、立法院的委員會、公聽會、工會、產業公會、地方政府的說明會等等來增加民眾的參與與溝通。但根據管中閔自己參加這樣的溝通過程，發現這樣的過程時間成本高昂，但效果卻很容易不彰。這些不彰的過程，其實正是經濟學裡典型的「資訊斷裂」、「資訊壟斷」與「代理人問題」。


(圖說：傳統政策決策過程的問題，管中閔提供)

管中閔觀察共享經濟中創新模式的特點，發現網際網路平台所帶來的資訊公開、分享而不壟斷的群眾外包，其媒合效率可能可以比以往驚人，透過網際網路的效力，資訊公開與群眾智慧來形成政府政策的決策模式比以往都更加有機會。管中閔以同在現場，並目前還正在台灣行政部門內閣裡的蔡玉玲政務委員，其所推動群眾參與政策形成過程的 vTaiwan平台為例，發現透過網路讓群眾參與政策討論，溝通效率與效果可能遠比以往菁英政策決策模式的效果還好。透過網路平台開放政策討論，首先讓行政部門在政策形成的過程有機會直接快速的與立法部門溝通，包含行政部門、立法部門、人民與智庫都可以作為政策的提案者，也都同時可以作為政策決策所需要的資料提供者，這樣的過程有助於政策決策時的利益相關人直接溝通並互相理解，也可以加快傳統家父長式菁英政策決策過程的不足。


(圖說：透過個人的政治實踐，發現政策形成過程溝通效率的不足，管中閔提供)

管中閔分享，在 2014 年 3 月，當立法院衝進許多學生，最後演變成學運的同時，他其實非常深刻在反省，行政部門裡面包含他自己有這麼多好人，這麼努力地想要讓國家讓社會更好，為什麼我們做的事情會被指責到那麼不堪。當他看到「自己的國家自己救」還包含有 fxxx goverment 的這句標語時他非常震驚，後來自由貿易區法案的推動過程，他實踐了自己的假設，花了許多時間上媒體宣傳、同時參加公聽會、立法院委員會、產業公會說明會等等，最後推論也許不只是政策形成的「溝通不夠」而已，可能還有政策形成的「群眾參與」之不足。


(圖說：vTaiwan 平台目前的討論首頁，數位時代翻攝)

管中閔最後回答主持人許毓仁對於演講的前一天，國民黨剛針對 2016 總統大選提名「柱下朱上」的決定，他表示他很認真在思考明年總統大選是否要去投票，目前也還沒有明白的答案，


  但他對於未來政治的思考，已經從「自己的國家自己救」，推往公民社會透過網路直接群眾參與，更進一步的「自己的政策自己修」。


管中閔相信，這樣大家才能一起讓國家與社會更好。


(圖說：透過網路平台資訊公開與群眾智慧，有機會增加政策形成溝通的媒合效率。管中閔提供)
\r
        ",
  "imgs"=>["https://3.bp.blogspot.com/-UZcqMQoahf4/ViNhwPcsLmI/AAAAAAABVGA/tI6Ow_MfMIw/s600/2015-10-18+11.21.32.jpg", "https://3.bp.blogspot.com/-6UCC-xoSxwg/ViNkbahpmZI/AAAAAAABVGY/_g1epWBn3-M/s600/2015-10-18+11.21.35.jpg", "https://3.bp.blogspot.com/-S2GsRv23HeQ/ViNnaF0WQJI/AAAAAAABVHY/X6ZR-EyOiTE/s600/%25E8%259E%25A2%25E5%25B9%2595%25E6%2588%25AA%25E5%259C%2596+2015-10-18+17.28.08.png", "https://3.bp.blogspot.com/-nsgyXfU02U0/ViNopfEvxBI/AAAAAAABVIE/zf8eXkxrc80/s600/%25E8%259E%25A2%25E5%25B9%2595%25E6%2588%25AA%25E5%259C%2596+2015-10-18+17.37.59.png", "https://3.bp.blogspot.com/-UjCZPIDQyEU/ViNnAjk9oRI/AAAAAAABVHE/1boW7YmJh38/s600/%25E8%259E%25A2%25E5%25B9%2595%25E6%2588%25AA%25E5%259C%2596+2015-10-18+17.22.27.png", "https://3.bp.blogspot.com/-gNv9kCtyHlQ/ViNn3Q8kpCI/AAAAAAABVHs/3DOzuDCeR2o/s600/%25E8%259E%25A2%25E5%25B9%2595%25E6%2588%25AA%25E5%259C%2596+2015-10-18+17.32.34.png"]
}
VCR.configure do |config|
    config.cassette_library_dir = './spec/testfiles/vcr_cassettes'
    config.hook_into :webmock
end

bnext_robot = nil

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
  bnext_tech = bnext_robot.get_feeds("tech", 1)

  describe "Get correct list of each category" do

    it 'get right number of feeds' do
      bnext_tech.size.must_equal 20
    end

    it 'get right feed' do
      bnext_tech[0].to_hash.must_equal first_feed
    end
  end
end
