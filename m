Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 273F510E266
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jun 2023 13:33:07 +0000 (UTC)
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 13 Jun 2023 19:07:11 +0530
Message-Id: <20230613133713.3315078-3-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230613133713.3315078-1-himal.prasad.ghimiray@intel.com>
References: <20230613133713.3315078-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 2/4] lib/igt_sysfs: Handling gt related sysfs uapi
 changes.
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

Patch https://patchwork.freedesktop.org/series/118927/
is moving gt sysfs parent under tile folder.

With the above patch path for sysfs changes:
from: /sys/class/drm/cardX/device/gtN/
to : /sys/class/drm/cardX/device/tileN/gtN

Adding xe_for_each_gt_under_each_tile macro to
access new path.

Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 lib/igt_sysfs.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index 2fb2303c..6c0ab617 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -78,6 +78,11 @@
 
 #define xe_for_each_tile for_each_sysfs_tile_dirfd
 
+/* FIXME: Need to revisit if GT indexing under TILE changes from KMD */
+#define xe_for_each_gt_under_each_tile(xe__, gt__, tile__) \
+	for (gt__ = 0, tile__ = 0 ; gt__ < xe_number_gt(xe__); \
+	     (xe_number_gt(xe__) == igt_sysfs_get_num_tiles(xe__)) ? ++gt__, ++tile__ : ++gt__)
+
 enum i915_attr_id {
 	RPS_ACT_FREQ_MHZ,
 	RPS_CUR_FREQ_MHZ,
-- 
2.25.1
