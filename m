Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53E1210EC75
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Apr 2023 07:19:15 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 28 Apr 2023 12:43:39 +0530
Message-Id: <20230428071350.2561575-37-bhanuprakash.modem@intel.com>
In-Reply-To: <20230428071350.2561575-1-bhanuprakash.modem@intel.com>
References: <20230428071350.2561575-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V5 36/47] tests/kms_getfb: Add XE support
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

Add XE driver support for kms tests.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_getfb.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/tests/kms_getfb.c b/tests/kms_getfb.c
index 813417e77..4adc7eee2 100644
--- a/tests/kms_getfb.c
+++ b/tests/kms_getfb.c
@@ -42,6 +42,7 @@
 #include "drm_fourcc.h"
 #include "i915/gem_create.h"
 #include "igt_device.h"
+#include "xe/xe_query.h"
 
 IGT_TEST_DESCRIPTION("Tests GETFB and GETFB2 ioctls.");
 
@@ -91,7 +92,6 @@ static void get_ccs_fb(int fd, struct drm_mode_fb_cmd2 *ret)
 	uint32_t devid;
 
 	igt_require(has_addfb2_iface(fd));
-	igt_require_intel(fd);
 	devid = intel_get_drm_devid(fd);
 
 	if (HAS_FLATCCS(devid)) {
@@ -265,7 +265,7 @@ static void test_duplicate_handles(int fd)
 		struct drm_mode_fb_cmd2 add_ccs = { };
 		struct drm_mode_fb_cmd get = { };
 
-		igt_require(is_i915_device(fd));
+		igt_require_i915(fd);
 		igt_require_f(!HAS_FLATCCS(intel_get_drm_devid(fd)),
 			      "skip because flat ccs has only one buffer.\n");
 
@@ -340,6 +340,7 @@ static void test_getfb2(int fd)
 		struct drm_mode_fb_cmd2 get = { };
 		int i;
 
+		igt_require_i915(fd);
 		get_ccs_fb(fd, &add_ccs);
 		igt_require(add_ccs.fb_id != 0);
 		get.fb_id = add_ccs.fb_id;
@@ -398,6 +399,9 @@ static void test_handle_protection(void) {
 	igt_fixture {
 		non_master_fd = drm_open_driver(DRIVER_ANY);
 
+		if (is_xe_device(non_master_fd))
+			xe_device_get(non_master_fd);
+
 		non_master_add.width = 1024;
 		non_master_add.height = 1024;
 		non_master_add.pixel_format = DRM_FORMAT_XRGB8888;
@@ -444,6 +448,11 @@ static void test_handle_protection(void) {
 	igt_fixture {
 		do_ioctl(non_master_fd, DRM_IOCTL_MODE_RMFB, &non_master_add.fb_id);
 		gem_close(non_master_fd, non_master_add.handles[0]);
+
+		if (is_xe_device(non_master_fd))
+			xe_device_get(non_master_fd);
+
+		close(non_master_fd);
 	}
 }
 
@@ -454,6 +463,9 @@ igt_main
 	igt_fixture {
 		fd = drm_open_driver_master(DRIVER_ANY);
 		igt_require(has_getfb_iface(fd));
+
+		if (is_xe_device(fd))
+			xe_device_get(fd);
 	}
 
 	igt_subtest_group
@@ -468,6 +480,10 @@ igt_main
 	igt_subtest_group
 		test_handle_protection();
 
-	igt_fixture
+	igt_fixture {
+		if (is_xe_device(fd))
+			xe_device_put(fd);
+
 		close(fd);
+	}
 }
-- 
2.40.0
