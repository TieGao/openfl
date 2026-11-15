package openfl.utils._internal;

import openfl.display.DisplayObject;
import openfl.display.InteractiveObject;
#if lime
import lime.ui.Touch;
#end

#if !openfl_debug
@:fileXml('tags="haxe,release"')
@:noDebug
#end
@SuppressWarnings("checkstyle:FieldDocComment")
class TouchData
{
	public static var __pool(get, never):ObjectPool<TouchData>;
	@:noCompletion private static var __poolStorage:ObjectPool<TouchData>;

	// Created on first use: static initializer order is unspecified, and touch
	// data is requested from inside other classes' initializers.
	@:noCompletion private static function get___pool():ObjectPool<TouchData>
	{
		if (__poolStorage == null)
		{
			__poolStorage = new ObjectPool<TouchData>(function() return new TouchData(), function(data) data.reset());
		}

		return __poolStorage;
	}

	public var rollOutStack:Array<DisplayObject>;
	@SuppressWarnings("checkstyle:Dynamic") public var touch:#if lime Touch #else Dynamic #end;
	public var touchDownTarget:InteractiveObject;
	public var touchOverTarget:InteractiveObject;

	public function new()
	{
		rollOutStack = [];
	}

	public function reset():Void
	{
		touch = null;
		touchDownTarget = null;
		touchOverTarget = null;

		rollOutStack.splice(0, rollOutStack.length);
	}
}
