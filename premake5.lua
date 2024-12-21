project "FreeType"
   kind "StaticLib"
   language "C"

	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

   
   files {
      "src/**.c",  -- Include all C source files from FreeType
      "include/**.h"  -- Include all header files from FreeType
   }

   includedirs {
      "/include",
   }

   

   -- Configure build settings for Debug and Release, Dist configurations
  filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		symbols "on"
		optimize "Debug"

	filter "configurations:Dist"
		runtime "Release"
		symbols "off"
		optimize "Speed"
