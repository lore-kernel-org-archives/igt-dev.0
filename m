Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1205D10E821
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Apr 2023 16:50:18 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 18 Apr 2023 22:14:59 +0530
Message-Id: <20230418164501.1687266-44-bhanuprakash.modem@intel.com>
In-Reply-To: <20230418164501.1687266-1-bhanuprakash.modem@intel.com>
References: <20230418164501.1687266-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 43/45] tests/kms_universal_plane: Add XE support
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
---
 tests/kms_universal_plane.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 114918d97..ddd356eda 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -576,13 +576,18 @@ cursor_leak_test_fini(data_t *data,
 }
 
 static int
-i915_gem_fb_count(data_t *data)
+intel_gem_fb_count(data_t *data)
 {
 	char buf[1024];
 	FILE *fp;
 	int fd;
 	int count = 0;
 
+	/*
+	 * FIXME: As of now, XE's debugfs is using i915 namespace. Once Kernel
+	 * changes got landed, please update this logic to use XE specific
+	 * debugfs.
+	 */
 	fd = igt_debugfs_open(data->drm_fd, "i915_gem_framebuffer", O_RDONLY);
 	fp = fdopen(fd, "r");
 	igt_require(fp);
@@ -617,7 +622,7 @@ cursor_leak_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	mode = igt_output_get_mode(output);
 
 	/* Count GEM framebuffers before creating our cursor FB's */
-	count1 = i915_gem_fb_count(data);
+	count1 = intel_gem_fb_count(data);
 
 	/* Black background FB */
 	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
@@ -675,7 +680,7 @@ cursor_leak_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	cursor_leak_test_fini(data, output, &background_fb, cursor_fb);
 
 	/* We should be back to the same framebuffer count as when we started */
-	count2 = i915_gem_fb_count(data);
+	count2 = intel_gem_fb_count(data);
 
 	igt_assert_eq(count1, count2);
 }
@@ -737,7 +742,7 @@ pageflip_win_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 
 	int ret = 0;
 
-	igt_skip_on(is_i915_device(data->drm_fd) && data->display_ver < 9);
+	igt_skip_on(is_intel_device(data->drm_fd) && data->display_ver < 9);
 	igt_require_pipe(&data->display, pipe);
 
 	igt_info("Using (pipe %s + %s) to run the subtest.\n",
@@ -895,7 +900,7 @@ igt_main
 
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
-		if (is_i915_device(data.drm_fd))
+		if (is_intel_device(data.drm_fd))
 			data.display_ver = intel_display_ver(intel_get_drm_devid(data.drm_fd));
 
 		kmstest_set_vt_graphics_mode();
-- 
2.40.0
