Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE81110E106
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jun 2023 11:46:15 +0000 (UTC)
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 23 Jun 2023 17:19:44 +0530
Message-Id: <20230623114946.3803540-3-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230623114946.3803540-1-himal.prasad.ghimiray@intel.com>
References: <20230623114946.3803540-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 2/4] lib/igt_sysfs: Handling gt related sysfs
 uapi changes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Upadhyay <tejas.upadhyay@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Patch https://patchwork.freedesktop.org/series/118927/
is moving gt sysfs parent under tile folder.

With the above patch path for sysfs changes:
from: /sys/class/drm/cardX/device/gtN/
to : /sys/class/drm/cardX/device/tileN/gtN

Adding xe_for_each_gt_under_each_tile macro to
access new path.

v2:
- Calculate number of tiles once within iterator. (Rahul)

Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Upadhyay <tejas.upadhyay@intel.com>
Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 lib/igt_sysfs.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index de2c9a86..42bf2741 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -80,6 +80,12 @@
 
 #define xe_for_each_tile for_each_sysfs_tile_dirfd
 
+/* FIXME: Need to revisit if GT indexing under TILE changes from KMD */
+#define xe_for_each_gt_under_each_tile(xe__, gt__, tile__, tile_cnt__) \
+	for (gt__ = 0, tile__ = 0, tile_cnt__ = igt_sysfs_get_num_tiles(xe__) ; \
+	     gt__ < xe_number_gt(xe__); \
+	     (xe_number_gt(xe__) == tile_cnt__) ? ++gt__, ++tile__ : ++gt__)
+
 enum i915_attr_id {
 	RPS_ACT_FREQ_MHZ,
 	RPS_CUR_FREQ_MHZ,
-- 
2.25.1
