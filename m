Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE5710E78A
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Feb 2023 13:48:19 +0000 (UTC)
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  8 Feb 2023 14:47:36 +0100
Message-Id: <4d94c00f2ae887a4d258e47f8a2026a2091e0496.1675854161.git.karolina.stolarek@intel.com>
In-Reply-To: <cover.1675854161.git.karolina.stolarek@intel.com>
References: <cover.1675854161.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 3/6] lib/i915: Rename intel_tiling_info
 library
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

The structs here describe the properties of copy commands, not
just tiling formats they support. Make the library name more
generic.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 lib/i915/i915_blt.h                                 | 2 +-
 lib/i915/{intel_tiling_info.c => intel_cmds_info.c} | 2 +-
 lib/i915/{intel_tiling_info.h => intel_cmds_info.h} | 0
 lib/intel_chipset.h                                 | 2 +-
 lib/meson.build                                     | 6 +++---
 5 files changed, 6 insertions(+), 6 deletions(-)
 rename lib/i915/{intel_tiling_info.c => intel_cmds_info.c} (98%)
 rename lib/i915/{intel_tiling_info.h => intel_cmds_info.h} (100%)

diff --git a/lib/i915/i915_blt.h b/lib/i915/i915_blt.h
index 6a0c246a..7acf9595 100644
--- a/lib/i915/i915_blt.h
+++ b/lib/i915/i915_blt.h
@@ -47,7 +47,7 @@
 #include <malloc.h>
 #include "drm.h"
 #include "igt.h"
-#include "intel_tiling_info.h"
+#include "intel_cmds_info.h"
 
 #define CCS_RATIO 256
 
diff --git a/lib/i915/intel_tiling_info.c b/lib/i915/intel_cmds_info.c
similarity index 98%
rename from lib/i915/intel_tiling_info.c
rename to lib/i915/intel_cmds_info.c
index 5f785777..d99b3131 100644
--- a/lib/i915/intel_tiling_info.c
+++ b/lib/i915/intel_cmds_info.c
@@ -5,7 +5,7 @@
 
 #include <stdint.h>
 #include "intel_chipset.h"
-#include "i915/intel_tiling_info.h"
+#include "i915/intel_cmds_info.h"
 
 #define BLT_INFO(_cmd, _tiling)  { \
 		.blt_cmd_type = _cmd, \
diff --git a/lib/i915/intel_tiling_info.h b/lib/i915/intel_cmds_info.h
similarity index 100%
rename from lib/i915/intel_tiling_info.h
rename to lib/i915/intel_cmds_info.h
diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index 2e44de24..a02a84f9 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -31,7 +31,7 @@
 #include <pciaccess.h>
 #include <stdbool.h>
 
-#include "i915/intel_tiling_info.h"
+#include "i915/intel_cmds_info.h"
 
 #define BIT(x) (1ul <<(x))
 
diff --git a/lib/meson.build b/lib/meson.build
index d49b78ca..c5131d9a 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -14,7 +14,7 @@ lib_sources = [
 	'i915/intel_decode.c',
 	'i915/intel_memory_region.c',
 	'i915/intel_mocs.c',
-	'i915/intel_tiling_info.c',
+	'i915/intel_cmds_info.c',
 	'i915/i915_blt.c',
 	'i915/i915_crc.c',
 	'igt_collection.c',
@@ -219,7 +219,7 @@ igt_deps = [ lib_igt ] + lib_deps
 lin_igt_chipset_build = static_library('igt_chipset',
                                        ['intel_chipset.c',
 					'intel_device_info.c',
-					'i915/intel_tiling_info.c'],
+					'i915/intel_cmds_info.c'],
                                        include_directories : inc)
 
 lib_igt_chipset = declare_dependency(link_with : lin_igt_chipset_build,
@@ -242,7 +242,7 @@ lib_igt_device_scan_build = static_library('igt_device_scan',
 	'igt_list.c',
 	'igt_tools_stub.c',
 	'intel_device_info.c',
-	'i915/intel_tiling_info.c',
+	'i915/intel_cmds_info.c',
 	],
 	dependencies : scan_dep,
 	include_directories : inc)
-- 
2.25.1
