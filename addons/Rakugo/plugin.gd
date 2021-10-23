tool
extends EditorPlugin

var rakugo_tools
var tools_menu
var tm_container

var default_property_list = SettingsList.new().default_property_list

func init_project_settings():
	for property_key in default_property_list.keys():
		var property_value = default_property_list[property_key]
		ProjectTools.set_setting(property_key, property_value[0], property_value[1])
	
	ProjectSettings.set_order("rakugo/game/info/version", 1)

func init_tools():
	# todo rewrite
	pass
	# tools_menu = preload("tools/menu/ToolsMenu.tscn").instance()
	# tools_menu.plugin = self
	# tools_menu.connect_to_plugin()
	# tm_container = CONTAINER_TOOLBAR
	# add_control_to_container(tm_container, tools_menu)
	# var p = tools_menu.get_parent()
	# p.move_child(tools_menu, 0)

func _enter_tree():
	# Initialization of the plugin goes here
	add_autoload_singleton("Rakugo", "res://addons/Rakugo/Rakugo.tscn")
	add_autoload_singleton("Settings", "res://addons/Rakugo/Settings.gd")
	
	init_project_settings()
	init_tools()

	print("Rakugo is enabled")

func remove_tools():
	remove_control_from_container(tm_container, tools_menu)

	tools_menu.free()
	rakugo_tools.free()

func _exit_tree():
	remove_tools()
