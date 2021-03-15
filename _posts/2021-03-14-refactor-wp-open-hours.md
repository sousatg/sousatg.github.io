---
layout: post
title: Refactor WP Open Hours
summary: Wordpress, PHP, Subversion, jQueyr, Docker, Vagrant, Ansible
---


```
<select id="<?php echo $this->get_field_id('layout'); ?>" name="<?php echo $this->get_field_name('layout'); ?>" >
    <option value="1" <?php if(1==$counter){ ?> selected <?php } ?>>Simple</option>
    <option value="2" <?php if(2==$counter){ ?> selected <?php } ?>>Business</option>
    <option value="3" <?php if(3==$counter){ ?> selected <?php } ?>>Cafe</option>
    <option value="4" <?php if(4==$counter){ ?> selected <?php } ?>>Cafe Teria</option>
    <option value="5" <?php if(5==$counter){ ?> selected <?php } ?>>Cofee Bar</option>
    <option value="6" <?php if(6==$counter){ ?> selected <?php } ?>>Coktail Bar</option>
    <option value="7" <?php if(7==$counter){ ?> selected <?php } ?>>Restaurant</option>
    <option value="8" <?php if(8==$counter){ ?> selected <?php } ?>>Restaurant signboard</option>
    <option value="9" <?php if(9==$counter){ ?> selected <?php } ?>>Shop</option>
    <option value="10" <?php if(10==$counter){ ?> selected <?php } ?>>Snack Bar</option>
    <option value="11" <?php if(11==$counter){ ?> selected <?php } ?>>Social</option>
    <option value="12" <?php if(12==$counter){ ?> selected <?php } ?>>Cafe Dark</option>
</select>
```

We can use the `foreach` statement from PHP to improve the following code by doing something like this:

```
<select id="<?php echo $this->get_field_id('layout'); ?>" name="<?php echo $this->get_field_name('layout'); ?>" >
    <?php foreach($options as $key => $val): ?>
        <option value="<?php echo $key; ?>" <?php if($key==$counter){ ?> selected <?php } ?>><?php echo $val; ?></option>
    <?php endforeach; ?>
</select>
```

Advantages:
- Avoid repeated code
- Have to change just one piece of code to make a change in the way options are displayed


In the following string I was using the `<?php` and `?>` to define my code, when dealing with HTML code and we want to output a string this means that we have to have `echo` statement in order to have that text outputed`, what we can do instead is to use the `<?=` and `?>`.

```
<option value="<?php echo $key; ?>" <?php if($key==$counter){ ?> selected <?php } ?>><?php echo $val; ?></option>
```

can be changed into

```
<option value="<?= $key; ?>" <?php if($key==$counter): ?> selected <?php endif; ?>><?= echo $val; ?></option>
```

### jQuery Problems

While going over line 100 from `wp_openhour_widget.php` found out that there were some errors do to the fact that the website was missing jQuery. So I initially I was wandering of the new versions of Wordpress don't come with jQuery anymore, but that actually doesn matter since I can replace with with Vanilla JS anyways.

#### Page Ready
jQuery
```
jQuery(docuent).ready(function(){})
```

Vanilla JS
```
document.addEventListener("DOMContentLoaded", function(){})
```

#### Selecting elements by ID and changing it's HTML
jQuery
```
jQuery('#mod-fwopenhours-date-time').html('HTML')
```

Vanilla JS
```
document.getElementById('mod-fwopenhours-date-time').innerHTML = 'HTML'
```
