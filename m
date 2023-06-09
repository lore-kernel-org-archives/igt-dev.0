Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D4E410E69D
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Jun 2023 13:01:36 +0000 (UTC)
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  9 Jun 2023 15:01:27 +0200
Message-Id: <20230609130128.2197571-1-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/i915/mocs: Move mocs library to
 'lib' folder
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

Since mocs are driver agnostic and are currently used in driver agnostic
code, move them to the 'lib' folder and get rid of i915 references.

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
---
 lib/igt_draw.c                 | 2 +-
 lib/{i915 => }/intel_mocs.c    | 9 ++++-----
 lib/{i915 => }/intel_mocs.h    | 0
 lib/meson.build                | 2 +-
 tests/i915/gem_ccs.c           | 2 +-
 tests/i915/gem_exercise_blt.c  | 2 +-
 tests/i915/gem_lmem_swapping.c | 2 +-
 7 files changed, 9 insertions(+), 10 deletions(-)
 rename lib/{i915 => }/intel_mocs.c (89%)
 rename lib/{i915 => }/intel_mocs.h (100%)

diff --git a/lib/igt_draw.c b/lib/igt_draw.c
index a5c0cbbf..6f362994 100644
--- a/lib/igt_draw.c
+++ b/lib/igt_draw.c
@@ -30,13 +30,13 @@
 #include "intel_bufops.h"
 #include "intel_batchbuffer.h"
 #include "intel_chipset.h"
+#include "intel_mocs.h"
 #include "igt_core.h"
 #include "igt_fb.h"
 #include "ioctl_wrappers.h"
 #include "i830_reg.h"
 #include "i915/gem_create.h"
 #include "i915/gem_mman.h"
-#include "i915/intel_mocs.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 
diff --git a/lib/i915/intel_mocs.c b/lib/intel_mocs.c
similarity index 89%
rename from lib/i915/intel_mocs.c
rename to lib/intel_mocs.c
index 95f0fbde..cf3b8e4f 100644
--- a/lib/i915/intel_mocs.c
+++ b/lib/intel_mocs.c
@@ -4,7 +4,6 @@
  */
 
 #include "igt.h"
-#include "i915/gem.h"
 #include "intel_mocs.h"
 
 #define DG1_MOCS_UC_IDX				1
@@ -18,12 +17,12 @@
 #define XY_BLOCK_COPY_BLT_MOCS_SHIFT		21
 #define XY_CTRL_SURF_COPY_BLT_MOCS_SHIFT	25
 
-struct drm_i915_mocs_index {
+struct drm_intel_mocs_index {
 	uint8_t uc_index;
 	uint8_t wb_index;
 };
 
-static void get_mocs_index(int fd, struct drm_i915_mocs_index *mocs)
+static void get_mocs_index(int fd, struct drm_intel_mocs_index *mocs)
 {
 	uint16_t devid = intel_get_drm_devid(fd);
 
@@ -58,7 +57,7 @@ static void get_mocs_index(int fd, struct drm_i915_mocs_index *mocs)
 
 uint8_t intel_get_wb_mocs(int fd)
 {
-	struct drm_i915_mocs_index mocs;
+	struct drm_intel_mocs_index mocs;
 
 	get_mocs_index(fd, &mocs);
 	return mocs.wb_index << 1;
@@ -66,7 +65,7 @@ uint8_t intel_get_wb_mocs(int fd)
 
 uint8_t intel_get_uc_mocs(int fd)
 {
-	struct drm_i915_mocs_index mocs;
+	struct drm_intel_mocs_index mocs;
 
 	get_mocs_index(fd, &mocs);
 	return mocs.uc_index << 1;
diff --git a/lib/i915/intel_mocs.h b/lib/intel_mocs.h
similarity index 100%
rename from lib/i915/intel_mocs.h
rename to lib/intel_mocs.h
diff --git a/lib/meson.build b/lib/meson.build
index 55efdc83..ad5d999d 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -13,7 +13,6 @@ lib_sources = [
 	'i915/gem_vm.c',
 	'i915/intel_decode.c',
 	'i915/intel_memory_region.c',
-	'i915/intel_mocs.c',
 	'i915/intel_cmds_info.c',
 	'i915/i915_blt.c',
 	'i915/i915_crc.c',
@@ -60,6 +59,7 @@ lib_sources = [
 	'intel_ctx.c',
 	'intel_device_info.c',
 	'intel_mmio.c',
+	'intel_mocs.c',
 	'ioctl_wrappers.c',
 	'media_spin.c',
 	'media_fill.c',
diff --git a/tests/i915/gem_ccs.c b/tests/i915/gem_ccs.c
index ff6504b3..d38ab49a 100644
--- a/tests/i915/gem_ccs.c
+++ b/tests/i915/gem_ccs.c
@@ -14,7 +14,7 @@
 #include "i915/gem_create.h"
 #include "lib/intel_chipset.h"
 #include "i915/i915_blt.h"
-#include "i915/intel_mocs.h"
+#include "intel_mocs.h"
 /**
  * TEST: gem ccs
  * Description: Exercise gen12 blitter with and without flatccs compression
diff --git a/tests/i915/gem_exercise_blt.c b/tests/i915/gem_exercise_blt.c
index 3287ced7..89f89d21 100644
--- a/tests/i915/gem_exercise_blt.c
+++ b/tests/i915/gem_exercise_blt.c
@@ -9,7 +9,7 @@
 #include "i915/gem_create.h"
 #include "lib/intel_chipset.h"
 #include "i915/i915_blt.h"
-#include "i915/intel_mocs.h"
+#include "intel_mocs.h"
 /**
  * TEST: gem exercise blt
  * Description: Exercise blitter commands
diff --git a/tests/i915/gem_lmem_swapping.c b/tests/i915/gem_lmem_swapping.c
index 6f1340ba..8211edbe 100644
--- a/tests/i915/gem_lmem_swapping.c
+++ b/tests/i915/gem_lmem_swapping.c
@@ -23,7 +23,7 @@
 #include <sys/wait.h>
 #include "drm.h"
 #include "i915/i915_blt.h"
-#include "i915/intel_mocs.h"
+#include "intel_mocs.h"
 /**
  * TEST: gem lmem swapping
  * Description: Exercise local memory swapping.
-- 
2.40.1
