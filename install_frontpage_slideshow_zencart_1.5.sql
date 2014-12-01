SET @configuration_group_id=0;
SELECT @configuration_group_id:=configuration_group_id
FROM configuration_group
WHERE configuration_group_title= 'Frontpage Slideshow'
LIMIT 1;
DELETE FROM configuration WHERE configuration_group_id = @configuration_group_id;
DELETE FROM configuration_group WHERE configuration_group_id = @configuration_group_id;

INSERT INTO configuration_group (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) VALUES (NULL, 'Frontpage Slideshow', 'Slideshow Options', '1', '1');
SET @configuration_group_id=last_insert_id();
UPDATE configuration_group SET sort_order = @configuration_group_id WHERE configuration_group_id = @configuration_group_id;

INSERT INTO configuration (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, date_added, use_function, set_function) VALUES 
(NULL, 'Frontpage Slideshow Enable', 'FRONTPAGE_SLIDESHOW_STATUS', 'false', 'Set the statues of Frontpage Slideshow', @configuration_group_id, 1, NOW(), NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),'),
(NULL, 'Slideshow Orientation', 'FRONTPAGE_SLIDESHOW_ORIENTATION', 'horizontal', 'Scroll the images vertically or horizontally', @configuration_group_id, 2, NOW(), NULL, 'zen_cfg_select_option(array(\'horizontal\', \'vertical\'),'),
(NULL, 'Slideshow Auto Play', 'FRONTPAGE_SLIDESHOW_AUTO', 'true', 'Make the slideshow start playing automatically', @configuration_group_id, 3, NOW(), NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),'),
(NULL, 'Slides Continuous Play', 'FRONTPAGE_SLIDESHOW_CONTINUOUS', 'true', 'When it reaches the last slide start over from the beginning', @configuration_group_id, 4, NOW(), NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),'),
(NULL, 'Slideshow Animation Duration', 'FRONTPAGE_SLIDESHOW_ANIM_DURATION', '500', 'Integer: Set the speed of animations, in milliseconds', @configuration_group_id, 5, NOW(), NULL, NULL),
(NULL, 'Slideshow Pause Time', 'FRONTPAGE_SLIDESHOW_PAUSE', '4000', 'Integer: Set the speed of the slideshow cycling, in milliseconds', @configuration_group_id, 6, NOW(), NULL, NULL),
(NULL, 'Slideshow Prev/Next Navigation Controls', 'FRONTPAGE_SLIDESHOW_NAV', 'true', 'Show Prev/Next navigation text', @configuration_group_id, 7, NOW(), NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),'),
(NULL, 'Display Slides Caption', 'FRONTPAGE_SLIDESHOW_SHOW_CAPTION', 'true', 'Show a caption under each slide. Each caption is defined when inserting the images at Tools/Frontpage Slideshow', @configuration_group_id, 8, NOW(), NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),'),
(NULL, 'Animation Type', 'FRONTPAGE_SLIDESHOW_ANIMATION_TYPE', 'slide', 'Choose the way that the slides will animate', @configuration_group_id, 9, NOW(), NULL, 'zen_cfg_select_option(array(\'slide\', \'fade\'),'),
(NULL, 'Animation Start From Slide Number', 'FRONTPAGE_SLIDESHOW_STARTFROM', '0', 'Choose the first slide that will start playing. Starts from 0.', @configuration_group_id, 10, NOW(), NULL, NULL),
(NULL, 'Display Thumbnails Images or Navigation Circles', 'FRONTPAGE_SLIDESHOW_THUMBNAILS', 'circles', 'Create thumbnails or simple circles navigation for paging control under each slide', @configuration_group_id, 11, NOW(), NULL, 'zen_cfg_select_option(array(\'circles\', \'thumbnails\', \'disable\'),'),
(NULL, 'Slides Linkable', 'FRONTPAGE_SLIDESHOW_LINKSLIDES', 'true', 'Make the slides to point to the link that is defined from Tools/Frontpage Slideshow', @configuration_group_id, 12, NOW(), NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),'),
(NULL, 'Frontpage Slideshow Version', 'FRONTPAGE_SLIDESHOW_VERSION', '2.0.2', 'Currently using: <strong>v2.0</strong><br />Author <a href="http://www.vbarzokas.com" target="_blank">Vassilios Barzokas</a>', @configuration_group_id, 50, NOW(), NULL, 'zen_cfg_select_option(array(\'2.0.2\'),');

# Register the configuration page for Admin Access Control
DELETE FROM admin_pages WHERE page_key = 'configFrontpageSlideshow';
INSERT IGNORE INTO admin_pages (page_key,language_key,main_page,page_params,menu_key,display_on_menu,sort_order) VALUES ('configFrontpageSlideshow','BOX_CONFIGURATION_FRONTPAGE_SLIDESHOW','FILENAME_CONFIGURATION',CONCAT('gID=',@configuration_group_id),'configuration','Y',@configuration_group_id);

CREATE TABLE IF NOT EXISTS frontpage_slideshow (
  id int(11) NOT NULL AUTO_INCREMENT,
  image varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  url varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  caption varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (id)
);