Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B5610EAFF
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Feb 2023 14:12:29 +0000 (UTC)
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  9 Feb 2023 15:12:07 +0100
Message-Id: <23aedeff0bff9621829448b7fcc534a07f56646a.1675950055.git.karolina.stolarek@intel.com>
In-Reply-To: <cover.1675950055.git.karolina.stolarek@intel.com>
References: <cover.1675950055.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 4/9] lib/intel_device_info: Update name
 for cmds_info getter
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

cmds_info, previously referred as blt_tiling, is not just limited
to blitter commands. Keeping such reference in intel_get_blt_info()
is misleading and confusing. Update the name of the function,
together with the macro that uses it, to make their purpose clear.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 lib/i915/i915_blt.c     | 10 +++++-----
 lib/intel_chipset.h     |  2 +-
 lib/intel_device_info.c |  4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/lib/i915/i915_blt.c b/lib/i915/i915_blt.c
index dace57b3..efc280f9 100644
--- a/lib/i915/i915_blt.c
+++ b/lib/i915/i915_blt.c
@@ -14,7 +14,7 @@
 #include "i915_blt.h"
 
 #define BITRANGE(start, end) (end - start + 1)
-#define GET_BLT_INFO(__fd) intel_get_blt_info(intel_get_drm_devid(__fd))
+#define GET_CMDS_INFO(__fd) intel_get_cmds_info(intel_get_drm_devid(__fd))
 
 enum blt_special_mode {
 	SM_NONE,
@@ -265,7 +265,7 @@ bool blt_cmd_supports_tiling(const struct intel_cmds_info *cmds_info,
  */
 bool blt_has_block_copy(int i915)
 {
-	const struct intel_cmds_info *cmds_info = GET_BLT_INFO(i915);
+	const struct intel_cmds_info *cmds_info = GET_CMDS_INFO(i915);
 
 	return blt_supports_command(cmds_info, XY_BLOCK_COPY);
 }
@@ -281,7 +281,7 @@ bool blt_has_block_copy(int i915)
  */
 bool blt_has_fast_copy(int i915)
 {
-	const struct intel_cmds_info *cmds_info = GET_BLT_INFO(i915);
+	const struct intel_cmds_info *cmds_info = GET_CMDS_INFO(i915);
 
 	return blt_supports_command(cmds_info, XY_FAST_COPY);
 }
@@ -298,7 +298,7 @@ bool blt_has_fast_copy(int i915)
  */
 bool blt_fast_copy_supports_tiling(int i915, enum blt_tiling_type tiling)
 {
-	const struct intel_cmds_info *cmds_info = GET_BLT_INFO(i915);
+	const struct intel_cmds_info *cmds_info = GET_CMDS_INFO(i915);
 
 	return blt_cmd_supports_tiling(cmds_info, XY_FAST_COPY, tiling);
 }
@@ -315,7 +315,7 @@ bool blt_fast_copy_supports_tiling(int i915, enum blt_tiling_type tiling)
  */
 bool blt_block_copy_supports_tiling(int i915, enum blt_tiling_type tiling)
 {
-	const struct intel_cmds_info *cmds_info = GET_BLT_INFO(i915);
+	const struct intel_cmds_info *cmds_info = GET_CMDS_INFO(i915);
 
 	return blt_cmd_supports_tiling(cmds_info, XY_BLOCK_COPY, tiling);
 }
diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index 0ae59adc..3de67483 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -94,7 +94,7 @@ struct intel_device_info {
 
 const struct intel_device_info *intel_get_device_info(uint16_t devid) __attribute__((pure));
 
-const struct intel_cmds_info *intel_get_blt_info(uint16_t devid) __attribute__((pure));
+const struct intel_cmds_info *intel_get_cmds_info(uint16_t devid) __attribute__((pure));
 unsigned intel_gen(uint16_t devid) __attribute__((pure));
 unsigned intel_graphics_ver(uint16_t devid) __attribute__((pure));
 unsigned intel_display_ver(uint16_t devid) __attribute__((pure));
diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index 174e2b6f..2cd93c43 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -613,7 +613,7 @@ out:
 }
 
 /**
- * intel_get_blt_info:
+ * intel_get_cmds_info:
  * @devid: pci device id
  *
  * Looks up information on copy commands and tiling formats supported
@@ -622,7 +622,7 @@ out:
  * Returns:
  * The associated intel_cmds_info, NULL if no such information is found
  */
-const struct intel_cmds_info *intel_get_blt_info(uint16_t devid)
+const struct intel_cmds_info *intel_get_cmds_info(uint16_t devid)
 {
 	const struct intel_device_info *dev_info;
 
-- 
2.25.1
