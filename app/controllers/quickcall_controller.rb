class QuickcallController < ApplicationController
  unloadable
  def create
    #puts params
    author = User.find params[:author_id]
    issue = Issue.new
    issue.project_id = params[:project_id]
    issue.tracker_id = params[:tracker_id]
    issue.author_id = params[:author_id]
    issue.subject = params[:subject]
    notes = t(:quickcall_initiated_log, :user => User.current.name)
    issue.init_journal(author, notes)
    begin
      issue.save!
      redirect_to edit_issue_path issue
    rescue
      flash[:error] = issue.errors.full_messages.join("<br>")
    end
  end
end
