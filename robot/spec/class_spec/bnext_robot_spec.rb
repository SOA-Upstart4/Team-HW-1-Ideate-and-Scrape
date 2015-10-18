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
  bnext_tech = BNextRobot.new.get_feeds("tech", 1)
  describe "Get correct list of each category" do

    it 'get right number of feeds' do
      bnext_tech.size.must_equal 20
    end

  end
end
