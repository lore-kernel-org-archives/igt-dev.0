Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9836110E200
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jun 2023 12:05:22 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 19 Jun 2023 17:28:54 +0530
Message-Id: <20230619115858.2013195-15-bhanuprakash.modem@intel.com>
In-Reply-To: <20230619115858.2013195-1-bhanuprakash.modem@intel.com>
References: <20230619115858.2013195-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 14/18] tests/i915/kms_ccs: Add XE support
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

Add XE driver support for kms tests. This patch will add a support
to call the corresponding apis based on the driver (i915/xe)

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/kms_ccs.c | 42 ++++++++++++++++++++++++++----------------
 1 file changed, 26 insertions(+), 16 deletions(-)

diff --git a/tests/i915/kms_ccs.c b/tests/i915/kms_ccs.c
index abe464b47..835752b1c 100644
--- a/tests/i915/kms_ccs.c
+++ b/tests/i915/kms_ccs.c
@@ -25,6 +25,7 @@
 #include "igt.h"
 
 #include "i915/gem_create.h"
+#include "xe/xe_ioctl.h"
 
 #define SDR_PLANE_BASE	3
 
@@ -186,17 +187,19 @@ static void check_ccs_plane(int drm_fd, igt_fb_t *fb, int plane)
 	ccs_size = fb->strides[plane] * fb->plane_height[plane];
 	igt_assert(ccs_size);
 
-	gem_set_domain(drm_fd, fb->gem_handle, I915_GEM_DOMAIN_CPU, 0);
-
-	map = gem_mmap__cpu(drm_fd, fb->gem_handle, 0, fb->size, PROT_READ);
-
+	if (is_i915_device(drm_fd)) {
+		gem_set_domain(drm_fd, fb->gem_handle, I915_GEM_DOMAIN_CPU, 0);
+		map = gem_mmap__cpu(drm_fd, fb->gem_handle, 0, fb->size, PROT_READ);
+	} else {
+		map = xe_bo_mmap_ext(drm_fd, fb->gem_handle, fb->size, PROT_READ);
+	}
 	ccs_size = fb->strides[plane] * fb->plane_height[plane];
 	ccs_p = map + fb->offsets[plane];
 	for (i = 0; i < ccs_size; i += sizeof(uint32_t))
 		if (*(uint32_t *)(ccs_p + i))
 			break;
 
-	munmap(map, fb->size);
+	igt_assert(gem_munmap(map, fb->size) == 0);
 
 	igt_assert_f(i < ccs_size,
 		     "CCS plane %d (for main plane %d) lacks compression meta-data\n",
@@ -212,9 +215,12 @@ static void check_ccs_cc_plane(int drm_fd, igt_fb_t *fb, int plane, const float
 	void *map;
 	uint32_t native_color;
 
-	gem_set_domain(drm_fd, fb->gem_handle, I915_GEM_DOMAIN_CPU, 0);
-
-	map = gem_mmap__cpu(drm_fd, fb->gem_handle, 0, fb->size, PROT_READ);
+	if (is_i915_device(drm_fd)) {
+		gem_set_domain(drm_fd, fb->gem_handle, I915_GEM_DOMAIN_CPU, 0);
+		map = gem_mmap__cpu(drm_fd, fb->gem_handle, 0, fb->size, PROT_READ);
+	} else {
+		map = xe_bo_mmap_ext(drm_fd, fb->gem_handle, fb->size, PROT_READ);
+	}
 	cc_p = map + fb->offsets[plane];
 
 	igt_assert(cc_color[0] == cc_p[0].f &&
@@ -229,7 +235,7 @@ static void check_ccs_cc_plane(int drm_fd, igt_fb_t *fb, int plane, const float
 
 	igt_assert(native_color == cc_p[4].d);
 
-	munmap(map, fb->size);
+	igt_assert(gem_munmap(map, fb->size) == 0);
 };
 
 static void check_all_ccs_planes(int drm_fd, igt_fb_t *fb, const float *cc_color, bool check_cc_plane)
@@ -251,14 +257,17 @@ static void fill_fb_random(int drm_fd, igt_fb_t *fb)
 	uint8_t *p;
 	int i;
 
-	gem_set_domain(drm_fd, fb->gem_handle, I915_GEM_DOMAIN_CPU, I915_GEM_DOMAIN_CPU);
-
-	p = map = gem_mmap__cpu(drm_fd, fb->gem_handle, 0, fb->size, PROT_WRITE);
+	if (is_i915_device(drm_fd)) {
+		gem_set_domain(drm_fd, fb->gem_handle, I915_GEM_DOMAIN_CPU, I915_GEM_DOMAIN_CPU);
+		p = map = gem_mmap__cpu(drm_fd, fb->gem_handle, 0, fb->size, PROT_WRITE);
+	} else {
+		p = map = xe_bo_mmap_ext(drm_fd, fb->gem_handle, fb->size, PROT_READ | PROT_WRITE);
+	}
 
 	for (i = 0; i < fb->size; i++)
 		p[i] = rand();
 
-	munmap(map, fb->size);
+	igt_assert(gem_munmap(map, fb->size) == 0);
 }
 
 static void test_bad_ccs_plane(data_t *data, int width, int height, int ccs_plane,
@@ -366,8 +375,9 @@ static void fast_clear_fb(int drm_fd, struct igt_fb *fb, const float *cc_color)
 	struct buf_ops *bops = buf_ops_create(drm_fd);
 	struct intel_buf *dst = igt_fb_create_intel_buf(drm_fd, bops, fb, "fast clear dst");
 
-	gem_set_domain(drm_fd, fb->gem_handle,
-		       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
+	if (is_i915_device(drm_fd))
+		gem_set_domain(drm_fd, fb->gem_handle,
+			       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 
 	fast_clear(ibb, dst, 0, 0, fb->width, fb->height, cc_color);
 
@@ -687,7 +697,7 @@ igt_main_args("cs:", NULL, help_str, opt_handler, &data)
 	enum pipe pipe;
 
 	igt_fixture {
-		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
+		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 
 		igt_require(intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 9);
 		kmstest_set_vt_graphics_mode();
-- 
2.40.0
