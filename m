Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60DF710E041
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Mar 2023 05:33:11 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 27 Mar 2023 22:33:03 -0700
Message-Id: <20230328053303.26627-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/xe/xe_guc_pc: Skip RC6 tests for PVC
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

The Pontevecchio (PVC) platform doesn't have rc6 support yet.
Skip rc6_on_idle and rc0_on_exec subtests for PVC.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/xe/xe_guc_pc.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/tests/xe/xe_guc_pc.c b/tests/xe/xe_guc_pc.c
index 60c93288b..9fc2429d8 100644
--- a/tests/xe/xe_guc_pc.c
+++ b/tests/xe/xe_guc_pc.c
@@ -375,6 +375,38 @@ static bool in_rc6(int sysfs, int gt_id)
 	return strcmp(rc, "rc6") == 0;
 }
 
+static bool is_rc6_supported(int fd)
+{
+	struct drm_xe_query_config *config;
+	struct drm_xe_device_query query = {
+		.query = DRM_XE_DEVICE_QUERY_CONFIG,
+	};
+	uint16_t devid;
+
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+
+	config = malloc(query.size);
+	igt_assert(config);
+
+	query.data = to_user_pointer(config);
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+
+	/* No rc6 support yet on Pontevecchio */
+	devid = config->info[XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff;
+	return !(
+		devid == 0x0BD0 ||
+		devid == 0x0BD1 ||
+		devid == 0x0BD2 ||
+		devid == 0x0BD5 ||
+		devid == 0x0BD6 ||
+		devid == 0x0BD7 ||
+		devid == 0x0BD8 ||
+		devid == 0x0BD9 ||
+		devid == 0x0BDA ||
+		devid == 0x0BDB
+		);
+}
+
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -467,12 +499,14 @@ igt_main
 	}
 
 	igt_subtest("rc6_on_idle") {
+		igt_skip_on(!is_rc6_supported(fd));
 		xe_for_each_gt(fd, gt) {
 			assert(igt_wait(in_rc6(sysfs, gt), 1000, 1));
 		}
 	}
 
 	igt_subtest("rc0_on_exec") {
+		igt_skip_on(!is_rc6_supported(fd));
 		xe_for_each_gt(fd, gt) {
 			assert(igt_wait(in_rc6(sysfs, gt), 1000, 1));
 			xe_for_each_hw_engine(fd, hwe)
-- 
2.21.0.rc0.32.g243a4c7e27
