

class Feed

    attr_accessor :title, :author, :date, :tags, :link, :content

    def initialize( title, author, date, tags, link, content )
        @title = title
        @author = author
        @date = date
        @tags = tags
        @link = link
        @content = content
    end

end
