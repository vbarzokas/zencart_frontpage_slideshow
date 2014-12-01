Zen Cart Frontpage Slideshow
===========================

With this module you can display a JQuery Slideshow to you shop’s main page.You can insert/update/delete slideshow images and their prices.

There are no core files alterations made and the install and uninstall procedure is very clean and safe.

It may needs some css alterations to fit the needs of your template.

Download
--------
Latest version can be also found in the official Zen Cart plugin page [here](http://www.zen-cart.com/downloads.php?do=file&id=1343)

Forum Support Thread
--------
http://www.zen-cart.com/forum/showthread.php?t=190686

Installation
--------

1. Copy/Paste  the contents of  file “install.sql” to Admin->Install SQL Patches

2. rename the “ADMIN” and the “YOUR-TEMPLATE” folders to the ones that exist on your zen cart installation

3. upload the contents of the SITE and ADMIN folders to your server

To administer slideshow
----------
>Admin->Tools->Slideshow 

From here you can insert/edit/delete your slideshow images and their prices.

*Configuring slideshow parameters:*

>Admin->Configuration->Frontpage Slideshow

From here you can enable the slideshow and set parameters such as speed and effect.

If you want a currency sign displayed after the price,simply add it on the price (eg 100€)

Removing previous versions
--------
If you are already using a previous version of Frontpage Slideshow you have to uninstall it first by removing all corresponding files 
To uninstall the prior version, remove the files: 

>includes/templates/YOUR_TEMPLATE/jscript/jscript_easySlider.js
>includes/templates/YOUR_TEMPLATE/jscript/jscript_1.7.1_jquery.js
>includes/templates/YOUR_TEMPLATE/css/stylesheet_slider.css
>includes/templates/YOUR_TEMPLATE/images/slideshow/price_bg.png
>includes/extra_datafiles/slideshow.php
>admin/slideshow.php
>admin/includes/extra_datafiles/slideshow.php
>admin/includes/functions/extra_functions/slideshow.php
>admin/includes/boxes/extra_boxes/slideshow_tools_dhtml.php

(note that the last file will not exist in a 1.5.x installation and the second last file will not exist in a 1.3.x installation.)

Also remove from this file any references to Frontpage Slideshow and leave only any modifications that you may have done.
It will probably be from line 1 to line 97.
	includes/languages/YOUR_LANGUAGE/html_includes/YOUR_TEMPLATE/define_main_page.php
(you could also completely delete this file, but it will no longer be accessible for editing via admin->define pages)

then perform the following database commands in Admin->Tools->Install SQL Patches: 
	DROP TABLE slideshow;

1.5 users should also do
	DELETE FROM admin_pages WHERE page_key = 'slideshow';
