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

When(/^I enter "(.*?)" in the email field$/) do |email|
  fill_in('username', :with => email)
end

When(/^I enter "(.*?)" in the password field$/) do |password|
  fill_in('password', :with => password)
end

When(/^I click log in button on SAM form$/) do
  find('main.login div.page form fieldset.bottomButtons button.primary.left.last').click
end

Then(/^I should see "(.*?)"$/) do |modal_class|
  expect(page).to have_css(modal_class)
end

Then(/^I can click log out button$/) do
  find('.site-nav-firefly-span').hover
  find('a.ff-logout-btn.sam-returns').click
end
