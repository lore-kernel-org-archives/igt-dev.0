Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1697E6E57E
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Apr 2021 02:00:59 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
Date: Tue,  6 Apr 2021 07:40:51 +0530
Message-Id: <20210406021051.24760-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_atomic : Added test description
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
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_atomic.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index 2965b350..df9c9df7 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -1104,6 +1104,8 @@ igt_main
 				      LOCAL_DRM_FORMAT_MOD_NONE, &fb);
 	}
 
+	igt_describe("Test for KMS atomic modesetting on overlay plane and ensure coherency between "
+		     "the legacy and atomic interfaces.");
 	igt_subtest("plane-overlay-legacy") {
 		igt_plane_t *overlay =
 			igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_OVERLAY);
@@ -1114,6 +1116,8 @@ igt_main
 		plane_overlay(pipe_obj, output, overlay);
 	}
 
+	igt_describe("Test for KMS atomic modesetting on primary plane and ensure coherency between "
+		     "the legacy and atomic interfaces.");
 	igt_subtest("plane-primary-legacy") {
 		atomic_setup(&display, pipe, output, primary, &fb);
 
@@ -1148,12 +1152,16 @@ igt_main
 		plane_immutable_zpos(&display, pipe_obj, output);
 	}
 
+	igt_describe("Test to ensure that DRM_MODE_ATOMIC_TEST_ONLY really only touches "
+		     "the free-standing state objects and nothing else.");
 	igt_subtest("test-only") {
 		atomic_clear(&display, pipe, primary, output);
 
 		test_only(pipe_obj, primary, output);
 	}
 
+	igt_describe("Test for KMS atomic modesetting on cursor plane and ensure coherency between "
+		     "legacy and atomic interfaces.");
 	igt_subtest("plane-cursor-legacy") {
 		igt_plane_t *cursor =
 			igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_CURSOR);
@@ -1164,30 +1172,37 @@ igt_main
 		plane_cursor(pipe_obj, output, cursor);
 	}
 
+	igt_describe("Test error handling when invalid plane parameters are passed");
 	igt_subtest("plane-invalid-params") {
 		atomic_setup(&display, pipe, output, primary, &fb);
 
 		plane_invalid_params(pipe_obj, output, primary, &fb);
 	}
 
+	igt_describe("Test error handling when invalid plane fence parameters are passed");
 	igt_subtest("plane-invalid-params-fence") {
 		atomic_setup(&display, pipe, output, primary, &fb);
 
 		plane_invalid_params_fence(pipe_obj, output, primary);
 	}
 
+	igt_describe("Test error handling when invalid crtc parameters are passed");
 	igt_subtest("crtc-invalid-params") {
 		atomic_setup(&display, pipe, output, primary, &fb);
 
 		crtc_invalid_params(pipe_obj, output, primary, &fb);
 	}
 
+	igt_describe("Test error handling when invalid crtc fence parameters are passed");
 	igt_subtest("crtc-invalid-params-fence") {
 		atomic_setup(&display, pipe, output, primary, &fb);
 
 		crtc_invalid_params_fence(pipe_obj, output, primary, &fb);
 	}
 
+	igt_describe("Test abuse the atomic ioctl directly in order to test "
+		     "various invalid conditions which the libdrm wrapper won't "
+		     "allow us to create.");
 	igt_subtest("atomic-invalid-params") {
 		atomic_setup(&display, pipe, output, primary, &fb);
 
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
