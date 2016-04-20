class RedditNews::News

    attr_accessor :stories

    @stories = []

    def self.stories
        self.get_news
    end

    def self.get_news
        doc = Nokogiri::HTML(open("https://www.reddit.com/r/news"))
        news = self.new
        i = 1

        news = doc.css(".unvoted:nth-child(-n+10)")
        story = {}
        news.each do |n|
            if n.css("p.title").text != ""
                title = n.css("p.title").text
                title.length > 50 ? title = title[0..50] + "..." : title = title
                story[:title] = title
                i += 1
                url = n.css(".domain a").text
                story[:url] = url
                @stories << story
            end

        end
        @stories
    end


end
