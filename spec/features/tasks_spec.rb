require 'spec_helper'

feature 'Tasks' do
  scenario 'Can see the tasks for a user' do
    bob = User.create!(name: "Bob Smith")

    Task.create!(user_id: bob.id, description: "Run 10 miles")
    Task.create!(user_id: bob.id, description: "Finish gSchool Homework")

    visit user_path(bob)

    expect(page).to have_content "Bob Smith"

    within(".tasks") do
      expect(page).to have_content "Run 10 miles"
      expect(page).to have_content "Finish gSchool Homework"
    end
  end

  scenario 'Can see the user and attachment associated with a task' do
    bob = User.create!(name: "Bob Smith")

    task = Task.create!(user_id: bob.id, description: "Run 10 miles")
    Attachment.create!(task_id: task.id, name: 'My super cool attachment')

    visit task_path(task)

    within(".user-name") do
      expect(page).to have_content "Bob Smith"
    end

    within(".attachment-name") do
      expect(page).to have_content "My super cool attachment"
    end
  end
end
