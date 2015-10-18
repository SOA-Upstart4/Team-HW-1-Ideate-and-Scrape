

class Feed

    attr_accessor :title, :author, :date, :tags, :link, :content, :imgs

    def initialize( title, author, date, tags, link, content, imgs )
        @title = title
        @author = author
        @date = date
        @tags = tags
        @link = link
        @content = content
        @imgs = imgs
    end

end
