require 'minitest/autorun'
require 'vcr'
require 'webmock/minitest'
require 'yaml'
require_relative '../../lib/ext_class/bnext_robot'

day_rank = [
    "台積電勝三星？iPhone 6s 的 A9處理器事件總整理: http://www.bnext.com.tw/ext_rss/view/id/996449",
    "一台iPhone 6s竟有16種版本？性能有差異，消費者只能認了？: http://www.bnext.com.tw/ext_rss/view/id/1002363",
    "傳華碩不滿？微軟自製筆電買氣旺、OEM廠或遭消滅？: http://www.bnext.com.tw/article/view/id/37652",
    "[創業之國]幫百度、騰訊打天下的幕後推手：以色列最低調的獨角獸公司ironSource: http://www.bnext.com.tw/article/view/id/37618",
    "Dell＋EMC 670億美元併購成最熱新聞，到底這場交易對企業市場有何影響？: http://www.bnext.com.tw/article/view/id/37630",
    "Mac OS X El Capitan一次更新五套中文字型！蘋方體好亮眼，你發現了嗎？: http://www.bnext.com.tw/article/view/id/37639",
    "全方位數位行銷人員如何養成？這八種能力一個都不能少！: http://www.bnext.com.tw/article/view/id/37640",
    "Twitter宣布裁員8%，減少工程師數量為首要目標: http://www.bnext.com.tw/article/view/id/37646",
]

week_rank = [
    "台積電勝三星？iPhone 6s 的 A9處理器事件總整理: http://www.bnext.com.tw/ext_rss/view/id/996449",
    "Excel記帳雲端進化！Google表單比記帳App還好用: http://www.bnext.com.tw/ext_rss/view/id/955360",
    "如果你不幸得到一部 16GB 的 iPhone 6s……: http://www.bnext.com.tw/ext_rss/view/id/942311",
    "一台iPhone 6s竟有16種版本？性能有差異，消費者只能認了？: http://www.bnext.com.tw/ext_rss/view/id/1002363",
    "專業，就是用對方聽得懂的話，去告訴他不懂的事情: http://www.bnext.com.tw/article/view/id/37573",
    "蘋果穩居冠軍、Facebook強勢增長、Paypal首度進榜！解讀2015全球百大品牌: http://www.bnext.com.tw/article/view/id/37607",
    "圖解行動支付兩大模式，你的錢未來這樣用！: http://www.bnext.com.tw/article/view/id/37609",
    "韓流退燒？LG：韓企全球地位動搖、市佔全面敗退: http://www.bnext.com.tw/article/view/id/37624"
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
