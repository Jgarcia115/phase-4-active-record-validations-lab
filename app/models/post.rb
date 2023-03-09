class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    validate :must_be_clickbait

    def must_be_clickbait
        strings = ["Won't Believe", "Secret", "Top [number]", "Guess"]
        if title
            unless title.include?(strings[0])||title.include?(strings[1])||title.include?(strings[2])||title.include?(strings[3])
                errors.add(:title, "Please add clickbait")
            end
        end
    end
end
