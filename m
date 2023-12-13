Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1008910E722
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Dec 2023 07:55:31 +0000 (UTC)
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: 
Subject: [PATCH i-g-t v6 4/5] lib/intel_blt: Update caching mode and pat_index
Date: Wed, 13 Dec 2023 11:55:08 -0800
Message-Id: <91ba0ce1de4335d879bf5582a0e2ded19a8de406.1702496855.git.akshata.jahagirdar@intel.com>
In-Reply-To: <cover.1702496855.git.akshata.jahagirdar@intel.com>
References: <cover.1702496855.git.akshata.jahagirdar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The pat-index and caching mode for compression need to change to uc_comp in case
of compression, else they just take the default value of pat_index and caching.

Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 lib/intel_blt.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 1be289ad6..e41e261ea 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -1797,6 +1797,7 @@ blt_create_object(const struct blt_copy_data *blt, uint32_t region,
 	uint64_t size = width * height * bpp / 8;
 	uint32_t stride = tiling == T_LINEAR ? width * 4 : width;
 	uint32_t handle;
+	uint8_t pat_index = DEFAULT_PAT_INDEX;
 
 	igt_assert_f(blt->driver, "Driver isn't set, have you called blt_copy_init()?\n");
 
@@ -1806,18 +1807,24 @@ blt_create_object(const struct blt_copy_data *blt, uint32_t region,
 
 	if (blt->driver == INTEL_DRIVER_XE) {
 		uint64_t flags = 0;
+		uint16_t cpu_caching = __xe_default_cpu_caching(blt->fd, region, flags);
 
 		if (create_mapping && region != system_memory(blt->fd))
 			flags |= DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
 
+		if (AT_LEAST_GEN(intel_get_drm_devid(blt->fd), 20) && compression) {
+			pat_index = intel_get_pat_idx_uc_comp(blt->fd);
+			cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
+		}
+
 		size = ALIGN(size, xe_get_default_alignment(blt->fd));
-		handle = xe_bo_create(blt->fd, 0, size, region, flags);
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
