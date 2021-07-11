Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70D736EB84
 for <igt-dev@lists.freedesktop.org>; Sun, 11 Jul 2021 06:12:23 +0000 (UTC)
From: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Sat, 10 Jul 2021 23:12:04 -0700
Message-Id: <20210711061211.2879015-3-lucas.demarchi@intel.com>
In-Reply-To: <20210711061211.2879015-1-lucas.demarchi@intel.com>
References: <20210711061211.2879015-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 2/9] Remove local copies of I915 macros
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
List-ID: <igt-dev@lists.freedesktop.org>

Just use the one from the kernel headers. Updated with:

	git grep -l LOCAL_I915 | \
	xargs sed -i -e '/^#define LOCAL_I915/d' -e 's/LOCAL_\(I915[[:alnum:]_]*\)/\1/g'

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_fb.c                      | 48 +++++++++++++--------------
 lib/ioctl_wrappers.h              |  8 -----
 tests/i915/gem_eio.c              |  2 +-
 tests/i915/gem_exec_reloc.c       |  2 +-
 tests/i915/i915_fb_tiling.c       |  2 +-
 tests/i915/i915_getparams_basic.c |  6 ++--
 tests/i915/i915_pm_dc.c           |  2 +-
 tests/i915/i915_pm_rpm.c          |  8 ++---
 tests/kms_addfb_basic.c           | 18 +++++------
 tests/kms_async_flips.c           |  6 ++--
 tests/kms_busy.c                  |  6 ++--
 tests/kms_ccs.c                   | 14 ++++----
 tests/kms_concurrent.c            |  4 +--
 tests/kms_cursor_legacy.c         |  2 +-
 tests/kms_draw_crc.c              | 12 +++----
 tests/kms_fbcon_fbt.c             |  2 +-
 tests/kms_fence_pin_leak.c        |  4 +--
 tests/kms_flip.c                  |  2 +-
 tests/kms_flip_scaled_crc.c       | 28 ++++++++--------
 tests/kms_flip_tiling.c           | 32 +++++++++---------
 tests/kms_frontbuffer_tracking.c  |  4 +--
 tests/kms_plane_lowres.c          |  6 ++--
 tests/kms_plane_multiple.c        |  6 ++--
 tests/kms_plane_scaling.c         | 18 +++++------
 tests/kms_psr.c                   |  4 +--
 tests/kms_rotation_crc.c          | 54 +++++++++++++++----------------
 tests/testdisplay.c               |  6 ++--
 tools/intel_residency.c           |  2 +-
 28 files changed, 149 insertions(+), 159 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index acb81518..b67483de 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -419,7 +419,7 @@ void igt_get_fb_tile_size(int fd, uint64_t modifier, int fb_bpp,
 
 		*height_ret = 1;
 		break;
-	case LOCAL_I915_FORMAT_MOD_X_TILED:
+	case I915_FORMAT_MOD_X_TILED:
 		igt_require_intel(fd);
 		if (intel_display_ver(intel_get_drm_devid(fd)) == 2) {
 			*width_ret = 128;
@@ -429,11 +429,11 @@ void igt_get_fb_tile_size(int fd, uint64_t modifier, int fb_bpp,
 			*height_ret = 8;
 		}
 		break;
-	case LOCAL_I915_FORMAT_MOD_Y_TILED:
-	case LOCAL_I915_FORMAT_MOD_Y_TILED_CCS:
-	case LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS:
-	case LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC:
-	case LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS:
+	case I915_FORMAT_MOD_Y_TILED:
+	case I915_FORMAT_MOD_Y_TILED_CCS:
+	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS:
+	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC:
+	case I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS:
 		igt_require_intel(fd);
 		if (intel_display_ver(intel_get_drm_devid(fd)) == 2) {
 			*width_ret = 128;
@@ -446,8 +446,8 @@ void igt_get_fb_tile_size(int fd, uint64_t modifier, int fb_bpp,
 			*height_ret = 32;
 		}
 		break;
-	case LOCAL_I915_FORMAT_MOD_Yf_TILED:
-	case LOCAL_I915_FORMAT_MOD_Yf_TILED_CCS:
+	case I915_FORMAT_MOD_Yf_TILED:
+	case I915_FORMAT_MOD_Yf_TILED_CCS:
 		igt_require_intel(fd);
 		switch (fb_bpp) {
 		case 8:
@@ -542,14 +542,14 @@ void igt_get_fb_tile_size(int fd, uint64_t modifier, int fb_bpp,
 
 static bool is_gen12_mc_ccs_modifier(uint64_t modifier)
 {
-	return modifier == LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS;
+	return modifier == I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS;
 }
 
 static bool is_gen12_ccs_modifier(uint64_t modifier)
 {
 	return is_gen12_mc_ccs_modifier(modifier) ||
 		modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS ||
-		modifier == LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC;
+		modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC;
 }
 
 static bool is_ccs_modifier(uint64_t modifier)
@@ -579,7 +579,7 @@ static bool is_gen12_ccs_plane(const struct igt_fb *fb, int plane)
 
 static bool is_gen12_ccs_cc_plane(const struct igt_fb *fb, int plane)
 {
-	return fb->modifier == LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC &&
+	return fb->modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC &&
 	       plane == 2;
 }
 
@@ -666,7 +666,7 @@ static int fb_num_planes(const struct igt_fb *fb)
 	if (is_ccs_modifier(fb->modifier))
 		num_planes *= 2;
 
-	if (fb->modifier == LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC)
+	if (fb->modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC)
 		num_planes++;
 
 	return num_planes;
@@ -921,16 +921,16 @@ uint64_t igt_fb_mod_to_tiling(uint64_t modifier)
 	switch (modifier) {
 	case LOCAL_DRM_FORMAT_MOD_NONE:
 		return I915_TILING_NONE;
-	case LOCAL_I915_FORMAT_MOD_X_TILED:
+	case I915_FORMAT_MOD_X_TILED:
 		return I915_TILING_X;
-	case LOCAL_I915_FORMAT_MOD_Y_TILED:
-	case LOCAL_I915_FORMAT_MOD_Y_TILED_CCS:
-	case LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS:
-	case LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC:
-	case LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS:
+	case I915_FORMAT_MOD_Y_TILED:
+	case I915_FORMAT_MOD_Y_TILED_CCS:
+	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS:
+	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC:
+	case I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS:
 		return I915_TILING_Y;
-	case LOCAL_I915_FORMAT_MOD_Yf_TILED:
-	case LOCAL_I915_FORMAT_MOD_Yf_TILED_CCS:
+	case I915_FORMAT_MOD_Yf_TILED:
+	case I915_FORMAT_MOD_Yf_TILED_CCS:
 		return I915_TILING_Yf;
 	default:
 		igt_assert(0);
@@ -953,11 +953,11 @@ uint64_t igt_fb_tiling_to_mod(uint64_t tiling)
 	case I915_TILING_NONE:
 		return LOCAL_DRM_FORMAT_MOD_NONE;
 	case I915_TILING_X:
-		return LOCAL_I915_FORMAT_MOD_X_TILED;
+		return I915_FORMAT_MOD_X_TILED;
 	case I915_TILING_Y:
-		return LOCAL_I915_FORMAT_MOD_Y_TILED;
+		return I915_FORMAT_MOD_Y_TILED;
 	case I915_TILING_Yf:
-		return LOCAL_I915_FORMAT_MOD_Yf_TILED;
+		return I915_FORMAT_MOD_Yf_TILED;
 	default:
 		igt_assert(0);
 	}
@@ -2335,7 +2335,7 @@ igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
 				 end - fb->offsets[i]);
 	}
 
-	if (fb->modifier == LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC)
+	if (fb->modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC)
 		buf->cc.offset = fb->offsets[2];
 
 	return buf;
diff --git a/lib/ioctl_wrappers.h b/lib/ioctl_wrappers.h
index a8274a3f..689e6d53 100644
--- a/lib/ioctl_wrappers.h
+++ b/lib/ioctl_wrappers.h
@@ -179,14 +179,6 @@ struct local_drm_mode_fb_cmd2 {
 		(val & 0x00ffffffffffffffL))
 
 #define LOCAL_DRM_FORMAT_MOD_NONE	(0)
-#define LOCAL_I915_FORMAT_MOD_X_TILED	local_fourcc_mod_code(INTEL, 1)
-#define LOCAL_I915_FORMAT_MOD_Y_TILED	local_fourcc_mod_code(INTEL, 2)
-#define LOCAL_I915_FORMAT_MOD_Yf_TILED	local_fourcc_mod_code(INTEL, 3)
-#define LOCAL_I915_FORMAT_MOD_Y_TILED_CCS	local_fourcc_mod_code(INTEL, 4)
-#define LOCAL_I915_FORMAT_MOD_Yf_TILED_CCS	local_fourcc_mod_code(INTEL, 5)
-#define LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS fourcc_mod_code(INTEL, 6)
-#define LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS fourcc_mod_code(INTEL, 7)
-#define LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC fourcc_mod_code(INTEL, 8)
 #define LOCAL_DRM_IOCTL_MODE_ADDFB2	DRM_IOWR(0xB8,			\
 						 struct local_drm_mode_fb_cmd2)
 
diff --git a/tests/i915/gem_eio.c b/tests/i915/gem_eio.c
index 50d250f3..9d5df8ef 100644
--- a/tests/i915/gem_eio.c
+++ b/tests/i915/gem_eio.c
@@ -897,7 +897,7 @@ static void display_helper(igt_display_t *dpy, int *done)
 			igt_create_pattern_fb(dpy->drm_fd,
 					      mode->hdisplay, mode->vdisplay,
 					      DRM_FORMAT_XRGB8888,
-					      LOCAL_I915_FORMAT_MOD_X_TILED,
+					      I915_FORMAT_MOD_X_TILED,
 					      &fb);
 		}
 
diff --git a/tests/i915/gem_exec_reloc.c b/tests/i915/gem_exec_reloc.c
index d5447334..7a93736d 100644
--- a/tests/i915/gem_exec_reloc.c
+++ b/tests/i915/gem_exec_reloc.c
@@ -1311,7 +1311,7 @@ pin_scanout(igt_display_t *dpy, igt_output_t *output, struct igt_fb *fb)
 
 	igt_create_pattern_fb(dpy->drm_fd, mode->hdisplay, mode->vdisplay,
 			      DRM_FORMAT_XRGB8888,
-			      LOCAL_I915_FORMAT_MOD_X_TILED, fb);
+			      I915_FORMAT_MOD_X_TILED, fb);
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, fb);
diff --git a/tests/i915/i915_fb_tiling.c b/tests/i915/i915_fb_tiling.c
index 7d5c3f1f..725ad3ad 100644
--- a/tests/i915/i915_fb_tiling.c
+++ b/tests/i915/i915_fb_tiling.c
@@ -33,7 +33,7 @@ igt_simple_main
 	int ret;
 
 	igt_create_fb(drm_fd, 512, 512, DRM_FORMAT_XRGB8888,
-		      LOCAL_I915_FORMAT_MOD_X_TILED, &fb);
+		      I915_FORMAT_MOD_X_TILED, &fb);
 
 	ret = __gem_set_tiling(drm_fd, fb.gem_handle, I915_TILING_X, fb.strides[0]);
 	igt_assert_eq(ret, 0);
diff --git a/tests/i915/i915_getparams_basic.c b/tests/i915/i915_getparams_basic.c
index e1b4634f..09b38d8a 100644
--- a/tests/i915/i915_getparams_basic.c
+++ b/tests/i915/i915_getparams_basic.c
@@ -49,8 +49,6 @@ deinit(void)
 	close(drm_fd);
 }
 
-#define LOCAL_I915_PARAM_SUBSLICE_TOTAL	33
-#define LOCAL_I915_PARAM_EU_TOTAL	34
 
 static int
 getparam(int param, int *value)
@@ -74,7 +72,7 @@ subslice_total(void)
 	unsigned int subslice_total = 0;
 	int ret;
 
-	ret = getparam(LOCAL_I915_PARAM_SUBSLICE_TOTAL, (int*)&subslice_total);
+	ret = getparam(I915_PARAM_SUBSLICE_TOTAL, (int*)&subslice_total);
 	igt_skip_on_f(ret == -EINVAL && intel_gen(devid), "Interface not supported by kernel\n");
 
 	if (ret) {
@@ -111,7 +109,7 @@ eu_total(void)
 	unsigned int eu_total = 0;
 	int ret;
 
-	ret = getparam(LOCAL_I915_PARAM_EU_TOTAL, (int*)&eu_total);
+	ret = getparam(I915_PARAM_EU_TOTAL, (int*)&eu_total);
 	igt_skip_on_f(ret == -EINVAL, "Interface not supported by kernel\n");
 
 	if (ret) {
diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
index 0301fecc..2705b7d0 100644
--- a/tests/i915/i915_pm_dc.c
+++ b/tests/i915/i915_pm_dc.c
@@ -144,7 +144,7 @@ static void setup_primary(data_t *data)
 	igt_create_color_fb(data->drm_fd,
 			    data->mode->hdisplay, data->mode->vdisplay,
 			    DRM_FORMAT_XRGB8888,
-			    LOCAL_I915_FORMAT_MOD_X_TILED,
+			    I915_FORMAT_MOD_X_TILED,
 			    1.0, 1.0, 1.0,
 			    &data->fb_white);
 	igt_plane_set_fb(primary, &data->fb_white);
diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index fb7a70aa..6b086eee 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -1592,7 +1592,7 @@ static void cursor_subtest(bool dpms)
 	igt_create_fb(drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
 		      LOCAL_DRM_FORMAT_MOD_NONE, &cursor_fb2);
 	igt_create_fb(drm_fd, 64, 64, DRM_FORMAT_XRGB8888,
-		      LOCAL_I915_FORMAT_MOD_X_TILED, &cursor_fb3);
+		      I915_FORMAT_MOD_X_TILED, &cursor_fb3);
 
 	fill_igt_fb(&cursor_fb1, 0xFF00FFFF);
 	fill_igt_fb(&cursor_fb2, 0xFF00FF00);
@@ -1710,13 +1710,13 @@ static void test_one_plane(bool dpms, uint32_t plane_id,
 		plane_format = DRM_FORMAT_XRGB8888;
 		plane_w = 64;
 		plane_h = 64;
-		tiling = LOCAL_I915_FORMAT_MOD_X_TILED;
+		tiling = I915_FORMAT_MOD_X_TILED;
 		break;
 	case PLANE_PRIMARY:
 		plane_format = DRM_FORMAT_XRGB8888;
 		plane_w = default_mode_params->mode->hdisplay;
 		plane_h = default_mode_params->mode->vdisplay;
-		tiling = LOCAL_I915_FORMAT_MOD_X_TILED;
+		tiling = I915_FORMAT_MOD_X_TILED;
 		break;
 	case PLANE_CURSOR:
 		plane_format = DRM_FORMAT_ARGB8888;
@@ -1935,7 +1935,7 @@ static void fences_subtest(bool dpms)
 	params.connector_id = default_mode_params->connector_id;
 	params.mode = default_mode_params->mode;
 	igt_create_fb(drm_fd, params.mode->hdisplay, params.mode->vdisplay,
-		      DRM_FORMAT_XRGB8888, LOCAL_I915_FORMAT_MOD_X_TILED,
+		      DRM_FORMAT_XRGB8888, I915_FORMAT_MOD_X_TILED,
 		      &params.fb);
 
 	/* Even though we passed "true" as the tiling argument, double-check
diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
index 91fb6ac9..7937fff8 100644
--- a/tests/kms_addfb_basic.c
+++ b/tests/kms_addfb_basic.c
@@ -129,7 +129,7 @@ static void invalid_tests(int fd)
 	igt_subtest("unused-modifier") {
 		igt_require_fb_modifiers(fd);
 
-		f.modifier[1] =  LOCAL_I915_FORMAT_MOD_X_TILED;
+		f.modifier[1] =  I915_FORMAT_MOD_X_TILED;
 		igt_assert(drmIoctl(fd, LOCAL_DRM_IOCTL_MODE_ADDFB2, &f) == -1 &&
 			   errno == EINVAL);
 		f.modifier[1] = 0;
@@ -343,12 +343,12 @@ static void tiling_tests(int fd)
 		igt_fixture {
 			igt_require_intel(fd);
 			tiled_x_bo = igt_create_bo_with_dimensions(fd, 1024, 1024,
-				DRM_FORMAT_XRGB8888, LOCAL_I915_FORMAT_MOD_X_TILED,
+				DRM_FORMAT_XRGB8888, I915_FORMAT_MOD_X_TILED,
 				1024*4, NULL, NULL, NULL);
 			igt_assert(tiled_x_bo);
 
 			tiled_y_bo = igt_create_bo_with_dimensions(fd, 1024, 1024,
-				DRM_FORMAT_XRGB8888, LOCAL_I915_FORMAT_MOD_Y_TILED,
+				DRM_FORMAT_XRGB8888, I915_FORMAT_MOD_Y_TILED,
 				1024*4, NULL, NULL, NULL);
 			igt_assert(tiled_y_bo);
 
@@ -549,7 +549,7 @@ static void addfb25_tests(int fd)
 	igt_subtest("addfb25-modifier-no-flag") {
 		igt_require_fb_modifiers(fd);
 
-		f.modifier[0] = LOCAL_I915_FORMAT_MOD_X_TILED;
+		f.modifier[0] = I915_FORMAT_MOD_X_TILED;
 		igt_assert(drmIoctl(fd, LOCAL_DRM_IOCTL_MODE_ADDFB2, &f) < 0 && errno == EINVAL);
 	}
 
@@ -579,7 +579,7 @@ static void addfb25_tests(int fd)
 
 		igt_describe("Check if addfb2 call works for x-tiling");
 		igt_subtest("addfb25-x-tiled-legacy") {
-			f.modifier[0] = LOCAL_I915_FORMAT_MOD_X_TILED;
+			f.modifier[0] = I915_FORMAT_MOD_X_TILED;
 			igt_assert(drmIoctl(fd, LOCAL_DRM_IOCTL_MODE_ADDFB2, &f) == 0);
 			igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id) == 0);
 			f.fb_id = 0;
@@ -587,7 +587,7 @@ static void addfb25_tests(int fd)
 
 		igt_describe("Check if addfb2 call works for relevant combination of tiling and fbs");
 		igt_subtest("addfb25-framebuffer-vs-set-tiling") {
-			f.modifier[0] = LOCAL_I915_FORMAT_MOD_X_TILED;
+			f.modifier[0] = I915_FORMAT_MOD_X_TILED;
 			igt_assert(drmIoctl(fd, LOCAL_DRM_IOCTL_MODE_ADDFB2, &f) == 0);
 			igt_assert(__gem_set_tiling(fd, gem_bo, I915_TILING_X, 512*4) == -EBUSY);
 			igt_assert(__gem_set_tiling(fd, gem_bo, I915_TILING_Y, 1024*4) == -EBUSY);
@@ -637,7 +637,7 @@ static void addfb25_ytile(int fd)
 		igt_require_fb_modifiers(fd);
 		igt_require_intel(fd);
 
-		f.modifier[0] = LOCAL_I915_FORMAT_MOD_Y_TILED;
+		f.modifier[0] = I915_FORMAT_MOD_Y_TILED;
 		igt_assert(drmIoctl(fd, LOCAL_DRM_IOCTL_MODE_ADDFB2, &f) ==
 			   addfb_expected_ret(&display, &f));
 		if (!addfb_expected_ret(&display, &f))
@@ -650,7 +650,7 @@ static void addfb25_ytile(int fd)
 		igt_require_fb_modifiers(fd);
 		igt_require_intel(fd);
 
-		f.modifier[0] = LOCAL_I915_FORMAT_MOD_Yf_TILED;
+		f.modifier[0] = I915_FORMAT_MOD_Yf_TILED;
 		igt_assert(drmIoctl(fd, LOCAL_DRM_IOCTL_MODE_ADDFB2, &f) ==
 			   addfb_expected_ret(&display, &f));
 		if (!addfb_expected_ret(&display, &f))
@@ -663,7 +663,7 @@ static void addfb25_ytile(int fd)
 		igt_require_fb_modifiers(fd);
 		igt_require_intel(fd);
 
-		f.modifier[0] = LOCAL_I915_FORMAT_MOD_Y_TILED;
+		f.modifier[0] = I915_FORMAT_MOD_Y_TILED;
 		f.height = 1023;
 		f.handles[0] = gem_bo_small;
 		igt_require(addfb_expected_ret(&display, &f) == 0);
diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index a60eab68..7a63f42b 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -134,7 +134,7 @@ static void make_fb(data_t *data, struct igt_fb *fb,
 	rec_width = width / (ARRAY_SIZE(data->bufs) * 2);
 
 	igt_create_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
-		      LOCAL_I915_FORMAT_MOD_X_TILED, fb);
+		      I915_FORMAT_MOD_X_TILED, fb);
 	igt_draw_fill_fb(data->drm_fd, fb, 0x88);
 	igt_draw_rect_fb(data->drm_fd, NULL, 0, fb, IGT_DRAW_MMAP_CPU,
 			 rec_width * 2 + rec_width * index,
@@ -336,10 +336,10 @@ static void test_invalid(data_t *data)
 	height = data->connector->modes[0].vdisplay;
 
 	igt_require(igt_display_has_format_mod(&data->display, DRM_FORMAT_XRGB8888,
-					       LOCAL_I915_FORMAT_MOD_Y_TILED));
+					       I915_FORMAT_MOD_Y_TILED));
 
 	igt_create_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
-		      LOCAL_I915_FORMAT_MOD_Y_TILED, &fb);
+		      I915_FORMAT_MOD_Y_TILED, &fb);
 
 	/* Flip with a different fb modifier which is expected to be rejected */
 	ret = drmModePageFlip(data->drm_fd, data->crtc_id,
diff --git a/tests/kms_busy.c b/tests/kms_busy.c
index 0973daf0..9722aadc 100644
--- a/tests/kms_busy.c
+++ b/tests/kms_busy.c
@@ -44,7 +44,7 @@ set_fb_on_crtc(igt_display_t *dpy, int pipe, struct igt_fb *fb)
 
 	igt_create_pattern_fb(dpy->drm_fd, mode->hdisplay, mode->vdisplay,
 			      DRM_FORMAT_XRGB8888,
-			      LOCAL_I915_FORMAT_MOD_X_TILED, fb);
+			      I915_FORMAT_MOD_X_TILED, fb);
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, fb);
@@ -147,7 +147,7 @@ static void test_flip(igt_display_t *dpy, int pipe, bool modeset)
 	igt_create_pattern_fb(dpy->drm_fd,
 			      fb[0].width, fb[0].height,
 			      DRM_FORMAT_XRGB8888,
-			      LOCAL_I915_FORMAT_MOD_X_TILED,
+			      I915_FORMAT_MOD_X_TILED,
 			      &fb[1]);
 
 	/* Bind both fb to the display (such that they are ready for future
@@ -228,7 +228,7 @@ static void test_hang(igt_display_t *dpy,
 	igt_create_pattern_fb(dpy->drm_fd,
 			      fb[0].width, fb[0].height,
 			      DRM_FORMAT_XRGB8888,
-			      LOCAL_I915_FORMAT_MOD_X_TILED,
+			      I915_FORMAT_MOD_X_TILED,
 			      &fb[1]);
 
 	if (modeset) {
diff --git a/tests/kms_ccs.c b/tests/kms_ccs.c
index 62850c1b..c3453160 100644
--- a/tests/kms_ccs.c
+++ b/tests/kms_ccs.c
@@ -93,11 +93,11 @@ static const struct {
 	uint64_t modifier;
 	const char *str;
 } ccs_modifiers[] = {
-	{LOCAL_I915_FORMAT_MOD_Y_TILED_CCS, "y_tiled_ccs"},
-	{LOCAL_I915_FORMAT_MOD_Yf_TILED_CCS, "yf_tiled_ccs"},
-	{LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS, "y_tiled_gen12_rc_ccs"},
-	{LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC, "y_tiled_gen12_rc_ccs_cc"},
-	{LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS, "y_tiled_gen12_mc_ccs"},
+	{I915_FORMAT_MOD_Y_TILED_CCS, "y_tiled_ccs"},
+	{I915_FORMAT_MOD_Yf_TILED_CCS, "yf_tiled_ccs"},
+	{I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS, "y_tiled_gen12_rc_ccs"},
+	{I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC, "y_tiled_gen12_rc_ccs_cc"},
+	{I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS, "y_tiled_gen12_mc_ccs"},
 };
 
 static bool check_ccs_planes;
@@ -130,7 +130,7 @@ static void addfb_init(struct igt_fb *fb, struct drm_mode_fb_cmd2 *f)
 
 static bool is_ccs_cc_modifier(uint64_t modifier)
 {
-	return modifier == LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC;
+	return modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC;
 }
 
 /*
@@ -277,7 +277,7 @@ static void generate_fb(data_t *data, struct igt_fb *fb,
 	if (fb_flags & FB_COMPRESSED)
 		modifier = data->ccs_modifier;
 	else if (!(fb_flags & FB_HAS_PLANE))
-		modifier = LOCAL_I915_FORMAT_MOD_Y_TILED;
+		modifier = I915_FORMAT_MOD_Y_TILED;
 	else
 		modifier = 0;
 
diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index c3f29ec7..25d4b3c9 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -176,7 +176,7 @@ prepare_planes(data_t *data, enum pipe pipe, int max_planes,
 		igt_create_color_fb(data->drm_fd,
 				    size[i], size[i],
 				    data->plane[i]->type == DRM_PLANE_TYPE_CURSOR ? DRM_FORMAT_ARGB8888 : DRM_FORMAT_XRGB8888,
-				    data->plane[i]->type == DRM_PLANE_TYPE_CURSOR ? LOCAL_DRM_FORMAT_MOD_NONE : LOCAL_I915_FORMAT_MOD_X_TILED,
+				    data->plane[i]->type == DRM_PLANE_TYPE_CURSOR ? LOCAL_DRM_FORMAT_MOD_NONE : I915_FORMAT_MOD_X_TILED,
 				    0.0f, 0.0f, 1.0f,
 				    &data->fb[i]);
 
@@ -187,7 +187,7 @@ prepare_planes(data_t *data, enum pipe pipe, int max_planes,
 	/* primary plane */
 	data->plane[primary->index] = primary;
 	create_fb_for_mode_position(data, mode, x, y, size, size,
-				    LOCAL_I915_FORMAT_MOD_X_TILED,
+				    I915_FORMAT_MOD_X_TILED,
 				    max_planes, output);
 
 	igt_plane_set_fb(data->plane[primary->index], &data->fb[primary->index]);
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 571ea59c..75a822c4 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -1325,7 +1325,7 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
 
 	igt_require(set_fb_on_crtc(display, pipe, &fb_info[0]));
 	igt_create_color_pattern_fb(display->drm_fd, fb_info[0].width, fb_info[0].height,
-				    DRM_FORMAT_XRGB8888, LOCAL_I915_FORMAT_MOD_X_TILED, .1, .1, .1, &fb_info[1]);
+				    DRM_FORMAT_XRGB8888, I915_FORMAT_MOD_X_TILED, .1, .1, .1, &fb_info[1]);
 
 	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888, 0, 1., 1., 1., &cursor_fb);
 	populate_cursor_args(display, pipe, arg, &cursor_fb);
diff --git a/tests/kms_draw_crc.c b/tests/kms_draw_crc.c
index dcda2e04..153e654e 100644
--- a/tests/kms_draw_crc.c
+++ b/tests/kms_draw_crc.c
@@ -51,8 +51,8 @@ static const uint32_t formats[N_FORMATS] = {
 #define N_TILING_METHODS 3
 static const uint64_t tilings[N_TILING_METHODS] = {
 	LOCAL_DRM_FORMAT_MOD_NONE,
-	LOCAL_I915_FORMAT_MOD_X_TILED,
-	LOCAL_I915_FORMAT_MOD_Y_TILED,
+	I915_FORMAT_MOD_X_TILED,
+	I915_FORMAT_MOD_Y_TILED,
 };
 
 struct base_crc {
@@ -242,11 +242,11 @@ static void fill_fb_subtest(void)
 	get_fill_crc(LOCAL_DRM_FORMAT_MOD_NONE, &crc);
 	igt_assert_crc_equal(&crc, &base_crc);
 
-	get_fill_crc(LOCAL_I915_FORMAT_MOD_X_TILED, &crc);
+	get_fill_crc(I915_FORMAT_MOD_X_TILED, &crc);
 	igt_assert_crc_equal(&crc, &base_crc);
 
 	if (intel_display_ver(intel_get_drm_devid(drm_fd)) >= 9) {
-		get_fill_crc(LOCAL_I915_FORMAT_MOD_Y_TILED, &crc);
+		get_fill_crc(I915_FORMAT_MOD_Y_TILED, &crc);
 		igt_assert_crc_equal(&crc, &base_crc);
 	}
 
@@ -311,9 +311,9 @@ static const char *tiling_str(int tiling_index)
 	switch (tilings[tiling_index]) {
 	case LOCAL_DRM_FORMAT_MOD_NONE:
 		return "untiled";
-	case LOCAL_I915_FORMAT_MOD_X_TILED:
+	case I915_FORMAT_MOD_X_TILED:
 		return "xtiled";
-	case LOCAL_I915_FORMAT_MOD_Y_TILED:
+	case I915_FORMAT_MOD_Y_TILED:
 		return "ytiled";
 	default:
 		igt_assert(false);
diff --git a/tests/kms_fbcon_fbt.c b/tests/kms_fbcon_fbt.c
index 43a7ace1..98c452c4 100644
--- a/tests/kms_fbcon_fbt.c
+++ b/tests/kms_fbcon_fbt.c
@@ -186,7 +186,7 @@ static void set_mode_for_one_screen(struct drm_info *drm,
 
 	buffer_id = igt_create_fb(drm->fd, mode->hdisplay, mode->vdisplay,
 				  DRM_FORMAT_XRGB8888,
-				  LOCAL_I915_FORMAT_MOD_X_TILED, &drm->fb);
+				  I915_FORMAT_MOD_X_TILED, &drm->fb);
 	igt_draw_fill_fb(drm->fd, &drm->fb, 0xFF);
 
 	igt_info("Setting %dx%d mode for %s connector\n",
diff --git a/tests/kms_fence_pin_leak.c b/tests/kms_fence_pin_leak.c
index e0f122df..16eb595f 100644
--- a/tests/kms_fence_pin_leak.c
+++ b/tests/kms_fence_pin_leak.c
@@ -131,12 +131,12 @@ static void run_single_test(data_t *data, enum pipe pipe, igt_output_t *output)
 
 	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
 			    DRM_FORMAT_XRGB8888,
-			    LOCAL_I915_FORMAT_MOD_X_TILED , /* need a fence so must be tiled */
+			    I915_FORMAT_MOD_X_TILED , /* need a fence so must be tiled */
 			    0.0, 0.0, 0.0,
 			    &fb[0]);
 	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
 			    DRM_FORMAT_XRGB8888,
-			    LOCAL_I915_FORMAT_MOD_X_TILED, /* need a fence so must be tiled */
+			    I915_FORMAT_MOD_X_TILED, /* need a fence so must be tiled */
 			    0.0, 0.0, 0.0,
 			    &fb[1]);
 
diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 8f736652..03c785bd 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1278,7 +1278,7 @@ static void __run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
 
 	tiling = LOCAL_DRM_FORMAT_MOD_NONE;
 	if (o->flags & TEST_FENCE_STRESS)
-		tiling = LOCAL_I915_FORMAT_MOD_X_TILED;
+		tiling = I915_FORMAT_MOD_X_TILED;
 
 	/* 256 MB is usually the maximum mappable aperture,
 	 * (make it 4x times that to ensure failure) */
diff --git a/tests/kms_flip_scaled_crc.c b/tests/kms_flip_scaled_crc.c
index 19c879fe..24ca1224 100644
--- a/tests/kms_flip_scaled_crc.c
+++ b/tests/kms_flip_scaled_crc.c
@@ -52,56 +52,56 @@ const struct {
 	{
 		"flip-32bpp-ytile-to-64bpp-ytile",
 		"Flip from 32bpp non scaled fb to 64bpp downscaled fb to stress CD clock programming",
-		LOCAL_I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB8888,
-		LOCAL_I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB16161616F,
+		I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB8888,
+		I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB16161616F,
 		1.0,
 		2.0,
 	},
 	{
 		"flip-64bpp-ytile-to-32bpp-ytile",
 		"Flip from 64bpp non scaled fb to 32bpp downscaled fb to stress CD clock programming",
-		LOCAL_I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB16161616F,
-		LOCAL_I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB8888,
+		I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB16161616F,
+		I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB8888,
 		1.0,
 		2.0,
 	},
 	{
 		"flip-64bpp-ytile-to-16bpp-ytile",
 		"Flip from 64bpp non scaled fb to 16bpp downscaled fb to stress CD clock programming",
-		LOCAL_I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB16161616F,
-		LOCAL_I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_RGB565,
+		I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB16161616F,
+		I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_RGB565,
 		1.0,
 		2.0,
 	},
 	{
 		"flip-32bpp-ytileccs-to-64bpp-ytile",
 		"Flip from 32bpp non scaled fb to 64bpp downscaled fb to stress CD clock programming",
-		LOCAL_I915_FORMAT_MOD_Y_TILED_CCS, DRM_FORMAT_XRGB8888,
-		LOCAL_I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB16161616F,
+		I915_FORMAT_MOD_Y_TILED_CCS, DRM_FORMAT_XRGB8888,
+		I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB16161616F,
 		1.0,
 		2.0,
 	},
 	{
 		"flip-32bpp-ytile-to-32bpp-ytilegen12rcccs",
 		"Flip from 32bpp non scaled fb to 32bpp downscaled fb to stress CD clock programming",
-		LOCAL_I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB8888,
-		LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS, DRM_FORMAT_XRGB8888,
+		I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB8888,
+		I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS, DRM_FORMAT_XRGB8888,
 		1.0,
 		2.0,
 	},
 	{
 		"flip-32bpp-ytile-to-32bpp-ytileccs",
 		"Flip from 32bpp non scaled fb to 32bpp downscaled fb to stress CD clock programming",
-		LOCAL_I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB8888,
-		LOCAL_I915_FORMAT_MOD_Y_TILED_CCS, DRM_FORMAT_XRGB8888,
+		I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB8888,
+		I915_FORMAT_MOD_Y_TILED_CCS, DRM_FORMAT_XRGB8888,
 		1.0,
 		2.0,
 	},
 	{
 		"flip-64bpp-ytile-to-32bpp-ytilercccs",
 		"Flip from 64bpp non scaled fb to 32bpp downscaled fb to stress CD clock programming",
-		LOCAL_I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB16161616F,
-		LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS, DRM_FORMAT_XRGB8888,
+		I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB16161616F,
+		I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS, DRM_FORMAT_XRGB8888,
 		1.0,
 		2.0,
 	},
diff --git a/tests/kms_flip_tiling.c b/tests/kms_flip_tiling.c
index 211117f3..48901acb 100644
--- a/tests/kms_flip_tiling.c
+++ b/tests/kms_flip_tiling.c
@@ -80,10 +80,10 @@ test_flip_tiling(data_t *data, enum pipe pipe, igt_output_t *output, uint64_t ti
 	mode = igt_output_get_mode(output);
 
 	/* Interlaced modes don't support Y/Yf tiling */
-	if (tiling[0] == LOCAL_I915_FORMAT_MOD_Y_TILED ||
-	    tiling[0] == LOCAL_I915_FORMAT_MOD_Yf_TILED ||
-	    tiling[1] == LOCAL_I915_FORMAT_MOD_Y_TILED ||
-	    tiling[1] == LOCAL_I915_FORMAT_MOD_Yf_TILED)
+	if (tiling[0] == I915_FORMAT_MOD_Y_TILED ||
+	    tiling[0] == I915_FORMAT_MOD_Yf_TILED ||
+	    tiling[1] == I915_FORMAT_MOD_Y_TILED ||
+	    tiling[1] == I915_FORMAT_MOD_Yf_TILED)
 		igt_require(!(mode->flags & DRM_MODE_FLAG_INTERLACE));
 
 	primary = igt_output_get_plane(output, 0);
@@ -181,7 +181,7 @@ igt_main
 
 	igt_describe("Check pageflip from tiled buffer to linear one works correctly with x tiling");
 	igt_subtest_with_dynamic("flip-changes-tiling") {
-		uint64_t tiling[2] = { LOCAL_I915_FORMAT_MOD_X_TILED,
+		uint64_t tiling[2] = { I915_FORMAT_MOD_X_TILED,
 				       LOCAL_DRM_FORMAT_MOD_NONE };
 		enum pipe pipe;
 
@@ -197,7 +197,7 @@ igt_main
 
 	igt_describe("Check pageflip from tiled buffer to linear one works correctly with y tiling");
 	igt_subtest_with_dynamic("flip-changes-tiling-Y") {
-		uint64_t tiling[2] = { LOCAL_I915_FORMAT_MOD_Y_TILED,
+		uint64_t tiling[2] = { I915_FORMAT_MOD_Y_TILED,
 				       LOCAL_DRM_FORMAT_MOD_NONE };
 		enum pipe pipe;
 
@@ -217,7 +217,7 @@ igt_main
 
 	igt_describe("Check pageflip from tiled buffer to linear one works correctly with yf tiling");
 	igt_subtest_with_dynamic("flip-changes-tiling-Yf") {
-		uint64_t tiling[2] = { LOCAL_I915_FORMAT_MOD_Yf_TILED,
+		uint64_t tiling[2] = { I915_FORMAT_MOD_Yf_TILED,
 				       LOCAL_DRM_FORMAT_MOD_NONE };
 		enum pipe pipe;
 
@@ -245,8 +245,8 @@ igt_main
 
 	igt_describe("Check pageflip from tiled buffer to another tiled one works correctly with x tiling");
 	igt_subtest_with_dynamic("flip-X-tiled") {
-		uint64_t tiling[2] = { LOCAL_I915_FORMAT_MOD_X_TILED,
-				       LOCAL_I915_FORMAT_MOD_X_TILED };
+		uint64_t tiling[2] = { I915_FORMAT_MOD_X_TILED,
+				       I915_FORMAT_MOD_X_TILED };
 		enum pipe pipe;
 
 		for (int i = 0; i < ARRAY_SIZE(tiling); i++)
@@ -261,8 +261,8 @@ igt_main
 
 	igt_describe("Check pageflip from tiled buffer to another tiled one works correctly with y tiling");
 	igt_subtest_with_dynamic("flip-Y-tiled") {
-		uint64_t tiling[2] = { LOCAL_I915_FORMAT_MOD_Y_TILED,
-				       LOCAL_I915_FORMAT_MOD_Y_TILED };
+		uint64_t tiling[2] = { I915_FORMAT_MOD_Y_TILED,
+				       I915_FORMAT_MOD_Y_TILED };
 		enum pipe pipe;
 
 		igt_require_fb_modifiers(data.drm_fd);
@@ -281,8 +281,8 @@ igt_main
 
 	igt_describe("Check pageflip from tiled buffer to another tiled one works correctly with yf tiling");
 	igt_subtest_with_dynamic("flip-Yf-tiled") {
-		uint64_t tiling[2] = { LOCAL_I915_FORMAT_MOD_Yf_TILED,
-				       LOCAL_I915_FORMAT_MOD_Yf_TILED };
+		uint64_t tiling[2] = { I915_FORMAT_MOD_Yf_TILED,
+				       I915_FORMAT_MOD_Yf_TILED };
 		enum pipe pipe;
 
 		igt_require_fb_modifiers(data.drm_fd);
@@ -310,7 +310,7 @@ igt_main
 	igt_describe("Check pageflip from linear buffer to tiled one works correctly with x tiling");
 	igt_subtest_with_dynamic("flip-to-X-tiled") {
 		uint64_t tiling[2] = { LOCAL_DRM_FORMAT_MOD_NONE,
-				       LOCAL_I915_FORMAT_MOD_X_TILED };
+				       I915_FORMAT_MOD_X_TILED };
 		enum pipe pipe;
 
 		for (int i = 0; i < ARRAY_SIZE(tiling); i++)
@@ -326,7 +326,7 @@ igt_main
 	igt_describe("Check pageflip from linear buffer to tiled one works correctly with y tiling");
 	igt_subtest_with_dynamic("flip-to-Y-tiled") {
 		uint64_t tiling[2] = { LOCAL_DRM_FORMAT_MOD_NONE,
-				       LOCAL_I915_FORMAT_MOD_Y_TILED };
+				       I915_FORMAT_MOD_Y_TILED };
 		enum pipe pipe;
 
 		igt_require_fb_modifiers(data.drm_fd);
@@ -346,7 +346,7 @@ igt_main
 	igt_describe("Check pageflip from linear buffer to tiled one works correctly with yf tiling");
 	igt_subtest_with_dynamic("flip-to-Yf-tiled") {
 		uint64_t tiling[2] = { LOCAL_DRM_FORMAT_MOD_NONE,
-				       LOCAL_I915_FORMAT_MOD_Yf_TILED };
+				       I915_FORMAT_MOD_Yf_TILED };
 		enum pipe pipe;
 
 		igt_require_fb_modifiers(data.drm_fd);
diff --git a/tests/kms_frontbuffer_tracking.c b/tests/kms_frontbuffer_tracking.c
index 97902c08..c2f180aa 100644
--- a/tests/kms_frontbuffer_tracking.c
+++ b/tests/kms_frontbuffer_tracking.c
@@ -460,9 +460,9 @@ static uint64_t tiling_to_modifier(enum tiling_type tiling)
 	case TILING_LINEAR:
 		return LOCAL_DRM_FORMAT_MOD_NONE;
 	case TILING_X:
-		return LOCAL_I915_FORMAT_MOD_X_TILED;
+		return I915_FORMAT_MOD_X_TILED;
 	case TILING_Y:
-		return LOCAL_I915_FORMAT_MOD_Y_TILED;
+		return I915_FORMAT_MOD_Y_TILED;
 	default:
 		igt_assert(false);
 	}
diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
index 7fd02180..4dc5a345 100644
--- a/tests/kms_plane_lowres.c
+++ b/tests/kms_plane_lowres.c
@@ -303,17 +303,17 @@ igt_main
 		igt_describe("Tests the visibility of the planes when switching between "
 			     "high and low resolution with x-tiling.");
 		igt_subtest_f("pipe-%s-tiling-x", kmstest_pipe_name(pipe))
-			test_planes_on_pipe(&data, LOCAL_I915_FORMAT_MOD_X_TILED);
+			test_planes_on_pipe(&data, I915_FORMAT_MOD_X_TILED);
 
 		igt_describe("Tests the visibility of the planes when switching between "
 			     "high and low resolution with y-tiling.");
 		igt_subtest_f("pipe-%s-tiling-y", kmstest_pipe_name(pipe))
-			test_planes_on_pipe(&data, LOCAL_I915_FORMAT_MOD_Y_TILED);
+			test_planes_on_pipe(&data, I915_FORMAT_MOD_Y_TILED);
 
 		igt_describe("Tests the visibility of the planes when switching between "
 			     "high and low resolution with yf-tiling.");
 		igt_subtest_f("pipe-%s-tiling-yf", kmstest_pipe_name(pipe))
-			test_planes_on_pipe(&data, LOCAL_I915_FORMAT_MOD_Yf_TILED);
+			test_planes_on_pipe(&data, I915_FORMAT_MOD_Yf_TILED);
 	}
 
 	igt_fixture {
diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index 93c6ea7d..52133cd6 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -381,13 +381,13 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)
 	}
 
 	igt_subtest_f("atomic-pipe-%s-tiling-x", kmstest_pipe_name(pipe))
-		test_plane_position(data, pipe, LOCAL_I915_FORMAT_MOD_X_TILED);
+		test_plane_position(data, pipe, I915_FORMAT_MOD_X_TILED);
 
 	igt_subtest_f("atomic-pipe-%s-tiling-y", kmstest_pipe_name(pipe))
-		test_plane_position(data, pipe, LOCAL_I915_FORMAT_MOD_Y_TILED);
+		test_plane_position(data, pipe, I915_FORMAT_MOD_Y_TILED);
 
 	igt_subtest_f("atomic-pipe-%s-tiling-yf", kmstest_pipe_name(pipe))
-		test_plane_position(data, pipe, LOCAL_I915_FORMAT_MOD_Yf_TILED);
+		test_plane_position(data, pipe, I915_FORMAT_MOD_Yf_TILED);
 
 	igt_subtest_f("atomic-pipe-%s-tiling-none", kmstest_pipe_name(pipe))
 		test_plane_position(data, pipe, LOCAL_DRM_FORMAT_MOD_NONE);
diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 1dad2e60..1c68519e 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -82,7 +82,7 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe,
 {
 	igt_display_t *display = &data->display;
 	uint64_t tiling = is_i915_device(data->drm_fd) ?
-		LOCAL_I915_FORMAT_MOD_X_TILED : LOCAL_DRM_FORMAT_MOD_NONE;
+		I915_FORMAT_MOD_X_TILED : LOCAL_DRM_FORMAT_MOD_NONE;
 
 	cleanup_crtc(data);
 
@@ -252,7 +252,7 @@ static void test_scaler_with_rotation_pipe(data_t *d, enum pipe pipe,
 	igt_display_t *display = &d->display;
 	igt_plane_t *plane;
 	uint64_t tiling = is_i915_device(d->drm_fd) ?
-		LOCAL_I915_FORMAT_MOD_Y_TILED : LOCAL_DRM_FORMAT_MOD_NONE;
+		I915_FORMAT_MOD_Y_TILED : LOCAL_DRM_FORMAT_MOD_NONE;
 
 	igt_require(get_num_scalers(d, pipe) > 0);
 
@@ -286,9 +286,9 @@ static void test_scaler_with_rotation_pipe(data_t *d, enum pipe pipe,
 
 static const uint64_t tilings[] = {
 	LOCAL_DRM_FORMAT_MOD_NONE,
-	LOCAL_I915_FORMAT_MOD_X_TILED,
-	LOCAL_I915_FORMAT_MOD_Y_TILED,
-	LOCAL_I915_FORMAT_MOD_Yf_TILED
+	I915_FORMAT_MOD_X_TILED,
+	I915_FORMAT_MOD_Y_TILED,
+	I915_FORMAT_MOD_Yf_TILED
 };
 
 static void test_scaler_with_pixel_format_pipe(data_t *d, enum pipe pipe, igt_output_t *output)
@@ -369,7 +369,7 @@ test_plane_scaling_on_pipe(data_t *d, enum pipe pipe, igt_output_t *output)
 	drmModeModeInfo *mode;
 	int primary_plane_scaling = 0; /* For now */
 	uint64_t tiling = is_i915_device(display->drm_fd) ?
-		LOCAL_I915_FORMAT_MOD_X_TILED : LOCAL_DRM_FORMAT_MOD_NONE;
+		I915_FORMAT_MOD_X_TILED : LOCAL_DRM_FORMAT_MOD_NONE;
 
 	igt_require(get_num_scalers(d, pipe) > 0);
 
@@ -559,7 +559,7 @@ test_scaler_with_clipping_clamping_scenario(data_t *d, enum pipe pipe, igt_outpu
 
 		igt_create_pattern_fb(d->drm_fd,
 				      mode->hdisplay, mode->vdisplay, f1,
-				      LOCAL_I915_FORMAT_MOD_X_TILED, &d->fb[1]);
+				      I915_FORMAT_MOD_X_TILED, &d->fb[1]);
 
 		for (int j = 0; j < d->plane2->drm_plane->count_formats; j++) {
 			unsigned f2 = d->plane2->drm_plane->formats[j];
@@ -570,7 +570,7 @@ test_scaler_with_clipping_clamping_scenario(data_t *d, enum pipe pipe, igt_outpu
 
 			igt_create_pattern_fb(d->drm_fd,
 					      mode->hdisplay, mode->vdisplay, f2,
-					      LOCAL_I915_FORMAT_MOD_Y_TILED,
+					      I915_FORMAT_MOD_Y_TILED,
 					      &d->fb[2]);
 
 			__test_scaler_with_clipping_clamping_scenario(d, mode);
@@ -617,7 +617,7 @@ static void test_scaler_with_multi_pipe_plane(data_t *d)
 	drmModeModeInfo *mode1, *mode2;
 	enum pipe pipe1, pipe2;
 	uint64_t tiling = is_i915_device(display->drm_fd) ?
-		LOCAL_I915_FORMAT_MOD_Y_TILED : LOCAL_DRM_FORMAT_MOD_NONE;
+		I915_FORMAT_MOD_Y_TILED : LOCAL_DRM_FORMAT_MOD_NONE;
 
 	cleanup_crtc(d);
 
diff --git a/tests/kms_psr.c b/tests/kms_psr.c
index cc713e27..97c95d96 100644
--- a/tests/kms_psr.c
+++ b/tests/kms_psr.c
@@ -358,7 +358,7 @@ static void setup_test_plane(data_t *data, int test_plane)
 	igt_create_color_fb(data->drm_fd,
 			    data->mode->hdisplay, data->mode->vdisplay,
 			    DRM_FORMAT_XRGB8888,
-			    LOCAL_I915_FORMAT_MOD_X_TILED,
+			    I915_FORMAT_MOD_X_TILED,
 			    0.0, 1.0, 0.0,
 			    &data->fb_green);
 
@@ -386,7 +386,7 @@ static void setup_test_plane(data_t *data, int test_plane)
 		igt_create_color_fb(data->drm_fd,
 				    white_h, white_v,
 				    DRM_FORMAT_XRGB8888,
-				    LOCAL_I915_FORMAT_MOD_X_TILED,
+				    I915_FORMAT_MOD_X_TILED,
 				    1.0, 1.0, 1.0,
 				    &data->fb_white);
 		break;
diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 811f295e..c0020cec 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -271,7 +271,7 @@ static void prepare_fbs(data_t *data, igt_output_t *output,
 	 * frame can fit in
 	 */
 	if (data->rotation & (IGT_ROTATION_90 | IGT_ROTATION_270)) {
-		tiling = data->override_tiling ?: LOCAL_I915_FORMAT_MOD_Y_TILED;
+		tiling = data->override_tiling ?: I915_FORMAT_MOD_Y_TILED;
 
 		igt_swap(w, h);
 	}
@@ -676,17 +676,17 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 		struct igt_fb fbs[ARRAY_SIZE(formatlist)][2];
 	} planeconfigs[] = {
 	{IGT_ROTATION_0, .2f, .4f, LOCAL_DRM_FORMAT_MOD_NONE },
-	{IGT_ROTATION_0, .2f, .4f, LOCAL_I915_FORMAT_MOD_X_TILED },
-	{IGT_ROTATION_0, .2f, .4f, LOCAL_I915_FORMAT_MOD_Y_TILED },
-	{IGT_ROTATION_0, .2f, .4f, LOCAL_I915_FORMAT_MOD_Yf_TILED },
-	{IGT_ROTATION_90, .2f, .4f, LOCAL_I915_FORMAT_MOD_Y_TILED },
-	{IGT_ROTATION_90, .2f, .4f, LOCAL_I915_FORMAT_MOD_Yf_TILED },
+	{IGT_ROTATION_0, .2f, .4f, I915_FORMAT_MOD_X_TILED },
+	{IGT_ROTATION_0, .2f, .4f, I915_FORMAT_MOD_Y_TILED },
+	{IGT_ROTATION_0, .2f, .4f, I915_FORMAT_MOD_Yf_TILED },
+	{IGT_ROTATION_90, .2f, .4f, I915_FORMAT_MOD_Y_TILED },
+	{IGT_ROTATION_90, .2f, .4f, I915_FORMAT_MOD_Yf_TILED },
 	{IGT_ROTATION_180, .2f, .4f, LOCAL_DRM_FORMAT_MOD_NONE },
-	{IGT_ROTATION_180, .2f, .4f, LOCAL_I915_FORMAT_MOD_X_TILED },
-	{IGT_ROTATION_180, .2f, .4f, LOCAL_I915_FORMAT_MOD_Y_TILED },
-	{IGT_ROTATION_180, .2f, .4f, LOCAL_I915_FORMAT_MOD_Yf_TILED },
-	{IGT_ROTATION_270, .2f, .4f, LOCAL_I915_FORMAT_MOD_Y_TILED },
-	{IGT_ROTATION_270, .2f, .4f, LOCAL_I915_FORMAT_MOD_Yf_TILED },
+	{IGT_ROTATION_180, .2f, .4f, I915_FORMAT_MOD_X_TILED },
+	{IGT_ROTATION_180, .2f, .4f, I915_FORMAT_MOD_Y_TILED },
+	{IGT_ROTATION_180, .2f, .4f, I915_FORMAT_MOD_Yf_TILED },
+	{IGT_ROTATION_270, .2f, .4f, I915_FORMAT_MOD_Y_TILED },
+	{IGT_ROTATION_270, .2f, .4f, I915_FORMAT_MOD_Yf_TILED },
 	};
 
 	for_each_valid_output_on_pipe(display, pipe, output) {
@@ -881,7 +881,7 @@ static void test_plane_rotation_exhaust_fences(data_t *data,
 					       igt_plane_t *plane)
 {
 	igt_display_t *display = &data->display;
-	uint64_t tiling = LOCAL_I915_FORMAT_MOD_Y_TILED;
+	uint64_t tiling = I915_FORMAT_MOD_Y_TILED;
 	uint32_t format = DRM_FORMAT_XRGB8888;
 	int fd = data->gfx_fd;
 	drmModeModeInfo *mode;
@@ -959,11 +959,11 @@ static const char *rot_test_str(igt_rotation_t rot)
 static const char *tiling_test_str(uint64_t tiling)
 {
 	switch (tiling) {
-	case LOCAL_I915_FORMAT_MOD_X_TILED:
+	case I915_FORMAT_MOD_X_TILED:
 		return "x-tiled";
-	case LOCAL_I915_FORMAT_MOD_Y_TILED:
+	case I915_FORMAT_MOD_Y_TILED:
 		return "y-tiled";
-	case LOCAL_I915_FORMAT_MOD_Yf_TILED:
+	case I915_FORMAT_MOD_Yf_TILED:
 		return "yf-tiled";
 	default:
 		igt_assert(0);
@@ -1013,16 +1013,16 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		uint64_t tiling;
 		igt_rotation_t rot;
 	} *reflect_x, reflect_x_subtests[] = {
-		{ LOCAL_I915_FORMAT_MOD_X_TILED, IGT_ROTATION_0 },
-		{ LOCAL_I915_FORMAT_MOD_X_TILED, IGT_ROTATION_180 },
-		{ LOCAL_I915_FORMAT_MOD_Y_TILED, IGT_ROTATION_0 },
-		{ LOCAL_I915_FORMAT_MOD_Y_TILED, IGT_ROTATION_90 },
-		{ LOCAL_I915_FORMAT_MOD_Y_TILED, IGT_ROTATION_180 },
-		{ LOCAL_I915_FORMAT_MOD_Y_TILED, IGT_ROTATION_270 },
-		{ LOCAL_I915_FORMAT_MOD_Yf_TILED, IGT_ROTATION_0 },
-		{ LOCAL_I915_FORMAT_MOD_Yf_TILED, IGT_ROTATION_90 },
-		{ LOCAL_I915_FORMAT_MOD_Yf_TILED, IGT_ROTATION_180 },
-		{ LOCAL_I915_FORMAT_MOD_Yf_TILED, IGT_ROTATION_270 },
+		{ I915_FORMAT_MOD_X_TILED, IGT_ROTATION_0 },
+		{ I915_FORMAT_MOD_X_TILED, IGT_ROTATION_180 },
+		{ I915_FORMAT_MOD_Y_TILED, IGT_ROTATION_0 },
+		{ I915_FORMAT_MOD_Y_TILED, IGT_ROTATION_90 },
+		{ I915_FORMAT_MOD_Y_TILED, IGT_ROTATION_180 },
+		{ I915_FORMAT_MOD_Y_TILED, IGT_ROTATION_270 },
+		{ I915_FORMAT_MOD_Yf_TILED, IGT_ROTATION_0 },
+		{ I915_FORMAT_MOD_Yf_TILED, IGT_ROTATION_90 },
+		{ I915_FORMAT_MOD_Yf_TILED, IGT_ROTATION_180 },
+		{ I915_FORMAT_MOD_Yf_TILED, IGT_ROTATION_270 },
 		{ 0, 0 }
 	};
 
@@ -1094,7 +1094,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	igt_subtest_f("bad-tiling") {
 		igt_require(gen >=9 && gen < 13);
 		data.rotation = IGT_ROTATION_90;
-		data.override_tiling = LOCAL_I915_FORMAT_MOD_X_TILED;
+		data.override_tiling = I915_FORMAT_MOD_X_TILED;
 		test_plane_rotation(&data, DRM_PLANE_TYPE_PRIMARY, true);
 	}
 	data.override_tiling = 0;
@@ -1106,7 +1106,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 			      rot_test_str(reflect_x->rot)) {
 			igt_require(gen >= 10 ||
 				    (IS_CHERRYVIEW(data.devid) && reflect_x->rot == IGT_ROTATION_0
-				     && reflect_x->tiling == LOCAL_I915_FORMAT_MOD_X_TILED));
+				     && reflect_x->tiling == I915_FORMAT_MOD_X_TILED));
 			data.rotation = (IGT_REFLECT_X | reflect_x->rot);
 			igt_require(!(gen >= 13 && (data.rotation &
 						    (IGT_ROTATION_90 |
diff --git a/tests/testdisplay.c b/tests/testdisplay.c
index e2560eaf..937a48f4 100644
--- a/tests/testdisplay.c
+++ b/tests/testdisplay.c
@@ -671,14 +671,14 @@ static int opt_handler(int opt, int opt_index, void *data)
 		test_preferred_mode = 1;
 		break;
 	case 't':
-		tiling = LOCAL_I915_FORMAT_MOD_X_TILED;
+		tiling = I915_FORMAT_MOD_X_TILED;
 		break;
 	case 'y':
 	case OPT_YB:
-		tiling = LOCAL_I915_FORMAT_MOD_Y_TILED;
+		tiling = I915_FORMAT_MOD_Y_TILED;
 		break;
 	case OPT_YF:
-		tiling = LOCAL_I915_FORMAT_MOD_Yf_TILED;
+		tiling = I915_FORMAT_MOD_Yf_TILED;
 		break;
 	case 'r':
 		qr_code = 1;
diff --git a/tools/intel_residency.c b/tools/intel_residency.c
index 736fca0d..789dfcca 100644
--- a/tools/intel_residency.c
+++ b/tools/intel_residency.c
@@ -267,7 +267,7 @@ static void setup_modeset(void)
 	for (i = 0; i < 2; i++) {
 		igt_create_fb(drm.fd, modeset.mode->hdisplay,
 			      modeset.mode->vdisplay,  DRM_FORMAT_XRGB8888,
-			      LOCAL_I915_FORMAT_MOD_X_TILED, &fbs[i]);
+			      I915_FORMAT_MOD_X_TILED, &fbs[i]);
 		igt_draw_fill_fb(drm.fd, &fbs[i], 0x80);
 	}
 	draw_rect(&fbs[1], IGT_DRAW_BLT, 0x800000);
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
