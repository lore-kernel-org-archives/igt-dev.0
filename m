Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 681A410F75A
 for <igt-dev@lists.freedesktop.org>; Sun, 14 Aug 2022 18:12:09 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun, 14 Aug 2022 23:38:20 +0530
Message-Id: <20220814180908.2553394-4-bhanuprakash.modem@intel.com>
In-Reply-To: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
References: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 03/51] tests/kms_atomic: Add support for Bigjoiner
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

This patch will add a check to Skip the subtest if a selected pipe/output
combo won't support Bigjoiner or 8K mode.

Example:
* Pipe-D wont support a mode > 5K
* To use 8K mode on a pipe then consecutive pipe must be available & free.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_atomic.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index 253829f2..fd20b91f 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -1265,6 +1265,9 @@ static void atomic_plane_damage(igt_pipe_t *pipe, igt_plane_t *plane, struct igt
 
 static void atomic_setup(igt_display_t *display, enum pipe pipe, igt_output_t *output, igt_plane_t *primary, struct igt_fb *fb)
 {
+	igt_info("Using (pipe %s + %s) to run the subtest.\n",
+		 kmstest_pipe_name(pipe), igt_output_name(output));
+
 	igt_output_set_pipe(output, pipe);
 	igt_plane_set_fb(primary, fb);
 
@@ -1293,6 +1296,7 @@ igt_main
 	igt_plane_t *primary = NULL;
 	drmModeModeInfo *mode;
 	struct igt_fb fb;
+	bool valid_config = false;
 
 	igt_fixture {
 		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
@@ -1303,8 +1307,15 @@ igt_main
 		igt_require(display.is_atomic);
 		igt_display_require_output(&display);
 
-		for_each_pipe_with_valid_output(&display, pipe, output)
-			break;
+		for_each_pipe_with_valid_output(&display, pipe, output) {
+			igt_output_set_pipe(output, pipe);
+			if (igt_test_constraint(&display)) {
+				valid_config = true;
+				break;
+			}
+			igt_output_set_pipe(output, PIPE_NONE);
+		}
+		igt_require(valid_config);
 
 		pipe_obj = &display.pipes[pipe];
 		primary = igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_PRIMARY);
@@ -1342,9 +1353,12 @@ igt_main
 	igt_subtest("plane-primary-overlay-mutable-zpos") {
 		uint32_t format_primary = DRM_FORMAT_ARGB8888;
 		uint32_t format_overlay = DRM_FORMAT_ARGB1555;
+		igt_plane_t *overlay;
 
-		igt_plane_t *overlay =
-			igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_OVERLAY);
+		igt_info("Using (pipe %s + %s) to run the subtest.\n",
+			 kmstest_pipe_name(pipe), igt_output_name(output));
+
+		overlay = igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_OVERLAY);
 		igt_require(overlay);
 
 		igt_require(igt_plane_has_prop(primary, IGT_PLANE_ZPOS));
@@ -1361,6 +1375,9 @@ igt_main
 	igt_describe("Verify the reported zpos property of planes by making sure "\
 		     "only higher zpos planes cover the lower zpos ones.");
 	igt_subtest("plane-immutable-zpos") {
+		igt_info("Using (pipe %s + %s) to run the subtest.\n",
+			 kmstest_pipe_name(pipe), igt_output_name(output));
+
 		igt_output_set_pipe(output, pipe);
 		plane_immutable_zpos(&display, pipe_obj, output);
 	}
@@ -1370,6 +1387,9 @@ igt_main
 	igt_subtest("test-only") {
 		atomic_clear(&display, pipe, primary, output);
 
+		igt_info("Using (pipe %s + %s) to run the subtest.\n",
+			 kmstest_pipe_name(pipe), igt_output_name(output));
+
 		test_only(pipe_obj, primary, output);
 	}
 
-- 
2.35.1
