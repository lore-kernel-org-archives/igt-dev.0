Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A8B489CB3
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Nov 2023 15:52:29 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 10 Nov 2023 15:52:08 +0000
Message-Id: <20231110155211.7-5-francois.dugast@intel.com>
In-Reply-To: <20231110155211.7-1-francois.dugast@intel.com>
References: <20231110155211.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v1 4/7] drm-uapi/xe: Remove unused inaccessible
 memory region
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

Align with commit ("drm/xe/uapi: Remove unused inaccessible memory region")

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/drm-uapi/xe_drm.h | 5 -----
 tests/intel/xe_query.c    | 2 --
 2 files changed, 7 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 1d8dc1b9c..68317a82e 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -360,11 +360,6 @@ struct drm_xe_query_gt {
 	 * they live on a different GPU/Tile.
 	 */
 	__u64 slow_mem_regions;
-	/**
-	 * @inaccessible_mem_regions: Bit mask of instances from
-	 * drm_xe_query_mem_usage that is not accessible by this GT at all.
-	 */
-	__u64 inaccessible_mem_regions;
 	/** @reserved: Reserved */
 	__u64 reserved[8];
 };
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 2cff75414..e6258ff01 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -285,8 +285,6 @@ test_query_gt_list(int fd)
 		       gt_list->gt_list[i].native_mem_regions);
 		igt_info("slow_mem_regions: 0x%016llx\n",
 		       gt_list->gt_list[i].slow_mem_regions);
-		igt_info("inaccessible_mem_regions: 0x%016llx\n",
-		       gt_list->gt_list[i].inaccessible_mem_regions);
 	}
 }
 
-- 
2.34.1
