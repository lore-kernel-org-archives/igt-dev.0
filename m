Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5DAA10E2E0
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jun 2023 12:20:02 +0000 (UTC)
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 27 Jun 2023 17:53:03 +0530
Message-Id: <20230627122305.4097852-3-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230627122305.4097852-1-himal.prasad.ghimiray@intel.com>
References: <20230627122305.4097852-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 2/4] lib/igt_sysfs: Handling gt related sysfs
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

v3:
- Drop usage of local variable for tilecount.
- Change order of tile and gt. (Ashutosh)

Reviewed-by: Upadhyay <tejas.upadhyay@intel.com>
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
index de2c9a86..e4a0451b 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -80,6 +80,12 @@
 
 #define xe_for_each_tile for_each_sysfs_tile_dirfd
 
+/* FIXME: Need to revisit if GT indexing under TILE changes from KMD */
+#define xe_for_each_gt_under_each_tile(xe__, tile__, gt__) \
+	for (gt__ = 0, tile__ = 0; \
+	     gt__ < xe_number_gt(xe__); \
+	     (xe_number_gt(xe__) == igt_sysfs_get_num_tiles(xe__)) ? ++gt__, ++tile__ : ++gt__)
+
 enum i915_attr_id {
 	RPS_ACT_FREQ_MHZ,
 	RPS_CUR_FREQ_MHZ,
-- 
2.25.1
