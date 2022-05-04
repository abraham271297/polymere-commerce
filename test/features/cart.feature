@all_tests
@card
Feature: Check cart functionality

    Background: Background name
        Given I am on the main page
        And I clear my session


    Scenario Outline: As a user, I can check the cart even if it is empty
        When I click on the cart_icon
        Then I should see an empty_cart_class
        And I should see a message <message_value> in empty_cart_class
        Examples:
            | message_value |
            | is empty      |



    Scenario Outline: As a user, I can add one item to the Cart and the cart changes
        When I click on link with text <section> with <number>
        And I click on the first element in the result_list
        And I click on the add_to_cart_button
        Then I verify the added_to_cart popup has the message <message>
        And I click on the view_cart_button
        And I verify the cart has at least one element
        Examples:
            | section          | number | message       |
            | Men's Outerwear  | 1      | Added to cart |
            | Ladies Outerwear | 2      | Added to cart |
            | Men's T-Shirts   | 3      | Added to cart |
            | Ladies T-Shirts  | 4      | Added to cart |



    Scenario: As a user, I can add some items to the Cart, the cart changes and the calculated amount is correct
        When I click on link with text Men's Outerwear with 1
        And I click on the first element in the result_list
        And I click on the add_to_cart_button
        And I verify the added_to_cart popup has the message Added to cart
        And I save the item's price
        And I click on link with text Ladies Outerwear with 2
        And I click on the first element in the result_list
        And I click on the add_to_cart_button
        And I verify the added_to_cart popup has the message Added to cart
        And I save the item's price
        And I click on link with text Ladies T-Shirts with 4
        And I click on the first element in the result_list
        And I click on the add_to_cart_button
        And I verify the added_to_cart popup has the message Added to cart
        And I save the item's price
        And I click on link with text Men's T-Shirts with 3
        And I click on the first element in the result_list
        And I click on the add_to_cart_button
        And I verify the added_to_cart popup has the message Added to cart
        And I save the item's price
        Then I click on the view_cart_button
        And I verify the cart has at least one element
        And I verify the total amount matches our calculated total amount



    Scenario Outline: As a user, I can add an item but 5 times to cart, the cart changes and shows the item with the correct quantity
        When I click on link with text <section> with <number>
        And I click on the first element in the result_list
        And I change the quantity_dropdown to <quantity>
        And I save the item's price
        And I click on the add_to_cart_button
        Then I verify the added_to_cart popup has the message <message>
        And I click on the view_cart_button
        And I verify the cart has at least one element
        And I verify the total amount matches our calculated total amount with the <quantity>
        Examples:
            | section          | number | message       | quantity |
            | Men's Outerwear  | 1      | Added to cart | 5        |
            | Ladies Outerwear | 2      | Added to cart | 4        |
            | Men's T-Shirts   | 3      | Added to cart | 3        |
            | Ladies T-Shirts  | 4      | Added to cart | 2        |


    
    Scenario Outline: As a user, I can add an item with different sizes, the cart changes and shows the item with the correct size
        When I click on link with text <section> with <number>
        And I click on the first element in the result_list
        And I change the size_dropdown to <size>
        And I click on the add_to_cart_button
        Then I verify the added_to_cart popup has the message <message>
        And I click on the view_cart_button
        And I verify the cart has at least one element
        And I verify the size matches our entered size <size>
        Examples:
            | section          | number | message       | size |
            | Men's Outerwear  | 1      | Added to cart | S    |
            | Men's Outerwear  | 1      | Added to cart | XL   |
            | Ladies Outerwear | 2      | Added to cart | XS   |
            | Ladies Outerwear | 2      | Added to cart | S    |
            | Men's T-Shirts   | 3      | Added to cart | XL   |
            | Men's T-Shirts   | 3      | Added to cart | XS   |
            | Ladies T-Shirts  | 4      | Added to cart | S    |
            | Ladies T-Shirts  | 4      | Added to cart | L    |

