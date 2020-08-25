Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D846E0F7
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Aug 2020 20:05:56 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id v12so15262102ljc.10
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Aug 2020 13:05:56 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Tue, 25 Aug 2020 23:05:10 +0300
Message-Id: <20200825200510.4021-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_flip: add flip to downscaled
 subtests
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

attempt to cause cdclk changes and stress scalers with flipping
to different size fb with different modifiers. Verify results
with crc.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_flip.c | 155 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 155 insertions(+)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index b33cfe9ca..5f906f5f0 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1605,6 +1605,155 @@ static void test_nonblocking_read(int in)
 	close(fd);
 }
 
+const struct {
+	const char *name;
+	const char *describe;
+	uint64_t firstmodifier;
+	uint32_t firstformat;
+	uint64_t secondmodifier;
+	uint32_t secondformat;
+} special_flip_scenario_test[] = {
+	{
+		"flip-32bpp-ytile-to-64bpp-ytile",
+		"Try to flip from 32bpp non scaled fb to 64bpp downscaled fb in attempt to stress cdclk reprogramming.",
+		LOCAL_I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB8888,
+		LOCAL_I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB16161616F
+	},
+	{
+		"flip-32bpp-ytile-to-32bpp-ytilegen12rcccs",
+		"Try to flip from 32bpp non scaled fb to 32bpp downscaled gen12 rc ccs fb in attempt to stress cdclk reprogramming.",
+		LOCAL_I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB8888,
+		LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS, DRM_FORMAT_XRGB8888
+	},
+	{
+		"flip-32bpp-ytile-to-32bpp-ytileccs",
+		"Try to flip from 32bpp non scaled ytiled fb to 32bpp downscaled ytiled ccs fb.",
+		LOCAL_I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB8888,
+		LOCAL_I915_FORMAT_MOD_Y_TILED_CCS, DRM_FORMAT_XRGB8888
+	},
+	{
+		"flip-64bpp-ytile-to-32bpp-ytileccs",
+		"Try to flip from 64bpp non scaled ytiled fb to 32bpp downscaled gen12 rc ccs fb.",
+		LOCAL_I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB8888,
+		LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS, DRM_FORMAT_XRGB8888
+	},
+};
+
+static void test_flip_to_scaled(uint32_t index)
+{
+	uint32_t screenwidth, screenheight;
+	uint32_t bigfbwidth, bigfbheight;
+	uint32_t pipe = 0;	//lets just run on first output, first pipe
+	uint64_t smallmodifier = special_flip_scenario_test[index].firstmodifier;
+	uint64_t bigmodifier = special_flip_scenario_test[index].secondmodifier;
+	uint32_t smallformat = special_flip_scenario_test[index].firstformat;
+	uint32_t bigformat = special_flip_scenario_test[index].secondformat;
+	uint32_t gen;
+
+	igt_display_t display;
+	igt_output_t *output;
+	igt_plane_t *primary;
+	igt_pipe_crc_t *pipe_crc;
+	igt_crc_t small_crc, big_crc;
+	struct igt_fb small_fb, big_fb;
+
+	struct drm_mode_fb_cmd2 f = {0};
+	drmModeModeInfo *mode;
+	struct drm_event_vblank ev;
+
+	cairo_t *cr;
+
+	// this is Intel only test so bail out early.
+	igt_require_intel(drm_fd);
+	gen = intel_gen(intel_get_drm_devid(drm_fd));
+
+	// will be using scalers hence gen need to be >= 9
+	igt_require(gen >= 9);
+	igt_require_pipe_crc(drm_fd);
+	igt_display_require(&display, drm_fd);
+	igt_require(display.is_atomic);
+	igt_require(igt_display_has_format_mod(&display, smallformat, smallmodifier));
+	igt_require(igt_display_has_format_mod(&display, bigformat, bigmodifier));
+
+	for_each_connected_output(&display, output) {
+		mode = igt_output_get_mode(output);
+		screenwidth = min(mode->hdisplay, 1920);
+		screenheight = min(mode->vdisplay, 1080);
+
+		// big fb will be 4k unless running on older than ICL
+		if (gen < 11) {
+			bigfbwidth = 2560;
+			bigfbheight = 1440;
+		} else {
+			bigfbwidth = 3840;
+			bigfbheight = 2160;
+		}
+
+		igt_require(igt_create_color_fb(drm_fd, screenwidth, screenheight,
+				smallformat, smallmodifier,
+				0, 1, 0, &small_fb));
+
+		igt_create_bo_for_fb(drm_fd, bigfbwidth, bigfbheight, bigformat,
+							 bigmodifier, &big_fb);
+		igt_assert(big_fb.gem_handle > 0);
+
+		f.width = big_fb.width;
+		f.height = big_fb.height;
+		f.pixel_format = big_fb.drm_format;
+		f.flags = LOCAL_DRM_MODE_FB_MODIFIERS;
+
+		for (int n = 0; n < big_fb.num_planes; n++) {
+			f.handles[n] = big_fb.gem_handle;
+			f.modifier[n] = big_fb.modifier;
+			f.pitches[n] = big_fb.strides[n];
+			f.offsets[n] = big_fb.offsets[n];
+		}
+
+		cr = igt_get_cairo_ctx(drm_fd, &big_fb);
+		igt_paint_color(cr, 0, 0, bigfbwidth, bigfbheight, 0, 1, 0);
+		igt_put_cairo_ctx(cr);
+
+		igt_assert(drmIoctl(drm_fd, LOCAL_DRM_IOCTL_MODE_ADDFB2, &f) == 0);
+		big_fb.fb_id = f.fb_id;
+
+		igt_output_set_pipe(output, pipe);
+
+		primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+		igt_plane_set_fb(primary, NULL);
+
+		igt_display_commit_atomic(&display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+		pipe_crc = igt_pipe_crc_new(drm_fd, pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
+		igt_pipe_crc_start(pipe_crc);
+
+		igt_plane_set_position(primary, 0, 0);
+		igt_plane_set_fb(primary, &small_fb);
+		igt_plane_set_size(primary, screenwidth, screenheight);
+
+		igt_display_commit_atomic(&display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+		igt_pipe_crc_collect_crc(pipe_crc, &small_crc);
+
+		igt_plane_set_fb(primary, &big_fb);
+		igt_plane_set_size(primary, screenwidth, screenheight);
+		igt_display_commit_atomic(&display, DRM_MODE_ATOMIC_ALLOW_MODESET  |
+							DRM_MODE_PAGE_FLIP_EVENT, NULL);
+
+		igt_assert(read(drm_fd, &ev, sizeof(ev)) == sizeof(ev));
+
+		igt_pipe_crc_collect_crc(pipe_crc, &big_crc);
+
+		igt_pipe_crc_stop(pipe_crc);
+		igt_pipe_crc_free(pipe_crc);
+		igt_remove_fb(drm_fd, &small_fb);
+		igt_remove_fb(drm_fd, &big_fb);
+		igt_output_set_pipe(output, PIPE_ANY);
+
+		igt_assert(igt_check_crc_equal(&small_crc, &big_crc));
+
+		// run just on first found connected output.
+		break;
+	}
+}
+
 igt_main
 {
 	struct {
@@ -1720,4 +1869,10 @@ igt_main
 			run_pair(tests[i].duration, tests[i].flags);
 	}
 	igt_stop_signal_helper();
+
+	for (int index = 0; index < ARRAY_SIZE(special_flip_scenario_test); index++) {
+		igt_describe(special_flip_scenario_test[index].describe);
+		igt_subtest(special_flip_scenario_test[index].name)
+			test_flip_to_scaled(index);
+	}
 }
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
