require_relative '../int_module/crawl_runner'
require_relative '../int_module/feeds_filter'
require_relative '../int_class/feed'
require_relative '../int_class/filter_condition'
require 'oga'
require 'open-uri'

# BNextRobot Extract titles and links of daily/ weekly hot feeds.
class BNextRobot
  include Crawler
  include FeedFilter

  FEED_XPATH = "//a[contains(@class, 'item_title block_link')]/@href"
  TITLE_XPATH = "//div[contains(@class, 'main_title')]"
  TAG_XPATH = "//a[contains(@class, 'tag_link')]"
  INFO_XPATH = "//span[contains(@class, 'info')]"
  CONTENT_XPATH = "//div[contains(@class, 'content htmlview')]"
  IMGS_XPATH = "//div[contains(@class, 'content htmlview')]/p/img/@src"

  attr_accessor :day_rank_feeds, :week_rank_feeds

  def initialize
    load_page('http://www.bnext.com.tw/')
    analyze
    init_rank_feeds
  end

  def analyze
    cat_tags = @web_data.scan(/<li>.*?<\/li>/)
    atags = cat_tags.map { |x| x.match(/<a.*?<\/a>/).to_s }
    hrefs = atags.map { |x| x.match(/href=\".*?\"/).to_s[7..-2] }
    cat_names = atags.map { |x| x.match(/>.+?</).to_s[1..-2] }
    cats_pair = cat_names.zip(hrefs).select { |n, ref| ref.start_with? 'categories' }

    @cats = Hash.new(false)
    cats_pair.map { |n, ref| @cats[n] = @domain + ref }
    nil
  end

  def show_day_rank
    @day_rank_feeds.map { |feed| puts "#{feed.title}: #{feed.link}" }
    nil
  end

  def show_week_rank
    @week_rank_feeds.map { |feed| puts "#{feed.title}: #{feed.link}" }
    nil
  end

  def init_rank_feeds
    token_gen = ["//div[@id = '", "_rank']//a[@class = 'content']"]
    document = Oga.parse_html(@web_data)

    day_rank_hrefs = document.xpath(token_gen.join('day') + '/@href').map(&:text)
    week_rank_hrefs = document.xpath(token_gen.join('week') + '/@href').map(&:text)

    day_rank_titles = document.xpath(token_gen.join('day')).map(&:text)
    week_rank_titles = document.xpath(token_gen.join('week')).map(&:text)

    day_rank = day_rank_titles.zip(day_rank_hrefs).select { |title, href| href.start_with? '/' }
    day_rank = day_rank.map { |title, href| [title, @domain + href[1..-1]] }
    week_rank = week_rank_titles.zip(week_rank_hrefs).select { |title, href| href.start_with? '/' }
    week_rank = week_rank.map { |title, href| [title, @domain + href[1..-1]] }

    @day_rank_feeds = day_rank.map { |title, href| Feed.new(title, "", "", [], href, "") }
    @week_rank_feeds = week_rank.map { |title, href| Feed.new(title, "", "", [], href, "") }
    nil
  end

  def get_feeds(cat, page_no)
    # TODO: parse all feeds @ page: page_no
    query_url = @domain + "categories/#{cat}/?p=#{page_no}"
    document = Oga.parse_html(open(query_url))
    path = document.xpath(FEED_XPATH).map(&:text)
    # path.each do |feed_id|
    #   feed = _extract_feed(feed_id)
    #   puts "Title: #{feed.title}"
    #   puts "Author: #{feed.author}"
    #   puts "Date: #{feed.date}"
    #   puts "Tags: " + feed.tags.join(", ")
    # end
    path.map { |feed_id| _extract_feed(feed_id) }
  end

  def _extract_feed(feed_id)
    query_url = @domain[0..-2] + "#{feed_id}"
    document = Oga.parse_html(open(query_url))
    title = document.xpath(TITLE_XPATH).text.force_encoding('utf-8')
    author = document.xpath(INFO_XPATH)[0].text.gsub('撰文者：'.force_encoding('ascii-8bit'), '').force_encoding('utf-8')
    date = document.xpath(INFO_XPATH)[1].text.gsub('發表日期：'.force_encoding('ascii-8bit'), '').force_encoding('utf-8')
    content = document.xpath(CONTENT_XPATH).text.force_encoding('utf-8')
    tags = document.xpath(TAG_XPATH).map { |i| i.text.force_encoding('utf-8') }
    imgs = document.xpath(IMGS_XPATH).map { |i| i.text.force_encoding('utf-8') }
    Feed.new(title, author, date, tags, query_url, content, imgs)
  end
end
