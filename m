Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33AD0BF381
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Jul 2022 06:26:43 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 28 Jul 2022 11:27:31 +0530
Message-Id: <20220728055731.1542-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] tests/kms_prime: Add subtests to
 validate hybrid GPU
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

Add subtests to validate the Hybrid Graphics config with 2 GPUs active.

1.basic-crc-hybrid: Render on one GPU and export to second GPU for
		    scanout.

2.basic-modeset-hybrid: Render+scanout on one GPU when second GPU is
			active.

3.D3hot: Validate PCI state of dGPU is D3 Hot when dGPU is idle and
         scanout is on iGPU.

4.basic-crc-vgem: The existing subtest which uses DRIVER_VGEM
		  as the virtual second GPU. This is the legacy
		  subtest which runs even on non-hybrid configurations.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_prime.c | 216 ++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 190 insertions(+), 26 deletions(-)

diff --git a/tests/kms_prime.c b/tests/kms_prime.c
index 1ad4b3a6..3df690e0 100644
--- a/tests/kms_prime.c
+++ b/tests/kms_prime.c
@@ -23,11 +23,20 @@
 
 #include "igt.h"
 #include "igt_device.h"
+#include "igt_debugfs.h"
+#include "igt_sysfs.h"
+#include <fcntl.h>
 
 #include <sys/ioctl.h>
 #include <sys/poll.h>
 #include <time.h>
 
+#define KMS_HELPER "/sys/module/drm_kms_helper/parameters/"
+#define KMS_POLL_DISABLE 0
+
+bool kms_poll_saved_state;
+bool kms_poll_disabled;
+
 struct dumb_bo {
 	uint32_t handle;
 	uint32_t width, height;
@@ -141,10 +150,33 @@ static void prepare_fb(int importer_fd, struct dumb_bo *scratch, struct igt_fb *
 static void import_fb(int importer_fd, struct igt_fb *fb,
 		      int dmabuf_fd, uint32_t pitch)
 {
-	uint32_t offsets[4] = {}, pitches[4] = {}, handles[4] = {};
+	uint32_t offsets[4] = {}, pitches[4] = {}, handles[4] = {}, temp_buf_handle;
 	int ret;
 
-	fb->gem_handle = prime_fd_to_handle(importer_fd, dmabuf_fd);
+	if (is_i915_device(importer_fd)) {
+		if (gem_has_lmem(importer_fd)) {
+			uint64_t ahnd = get_reloc_ahnd(importer_fd, 0);
+			uint64_t fb_size = 0;
+
+			igt_info("Importer is dGPU\n");
+			temp_buf_handle = prime_fd_to_handle(importer_fd, dmabuf_fd);
+			igt_assert(temp_buf_handle > 0);
+			fb->gem_handle = igt_create_bo_with_dimensions(importer_fd, fb->width, fb->height,
+								       fb->drm_format, fb->modifier, pitch, &fb_size, NULL, NULL);
+			igt_assert(fb->gem_handle > 0);
+
+			igt_blitter_src_copy(importer_fd, ahnd, 0, temp_buf_handle, 0, pitch, fb->modifier, 0, 0, fb_size,
+					     fb->width, fb->height, 32, fb->gem_handle, 0, pitch, fb->modifier, 0, 0, fb_size);
+
+			gem_sync(importer_fd, fb->gem_handle);
+			gem_close(importer_fd, temp_buf_handle);
+			put_ahnd(ahnd);
+		} else {
+			fb->gem_handle = prime_fd_to_handle(importer_fd, dmabuf_fd);
+		}
+	} else {
+		fb->gem_handle = prime_fd_to_handle(importer_fd, dmabuf_fd);
+	}
 
 	handles[0] = fb->gem_handle;
 	pitches[0] = pitch;
@@ -154,7 +186,6 @@ static void import_fb(int importer_fd, struct igt_fb *fb,
 			    DRM_FORMAT_XRGB8888,
 			    handles, pitches, offsets,
 			    &fb->fb_id, 0);
-
 	igt_assert(ret == 0);
 }
 
@@ -217,11 +248,9 @@ static void test_crc(int exporter_fd, int importer_fd)
 		import_fb(importer_fd, &fb, dmabuf_fd, scratch.pitch);
 		close(dmabuf_fd);
 
-
 		colors[i].prime_crc.name = "prime";
 		collect_crc_for_fb(importer_fd, &fb, &display, output,
 				   pipe_crc, colors[i].color, &colors[i].prime_crc);
-
 		igt_create_color_fb(importer_fd,
 				    mode->hdisplay, mode->vdisplay,
 				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
@@ -258,35 +287,170 @@ static void test_crc(int exporter_fd, int importer_fd)
 	igt_display_fini(&display);
 }
 
-igt_main
+static void test_basic_modeset(int drm_fd)
 {
-	igt_fixture
-		kmstest_set_vt_graphics_mode();
+	igt_display_t display;
+	igt_output_t *output;
+	enum pipe pipe;
+	drmModeModeInfo *mode;
+	struct igt_fb fb;
+
+	igt_device_set_master(drm_fd);
+	igt_display_require(&display, drm_fd);
+
+	output = setup_display(drm_fd, &display, &pipe);
+	mode = igt_output_get_mode(output);
+	igt_assert(mode);
+
+	igt_create_pattern_fb(drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
+			      DRM_FORMAT_MOD_LINEAR, &fb);
+
+	set_fb(&fb, &display, output);
+	igt_remove_fb(drm_fd, &fb);
+	igt_display_fini(&display);
+}
+
+static bool has_connected_output(int drm_fd)
+{
+	igt_display_t display;
+	igt_output_t *output;
+
+	igt_device_set_master(drm_fd);
+	igt_display_require(&display, drm_fd);
+
+	for_each_connected_output(&display, output)
+		return true;
+
+	return false;
+}
+
+static void validate_d3_hot(int drm_fd)
+{
+	igt_assert(igt_debugfs_search(drm_fd, "i915_runtime_pm_status", "GPU idle: yes"));
+	igt_assert(igt_debugfs_search(drm_fd, "i915_runtime_pm_status", "PCI device power state: D3hot [3]"));
+}
+
+static void kms_poll_state_restore(void)
+{
+	int sysfs_fd;
+
+	igt_assert((sysfs_fd = open(KMS_HELPER, O_RDONLY)) >= 0);
+	igt_sysfs_set_boolean(sysfs_fd, "poll", kms_poll_saved_state);
+	close(sysfs_fd);
 
-	igt_describe("Make a dumb color buffer, export to another device and"
-		     " compare the CRCs with a buffer native to that device");
-	igt_subtest_with_dynamic("basic-crc") {
-		int first_fd = -1;
-		int second_fd = -1;
+}
+
+static void kms_poll_disable(void)
+{
+	int sysfs_fd;
+
+	igt_require((sysfs_fd = open(KMS_HELPER, O_RDONLY)) >= 0);
+	kms_poll_saved_state = igt_sysfs_get_boolean(sysfs_fd, "poll");
+	igt_sysfs_set_boolean(sysfs_fd, "poll", KMS_POLL_DISABLE);
+	kms_poll_disabled = true;
+	close(sysfs_fd);
+}
+
+igt_main
+{
+	int first_fd = -1;
+	int second_fd_vgem = -1;
+	int second_fd_hybrid = -1;
+	bool first_output, second_output;
 
+	igt_fixture {
+		kmstest_set_vt_graphics_mode();
 		/* ANY = anything that is not VGEM */
-		first_fd = __drm_open_driver_another(0, DRIVER_ANY | DRIVER_VGEM);
+		first_fd = __drm_open_driver_another(0, DRIVER_ANY);
 		igt_require(first_fd >= 0);
+		first_output = has_connected_output(first_fd);
+	}
 
-		second_fd = __drm_open_driver_another(1, DRIVER_ANY | DRIVER_VGEM);
-		igt_require(second_fd >= 0);
+	igt_describe("Hybrid GPU subtests");
+	igt_subtest_group {
+		igt_fixture {
+			second_fd_hybrid = __drm_open_driver_another(1, DRIVER_ANY);
+			igt_require(second_fd_hybrid >= 0);
+			second_output = has_connected_output(second_fd_hybrid);
+		}
 
-		if (has_prime_export(first_fd) &&
-		    has_prime_import(second_fd))
-			igt_dynamic("first-to-second")
-				test_crc(first_fd, second_fd);
+		igt_describe("Hybrid GPU: Make a dumb color buffer, export to another device and"
+			     " compare the CRCs with a buffer native to that device");
+		igt_subtest_with_dynamic("basic-crc-hybrid") {
+			if (has_prime_export(first_fd) &&
+			    has_prime_import(second_fd_hybrid) && second_output)
+				igt_dynamic("first-to-second")
+					test_crc(first_fd, second_fd_hybrid);
+
+			if (has_prime_import(first_fd) &&
+			    has_prime_export(second_fd_hybrid) && first_output)
+				igt_dynamic("second-to-first")
+					test_crc(second_fd_hybrid, first_fd);
+		}
 
-		if (has_prime_import(first_fd) &&
-		    has_prime_export(second_fd))
-			igt_dynamic("second-to-first")
-				test_crc(second_fd, first_fd);
+		igt_describe("Basic modeset on the one device when the other device is active");
+		igt_subtest_with_dynamic("basic-modeset-hybrid") {
+			igt_require(second_fd_hybrid >= 0);
+			if (first_output) {
+				igt_dynamic("first")
+					test_basic_modeset(first_fd);
+			}
 
-		close(first_fd);
-		close(second_fd);
+			if (second_output) {
+				igt_dynamic("second")
+					test_basic_modeset(second_fd_hybrid);
+			}
+		}
+
+		igt_describe("Validate pci state of dGPU when dGPU is idle and  scanout is on iGPU");
+		igt_subtest("D3hot") {
+			igt_require_f(is_i915_device(second_fd_hybrid), "i915 device required\n");
+			igt_require_f(gem_has_lmem(second_fd_hybrid), "Second GPU is not dGPU\n");
+			igt_require_f(first_output, "No display connected to iGPU\n");
+			igt_require_f(!second_output, "Display connected to dGPU\n");
+
+			kms_poll_disable();
+
+			igt_set_timeout(10, "Wait for dGPU to enter D3hot before starting the subtest");
+			while (!igt_debugfs_search(second_fd_hybrid,
+			       "i915_runtime_pm_status",
+			       "PCI device power state: D3hot [3]"));
+			igt_reset_timeout();
+
+			test_basic_modeset(first_fd);
+			validate_d3_hot(second_fd_hybrid);
+		}
+
+		igt_fixture {
+			if (kms_poll_disabled)
+				kms_poll_state_restore();
+
+			close(second_fd_hybrid);
+		}
 	}
+
+	igt_describe("VGEM subtests");
+	igt_subtest_group {
+		igt_fixture {
+			second_fd_vgem = __drm_open_driver_another(1, DRIVER_VGEM);
+			igt_require(second_fd_vgem >= 0);
+			if (is_i915_device(first_fd))
+				igt_require(!gem_has_lmem(first_fd));
+		}
+
+		igt_describe("Make a dumb color buffer, export to another device and"
+			     " compare the CRCs with a buffer native to that device");
+		igt_subtest_with_dynamic("basic-crc-vgem") {
+			if (has_prime_import(first_fd) &&
+			    has_prime_export(second_fd_vgem) && first_output)
+				igt_dynamic("second-to-first")
+					test_crc(second_fd_vgem, first_fd);
+		}
+
+		igt_fixture
+			close(second_fd_vgem);
+	}
+
+	igt_fixture
+		close(first_fd);
 }
-- 
2.22.0
