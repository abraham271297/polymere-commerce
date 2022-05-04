@all_tests
@Structure
Feature: Check the structure of the items in the shop

    Background: Background name
        Given I am on the main page
        And I clear my session

    
    Scenario Outline: As a user, I can click on an element and verify that it has a the correct structure
        When I click on link with text <section> with <number>
        And I click on the first element in the result_list
        Then I verify the item has a title and it isn't empty
        And I verify the item has a description and it isn't empty
        And I verify the item has a price and it isn't empty
        And I verify the item has a size and it isn't empty
        And I verify the item has a quantity and it isn't empty
        And I verify the item has a add_to_cart_button and it isn't empty
        And I verify the item has a image
        Examples:
            | section          | number | message       |
            | Men's Outerwear  | 1      | Added to cart |
            | Ladies Outerwear | 2      | Added to cart |
            | Men's T-Shirts   | 3      | Added to cart |
            | Ladies T-Shirts  | 4      | Added to cart |

    
    Scenario Outline: As a user, I can check that the element count of each block is correct
        When I click on link with text <section> with <number>
        And I save the number of items
        Then I verify that the number of items displayed matches the number indicated
        Examples:
            | section          | number | message       |
            | Men's Outerwear  | 1      | Added to cart |
            | Ladies Outerwear | 2      | Added to cart |
            | Men's T-Shirts   | 3      | Added to cart |
            | Ladies T-Shirts  | 4      | Added to cart |
