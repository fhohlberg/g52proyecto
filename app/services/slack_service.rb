class SlackService
  def initialize
    integration = Integration.last
    Slack.configure do |config|
      #config.token = integration.slack_token
      config.token = ENV['SLACK_API_TOKEN']
    end
  end



  def add_user(acc, successful_actions, failed_actions)
    #User.invite!(email: acc[:attributes][:email], name: acc[:attributes][:name])
   #@user = User.new({ "name": acc[:attributes][:name], "email": acc[:attributes][:email], "password": "123456", "password_confirmation": "123456" })
    #if @user.save
    if Client.invite!(email: acc[:attributes][:email], name: acc[:attributes][:name])
      successful_actions.append(acc)
    else
      failed_actions.append(acc)
    end
    [successful_actions, failed_actions]
  end

  def delete_user(acc, successful_actions, failed_actions)
    @user = Client.find_by(id: acc[:attributes][:id].to_i)
    if @user&.destroy
      successful_actions.append(acc)
    else
      failed_actions.append(acc)
    end
    [successful_actions, failed_actions]
  end


  def execute_actions(actions_list)
    successful_actions = []
    failed_actions = []
    actions_list.each do |acc|
      if acc[:action] == "Add" && acc[:model] == "User"
        response = add_user(acc, successful_actions, failed_actions)
      elsif acc[:action] == "Add"  &&  acc[:model] == "Team"
        response = add_team(acc, successful_actions, failed_actions)
      elsif acc[:action] == "Add"  &&  acc[:model] == "Member"
        response = add_member(acc, successful_actions, failed_actions)
      elsif acc[:action] == "Delete"  &&  acc[:model] == "User"
        response = delete_user(acc, successful_actions, failed_actions)
      elsif acc[:action] == "Delete"  &&  acc[:model] == "Team"
        response = delete_team(acc, successful_actions, failed_actions)
      elsif acc[:action] == "Delete"  &&  acc[:model] == "Member"
        response = delete_member(acc, successful_actions, failed_actions)
      else
        failed_actions.append(acc)
      end
      successful_actions = response[0]
      failed_actions = response[1]
    end
    [{ "successful_actions": successful_actions, "failed_actions": failed_actions }]
  end

  private

  def client
    @client ||= Slack::Web::Client.new
  end
end
