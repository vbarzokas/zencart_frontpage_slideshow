<?php
/**
 * Frontpage Slideshow
 * Slideshow creator for displaying in shop's main page
 *
 * @package slideshow
 * @author Vassilios Barzokas <contact@vbarzokas.com> 
 * @author website www.vbarzokas.com
 * @copyright Copyright 2011 Vassilios Barzokas
 * @license http://www.gnu.org/copyleft/gpl.html   GNU Public License V2.0
 * @version $Id: frontpage_slideshow.php 2.0 2013-04-10 17:50:04Z $
 */
 
if (!defined('IS_ADMIN_FLAG')) {
    die('Illegal Access');
}

if (function_exists('zen_register_admin_page')) {
    if (!zen_page_key_exists('Frontpage Slideshow')) {
        // Add Frontpage Slideshow to Tools menu
        zen_register_admin_page('Frontpage Slideshow', 'BOX_TOOLS_SLIDESHOW','FILENAME_SLIDESHOW', '', 'tools', 'Y', 17);
    }
}
?>