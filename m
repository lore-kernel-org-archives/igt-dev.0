Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE36410E53A
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Dec 2023 01:13:33 +0000 (UTC)
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: 
Subject: [PATCH i-g-t v5 4/6] lib/intel_blt: Update caching mode and pat_index
Date: Tue, 12 Dec 2023 05:13:13 -0800
Message-Id: <f390b82cfe8352f177e344433c1a8e83a478e8e5.1702386259.git.akshata.jahagirdar@intel.com>
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

The pat-index and caching mode for compression need to change to uc_comp in 
case of compression, else they just take the default value of pat_index.

Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
---
 lib/intel_blt.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 2abfa15af..82e723925 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -1797,7 +1797,8 @@ blt_create_object(const struct blt_copy_data *blt, uint32_t region,
 	uint64_t size = width * height * bpp / 8;
 	uint32_t stride = tiling == T_LINEAR ? width * 4 : width;
 	uint32_t handle;
-
+	uint8_t pat_index = DEFAULT_PAT_INDEX;
+	uint16_t cpu_caching;
 	igt_assert_f(blt->driver, "Driver isn't set, have you called blt_copy_init()?\n");
 
 	obj = calloc(1, sizeof(*obj));
@@ -1807,17 +1808,23 @@ blt_create_object(const struct blt_copy_data *blt, uint32_t region,
 	if (blt->driver == INTEL_DRIVER_XE) {
 		uint64_t flags = 0;
 
+		if (AT_LEAST_GEN(intel_get_drm_devid(blt->fd), 20) && compression) {
+			pat_index = intel_get_pat_idx_uc_comp(blt->fd);
+			cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
+		} else
+			cpu_caching = __xe_default_cpu_caching_from_placement(blt->fd, region);
+
 		if (create_mapping && region != system_memory(blt->fd))
 			flags |= DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
 
 		size = ALIGN(size, xe_get_default_alignment(blt->fd));
-		handle = xe_bo_create_flags(blt->fd, 0, size, region);
+		handle = xe_bo_create_caching(blt->fd, 0, size, region, flags, cpu_caching);
 	} else {
 		igt_assert(__gem_create_in_memory_regions(blt->fd, &handle,
 							  &size, region) == 0);
 	}
 
-	blt_set_object(obj, handle, size, region, mocs_index, DEFAULT_PAT_INDEX, tiling,
+	blt_set_object(obj, handle, size, region, mocs_index, pat_index, tiling,
 		       compression, compression_type);
 	blt_set_geom(obj, stride, 0, 0, width, height, 0, 0);
 
-- 
2.34.1
