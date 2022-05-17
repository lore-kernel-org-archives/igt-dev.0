Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9773410E44B
 for <igt-dev@lists.freedesktop.org>; Tue, 17 May 2022 10:56:50 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 17 May 2022 16:24:48 +0530
Message-Id: <20220517105448.23117-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/kms_legacy_colorkey: Create
 dynamic subtests
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

Modified kms_legacy_colorkey to include dynamic test cases.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/i915/kms_legacy_colorkey.c | 50 ++++++++++++++++++++++----------
 1 file changed, 35 insertions(+), 15 deletions(-)

diff --git a/tests/i915/kms_legacy_colorkey.c b/tests/i915/kms_legacy_colorkey.c
index de9610a7..8c609d4f 100644
--- a/tests/i915/kms_legacy_colorkey.c
+++ b/tests/i915/kms_legacy_colorkey.c
@@ -38,33 +38,53 @@ static void test_plane(uint32_t plane_id, int expected_ret)
 	struct drm_intel_sprite_colorkey ckey = {
 		.plane_id = plane_id,
 	};
-
 	igt_assert(drmCommandWrite(drm_fd, DRM_I915_SET_SPRITE_COLORKEY, &ckey,
 				   sizeof(ckey)) == expected_ret);
 }
 
-igt_simple_main
+igt_main
 {
-	drm_fd = drm_open_driver_master(DRIVER_INTEL);
 
-	kmstest_set_vt_graphics_mode();
+	igt_fixture {
 
-	igt_display_require(&display, drm_fd);
+		drm_fd = drm_open_driver_master(DRIVER_INTEL);
 
-	for_each_pipe(&display, p) {
-		for_each_plane_on_pipe(&display, p, plane) {
-			bool is_valid = (plane->type == DRM_PLANE_TYPE_PRIMARY ||
-			                 plane->type == DRM_PLANE_TYPE_CURSOR);
-			test_plane(plane->drm_plane->plane_id,
-				   is_valid ? -ENOENT : 0);
+		kmstest_set_vt_graphics_mode();
 
-			max_id = max(max_id, plane->drm_plane->plane_id);
+		igt_display_require(&display, drm_fd);
+		for_each_pipe(&display, p) {
+			for_each_plane_on_pipe(&display, p, plane) {
+				max_id = max(max_id, plane->drm_plane->plane_id);
+			}
 		}
+
 	}
+	igt_describe("check valid and invalid plane ID's\n");
 
+	igt_subtest_with_dynamic("basic") {
+		for_each_pipe(&display, p) {
+			igt_dynamic_f("pipe-%s", kmstest_pipe_name(p)) {
+				for_each_plane_on_pipe(&display, p, plane) {
+					bool is_valid = (plane->type == DRM_PLANE_TYPE_PRIMARY ||
+							 plane->type == DRM_PLANE_TYPE_CURSOR);
+
+					test_plane(plane->drm_plane->plane_id,
+						   is_valid ? -ENOENT : 0);
+				}
+			}
+		}
+	}
 	/* try some invalid IDs too */
-	test_plane(0, -ENOENT);
-	test_plane(max_id + 1, -ENOENT);
+	igt_describe("check invalid plane id's zero and outrange\n");
+	igt_subtest_with_dynamic("invalid") {
+		igt_dynamic("zero")
+			test_plane(0, -ENOENT);
+		igt_dynamic("outrange")
+			test_plane(max_id + 1, -ENOENT);
+	}
 
-	igt_display_fini(&display);
+	igt_fixture {
+		igt_display_fini(&display);
+		close(drm_fd);
+	}
 }
-- 
2.25.1
