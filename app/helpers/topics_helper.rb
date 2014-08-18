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
end
