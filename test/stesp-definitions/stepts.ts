import { Given, When, Then } from '@wdio/cucumber-framework';

import LoginPage from '../../features/pageobjects/login.page';
import SecurePage from '../../features/pageobjects/secure.page';
import * as datas from '../datas.json';

const pages = {
    login: LoginPage,
    main: LoginPage
}

let cart_amount = 0;
let number_items = 0;

Given(/^I am on the (\w+) page$/, async (page) => {
    await pages[page].open('');
});

Given(/^I can see the (.*)$/, async (link) => {
    await expect($(datas[link])).toBeExisting();
});

Then(/^I clear my session$/, async () => {
    await browser.execute('window.localStorage.clear()');
    await browser.refresh();
    cart_amount = 0;
});

When(/^I click on the (\w+)$/, async (link) => {
    await $(datas[link]).click();
}); 

When(/^I click on the first element in the (\w+)$/, async (link) => {
    let text: string = link + ":nth-child(1)";
    await $(datas[link]).click();
}); 

When(/^I click on link with text (.*) with (.*)$/, async (text, number) => {
    let xpath: string = ">>>shop-tabs shop-tab:nth-child(" + number + ")";
    let element = $(xpath);
    await expect(element).toHaveTextContaining(text);
    await element.click();
}); 

When(/^I login with (\w+) and (.+)$/, async (username, password) => {
    await LoginPage.login(username, password);
});

When(/^I write the (.*) on (.*)$/, async (value, link) => {
    await (await $(datas[link])).setValue(value);
});

When(/^I save the number of items$/, async () => {
    let price: string = await $(datas["number_items"]).getText();
    number_items = +price.replace("(", "").replace(")", "").replace(" items", "");
});

When(/^I save the item's price$/, async () => {
    let price: string = await $(datas["item_price"]).getText();
    cart_amount = cart_amount + (+price.replace("$", ""));
});

When(/^I change the (.*) to (.*)$/, async (link, value) => {
    await $(datas[link]).click();
    await (await $(datas[link])).selectByAttribute('value', value);
});

Then(/^I should see a flash message saying (.*)$/, async (message) => {
    await expect(SecurePage.flashAlert).toBeExisting();
    await expect(SecurePage.flashAlert).toHaveTextContaining(message);
});

Then(/^I should see an (.*)$/, async (link) => {
    await expect($(datas[link])).toBeExisting();
});

Then(/^I should see a message (.*) in (.*)$/, async (message, link) => {
    await expect($(datas[link])).toHaveTextContaining(message);
});

Then(/^I verify the (.*) popup has the message (.*)$/, async (link, message) => {
    await expect($(datas[link])).toHaveTextContaining(message);
});

Then(/^I verify the cart has at least one element$/, async () => {
    await expect($(">>>.list shop-cart-item")).toBeExisting();
    await expect($(">>>.subtotal")).toBeExisting();
});

Then(/^I check (.*) has red color$/, async (link) => {
    let color = await $(datas[link]).getCSSProperty("color");
    expect(color.value).toEqual('rgba(221,44,0,1)'); //red color
});

Then(/^I verify the total amount matches our calculated total amount$/, async () => {
    let cart_subtotal = (await $(datas["cart_subtotal"]).getText()).replace("$", "");
    expect((cart_amount.toFixed(2)).toString()).toEqual(cart_subtotal);
});

Then(/^I verify the total amount matches our calculated total amount with the (.*)$/, async (quantity) => {
    let cart_subtotal = (await $(datas["cart_subtotal"]).getText()).replace("$", "");
    cart_amount = (+cart_amount.toFixed(2)) * (+quantity);
    expect((cart_amount.toFixed(2)).toString()).toEqual(cart_subtotal);
});

Then(/^I verify the size matches our entered size (.*)$/, async (entered_size) => {
    let cart_size = await $(">>>.size span").getText();
    expect(cart_size).toEqual(entered_size);
});

Then(/^I verify the item has a (.*) and it isn't empty$/, async (link) => {
    let text = await $(datas[link]).getText();
    expect(await $(datas[link])).toBeDisplayed();
    expect(text.length).toBeGreaterThanOrEqual(3);
});

Then(/^I verify the item has a (\w+)$/, async (link) => {
    expect(await $(datas[link])).toBeDisplayed();
});

Then(/^I verify that the number of items displayed matches the number indicated$/, async () => {
    let items = await $$(datas["items"]);
    expect(items.length).toEqual(number_items);
});

