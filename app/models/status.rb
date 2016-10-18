class Status < ActiveRecord::Base
	belongs_to :user
	has_many :likes, dependent: :destroy
	validates_presence_of :title
	validates_presence_of :content
	validates_length_of :title, minimum: 8, too_short: "/title is too short/"
	validates_length_of :content, minimum: 10, too_short: "/content is too short/"

	default_scope {order("created_at DESC")}
end


# validates_length_of :essay, :minimum => 100, :too_short => "Your essay must be at least {{count}} words."), :tokenizer => lambda {|str| str.scan(/\w+/) }
