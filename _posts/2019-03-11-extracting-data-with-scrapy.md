---
layout: post
title: Creating a REST API from Fanwiki data
summary: Using Scrapy to extra data to build a REST API with ExpressJS and MongoDB.
---

# Start a new Scrapy project

```
$ scrapy startproject adventuretime
```

This will create a scrapy project with the following structure:

<img src="/images/scrapy_project_structure.png">

# Create a spider

Inside the folder spiders create a new python file called `characters_spider.py`.

```
import scrapy

class CharactersSpider(scrapy.Spider):
	name = 'characters'

	start_urls = ['https://adventuretime.fandom.com/wiki/Category:Characters']

	pass
```



When Scrapy executes the spider code it will send HTTP code of the url's in `start_urls` as an argument to the `parse` method, where we need to extract the links for the next pages and the character pages.

<img src="/images/adeventure_time_characters_listing.png" />


```
def parse(self, response):
	for href in response.xpath('//a[@class="category-page__member-link"]/@href'):
		yield response.follow(href, self.parse_character)

	for href in response.xpath('//a[@class="category-page__pagination-next wds-button wds-is-secondary"]/@href'):
		yield response.follow(href, self.parse)
```

The pagination links are parse by the parse method while the character links are parse by a method called `parse_character`.

```
def parse_character(self, response):
	print(response)
	i = ItemLoader(item=CharacterItem(), response=response)
	i.add_xpath('name', '//*[contains(@class, "pi-group")]/div[contains(string(), "Name")]/div//text()')
	i.add_xpath('sex', '//*[contains(@class, "pi-group")]/div[contains(string(), "Sex")]/div//text()')
	i.add_xpath('species', '//*[contains(@class, "pi-group")]/div[contains(string(), "Species")]/div/*/text()')

	return i.load_item()
```

To make the extraction of the character data we created a new item called `CharacterItem` at `items.py`

```
class CharacterItem(scrapy.Item):
    url = scrapy.Field()
    name = scrapy.Field(output_processor=TakeFirst())
    sex = scrapy.Field(output_processor=TakeFirst())
    species = scrapy.Field()
```

# Extracting the data

`scrapy crawl spider_name -o result.json -t json`
