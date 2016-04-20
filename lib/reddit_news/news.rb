class RedditNews::News
    attr_accessor :stories
    @stories = []

    def self.stories
        self.get_news
    end

    def self.get_news
        doc = Nokogiri::HTML(open("https://www.reddit.com/r/news"))
        news = self.new
        news = doc.css(".unvoted")
        news.each do |n|
            if n.css("p.title").text != ""
                story = {}
                title = n.css("p.title").text
                title.length > 50 ? title = title[0..50] + "..." : title = title
                story[:title] = title
                url = n.css(".domain a").text
                story[:url] = url
                reddit_link = n.css("a.bylink")[0]["href"]
                story[:reddit_link] = reddit_link
                @stories << story


            end
        end
        @stories
    end

    def self.top_comment(url)
        doc = Nokogiri::HTML(open("#{url}"))
        top_comment = doc.css("div.unvoted form.usertext").first.text
        top_comment
    end
end
