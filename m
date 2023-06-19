Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D1B310E1F6
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jun 2023 12:05:28 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 19 Jun 2023 17:28:58 +0530
Message-Id: <20230619115858.2013195-19-bhanuprakash.modem@intel.com>
In-Reply-To: <20230619115858.2013195-1-bhanuprakash.modem@intel.com>
References: <20230619115858.2013195-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 18/18] tests/kms_prime: Add XE support
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

V2: - Use rendercopy method for both i915 & xe
    - Minor cleanup
V3: - New patch for cleanup & rendercopy

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_prime.c | 230 ++++++++++++++++++++++++++++++++++++----------
 1 file changed, 182 insertions(+), 48 deletions(-)

diff --git a/tests/kms_prime.c b/tests/kms_prime.c
index dd5ab993e..4442104a0 100644
--- a/tests/kms_prime.c
+++ b/tests/kms_prime.c
@@ -27,9 +27,12 @@
 #include "igt_sysfs.h"
 #include <fcntl.h>
 
+#include <limits.h>
 #include <sys/ioctl.h>
 #include <sys/poll.h>
 #include <time.h>
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
 
 #define KMS_HELPER "/sys/module/drm_kms_helper/parameters/"
 #define KMS_POLL_DISABLE 0
@@ -112,7 +115,29 @@ static void prepare_scratch(int exporter_fd, struct dumb_bo *scratch,
 	scratch->height = mode->vdisplay;
 	scratch->bpp = 32;
 
-	if (!is_i915_device(exporter_fd)) {
+	if (is_intel_device(exporter_fd)) {
+		igt_calc_fb_size(exporter_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
+				 DRM_FORMAT_MOD_LINEAR, &scratch->size, &scratch->pitch);
+
+		if (is_i915_device(exporter_fd)) {
+			if (gem_has_lmem(exporter_fd))
+				scratch->handle = gem_create_in_memory_regions(exporter_fd, scratch->size,
+								       REGION_LMEM(0), REGION_SMEM);
+			else
+				scratch->handle = gem_create_in_memory_regions(exporter_fd, scratch->size,
+								       REGION_SMEM);
+
+			ptr = gem_mmap__device_coherent(exporter_fd, scratch->handle, 0,
+							scratch->size, PROT_WRITE | PROT_READ);
+		} else {
+			scratch->handle = xe_bo_create_flags(exporter_fd, 0,
+							     ALIGN(scratch->size, xe_get_default_alignment(exporter_fd)),
+							     vram_if_possible(exporter_fd, 0));
+
+			ptr = xe_bo_mmap_ext(exporter_fd, scratch->handle,
+					     scratch->size, PROT_READ | PROT_WRITE);
+		}
+	} else {
 		scratch->handle = kmstest_dumb_create(exporter_fd,
 						      ALIGN(scratch->width, 256),
 						      scratch->height, scratch->bpp,
@@ -120,18 +145,6 @@ static void prepare_scratch(int exporter_fd, struct dumb_bo *scratch,
 
 		ptr = kmstest_dumb_map_buffer(exporter_fd, scratch->handle,
 					      scratch->size, PROT_WRITE);
-	} else {
-		igt_calc_fb_size(exporter_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
-				 DRM_FORMAT_MOD_LINEAR, &scratch->size, &scratch->pitch);
-		if (gem_has_lmem(exporter_fd))
-			scratch->handle = gem_create_in_memory_regions(exporter_fd, scratch->size,
-								       REGION_LMEM(0), REGION_SMEM);
-		else
-			scratch->handle = gem_create_in_memory_regions(exporter_fd, scratch->size,
-								       REGION_SMEM);
-
-		ptr = gem_mmap__device_coherent(exporter_fd, scratch->handle, 0, scratch->size,
-						PROT_WRITE | PROT_READ);
 	}
 
 	for (size_t idx = 0; idx < scratch->size / sizeof(*ptr); ++idx)
@@ -150,35 +163,71 @@ static void prepare_fb(int importer_fd, struct dumb_bo *scratch, struct igt_fb *
 		    color_encoding, color_range);
 }
 
+static struct intel_buf * create_buf(int fd, struct buf_ops *bops, int width,
+				     int height, uint64_t size, uint32_t gem_handle)
+{
+	struct intel_buf *buf;
+	uint32_t name, handle;
+	uint64_t region = (buf_ops_get_driver(bops) == INTEL_DRIVER_XE) ?
+						vram_if_possible(fd, 0) : -1;
+
+	name = gem_flink(fd, gem_handle);
+	handle = gem_open(fd, name);
+
+	buf = intel_buf_create_full(bops, handle,
+				    width, height, 32, 0,
+				    I915_TILING_NONE, 0,
+				    size, 0,
+				    region);
+
+	/* Make sure we close handle on destroy path */
+	intel_buf_set_ownership(buf, true);
+	return buf;
+}
+
 static void import_fb(int importer_fd, struct igt_fb *fb,
 		      int dmabuf_fd, uint32_t pitch)
 {
 	uint32_t offsets[4] = {}, pitches[4] = {}, handles[4] = {}, temp_buf_handle;
 	int ret;
 
-	if (is_i915_device(importer_fd)) {
-		if (gem_has_lmem(importer_fd)) {
-			uint64_t ahnd = get_reloc_ahnd(importer_fd, 0);
-			uint64_t fb_size = 0;
-
-			igt_info("Importer is dGPU\n");
-			temp_buf_handle = prime_fd_to_handle(importer_fd, dmabuf_fd);
-			igt_assert(temp_buf_handle > 0);
-			fb->gem_handle = igt_create_bo_with_dimensions(importer_fd, fb->width, fb->height,
-								       fb->drm_format, fb->modifier, pitch, &fb_size, NULL, NULL);
-			igt_assert(fb->gem_handle > 0);
-
-			igt_blitter_src_copy(importer_fd, ahnd, 0, NULL, temp_buf_handle,
-					     0, pitch, fb->modifier, 0, 0, fb_size, fb->width,
-					     fb->height, 32, fb->gem_handle, 0, pitch, fb->modifier,
-					     0, 0, fb_size);
-
-			gem_sync(importer_fd, fb->gem_handle);
-			gem_close(importer_fd, temp_buf_handle);
-			put_ahnd(ahnd);
+	if ((is_i915_device(importer_fd) && gem_has_lmem(importer_fd)) ||
+	    (is_xe_device(importer_fd) && xe_has_vram(importer_fd)))  {
+		uint32_t devid = intel_get_drm_devid(importer_fd);
+		struct buf_ops *bops = buf_ops_create(importer_fd);
+		igt_render_copyfunc_t rendercopy = igt_get_render_copyfunc(devid);
+		struct intel_bb *ibb = intel_bb_create(importer_fd, 4096);
+		struct intel_buf *src, *dst;
+		uint32_t *ptr;
+		uint64_t fb_size = 0;
+
+		igt_info("Importer is dGPU\n");
+		temp_buf_handle = prime_fd_to_handle(importer_fd, dmabuf_fd);
+		igt_assert(temp_buf_handle > 0);
+		fb->gem_handle = igt_create_bo_with_dimensions(importer_fd, fb->width, fb->height,
+							       fb->drm_format, fb->modifier, pitch, &fb_size, NULL, NULL);
+		igt_assert(fb->gem_handle > 0);
+
+		if (is_i915_device(importer_fd)) {
+			ptr = gem_mmap__device_coherent(importer_fd, temp_buf_handle, 0,
+							ALIGN(fb_size, 4096),
+							PROT_READ | PROT_WRITE);
 		} else {
-			fb->gem_handle = prime_fd_to_handle(importer_fd, dmabuf_fd);
+			ptr = xe_bo_mmap_ext(importer_fd, temp_buf_handle,
+					     ALIGN(fb_size, xe_get_default_alignment(importer_fd)),
+					     PROT_READ | PROT_WRITE);
 		}
+
+		src = create_buf(importer_fd, bops, fb->width, fb->height, fb_size, temp_buf_handle);
+		dst = create_buf(importer_fd, bops, fb->width, fb->height, fb_size, fb->gem_handle);
+		rendercopy(ibb, src, 0, 0, fb->width, fb->height, dst, 0, 0);
+
+		igt_assert(gem_munmap(ptr, fb_size) == 0);
+		intel_bb_destroy(ibb);
+		intel_buf_destroy(src);
+		intel_buf_destroy(dst);
+		buf_ops_destroy(bops);
+		gem_close(importer_fd, temp_buf_handle);
 	} else {
 		fb->gem_handle = prime_fd_to_handle(importer_fd, dmabuf_fd);
 	}
@@ -330,12 +379,6 @@ static bool has_connected_output(int drm_fd)
 	return false;
 }
 
-static void validate_d3_hot(int drm_fd)
-{
-	igt_assert(igt_debugfs_search(drm_fd, "i915_runtime_pm_status", "GPU idle: yes"));
-	igt_assert(igt_debugfs_search(drm_fd, "i915_runtime_pm_status", "PCI device power state: D3hot [3]"));
-}
-
 static void kms_poll_state_restore(void)
 {
 	int sysfs_fd;
@@ -357,6 +400,88 @@ static void kms_poll_disable(void)
 	close(sysfs_fd);
 }
 
+static bool runtime_usage_available(struct pci_device *pci)
+{
+	char name[PATH_MAX];
+	snprintf(name, PATH_MAX, "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/runtime_usage",
+		 pci->domain, pci->bus, pci->dev, pci->func);
+	return access(name, F_OK) == 0;
+}
+
+static bool in_d3_hot(struct pci_device *pci)
+{
+	uint16_t val;
+
+	/* We need to wait for the autosuspend to kick in before we can check */
+	if (!igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED))
+		return false;
+
+	if (runtime_usage_available(pci) &&
+	    igt_pm_get_runtime_usage(pci) != 0)
+		return false;
+
+	igt_assert_eq(pci_device_cfg_read_u16(pci, &val, 0xd4), 0);
+
+	return (val & 0x3) == 0x3;
+}
+
+static void validate_d3_hot(int drm_fd, struct pci_device *pci)
+{
+	if (is_i915_device(drm_fd)) {
+		igt_assert(igt_debugfs_search(drm_fd, "i915_runtime_pm_status", "GPU idle: yes"));
+		igt_assert(igt_debugfs_search(drm_fd, "i915_runtime_pm_status", "PCI device power state: D3hot [3]"));
+	} else {
+		igt_assert(in_d3_hot(pci));
+	}
+}
+
+static int open_d3_allowed(struct pci_device *pci)
+{
+	char name[PATH_MAX];
+	int fd;
+
+	snprintf(name, PATH_MAX, "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/d3cold_allowed",
+		 pci->domain, pci->bus, pci->dev, pci->func);
+
+	fd = open(name, O_RDWR);
+	igt_assert_f(fd >= 0, "Can't open %s\n", name);
+
+	return fd;
+}
+
+static void get_d3_allowed(struct pci_device *pci, char *d3_allowed)
+{
+	int fd = open_d3_allowed(pci);
+
+	igt_assert(read(fd, d3_allowed, 2));
+	close(fd);
+}
+
+static void set_d3_allowed(struct pci_device *pci, const char *d3_allowed)
+{
+	int fd = open_d3_allowed(pci);
+
+	igt_assert(write(fd, d3_allowed, 2));
+	close(fd);
+}
+
+static void setup_d3_hot(int fd, struct pci_device *pci)
+{
+	if (is_xe_device(fd)) {
+		igt_assert(igt_setup_runtime_pm(fd));
+
+		set_d3_allowed(pci, "0\n");
+
+		igt_assert(in_d3_hot(pci));
+	} else {
+		igt_set_timeout(10, "Wait for dGPU to enter D3hot before starting the subtest");
+		while (!igt_debugfs_search(fd,
+			"i915_runtime_pm_status",
+			"PCI device power state: D3hot [3]"));
+		igt_reset_timeout();
+	}
+}
+
 igt_main
 {
 	int first_fd = -1;
@@ -410,21 +535,28 @@ igt_main
 
 		igt_describe("Validate pci state of dGPU when dGPU is idle and  scanout is on iGPU");
 		igt_subtest("D3hot") {
-			igt_require_f(is_i915_device(second_fd_hybrid), "i915 device required\n");
-			igt_require_f(gem_has_lmem(second_fd_hybrid), "Second GPU is not dGPU\n");
+			char d3_allowed[2];
+			struct pci_device *pci;
+
+			igt_require_f(is_intel_device(second_fd_hybrid), "intel device required\n");
+			if (is_i915_device(second_fd_hybrid))
+				igt_require_f(gem_has_lmem(second_fd_hybrid), "Second GPU is not dGPU\n");
+			else
+				igt_require_f(xe_has_vram(second_fd_hybrid), "Second GPU is not dGPU\n");
 			igt_require_f(first_output, "No display connected to iGPU\n");
 			igt_require_f(!second_output, "Display connected to dGPU\n");
 
 			kms_poll_disable();
 
-			igt_set_timeout(10, "Wait for dGPU to enter D3hot before starting the subtest");
-			while (!igt_debugfs_search(second_fd_hybrid,
-			       "i915_runtime_pm_status",
-			       "PCI device power state: D3hot [3]"));
-			igt_reset_timeout();
+			pci = igt_device_get_pci_device(second_fd_hybrid);
+			get_d3_allowed(pci, d3_allowed);
+
+			setup_d3_hot(second_fd_hybrid, pci);
 
 			test_basic_modeset(first_fd);
-			validate_d3_hot(second_fd_hybrid);
+			validate_d3_hot(second_fd_hybrid, pci);
+
+			set_d3_allowed(pci, d3_allowed);
 		}
 
 		igt_fixture {
@@ -442,6 +574,8 @@ igt_main
 			igt_require(second_fd_vgem >= 0);
 			if (is_i915_device(first_fd))
 				igt_require(!gem_has_lmem(first_fd));
+			if (is_xe_device(first_fd))
+				igt_require(!xe_has_vram(first_fd));
 		}
 
 		igt_describe("Make a dumb color buffer, export to another device and"
-- 
2.40.0
