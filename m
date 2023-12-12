Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF83010E540
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Dec 2023 01:13:33 +0000 (UTC)
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: 
Subject: [PATCH i-g-t v5 2/6] lib/intel_blt: Update calculation of ccs_size
 and size_of_ctrl_copy
Date: Tue, 12 Dec 2023 05:13:11 -0800
Message-Id: <f8fb003fcc1f9119957e4f823fd7534479cfd406.1702386259.git.akshata.jahagirdar@intel.com>
In-Reply-To: <cover.1702386259.git.akshata.jahagirdar@intel.com>
References: <cover.1702386259.git.akshata.jahagirdar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, ayaz.siddiqui@intel.com,
 akshata.jahagirdar@intel.com, matthew.auld@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

The Main-to-CCS Ratio for XE2 has been changed to 512:1.
Update the CCS_RATIO macro to select relevant ratio based on platform.

Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
---
 lib/intel_blt.c | 15 +++++++++------
 lib/intel_blt.h |  2 +-
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 1116c978e..2abfa15af 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -948,15 +948,16 @@ int blt_block_copy(int fd,
 	return ret;
 }
 
-static uint16_t __ccs_size(const struct blt_ctrl_surf_copy_data *surf)
+static uint16_t __ccs_size(int fd, const struct blt_ctrl_surf_copy_data *surf)
 {
 	uint32_t src_size, dst_size;
+	uint16_t ccsratio = CCS_RATIO(fd);
 
 	src_size = surf->src.access_type == DIRECT_ACCESS ?
-				surf->src.size : surf->src.size / CCS_RATIO;
+				surf->src.size : surf->src.size / ccsratio;
 
 	dst_size = surf->dst.access_type == DIRECT_ACCESS ?
-				surf->dst.size : surf->dst.size / CCS_RATIO;
+				surf->dst.size : surf->dst.size / ccsratio;
 
 	igt_assert_f(src_size <= dst_size, "dst size must be >= src size for CCS copy\n");
 
@@ -1118,6 +1119,8 @@ uint64_t emit_blt_ctrl_surf_copy(int fd,
 	uint64_t dst_offset, src_offset, bb_offset, alignment;
 	uint32_t bbe = MI_BATCH_BUFFER_END;
 	uint32_t *bb;
+	uint16_t num_ccs_blocks = (ip_ver >= IP_VER(20, 0)) ? 
+				(xe_get_default_alignment(fd) / CCS_RATIO(fd)) : CCS_RATIO(fd);
 
 	igt_assert_f(ahnd, "ctrl-surf-copy supports softpin only\n");
 	igt_assert_f(surf, "ctrl-surf-copy requires data to do ctrl-surf-copy blit\n");
@@ -1136,7 +1139,7 @@ uint64_t emit_blt_ctrl_surf_copy(int fd,
 		data.xe2.dw00.dst_access_type = surf->dst.access_type;
 
 		/* Ensure dst has size capable to keep src ccs aux */
-		data.xe2.dw00.size_of_ctrl_copy = __ccs_size(surf) / CCS_RATIO - 1;
+		data.xe2.dw00.size_of_ctrl_copy = __ccs_size(fd, surf) / num_ccs_blocks - 1;
 		data.xe2.dw00.length = 0x3;
 
 		data.xe2.dw01.src_address_lo = src_offset;
@@ -1155,7 +1158,7 @@ uint64_t emit_blt_ctrl_surf_copy(int fd,
 		data.gen12.dw00.dst_access_type = surf->dst.access_type;
 
 		/* Ensure dst has size capable to keep src ccs aux */
-		data.gen12.dw00.size_of_ctrl_copy = __ccs_size(surf) / CCS_RATIO - 1;
+		data.gen12.dw00.size_of_ctrl_copy = __ccs_size(fd, surf) / num_ccs_blocks - 1;
 		data.gen12.dw00.length = 0x3;
 
 		data.gen12.dw01.src_address_lo = src_offset;
@@ -1808,7 +1811,7 @@ blt_create_object(const struct blt_copy_data *blt, uint32_t region,
 			flags |= DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
 
 		size = ALIGN(size, xe_get_default_alignment(blt->fd));
-		handle = xe_bo_create(blt->fd, 0, size, region, flags);
+		handle = xe_bo_create_flags(blt->fd, 0, size, region);
 	} else {
 		igt_assert(__gem_create_in_memory_regions(blt->fd, &handle,
 							  &size, region) == 0);
diff --git a/lib/intel_blt.h b/lib/intel_blt.h
index 5934ccd67..69eb2195f 100644
--- a/lib/intel_blt.h
+++ b/lib/intel_blt.h
@@ -52,7 +52,7 @@
 #include "igt.h"
 #include "intel_cmds_info.h"
 
-#define CCS_RATIO 256
+#define CCS_RATIO(xe) (AT_LEAST_GEN(intel_get_drm_devid(xe), 20) ? 512 : 256)
 
 enum blt_color_depth {
 	CD_8bit,
-- 
2.34.1
