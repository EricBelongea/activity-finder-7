require "rails_helper"

RSpec.describe "Search" do
  it "takes a number of participants" do
    visit root_path

    expect(page).to have_content("Activity Finder")
    expect(page).to have_content("Number of Participants")
    expect(page).to have_button("Find Activities")


    fill_in :num_participants, with: 1
    click_button "Find Activities"

    expect(current_path).to eq(search_path)

    expect(page).to have_content("Participant Count:")
    expect(page).to have_content("Type of Activity:")
    expect(page).to have_content("Cost Scale:")
    expect(page).to have_content("Accessibility Scale:")
  end

  describe '#sad-apth' do
    it 'Has to be a number between 1-5' do
      visit root_path

      fill_in :num_participants, with: 0
      click_button "Find Activities"

      expect(page).to have_content("Please select between 1 and 5 people for an activity.")
      expect(current_path).to eq(root_path)

      visit root_path

      fill_in :num_participants, with: 6
      click_button "Find Activities"

      expect(page).to have_content("Please select between 1 and 5 people for an activity.")
      expect(current_path).to eq(root_path)
    end
  end
end