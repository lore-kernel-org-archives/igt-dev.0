Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B7E510E278
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jun 2022 08:50:17 +0000 (UTC)
From: Ryszard Knop <ryszard.knop@intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Fri,  3 Jun 2022 10:49:58 +0200
Message-Id: <20220603084958.35012-6-ryszard.knop@intel.com>
In-Reply-To: <20220603084958.35012-1-ryszard.knop@intel.com>
References: <20220603084958.35012-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 5/5] lib, tools: Misc cleanups and typo fixes
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

A couple of small fixes for annoyances found while introducing the new
build-time option.

Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
---
 lib/igt.h         | 1 -
 lib/igt_frame.h   | 2 --
 lib/meson.build   | 6 +++---
 tools/meson.build | 4 ++--
 4 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/lib/igt.h b/lib/igt.h
index 95f60881..6d0ce175 100644
--- a/lib/igt.h
+++ b/lib/igt.h
@@ -28,7 +28,6 @@
 #include "i915_3d.h"
 #include "igt_aux.h"
 #include "igt_core.h"
-#include "igt_core.h"
 #include "igt_debugfs.h"
 #include "igt_draw.h"
 #include "igt_dummyload.h"
diff --git a/lib/igt_frame.h b/lib/igt_frame.h
index f44f57d7..5fd59edc 100644
--- a/lib/igt_frame.h
+++ b/lib/igt_frame.h
@@ -27,8 +27,6 @@
 #ifndef IGT_FRAME_H
 #define IGT_FRAME_H
 
-#include "config.h"
-
 #include <stdbool.h>
 
 bool igt_frame_dump_is_enabled(void);
diff --git a/lib/meson.build b/lib/meson.build
index a6dfc45a..3c51eab0 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -115,7 +115,7 @@ if libdrm_intel.found()
 	lib_deps += libdrm_intel
 else
 	lib_sources += 'stubs/drm/intel_bufmgr.c'
-	inc = [ inc, include_directories('stubs/drm') ]
+	inc += include_directories('stubs/drm')
 endif
 
 if libdrm_nouveau.found()
@@ -191,12 +191,12 @@ lib_igt = declare_dependency(link_with : lib_igt_build,
 
 igt_deps = [ lib_igt ] + lib_deps
 
-lin_igt_chipset_build = static_library('igt_chipset',
+lib_igt_chipset_build = static_library('igt_chipset',
                                        ['intel_chipset.c',
                                         'intel_device_info.c'],
                                        include_directories : inc)
 
-lib_igt_chipset = declare_dependency(link_with : lin_igt_chipset_build,
+lib_igt_chipset = declare_dependency(link_with : lib_igt_chipset_build,
                                      include_directories : inc)
 
 lib_igt_perf_build = static_library('igt_perf',
diff --git a/tools/meson.build b/tools/meson.build
index 106a7b04..95546b8a 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -1,11 +1,11 @@
-tools_progs_noisnt = [
+tools_progs_noinstall = [
 	'cnl_compute_wrpll',
 	'hsw_compute_wrpll',
 	'skl_compute_wrpll',
 	'skl_ddb_allocation',
 ]
 
-foreach prog : tools_progs_noisnt
+foreach prog : tools_progs_noinstall
 	executable(prog, prog + '.c',
 			dependencies : igt_deps,
 			install : false)
-- 
2.36.1
