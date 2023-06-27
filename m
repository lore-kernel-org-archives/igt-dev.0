Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A99F10E2E0
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jun 2023 10:59:19 +0000 (UTC)
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 27 Jun 2023 12:58:20 +0200
Message-Id: <de1528cb884ef2da5ecff84101f9dfc457901b8f.1687862551.git.karolina.stolarek@intel.com>
In-Reply-To: <cover.1687862551.git.karolina.stolarek@intel.com>
References: <cover.1687862551.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 3/3] tests/i915/i915_pm_rpm: Check
 command property instead of gen
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

Update submit_blt_cmd() function to check if a platform uses a long
version of XY_COLOR_BLT when building the command. Remove checks
related to the gen alone.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 tests/i915/i915_pm_rpm.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index dee44d71b..4ce83f27f 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -1492,20 +1492,24 @@ static void submit_blt_cmd(uint32_t dst_handle, int dst_size,
 	uint32_t batch_handle;
 	int batch_size = 8 * sizeof(uint32_t);
 	uint32_t batch_buf[batch_size];
+	bool cmd_extended;
 	struct drm_i915_gem_execbuffer2 execbuf = {};
 	struct drm_i915_gem_exec_object2 objs[2] = {{}, {}};
 	struct drm_i915_gem_relocation_entry relocs[1] = {{}};
 	struct drm_i915_gem_wait gem_wait;
 	uint64_t ahnd = get_reloc_ahnd(drm_fd, 0), dst_offset;
+	const struct intel_cmds_info *cmds_info = intel_get_cmds_info(ms_data.devid);
 
 	if (ahnd)
 		dst_offset = get_offset(ahnd, dst_handle, dst_size, 0);
 	else
 		dst_offset = *presumed_dst_offset;
 
+	cmd_extended = blt_cmd_has_property(cmds_info, XY_COLOR_BLT,
+					    BLT_CMD_EXTENDED);
 	i = 0;
 
-	if (intel_gen(ms_data.devid) >= 8)
+	if (cmd_extended)
 		batch_buf[i++] = XY_COLOR_BLT_CMD_NOLEN |
 				 XY_COLOR_BLT_WRITE_ALPHA |
 				 XY_COLOR_BLT_WRITE_RGB | 0x5;
@@ -1518,12 +1522,12 @@ static void submit_blt_cmd(uint32_t dst_handle, int dst_size,
 	batch_buf[i++] = ((y + height) << 16) | (x + width);
 	reloc_pos = i;
 	batch_buf[i++] = dst_offset;
-	if (intel_gen(ms_data.devid) >= 8)
+	if (cmd_extended)
 		batch_buf[i++] = dst_offset >> 32;
 	batch_buf[i++] = color;
 
 	batch_buf[i++] = MI_BATCH_BUFFER_END;
-	if (intel_gen(ms_data.devid) < 8)
+	if (!cmd_extended)
 		batch_buf[i++] = MI_NOOP;
 
 	igt_assert(i * sizeof(uint32_t) == batch_size);
-- 
2.25.1
