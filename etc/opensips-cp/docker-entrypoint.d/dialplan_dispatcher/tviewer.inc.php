<?php
/*
 * Copyright (C) 2014 OpenSIPS Project
 *
 * This file is part of opensips-cp, a free Web Control Panel Application for
 * OpenSIPS SIP server.
 *
 * opensips-cp is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * opensips-cp is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 */

###############################################################################
# Attention : advanced options !!

 //this is a very important parameter
 $module_id = "dialplan_dispatcher";
 $custom_config[$module_id] = array ();

 // a custom global name for the tool
 $custom_config[$module_id]['custom_name'] = "SIP Mappings";


//if you want submenu (horizontal) items add them here:

// $custom_config[$module_id]['submenu_items'] = array(
// 					"0"	=> "Submenu1",
//	 				"1"	=> "Submenu2"
//				);




/* config for each submenu item */

/*
Example table: table1
+---------------+------------------+------+-----+---------+----------------+
| Field         | Type             | Null | Key | Default | Extra          |
+---------------+------------------+------+-----+---------+----------------+
| id            | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
| name          | char(128)        | NO   | UNI |         |                |
| address       | char(128)        | NO   |     |         |                |
| age           | int(10) unsigned | NO   |     | 0       |                |
| married       | int(10) unsigned | NO   |     | 0       |                |
+---------------+------------------+------+-----+---------+----------------+

####################################################################################
#																				   #
# Uncomment bellow this line - follow the example and adapt it to your DB table    #
#																				   #
####################################################################################
*/

$custom_config[$module_id][0]['custom_table'] = "dialplan_sip";
$custom_config[$module_id][0]['custom_table_primary_key'] = "id";
$custom_config[$module_id][0]['custom_table_order_by'] = $custom_config[$module_id][0]['custom_table_primary_key'];
$custom_config[$module_id][0]['per_page'] = 25;
$custom_config[$module_id][0]['page_range'] = 3;


/*
 Columns definition:
	- header - the header title used to label this column (mandatory)
	- type - how to display/handle the data - text / combo / textarea (mandatory)
	- key - the key restrictions for this column (they will be checked prior to DB op) - PRI/UNI (optional)
	- tip - tip/explanation to be attached to this column in the add/edit forms (optional)
	- validation_regex - a regular expression to check the inserted value; only for text type (optional)
	- is_optional - if a value must be provided or not for the column (mandatory)

	- show_in_add_form - if to be shown in the add form (optional)
	- show_in_edit_form - if to be shown in the edit form (optional)
	- searchable - if to be listed as field in the search form (optional)
	- disabled - if the disabled attribute should be set to this column (optional)
	- readonly - if the readonly attribute should be set to this column (optional)
	- visible - if the column should be displayed in the table (optional)
	- value_wrapper_func - php function like func($key, $text, $link) to return
		a custom string to be displayed instead of the real value; parameters are:
		- $key - the name of the column
		- $text - the value of the column
		- $link - an assoc array with all the values of the DB row( i.e $text = $link[$key] )
		This function can be use to build links or images around the values to be displayed (optional).

	- default_value - optional default value to pre-populate the column in the add form
	- default_display - a default display text corresponding to the default value if the type is COMBO
	- combo_default_values - assoc array (value -> display) for definiting static COMBOs
		Example: array("1"=>"Yes","0"=>"No")
	- combo_table, combo_value_col, combo_display_col, combo_hook_col - set of attributes for
		defininig dynamic combos, with data from DB; table and value are mandatory in this
		configuration; display may be optionaly used; similar the hook - this has no impact
		over the display of the combo; it simply creates a label attribute inside the
		"option" html tag, which may be used by JS function to enable/disable/remove
		the value during runtime.

	- events - a string that optionaly may define JS events for the input/select field
		Example: "onChange=\"runJSfunction();\" "

	- textarea_display_size - optional value used when a textarea_label_column is not specified, and
		 indicates how many characters should be shown from the text area content. Default is 50.
*/

$custom_config[$module_id][0]['custom_table_column_defs'] = array (
	"id" 		=> 	array (
		"header" 			=> "ID",
		"type"				=> "text",
		"key"				=> "PRI",
		"show_in_add_form" 		=> false,
		"show_in_edit_form"		=> false,
		"searchable" 			=> false,
		"visible"			=> false
	),
	"dpid" 	=> 	array (
		"header" 			=> "Dialplan Group ID",
		"type"				=> "text",
		"is_optional"			=> "y",
		"show_in_add_form" 		=> false,
		"show_in_edit_form"		=> false,
		"searchable" 			=> false,
		"validation_regex" 		=> "^[0-9]+$",
		"visible"			=> false,
		"default_value"			=> "1",
	),
	"pr" 	=> 	array (
		"header" 			=> "Rule Priority",
		"tip"				=> "0 is the maximum priority - higher values mean lower mathcing priorities.",
		"is_optional"			=> "y",
		"type"				=> "text",
		"show_in_add_form" 		=> true,
		"show_in_edit_form"		=> true,
		"searchable" 			=> true,
		"validation_regex" 		=> "^[0-9]+$",
		"visible"			=> true,
		"default_value"			=> "0",
	),
	"match_op" 	=> 	array (
		"header" 			=> "Match OP",
		"type"				=> "text",
		"show_in_add_form" 		=> false,
		"show_in_edit_form"		=> false,
		"searchable" 			=> false,
		"validation_regex" 		=> "^[0-9]+$",
		"visible"			=> false,
		"default_value"			=> "1",
	),
	"match_exp"	=> 	array (
		"header" 			=> "Domain",
		"type"				=> "text",
		"key"				=> NULL,
		"is_optional"			=> "n",
		"tip"				=> "The protocol and domain that will match this rule; the format is protocol:domain; example: `tls:domain.example` or `*:domain.example`",
		"validation_regex" 		=> "^[a-zA-Z\+\.\*]+:.+$",
		"show_in_add_form" 		=> true,
		"show_in_edit_form"		=> true,
		"searchable" 			=> true,
		"visible"			=> true,
	), 
	"match_flags" 	=> 	array (
		"header" 			=> "Flags",
		"type"				=> "text",
		"show_in_add_form" 		=> false,
		"show_in_edit_form"		=> false,
		"searchable" 			=> false,
		"validation_regex" 		=> "^[0-9]+$",
		"visible"			=> false,
		"default_value"			=> "1",
	),
	"subst_exp" 	=> 	array (
		"header" 			=> "Subst EXP",
		"type"				=> "text",
		"show_in_add_form" 		=> false,
		"show_in_edit_form"		=> false,
		"searchable" 			=> false,
		"validation_regex" 		=> "^[0-9]+$",
		"visible"			=> false,
		"default_value"			=> ".*",
	),
	"repl_exp"	=> 	array (
		"header" 			=> "Core Servers Group",
		"type"				=> "combo",
		"key"				=> NULL,
		"tip"				=> "The Servers Group that should be used for the matched Domain.",
		"is_optional"			=> "n",
		"show_in_add_form" 		=> true,
		"show_in_edit_form"		=> true,
		"searchable" 			=> true,
		"value_wrapper_func"		=> "generate_link_to_dispatcher",
		"default_value" 		=> NULL,
		"default_display"		=> NULL,
		"combo_default_values"		=> NULL,
		"combo_table"			=> "dispatcher",
		"combo_value_col"		=> "setid",
		"combo_display_col"		=> "setid"
	), 
	"disabled" 	=> 	array (
		"header" 			=> "disabled",
		"type"				=> "text",
		"show_in_add_form" 		=> false,
		"show_in_edit_form"		=> false,
		"searchable" 			=> false,
		"validation_regex" 		=> "^[0-9]+$",
		"visible"			=> false,
		"default_value"			=> "0",
	),
);



 //need to reload 0 or 1
 $custom_config[$module_id][0]['reload'] = 1;

 //if you need reload please specify the MI command to be ran
 $custom_config[$module_id][0]['custom_mi_command'] = "dp_reload sip_map";

 //the system ID to send the reload MI command to
 $talk_to_this_assoc_id = 1;


##############################################
######### CUSTOM SEARCH OPTIONS ##############
##############################################
 $custom_config[$module_id][0]['custom_search'] = array ( "enabled" => true,
	 "action_script" => "custom_actions/search.php"
 );

##############################################
####### CUSTOM ACTIONS COLUMNS ###############
##############################################

 $custom_config[$module_id][0]['custom_action_columns'] = array (
	 "0" 	=> 	array(
		 "header" 			=> "Edit",
		 "show_header" 		=> false,
		 "type"			=> "link",
		 "action" 		=> "edit",
		 "icon"			=> "../../../images/share/edit.png",
		 "action_script" 	=> "custom_actions/edit.php",
		 "action_template" 	=> "template/custom_templates/edit.php"
	 ),
	 "1" 	=> 	array(
		 "header" 		=> "Delete",
		 "show_header" 		=> false,
		 "type"			=> "link",
		 "action" 		=> "delete",
		 "icon"			=> "../../../images/share/delete.png",
		 "action_script" 	=> "custom_actions/delete.php",
		 "action_template" 	=> "template/custom_templates/delete.php",
		 "events"		=> "onclick=\"return confirmDelete()\""
	 )
 );
##############################################
####### CUSTOM ACTIONS BUTTON  ###############
##############################################

 $custom_config[$module_id][0]['custom_action_buttons'] = array (
	 "0"		=>	array(
		 "text" 		=> "Add",
		 "action" 		=> "add",
		 "style"		=> "formButton",
		 "action_script"	=> "custom_actions/add.php",
		 "action_template"	=> "template/custom_templates/add.php"
	 ),
 );

function generate_link_to_dispatcher($key, $text, $link)
{
	$url = "../dispatcher/dispatcher.php?action=ds_search&search=Search&dispatcher_setid=".urlencode($text);
	$ret = "<a href=\"".$url."\" class=\"textlink\">".$text."</a>";
	return $ret;
}

if (file_exists("../../../../config/tools/system/$module_id/custom.inc.php"))
	require("../../../../config/tools/system/$module_id/custom.inc.php");
