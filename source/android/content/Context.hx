package android.content;

#if (!android && !native)
#error 'extension-androidtools is not supported on your current platform'
#end
import android.jni.JNICache;
import lime.system.JNI;

/**
 * This class provides access to directories associated with the application context using JNI calls.
 */
class Context
{
	/**
	 * Retrieves the absolute path of the directory assigned to the application for storing private files.
	 *
	 * @return The absolute path of the private files directory.
	 */
	public static inline function getFilesDir():String
	{
		return getAbsolutePath(JNICache.createStaticMethod('org.haxe.extension.Tools', 'getFilesDir', '()Ljava/io/File;')());
	}

	/**
	 * Retrieves the absolute path of the directory assigned to the application for storing external files.
	 *
	 * @param type Optional type of subdirectory to retrieve (e.g., "Pictures", "Documents").
	 * @return The absolute path of the external files directory.
	 */
	public static inline function getExternalFilesDir(type:String = null):String
	{
		return getAbsolutePath(JNICache.createStaticMethod('org.haxe.extension.Tools', 'getExternalFilesDir', '(Ljava/lang/String;)Ljava/io/File;')(type));
	}

	/**
	 * Retrieves the absolute paths of directories assigned to the application for storing external files.
	 * This can include multiple directories in cases where there are multiple external storage devices.
	 *
	 * @param type Optional type of subdirectory to retrieve (e.g., "Pictures", "Documents").
	 * @return An array of absolute paths of the external files directories.
	 */
	public static inline function getExternalFilesDirs(type:String = null):Array<String>
	{
		final dirs:Array<String> = [];

		final jniDirs:Array<Dynamic> = JNICache.createStaticMethod('org.haxe.extension.Tools', 'getExternalFilesDirs', '(Ljava/lang/String;)[Ljava/io/File;')(type);

		for (dir in jniDirs)
			dirs.push(getAbsolutePath(dir));

		return dirs;
	}

	/**
	 * Retrieves the absolute path of the directory assigned to the application for storing cached files.
	 *
	 * @return The absolute path of the cache directory.
	 */
	public static inline function getCacheDir():String
	{
		return getAbsolutePath(JNICache.createStaticMethod('org.haxe.extension.Tools', 'getCacheDir', '()Ljava/io/File;')());
	}

	/**
	 * Retrieves the absolute path of the directory assigned to the application for storing cached code.
	 *
	 * @return The absolute path of the code cache directory.
	 */
	public static inline function getCodeCacheDir():String
	{
		return getAbsolutePath(JNICache.createStaticMethod('org.haxe.extension.Tools', 'getCodeCacheDir', '()Ljava/io/File;')());
	}

	/**
	 * Retrieves the absolute path of the directory assigned to the application for storing backup files that won't be backed up by the system.
	 *
	 * @return The absolute path of the no-backup files directory.
	 */
	public static inline function getNoBackupFilesDir():String
	{
		return getAbsolutePath(JNICache.createStaticMethod('org.haxe.extension.Tools', 'getNoBackupFilesDir', '()Ljava/io/File;')());
	}

	/**
	 * Retrieves the absolute path of the directory assigned to the application for storing cached files on external storage.
	 *
	 * @return The absolute path of the external cache directory.
	 */
	public static inline function getExternalCacheDir():String
	{
		return getAbsolutePath(JNICache.createStaticMethod('org.haxe.extension.Tools', 'getExternalCacheDir', '()Ljava/io/File;')());
	}

	/**
	 * Retrieves the absolute paths of directories assigned to the application for storing cached files on external storage.
	 * This can include multiple directories in cases where there are multiple external storage devices.
	 *
	 * @return An array of absolute paths of the external cache directories.
	 */
	public static inline function getExternalCacheDirs():Array<String>
	{
		final dirs:Array<String> = [];

		final jniDirs:Array<Dynamic> = JNICache.createStaticMethod('org.haxe.extension.Tools', 'getExternalCacheDirs', '()[Ljava/io/File;')();

		for (dir in jniDirs)
			dirs.push(getAbsolutePath(dir));

		return dirs;
	}

	/**
	 * Retrieves the absolute path of the directory assigned to the application for storing expansion files (OBB files).
	 *
	 * @return The absolute path of the OBB directory.
	 */
	public static inline function getObbDir():String
	{
		return getAbsolutePath(JNICache.createStaticMethod('org.haxe.extension.Tools', 'getObbDir', '()Ljava/io/File;')());
	}

	/**
	 * Retrieves the absolute path from a given File object.
	 *
	 * @param file A File object for which to retrieve the absolute path.
	 *
	 * @return The absolute path of the File object.
	 */
	@:noCompletion
	private static inline function getAbsolutePath(file:Dynamic):String
	{
		return JNI.callMember(JNICache.createMemberMethod('java/io/File', 'getAbsolutePath', '()Ljava/lang/String;'), file, []);
	}
}
