Given(/^I have no browser cookies$/) do
browser = Capybara.current_session.driver.browser
browser.manage.delete_all_cookies
end

And(/^I am on the USCP home page$/) do
  visit 'http://ux-preprod-app.democratandchronicle.com/'
  #visit 'http://hh-ux-stage.democratandchronicle.com/'
  #visit 'http://www-stage.democratandchronicle.com/'
  #visit 'http://easybtn-stage.democratandchronicle.com/'
  #visit ui_url('/')
end

When (/^The homepage loads$/) do
  expect(page).to have_selector('#section_home')
  expect(page).to have_selector('.site-footer-logo')
end

When(/^I click Log in in pushdown$/) do
  #visit 'https://account-stage.democratandchronicle.com/login/?onSuccessRedirectURL=http%3A%2F%2Fwww-stage-cdn.democratandchronicle.com%2F'
  find('.site-nav-firefly-module.site-nav-item-visible').hover
  find('.site-nav-firefly-item.site-nav-module.site-nav-firefly-module.site-nav-item-visible span.site-nav-inner-wrap div.site-nav-dropdown.site-nav-firefly-dropdown div.site-nav-firefly-dropdown-section.ff-login a.ui-chunky-btn.secondary.ff.ff-login-btn.firefly-signin-btn.sam-returns').click
end

Then(/^the log in page loads$/) do
  #require 'debug'
  expect(page).to have_selector('main.login')
end

def standardLogIn(email="", password="")
  fill_in('username', :with => email)
  fill_in('password', :with => password)
  find('main.login div.page form fieldset.bottomButtons button.primary.left.last').click
end

#Scenario Outline
When(/^I log in with "(.*?)" and "(.*?)"$/) do |email,password|
  standardLogIn(email,password)
end

Then(/^Logins with "(.*?)" should "(.*?)"$/) do |payment_status, show_modal|
  if payment_status=='expired'or'lastpaymentfailed' and show_modal=='yes'
    expect(page).to have_css('div.expired-card-modal-wrapper')
  else
    expect(page).not_to have_css('div.expired-card-modal-wrapper')
  end
end

And(/^I can log out$/) do
  find('.site-nav-firefly-span').hover
  find('a.ff-logout-btn.sam-returns').click
end

#s2
When(/^Update Your Payment Information modal loads$/) do
  #expect(page).to have_css('div.expired-card-modal-wrapper')
  within("div.expired-card-modal-wrapper") do
    find_link('Update payment information')
  end
end

When(/^I click "(.*?)" link$/) do |link|
  find('a.cc-payment-button').click if link=='update your payment information'
  find('.cc-remind-later-link').click if link=='remind me later'
end

Then(/^The SAM Change Your Payment page displays$/) do
  #require 'debug'
  #expect(page).to have_content 'Change your payment information'
  find("legend", :text => "Payment Information")
  #expect(find('[name=form-payment-information]'))
end

#s3

Then(/^modal window closes$/) do
  pending # express the regexp above with the code you wish you had
end
