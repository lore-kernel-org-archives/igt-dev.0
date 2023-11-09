Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2229B10E8DA
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Nov 2023 15:54:55 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  9 Nov 2023 15:53:33 +0000
Message-Id: <20231109155410.7-21-francois.dugast@intel.com>
In-Reply-To: <20231109155410.7-1-francois.dugast@intel.com>
References: <20231109155410.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 20/57] drm-uapi/xe: Remove unused inaccessible
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
index ea9309af7..5bf557d5a 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -396,11 +396,6 @@ struct drm_xe_query_gt {
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
index 6f1236a30..6b1be248c 100644
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
