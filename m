Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5820D11B541
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jun 2022 15:01:38 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 30 Jun 2022 20:28:16 +0530
Message-Id: <20220630145816.68461-2-mohammed.thasleem@intel.com>
In-Reply-To: <20220630145816.68461-1-mohammed.thasleem@intel.com>
References: <20220630145816.68461-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 1/1] tests/i915/kms_legacy_colorkey: Create
 dynamic subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: nidhi1.gupta@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Modified kms_legacy_colorkey to include dynamic test cases.

v2: Updated igt_dynamic subtest names of invalid-plane.
v3: minor changes.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/i915/kms_legacy_colorkey.c | 49 +++++++++++++++++++++++---------
 1 file changed, 35 insertions(+), 14 deletions(-)

diff --git a/tests/i915/kms_legacy_colorkey.c b/tests/i915/kms_legacy_colorkey.c
index de9610a7..27ad7a86 100644
--- a/tests/i915/kms_legacy_colorkey.c
+++ b/tests/i915/kms_legacy_colorkey.c
@@ -43,28 +43,49 @@ static void test_plane(uint32_t plane_id, int expected_ret)
 				   sizeof(ckey)) == expected_ret);
 }
 
-igt_simple_main
+igt_main
 {
-	drm_fd = drm_open_driver_master(DRIVER_INTEL);
+	igt_fixture {
+		drm_fd = drm_open_driver_master(DRIVER_INTEL);
 
-	kmstest_set_vt_graphics_mode();
+		kmstest_set_vt_graphics_mode();
 
-	igt_display_require(&display, drm_fd);
+		igt_display_require(&display, drm_fd);
+		for_each_pipe(&display, p) {
+			for_each_plane_on_pipe(&display, p, plane) {
+				max_id = max(max_id, plane->drm_plane->plane_id);
+			}
+		}
+
+	}
 
-	for_each_pipe(&display, p) {
-		for_each_plane_on_pipe(&display, p, plane) {
-			bool is_valid = (plane->type == DRM_PLANE_TYPE_PRIMARY ||
-			                 plane->type == DRM_PLANE_TYPE_CURSOR);
-			test_plane(plane->drm_plane->plane_id,
-				   is_valid ? -ENOENT : 0);
+	igt_describe("check valid plane ID's\n");
+	igt_subtest_with_dynamic("valid-plane") {
+		for_each_pipe(&display, p) {
+			igt_dynamic_f("pipe-%s", kmstest_pipe_name(p)) {
+				for_each_plane_on_pipe(&display, p, plane) {
+					bool is_valid = (plane->type == DRM_PLANE_TYPE_PRIMARY ||
+							 plane->type == DRM_PLANE_TYPE_CURSOR);
 
-			max_id = max(max_id, plane->drm_plane->plane_id);
+					test_plane(plane->drm_plane->plane_id,
+						   is_valid ? -ENOENT : 0);
+					max_id = max(max_id, plane->drm_plane->plane_id);
+				}
+			}
 		}
 	}
 
 	/* try some invalid IDs too */
-	test_plane(0, -ENOENT);
-	test_plane(max_id + 1, -ENOENT);
+	igt_describe("check invalid plane id's, zero and outrange\n");
+	igt_subtest_with_dynamic("invalid-plane") {
+		igt_dynamic("zero-id")
+			test_plane(0, -ENOENT);
+		igt_dynamic("outrange-id")
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
