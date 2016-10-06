require 'rails_helper'

RSpec.feature "Workouts", type: :feature do
  context 'I can see filtered classes on the calendar after searching' do
    Steps 'search for classes in search bar' do
      Given 'That I am on the workouts page' do
        visit '/'
        click_link('Sign Up')
        fill_in('user[first_name]',:with=>"Remy")
        fill_in('user[last_name]',:with=>"Pickles")
        fill_in('user_email',:with=>"test@test.com")
        fill_in('user[password]',:with=>"password")
        fill_in('user_password_confirmation',:with=>"password")
        select('Instructor',:from => "role[role_name]")
        click_button("Sign up")
        expect(page).to have_content 'Welcome! You have signed up successfully'
        click_link ('Sign Out')
        log_in('test@test.com','password')
      end
      Then 'I can create another workout' do
        create_workout('Beach Yoga', '2018', 'January', '1', '00', '01', 'Huntington Beach', 'Yoga', '60 Minutes', 'Beginner', 'Yoga at the beach!')
      end
      Then 'I am on the details page' do
      expect(page).to have_content 'Beach Yoga'
      expect(page).to have_content '01/01/18'
      expect(page).to have_content '12:01 AM'
      expect(page).to have_content 'Huntington Beach'
      expect(page).to have_content 'Yoga'
      expect(page).to have_content '60 Minutes'
      expect(page).to have_content 'Beginner'
      expect(page).to have_content 'Yoga at the beach!'
      click_link 'Back'
      end #end of then
      Then 'I can create another workout' do
        create_workout('Beach Yoga', '2018', 'January', '1', '00', '01', 'Huntington Beach', 'Yoga', '60 Minutes', 'Beginner', 'Yoga at the beach!')
        click_link 'Back'
      end
      And 'I can filter the classes' do
        select('Yoga', :from => 'search1')
        select('Advanced', :from => 'search2')
        click_button 'searchbutton'
      end
      Then 'I want to see classes for beginners' do
        select('Beginner', :from => 'search2')
        click_button 'searchbutton'
      end
      Then 'I want to search for classes by instructor' do
        select('Remy Pickles', :from => 'search3')
        click_button 'searchbutton'
      end
    end
  end
end