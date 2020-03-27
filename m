Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E82E46EA29
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Mar 2020 13:07:14 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
Date: Fri, 27 Mar 2020 18:42:22 +0530
Message-Id: <20200327131222.26945-2-swati2.sharma@intel.com>
In-Reply-To: <20200327131222.26945-1-swati2.sharma@intel.com>
References: <20200327131222.26945-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/kms_atomic: Changed test names
 into standard convention
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

All the subtests in kms_atomic have test names in non-standard
convention, changing those to standard convention. '-' is the normal
delimeter in subtest names.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_atomic.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index aacd83c5..f80b5189 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -1098,7 +1098,7 @@ igt_main
 				      LOCAL_DRM_FORMAT_MOD_NONE, &fb);
 	}
 
-	igt_subtest("plane_overlay_legacy") {
+	igt_subtest("plane-overlay-legacy") {
 		igt_plane_t *overlay =
 			igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_OVERLAY);
 
@@ -1108,7 +1108,7 @@ igt_main
 		plane_overlay(pipe_obj, output, overlay);
 	}
 
-	igt_subtest("plane_primary_legacy") {
+	igt_subtest("plane-primary-legacy") {
 		atomic_setup(&display, pipe, output, primary, &fb);
 
 		plane_primary(pipe_obj, primary, &fb);
@@ -1116,7 +1116,7 @@ igt_main
 
 	igt_describe("Verify that the overlay plane can cover the primary one (and "\
 		     "vice versa) by changing their zpos property.");
-	igt_subtest("plane_primary_overlay_mutable_zpos") {
+	igt_subtest("plane-primary-overlay-mutable-zpos") {
 		uint32_t format_primary = DRM_FORMAT_ARGB8888;
 		uint32_t format_overlay = DRM_FORMAT_ARGB1555;
 
@@ -1137,18 +1137,18 @@ igt_main
 
 	igt_describe("Verify the reported zpos property of planes by making sure "\
 		     "only higher zpos planes cover the lower zpos ones.");
-	igt_subtest("plane_immutable_zpos") {
+	igt_subtest("plane-immutable-zpos") {
 		igt_output_set_pipe(output, pipe);
 		plane_immutable_zpos(&display, pipe_obj, output);
 	}
 
-	igt_subtest("test_only") {
+	igt_subtest("test-only") {
 		atomic_clear(&display, pipe, primary, output);
 
 		test_only(pipe_obj, primary, output);
 	}
 
-	igt_subtest("plane_cursor_legacy") {
+	igt_subtest("plane-cursor-legacy") {
 		igt_plane_t *cursor =
 			igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_CURSOR);
 
@@ -1158,31 +1158,31 @@ igt_main
 		plane_cursor(pipe_obj, output, cursor);
 	}
 
-	igt_subtest("plane_invalid_params") {
+	igt_subtest("plane-invalid-params") {
 		atomic_setup(&display, pipe, output, primary, &fb);
 
 		plane_invalid_params(pipe_obj, output, primary, &fb);
 	}
 
-	igt_subtest("plane_invalid_params_fence") {
+	igt_subtest("plane-invalid-params-fence") {
 		atomic_setup(&display, pipe, output, primary, &fb);
 
 		plane_invalid_params_fence(pipe_obj, output, primary);
 	}
 
-	igt_subtest("crtc_invalid_params") {
+	igt_subtest("crtc-invalid-params") {
 		atomic_setup(&display, pipe, output, primary, &fb);
 
 		crtc_invalid_params(pipe_obj, output, primary, &fb);
 	}
 
-	igt_subtest("crtc_invalid_params_fence") {
+	igt_subtest("crtc-invalid-params-fence") {
 		atomic_setup(&display, pipe, output, primary, &fb);
 
 		crtc_invalid_params_fence(pipe_obj, output, primary, &fb);
 	}
 
-	igt_subtest("atomic_invalid_params") {
+	igt_subtest("atomic-invalid-params") {
 		atomic_setup(&display, pipe, output, primary, &fb);
 
 		atomic_invalid_params(pipe_obj, primary, output, &fb);
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
