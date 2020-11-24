require 'rails_helper'

RSpec.describe Project, type: :model do
  describe "late status" do
    # 締切日が過ぎていれば遅延していること
    # it "is late when the due date is past today" do
      # project = FactoryBot.create(:project, :due_yesterday)
      # project.late?
      # expect(project.errors.full_messages).to include("")
    # end
    
    # 締切日が今日ならスケジュールどおりであること
    it "is on time when the due date is today" do
      project = FactoryBot.create(:project, :due_today)
      expect(project).to_not be_late
    end
    
    # 締切日が未来ならスケジュールどおりであること
    it "is on time when the due date is in the future" do
      project = FactoryBot.create(:project, :due_tomorrow)
      expect(project).to_not be_late
    end

    it "can have many notes" do
      project = FactoryBot.create(:project, :with_notes)
      expect(project.notes.length).to eq 5
    end
  end
end
