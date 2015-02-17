@ignore @updatePayment @acceptance
Feature: Update Payment Modal
Users with expired card or last payment failed get modal
Button on modal to update payment
No thanks link to close modal for 24 hours
User whose card is not expired and has not failed does not get modal

Background:
Given I have no browser cookies
And I am on the USCP home page
When The homepage loads
And I click Log in in pushdown
Then the log in page loads

Scenario Outline: Update Payment modal after log in
    When I enter "<email>" in the email field
    When I enter "<password>" in the password field
    And I click log in button on SAM form
    Then I should see "<modal_class>"
    And I can click log out button
Examples:
      | email                        | password    |  modal_class                       |
      | DC4834301@mailinator.com     | New1111     |  div.expired-card-modal-wrapper                      |
      | DC2753260@mailinator.com     | New1111     |  div.expired-card-modal-wrapper    |
