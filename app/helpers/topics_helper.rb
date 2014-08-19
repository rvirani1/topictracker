module TopicsHelper
  def already_voted?(topic)
    topic.voting_users.include? current_user
  end

  def value_search(params)
    if (params[:search_value] == "") || (params[:search_value] ==  nil)
      ""
    else
      params[:search_value]
    end
  end

  def select_list(topic)
    tag_array = Tag.all.map{ |tag| tag.name }
    topic_tags = topic.tags.map { |tag| tag.name }
    options_for_select(tag_array, topic_tags)
  end
end
