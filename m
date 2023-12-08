Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C627D10E1A7
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Dec 2023 00:30:03 +0000 (UTC)
From: Matt Roper <matthew.d.roper@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 2/2] tests/xe_query: Query and sanity-check GT ip
 versions
Date: Thu,  7 Dec 2023 16:29:44 -0800
Message-ID: <20231208002944.1290951-3-matthew.d.roper@intel.com>
In-Reply-To: <20231208002944.1290951-1-matthew.d.roper@intel.com>
References: <20231208002944.1290951-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Update the query test to include the GT's IP version in the output and
to also perform some simple sanity checks on the version received.  We
don't want to try to match any specific version numbers (since we expect
new versions to show up in the future), but we do know that the uapi
should never return version numbers older than 12.70 for the primary GT
or 13.00 for the media GT since those were the first IP versions to
include GMD_ID support.  We also know that MTL/ARL are the only pre-Xe2
platforms to support GMD_ID, so if we're not running on MTL/ARL, the
version numbers must always be 20.00 or greater.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 tests/intel/xe_query.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 338ef6151..0e66b2eec 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -259,6 +259,7 @@ test_query_mem_regions(int fd)
 static void
 test_query_gt_list(int fd)
 {
+	uint16_t dev_id = intel_get_drm_devid(fd);
 	struct drm_xe_query_gt_list *gt_list;
 	struct drm_xe_device_query query = {
 		.extensions = 0,
@@ -278,13 +279,40 @@ test_query_gt_list(int fd)
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
 
 	for (i = 0; i < gt_list->num_gt; i++) {
+		int verx100 = 100 * gt_list->gt_list[i].ip_ver_major +
+			gt_list->gt_list[i].ip_ver_minor;
+
 		igt_info("type: %d\n", gt_list->gt_list[i].type);
 		igt_info("gt_id: %d\n", gt_list->gt_list[i].gt_id);
+		igt_info("IP version: %d.%02d, stepping %d\n",
+			 gt_list->gt_list[i].ip_ver_major,
+			 gt_list->gt_list[i].ip_ver_minor,
+			 gt_list->gt_list[i].ip_ver_rev);
 		igt_info("reference_clock: %u\n", gt_list->gt_list[i].reference_clock);
 		igt_info("near_mem_regions: 0x%016llx\n",
 		       gt_list->gt_list[i].near_mem_regions);
 		igt_info("far_mem_regions: 0x%016llx\n",
 		       gt_list->gt_list[i].far_mem_regions);
+
+		/* Sanity check IP version. */
+		if (verx100) {
+			/*
+			 * First GMD_ID platforms had graphics 12.70 and media
+			 * 13.00 so we should never see non-zero values lower
+			 * than those.
+			 */
+			if (gt_list->gt_list[i].type == DRM_XE_QUERY_GT_TYPE_MEDIA)
+				igt_assert_lte(1300, verx100);
+			else
+				igt_assert_lte(1270, verx100);
+
+			/*
+			 * Aside from MTL/ARL, all version numbers should be
+			 * 20.00 or higher.
+			 */
+			if (!IS_METEORLAKE(dev_id))
+				igt_assert_lte(20, gt_list->gt_list[i].ip_ver_major);
+		}
 	}
 }
 
-- 
2.43.0
