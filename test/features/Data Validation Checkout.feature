@all_tests
@checkout_validation
Feature: Data Validation in checkout

    Background: Prerequisite for data validation in checkout
        Given I am on the main page
        And I clear my session
        And I click on link with text Men's Outerwear with 1
        And I click on the first element in the result_list
        And I click on the add_to_cart_button
        And I verify the added_to_cart popup has the message Added to cart
        And I click on the view_cart_button
        And I verify the cart has at least one element
        And I click on the checkout_button
        And I can see the checkout_form


    Scenario Outline: As a user, I try to introduce an incorrect Card CVV in checkout
        When I write the <email> on email_input
        And I write the <number> on phone_number_input
        And I write the <address> on address_input
        And I write the <city> on city_input
        And I write the <state> on state_input
        And I write the <zip> on zip_input
        And I write the <card_name> on card_name_input
        And I write the <card_number> on card_number_input
        And I write the <cvv> on cvv_input
        Then I click on the place_order_button
        And I can see the checkout_form
        And I check cvv_label has red color
        Examples:
            | email           | number      | address | city | state | zip   | card_name | card_number      | cvv                  | message_value                  |
            | aaa27@gmail.com | 34666666666 | address | city | state | 28000 | card_name | 8888888888888888 | aaa                  | Demo checkout process complete |
            | aaa27@gmail.com | 34666666666 | address | city | state | 28000 | card_name | 8888888888888888 |                      | Demo checkout process complete |
            | aaa27@gmail.com | 34666666666 | address | city | state | 28000 | card_name | 8888888888888888 | aaaaaaaaaaaaaaaaaaaa | Demo checkout process complete |
            | aaa27@gmail.com | 34666666666 | address | city | state | 28000 | card_name | 8888888888888888 | 12                   | Demo checkout process complete |
            | aaa27@gmail.com | 34666666666 | address | city | state | 28000 | card_name | 8888888888888888 | 1                    | Demo checkout process complete |


    Scenario Outline: As a user, I try to introduce an incorrect Card number name in checkout
        When I write the <email> on email_input
        And I write the <number> on phone_number_input
        And I write the <address> on address_input
        And I write the <city> on city_input
        And I write the <state> on state_input
        And I write the <zip> on zip_input
        And I write the <card_name> on card_name_input
        And I write the <card_number> on card_number_input
        And I write the <cvv> on cvv_input
        Then I click on the place_order_button
        And I can see the checkout_form
        And I check cardnumber_label has red color
        Examples:
            | email           | number      | address | city | state | zip   | card_name | card_number       | cvv | message_value                  |
            | aaa27@gmail.com | 34666666666 | address | city | state | 28000 | card_name | aaaaaaaaaaaaa     | 000 | Demo checkout process complete |
            | aaa27@gmail.com | 34666666666 | address | city | state | 28000 | card_name |                   | 000 | Demo checkout process complete |
            | aaa27@gmail.com | 34666666666 | address | city | state | 28000 | card_name | 1                 | 000 | Demo checkout process complete |
            | aaa27@gmail.com | 34666666666 | address | city | state | 28000 | card_name | 11111111111111    | 000 | Demo checkout process complete |
            | aaa27@gmail.com | 34666666666 | address | city | state | 28000 | card_name | .8888888888888888 | 000 | Demo checkout process complete |


    Scenario Outline: As a user, I try to introduce an incorrect Cardholder name in checkout
        When I write the <email> on email_input
        And I write the <number> on phone_number_input
        And I write the <address> on address_input
        And I write the <city> on city_input
        And I write the <state> on state_input
        And I write the <zip> on zip_input
        And I write the <card_name> on card_name_input
        And I write the <card_number> on card_number_input
        And I write the <cvv> on cvv_input
        Then I click on the place_order_button
        And I can see the checkout_form
        And I check cardholder_label has red color
        Examples:
            | email           | number      | address | city | state | zip   | card_name | card_number      | cvv | message_value                  |
            | aaa27@gmail.com | 34666666666 | address | city | state | 28000 |           | 8888888888888888 | 000 | Demo checkout process complete |
            | aaa27@gmail.com | 34666666666 | address | city | state | 28000 | 1         | 8888888888888888 | 000 | Demo checkout process complete |
            | aaa27@gmail.com | 34666666666 | address | city | state | 28000 | %%        | 8888888888888888 | 000 | Demo checkout process complete |


    Scenario Outline: As a user, I try to introduce an incorrect Postal Code in checkout
        When I write the <email> on email_input
        And I write the <number> on phone_number_input
        And I write the <address> on address_input
        And I write the <city> on city_input
        And I write the <state> on state_input
        And I write the <zip> on zip_input
        And I write the <card_name> on card_name_input
        And I write the <card_number> on card_number_input
        And I write the <cvv> on cvv_input
        Then I click on the place_order_button
        And I can see the checkout_form
        And I check zip_label has red color
        Examples:
            | email           | number      | address | city | state | zip | card_name | card_number      | cvv | message_value                  |
            | aaa27@gmail.com | 34666666666 | address | city | state | 1   | card_name | 8888888888888888 | 000 | Demo checkout process complete |
            | aaa27@gmail.com | 34666666666 | address | city | state |     | card_name | 8888888888888888 | 000 | Demo checkout process complete |
            | aaa27@gmail.com | 34666666666 | address | city | state | aaa | card_name | 8888888888888888 | 000 | Demo checkout process complete |
            | aaa27@gmail.com | 34666666666 | address | city | state | %%% | card_name | 8888888888888888 | 000 | Demo checkout process complete |


    Scenario Outline: As a user, I try to introduce an incorrect city in checkout
        When I write the <email> on email_input
        And I write the <number> on phone_number_input
        And I write the <address> on address_input
        And I write the <city> on city_input
        And I write the <state> on state_input
        And I write the <zip> on zip_input
        And I write the <card_name> on card_name_input
        And I write the <card_number> on card_number_input
        And I write the <cvv> on cvv_input
        Then I click on the place_order_button
        And I can see the checkout_form
        And I check state_label has red color
        Examples:
            | email           | number      | address | city | state | zip   | card_name | card_number      | cvv | message_value                  |
            | aaa27@gmail.com | 34666666666 | address | city |       | 28000 | card_name | 8888888888888888 | 000 | Demo checkout process complete |
            | aaa27@gmail.com | 34666666666 | address | city | 1     | 28000 | card_name | 8888888888888888 | 000 | Demo checkout process complete |


    Scenario Outline: As a user, I try to introduce an incorrect city in checkout
        When I write the <email> on email_input
        And I write the <number> on phone_number_input
        And I write the <address> on address_input
        And I write the <city> on city_input
        And I write the <state> on state_input
        And I write the <zip> on zip_input
        And I write the <card_name> on card_name_input
        And I write the <card_number> on card_number_input
        And I write the <cvv> on cvv_input
        Then I click on the place_order_button
        And I can see the checkout_form
        And I check city_label has red color
        Examples:
            | email           | number      | address | city | state | zip   | card_name | card_number      | cvv | message_value                  |
            | aaa27@gmail.com | 34666666666 | address | 1    | state | 28000 | card_name | 8888888888888888 | 000 | Demo checkout process complete |
            | aaa27@gmail.com | 34666666666 | address |      | state | 28000 | card_name | 8888888888888888 | 000 | Demo checkout process complete |


    Scenario Outline: As a user, I try to introduce an incorrect address in checkout
        When I write the <email> on email_input
        And I write the <number> on phone_number_input
        And I write the <address> on address_input
        And I write the <city> on city_input
        And I write the <state> on state_input
        And I write the <zip> on zip_input
        And I write the <card_name> on card_name_input
        And I write the <card_number> on card_number_input
        And I write the <cvv> on cvv_input
        Then I click on the place_order_button
        And I can see the checkout_form
        And I check address_label has red color
        Examples:
            | email           | number      | address | city | state | zip   | card_name | card_number      | cvv | message_value                  |
            | aaa27@gmail.com | 34666666666 |         | city | state | 28000 | card_name | 8888888888888888 | 000 | Demo checkout process complete |
            | aaa27@gmail.com | 34666666666 | 1234    | city | state | 28000 | card_name | 8888888888888888 | 000 | Demo checkout process complete |
            | aaa27@gmail.com | 34666666666 | a       | city | state | 28000 | card_name | 8888888888888888 | 000 | Demo checkout process complete |


    Scenario Outline: As a user, I try to introduce an incorrect number in checkout
        When I write the <email> on email_input
        And I write the <number> on phone_number_input
        And I write the <address> on address_input
        And I write the <city> on city_input
        And I write the <state> on state_input
        And I write the <zip> on zip_input
        And I write the <card_name> on card_name_input
        And I write the <card_number> on card_number_input
        And I write the <cvv> on cvv_input
        Then I click on the place_order_button
        And I can see the checkout_form
        And I check number_label has red color
        Examples:
            | email           | number    | address | city | state | zip   | card_name | card_number      | cvv | message_value                  |
            | aaa27@gmail.com | 346666666 | address | city | state | 28000 | card_name | 8888888888888888 | 000 | Demo checkout process complete |
            | aaa27@gmail.com |           | address | city | state | 28000 | card_name | 8888888888888888 | 000 | Demo checkout process complete |
            | aaa27@gmail.com | 0         | address | city | state | 28000 | card_name | 8888888888888888 | 000 | Demo checkout process complete |
            | aaa27@gmail.com | 996666666 | address | city | state | 28000 | card_name | 8888888888888888 | 000 | Demo checkout process complete |
            | aaa27@gmail.com | 006666666 | address | city | state | 28000 | card_name | 8888888888888888 | 000 | Demo checkout process complete |


    Scenario Outline: As a user, I try to introduce an incorrect email in checkout
        When I write the <email> on email_input
        And I write the <number> on phone_number_input
        And I write the <address> on address_input
        And I write the <city> on city_input
        And I write the <state> on state_input
        And I write the <zip> on zip_input
        And I write the <card_name> on card_name_input
        And I write the <card_number> on card_number_input
        And I write the <cvv> on cvv_input
        Then I click on the place_order_button
        And I can see the checkout_form
        And I check email_label has red color
        Examples:
            | email          | number      | address | city | state | zip   | card_name | card_number      | cvv | message_value                  |
            | aaa27@gmail.   | 34666666666 | address | city | state | 28000 | card_name | 8888888888888888 | 000 | Demo checkout process complete |
            | aaa27          | 34666666666 | address | city | state | 28000 | card_name | 8888888888888888 | 000 | Demo checkout process complete |
            | @gmail.com     | 34666666666 | address | city | state | 28000 | card_name | 8888888888888888 | 000 | Demo checkout process complete |
            | 123456         | 34666666666 | address | city | state | 28000 | card_name | 8888888888888888 | 000 | Demo checkout process complete |
            | aaa27@.com     | 34666666666 | address | city | state | 28000 | card_name | 8888888888888888 | 000 | Demo checkout process complete |
            | aaa27gmail.com | 34666666666 | address | city | state | 28000 | card_name | 8888888888888888 | 000 | Demo checkout process complete |
            | aaa27          | 34666666666 | address | city | state | 28000 | card_name | 8888888888888888 | 000 | Demo checkout process complete |
            |                | 34666666666 | address | city | state | 28000 | card_name | 8888888888888888 | 000 | Demo checkout process complete |


    Scenario Outline: As a user, I try to make a correct checkout
        When I write the <email> on email_input
        And I write the <number> on phone_number_input
        And I write the <address> on address_input
        And I write the <city> on city_input
        And I write the <state> on state_input
        And I write the <zip> on zip_input
        And I write the <card_name> on card_name_input
        And I write the <card_number> on card_number_input
        And I write the <cvv> on cvv_input
        And I click on the place_order_button
        Then I should see a message <message_value> in success_div
        Examples:
            | email           | number      | address | city | state | zip   | card_name | card_number      | cvv | message_value                  |
            | aaa27@gmail.com | 34666666666 | address | city | state | 28000 | card_name | 8888888888888888 | 000 | Demo checkout process complete |



