#if !macro
#if android
import android.content.Context as AndroidContext;
import android.widget.Toast as AndroidToast;
import android.os.Environment as AndroidEnvironment;
import android.Permissions as AndroidPermissions;
import android.Settings as AndroidSettings;
import android.Tools as AndroidTools;
import android.os.Build.VERSION as AndroidVersion;
import android.os.Build.VERSION_CODES as AndroidVersionCode;
import android.os.BatteryManager as AndroidBatteryManager;

import mobile.*;
#if MOBILE_CONTROLS
import mobile.MobileControls;
#end

import mobile.backend.StorageUtil;
#end

#if sys
import sys.*;
import sys.io.*;
#end
import meta.data.script.ScriptHandler;
import MPUtils;

import meta.CoolUtil;
import Init;
import Paths;

import lime.app.Application;
import flixel.FlxG;
import flixel.system.FlxAssets;

using StringTools;
#end
