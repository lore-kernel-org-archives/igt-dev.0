Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FB9610E02D
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Dec 2023 02:35:00 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2] tests/kms_prime: Add XE support
Date: Thu, 28 Dec 2023 08:15:20 +0530
Message-Id: <20231228024520.20071-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Add XE driver support for kms tests.

V2: - Use rendercopy method for both i915 & xe
    - Minor cleanup
V3: - New patch for cleanup & rendercopy
V4: - Fallback to blitter
V5: - Rebase
v7: - Rebase and patch cleanup

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_prime.c | 299 ++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 251 insertions(+), 48 deletions(-)

diff --git a/tests/kms_prime.c b/tests/kms_prime.c
index 135c75168..039790b86 100644
--- a/tests/kms_prime.c
+++ b/tests/kms_prime.c
@@ -36,10 +36,16 @@
 #include "igt_debugfs.h"
 #include "igt_sysfs.h"
 #include <fcntl.h>
+#include <limits.h>
 
 #include <sys/ioctl.h>
 #include <sys/poll.h>
 #include <time.h>
+#include "lib/intel_blt.h"
+#include "lib/intel_mocs.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+
 
 /**
  * SUBTEST: D3hot
@@ -120,10 +126,14 @@ static igt_output_t *setup_display(int importer_fd, igt_display_t *display,
 		igt_display_reset(display);
 
 		igt_output_set_pipe(output, *pipe);
-		if (intel_pipe_output_combo_valid(display)) {
-			found = true;
-			break;
+		if ((is_i915_device(importer_fd) && gem_has_lmem(importer_fd)) ||
+		   (is_xe_device(importer_fd) && xe_has_vram(importer_fd))) {
+			if (!intel_pipe_output_combo_valid(display))
+				continue;
 		}
+
+		found = true;
+		break;
 	}
 
 	igt_require_f(found, "No valid connector/pipe found\n");
@@ -131,6 +141,25 @@ static igt_output_t *setup_display(int importer_fd, igt_display_t *display,
 	return output;
 }
 
+static igt_output_t *setup_hybrid_display(int importer_fd, igt_display_t *display,
+				   enum pipe *pipe)
+{
+	igt_output_t *output;
+	bool found = false;
+
+	for_each_pipe_with_valid_output(display, *pipe, output) {
+		igt_display_reset(display);
+
+		igt_output_set_pipe(output, *pipe);
+
+		found = true;
+		break; /*Validation on single pipe is enough*/
+	}
+
+	igt_require_f(found, "No valid connector/pipe found\n");
+
+	return output;
+}
 static void prepare_scratch(int exporter_fd, struct dumb_bo *scratch,
 			    drmModeModeInfo *mode, uint32_t color)
 {
@@ -140,7 +169,29 @@ static void prepare_scratch(int exporter_fd, struct dumb_bo *scratch,
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
+			scratch->handle = xe_bo_create(exporter_fd, 0,
+							     ALIGN(scratch->size, xe_get_default_alignment(exporter_fd)),
+							     vram_if_possible(exporter_fd, 0), 0);
+
+			ptr = xe_bo_mmap_ext(exporter_fd, scratch->handle,
+					     scratch->size, PROT_READ | PROT_WRITE);
+		}
+	} else {
 		scratch->handle = kmstest_dumb_create(exporter_fd,
 						      ALIGN(scratch->width, 256),
 						      scratch->height, scratch->bpp,
@@ -148,18 +199,6 @@ static void prepare_scratch(int exporter_fd, struct dumb_bo *scratch,
 
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
@@ -178,23 +217,52 @@ static void prepare_fb(int importer_fd, struct dumb_bo *scratch, struct igt_fb *
 		    color_encoding, color_range);
 }
 
+static struct blt_copy_object *blt_fb_init(const struct igt_fb *fb,
+					   uint32_t memregion, uint32_t pitch)
+{
+	uint32_t name, handle;
+	struct blt_copy_object *blt;
+
+	blt = malloc(sizeof(*blt));
+	igt_assert(blt);
+
+	name = gem_flink(fb->fd, fb->gem_handle);
+	handle = gem_open(fb->fd, name);
+
+	blt_set_object(blt, handle, fb->size, memregion,
+		       intel_get_uc_mocs_index(fb->fd),
+		       0, 0, 0, 0);
+
+	blt_set_geom(blt, pitch, 0, 0, fb->width, fb->height, 0, 0);
+
+	blt->plane_offset = 0;
+
+	blt->ptr = xe_bo_mmap_ext(fb->fd, handle, fb->size,
+				  PROT_READ | PROT_WRITE);
+	return blt;
+}
+
 static void import_fb(int importer_fd, struct igt_fb *fb,
 		      int dmabuf_fd, uint32_t pitch)
 {
 	uint32_t offsets[4] = {}, pitches[4] = {}, handles[4] = {}, temp_buf_handle;
 	int ret;
+	struct igt_fb dst_fb;
 
-	if (is_i915_device(importer_fd)) {
-		if (gem_has_lmem(importer_fd)) {
-			uint64_t ahnd = get_reloc_ahnd(importer_fd, 0);
-			uint64_t fb_size = 0;
+	if ((is_i915_device(importer_fd) && gem_has_lmem(importer_fd)) ||
+	    (is_xe_device(importer_fd) && xe_has_vram(importer_fd)))  {
+		uint64_t fb_size = 0;
+		uint64_t ahnd = 0;
 
-			igt_info("Importer is dGPU\n");
-			temp_buf_handle = prime_fd_to_handle(importer_fd, dmabuf_fd);
-			igt_assert(temp_buf_handle > 0);
-			fb->gem_handle = igt_create_bo_with_dimensions(importer_fd, fb->width, fb->height,
-								       fb->drm_format, fb->modifier, pitch, &fb_size, NULL, NULL);
-			igt_assert(fb->gem_handle > 0);
+		igt_info("Importer is dGPU\n");
+		temp_buf_handle = prime_fd_to_handle(importer_fd, dmabuf_fd);
+		igt_assert(temp_buf_handle > 0);
+		fb->gem_handle = igt_create_bo_with_dimensions(importer_fd, fb->width, fb->height,
+							       fb->drm_format, fb->modifier, pitch, &fb_size, NULL, NULL);
+		igt_assert(fb->gem_handle > 0);
+
+		if (is_i915_device(importer_fd)) {
+			ahnd = get_reloc_ahnd(importer_fd, 0);
 
 			igt_blitter_src_copy(importer_fd, ahnd, 0, NULL, temp_buf_handle,
 					     0, pitch, fb->modifier, 0, 0, fb_size, fb->width,
@@ -205,7 +273,62 @@ static void import_fb(int importer_fd, struct igt_fb *fb,
 			gem_close(importer_fd, temp_buf_handle);
 			put_ahnd(ahnd);
 		} else {
-			fb->gem_handle = prime_fd_to_handle(importer_fd, dmabuf_fd);
+			uint32_t xe_bb;
+			uint64_t bb_size = 4096;
+			struct blt_copy_data blt = {};
+			struct blt_copy_object *src, *dst;
+			struct blt_block_copy_data_ext ext = {};
+			uint32_t mem_region;
+			intel_ctx_t *xe_ctx;
+			uint32_t vm, xe_exec;
+
+			struct drm_xe_engine_class_instance inst = {
+				.engine_class = DRM_XE_ENGINE_CLASS_COPY,
+			};
+			vm = xe_vm_create(importer_fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
+			xe_exec = xe_exec_queue_create(importer_fd, vm, &inst, 0);
+			xe_ctx = intel_ctx_xe(importer_fd, vm, xe_exec, 0, 0, 0);
+			mem_region = vram_if_possible(importer_fd, 0);
+
+			ahnd = intel_allocator_open_full(importer_fd, xe_ctx->vm, 0, 0,
+							 INTEL_ALLOCATOR_SIMPLE,
+							 ALLOC_STRATEGY_LOW_TO_HIGH, 0);
+
+			bb_size = ALIGN(bb_size + xe_cs_prefetch_size(importer_fd),
+					xe_get_default_alignment(importer_fd));
+			xe_bb = xe_bo_create(importer_fd, 0, bb_size, mem_region, 0);
+
+
+
+			igt_init_fb(&dst_fb, importer_fd, fb->width, fb->height,
+				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+				    IGT_COLOR_YCBCR_BT709, IGT_COLOR_YCBCR_LIMITED_RANGE);
+			dst_fb.gem_handle = temp_buf_handle;
+
+			src = blt_fb_init(fb, mem_region, pitch);
+			dst = blt_fb_init(&dst_fb, mem_region, pitch);
+
+			blt_copy_init(importer_fd, &blt);
+			blt.color_depth = 32;
+			blt_set_copy_object(&blt.src, src);
+			blt_set_copy_object(&blt.dst, dst);
+
+			blt_set_object_ext(&ext.src, 0, fb->width, fb->height,
+					   SURFACE_TYPE_2D);
+			blt_set_object_ext(&ext.dst, 0, fb->width, fb->height,
+					   SURFACE_TYPE_2D);
+
+			blt_set_batch(&blt.bb, xe_bb, bb_size, mem_region);
+
+			blt_block_copy(importer_fd, xe_ctx, NULL, ahnd, &blt, &ext);
+
+			blt_destroy_object(importer_fd, dst);
+
+			put_ahnd(ahnd);
+			gem_close(importer_fd, xe_bb);
+			xe_exec_queue_destroy(importer_fd, xe_exec);
+			xe_vm_destroy(importer_fd, vm);
+			free(xe_ctx);
 		}
 	} else {
 		fb->gem_handle = prime_fd_to_handle(importer_fd, dmabuf_fd);
@@ -332,7 +455,7 @@ static void test_basic_modeset(int drm_fd)
 	igt_device_set_master(drm_fd);
 	igt_display_require(&display, drm_fd);
 
-	output = setup_display(drm_fd, &display, &pipe);
+	output = setup_hybrid_display(drm_fd, &display, &pipe);
 	mode = igt_output_get_mode(output);
 	igt_assert(mode);
 
@@ -358,12 +481,6 @@ static bool has_connected_output(int drm_fd)
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
@@ -385,6 +502,89 @@ static void kms_poll_disable(void)
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
+
+		while (!igt_debugfs_search(fd, "i915_runtime_pm_status",
+					    "PCI device power state: D3hot [3]"))
+			;
+		igt_reset_timeout();
+	}
+}
+
 igt_main
 {
 	int first_fd = -1;
@@ -438,21 +638,28 @@ igt_main
 
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
@@ -470,6 +677,8 @@ igt_main
 			igt_require(second_fd_vgem >= 0);
 			if (is_i915_device(first_fd))
 				igt_require(!gem_has_lmem(first_fd));
+			if (is_xe_device(first_fd))
+				igt_require(!xe_has_vram(first_fd));
 		}
 
 		igt_describe("Make a dumb color buffer, export to another device and"
@@ -480,11 +689,5 @@ igt_main
 				igt_dynamic("second-to-first")
 					test_crc(second_fd_vgem, first_fd);
 		}
-
-		igt_fixture
-			drm_close_driver(second_fd_vgem);
 	}
-
-	igt_fixture
-		drm_close_driver(first_fd);
 }
-- 
2.39.0
