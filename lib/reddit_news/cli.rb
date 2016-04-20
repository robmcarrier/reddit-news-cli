class RedditNews::CLI

    @news = []

    def call
        list_news
        top_comment
        byebye
    end

    def list_news
        puts "Todays News"
        @news = RedditNews::News.stories
        @news = @news[0..9]
        i = 1
        @news.each do |story|
            puts "--------------------"
            puts "#{i}. #{story[:title]} \n"
            puts "#{story[:url]}\n"
            i += 1
        end

    end

    def top_comment
        input = nil
        while input != "exit"
            puts "Enter num of story you want the top comment on, list to see full list, or exit:"
            input = gets.strip.downcase
            if input == "list"
                list_news
            elsif input.to_i > 0 && input.to_i < 11
                input = (input.to_i) -1
                puts "########"
                puts "#{RedditNews::News.top_comment(@news[input][:reddit_link])}"
                puts "########"
            end
        end
    end

    def byebye
        puts "See ya later crocodile"
    end
end
