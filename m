Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F9710E2A1
 for <igt-dev@lists.freedesktop.org>; Mon, 22 May 2023 09:57:53 +0000 (UTC)
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 22 May 2023 11:57:14 +0200
Message-Id: <f2528001a96a33492973dc3cd21e3dc1ffd381e2.1684747649.git.karolina.stolarek@intel.com>
In-Reply-To: <cover.1684747649.git.karolina.stolarek@intel.com>
References: <cover.1684747649.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/4] tests/i915/i915_pm_rpm: Check command
 property instead of gen
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
index b23eba544..8656f5531 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -1489,20 +1489,24 @@ static void submit_blt_cmd(uint32_t dst_handle, int dst_size,
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
@@ -1515,12 +1519,12 @@ static void submit_blt_cmd(uint32_t dst_handle, int dst_size,
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
