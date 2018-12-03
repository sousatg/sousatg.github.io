---
layout: post
title: Add PHPUnit to a project
summary: 
---

```
composer require phpunit/phpunit
```

Add the test command to the `composer.json` file:
```
  "scripts": {
    "test": "phpunit"  
  },
```

Create a file in the project root with the name `phpunit.xml`
```
<?xml version="1.0" encoding="UTF-8"?>
<phpunit>
    <testsuites>
        <testsuite name="AllTests">
        <directory>tests/</directory>
        </testsuite>
    </testsuites>
</phpunit>
```

