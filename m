Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C5F010EA0B
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Nov 2023 14:45:11 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:43:49 +0000
Message-Id: <20231103144359.7-55-francois.dugast@intel.com>
In-Reply-To: <20231103144359.7-1-francois.dugast@intel.com>
References: <20231103144359.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 54/64] drm-uapi/xe: Add Tile ID information to
 the GT info query
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

Aligns with kernel commit ("drm/xe/uapi: Add Tile ID information to the GT info query")

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/drm-uapi/xe_drm.h | 2 ++
 tests/intel/xe_query.c    | 1 +
 2 files changed, 3 insertions(+)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index fea729aad..17b25f66d 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -426,6 +426,8 @@ struct drm_xe_query_gt {
 #define DRM_XE_QUERY_GT_TYPE_MEDIA		1
 	/** @type: GT type: Main or Media */
 	__u16 type;
+	/** @tile_id: Tile ID where this GT lives (Information only) */
+	__u16 tile_id;
 	/** @gt_id: Unique ID of this GT within the PCI Device */
 	__u16 gt_id;
 	/** @reference_clock: A clock frequency for timestamp */
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 4ed4d6cdc..f67b2db23 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -306,6 +306,7 @@ test_query_gt_list(int fd)
 
 	for (i = 0; i < gt_list->num_gt; i++) {
 		igt_info("type: %d\n", gt_list->gt_list[i].type);
+		igt_info("tile_id: %d\n", gt_list->gt_list[i].tile_id);
 		igt_info("gt_id: %d\n", gt_list->gt_list[i].gt_id);
 		igt_info("reference_clock: %u\n", gt_list->gt_list[i].reference_clock);
 	}
-- 
2.34.1
