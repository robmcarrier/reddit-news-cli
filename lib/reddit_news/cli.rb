class RedditNews::CLI

    def call
        list_news
    end

    def list_news
        puts "Todays News"
        puts "------------"
        @news = RedditNews::News.stories
        @news = @news[0..9]
        i = 1
        @news.each do |story|
            puts "#{i}. #{story[:title]} \n"
            puts "#{story[:url]}\n"
            puts "--------------------"
            i += 1
        end

    end

end
