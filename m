Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 029736E463
 for <igt-dev@lists.freedesktop.org>; Sat, 15 May 2021 23:01:49 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
Date: Sat, 15 May 2021 16:01:42 -0700
Message-Id: <20210515230142.1816456-18-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20210515230142.1816456-1-alan.previn.teres.alexis@intel.com>
References: <20210515230142.1816456-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 17/17] tests/i915_pxp: CRC validation for
 display tests.
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

From: Karthik B S <karthik.b.s@intel.com>

Added subtests to validate pxp using CRC validation.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/i915/gem_pxp.c | 267 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 267 insertions(+)

diff --git a/tests/i915/gem_pxp.c b/tests/i915/gem_pxp.c
index d9689c29..53592e41 100644
--- a/tests/i915/gem_pxp.c
+++ b/tests/i915/gem_pxp.c
@@ -463,6 +463,7 @@ static uint32_t alloc_and_fill_dest_buff(int i915, bool protected, uint32_t size
 #define TSTSURF_INITCOLOR1  0x12341234
 #define TSTSURF_INITCOLOR2  0x56785678
 #define TSTSURF_INITCOLOR3  0xabcdabcd
+#define TSTSURF_GREENCOLOR  0xFF00FF00
 
 static void test_render_baseline(int i915)
 {
@@ -955,6 +956,253 @@ static void test_pxp_pwrcycle_staleasset_execution(int i915, struct powermgt_dat
 	free_exec_assets(i915, &data[2]);
 }
 
+static void setup_protected_fb(int i915, int width, int height, igt_fb_t *fb, uint32_t ctx)
+{
+	int err;
+	uint32_t srcbo;
+	struct intel_buf *srcbuf, *dstbuf;
+	struct buf_ops *bops;
+	struct intel_bb *ibb;
+	uint32_t devid;
+	igt_render_copyfunc_t rendercopy;
+
+	devid = intel_get_drm_devid(i915);
+	igt_assert(devid);
+
+	rendercopy = igt_get_render_copyfunc(devid);
+	igt_assert(rendercopy);
+
+	bops = buf_ops_create(i915);
+	igt_assert(bops);
+
+	igt_init_fb(fb, i915, width, height, DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE,
+		    IGT_COLOR_YCBCR_BT709, IGT_COLOR_YCBCR_LIMITED_RANGE);
+
+	igt_calc_fb_size(i915, width, height, DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE, &fb->size, &fb->strides[0]);
+
+	err = create_bo_ext(i915, fb->size, true, &(fb->gem_handle));
+	igt_assert_eq(err, 0);
+	igt_assert(fb->gem_handle);
+
+	err = __gem_set_tiling(i915, fb->gem_handle, igt_fb_mod_to_tiling(fb->modifier), fb->strides[0]);
+	igt_assert(err == 0 || err == -EOPNOTSUPP);
+
+	do_or_die(__kms_addfb(fb->fd, fb->gem_handle, fb->width, fb->height, fb->drm_format,
+			      fb->modifier, fb->strides, fb->offsets, fb->num_planes,
+			      LOCAL_DRM_MODE_FB_MODIFIERS, &fb->fb_id));
+
+	dstbuf = intel_buf_create_using_handle(bops, fb->gem_handle, fb->width, fb->height,
+					       fb->plane_bpp[0], 0, igt_fb_mod_to_tiling(fb->modifier), 0);
+	dstbuf->is_protected = true;
+
+	srcbo = alloc_and_fill_dest_buff(i915, false, fb->size, TSTSURF_GREENCOLOR);
+	srcbuf = intel_buf_create_using_handle(bops, srcbo, fb->width, fb->height,
+					       fb->plane_bpp[0], 0, igt_fb_mod_to_tiling(fb->modifier), 0);
+
+	ibb = intel_bb_create_with_context(i915, ctx, 4096);
+	igt_assert(ibb);
+
+	ibb->pxp.enabled = true;
+	ibb->pxp.apptype = DISPLAY_APPTYPE;
+	ibb->pxp.appid = I915_PROTECTED_CONTENT_DEFAULT_SESSION;
+
+	gen12_render_copyfunc(ibb, srcbuf, 0, 0, fb->width, fb->height, dstbuf, 0, 0);
+
+	gem_sync(i915, fb->gem_handle);
+	assert_bo_content_check(i915, fb->gem_handle, COMPARE_COLOR_UNREADIBLE, fb->size, TSTSURF_GREENCOLOR, NULL, 0);
+
+	intel_bb_destroy(ibb);
+	intel_buf_destroy(srcbuf);
+	gem_close(i915, srcbo);
+}
+
+static void __debugfs_read(int fd, const char *param, char *buf, int len)
+{
+	len = igt_debugfs_simple_read(fd, param, buf, len);
+	if (len < 0)
+		igt_assert_eq(len, -ENODEV);
+}
+
+#define debugfs_read(fd, p, arr) __debugfs_read(fd, p, arr, sizeof(arr))
+#define MAX_SINK_HDCP_CAP_BUF_LEN	5000
+
+#define CP_UNDESIRED				0
+#define CP_DESIRED				1
+#define CP_ENABLED				2
+
+#define KERNEL_AUTH_TIME_ALLOWED_MSEC		(3 *  6 * 1000)
+#define KERNEL_DISABLE_TIME_ALLOWED_MSEC	(1 * 1000)
+
+static bool
+wait_for_prop_value(igt_output_t *output, uint64_t expected,
+		    uint32_t timeout_mSec)
+{
+	uint64_t val;
+	int i;
+
+	for (i = 0; i < timeout_mSec; i++) {
+		val = igt_output_get_prop(output, IGT_CONNECTOR_CONTENT_PROTECTION);
+		if (val == expected)
+			return true;
+		usleep(1000);
+	}
+
+	igt_info("prop_value mismatch %" PRId64 " != %" PRId64 "\n", val, expected);
+
+	return false;
+}
+
+static bool sink_hdcp_capable(int i915, igt_output_t *output)
+{
+	char buf[MAX_SINK_HDCP_CAP_BUF_LEN];
+	int fd;
+
+	fd = igt_debugfs_connector_dir(i915, output->name, O_RDONLY);
+	if (fd < 0)
+		return false;
+
+	if (is_i915_device(i915))
+		debugfs_read(fd, "i915_hdcp_sink_capability", buf);
+	else
+		debugfs_read(fd, "hdcp_sink_capability", buf);
+
+	close(fd);
+
+	igt_debug("Sink capability: %s\n", buf);
+
+	return strstr(buf, "HDCP1.4");
+}
+
+static bool output_hdcp_capable(int i915, igt_output_t *output, bool content_type)
+{
+	if (!output->props[IGT_CONNECTOR_CONTENT_PROTECTION])
+		return false;
+	if (!output->props[IGT_CONNECTOR_HDCP_CONTENT_TYPE] && content_type)
+		return false;
+	if (!sink_hdcp_capable(i915, output))
+		return false;
+
+	return true;
+}
+
+static void test_display_protected_crc(int i915, igt_display_t *display, bool hdcp)
+{
+	igt_output_t *output;
+	drmModeModeInfo *mode;
+	igt_fb_t ref_fb, protected_fb;
+	igt_plane_t *plane;
+	igt_pipe_t *pipe;
+	igt_pipe_crc_t *pipe_crc;
+	igt_crc_t ref_crc, new_crc;
+	int width = 0, height = 0, i = 0, ret, count, valid_outputs = 0;
+	uint32_t ctx;
+	igt_output_t *hdcp_output[IGT_MAX_PIPES];
+
+	ret = create_ctx_with_params(i915, true, true, true, false, &ctx);
+	igt_assert_eq(ret, 0);
+
+	for_each_connected_output(display, output) {
+		mode = igt_output_get_mode(output);
+
+		width = max(width, mode->hdisplay);
+		height = max(height, mode->vdisplay);
+
+		if (!output_hdcp_capable(i915, output, 0))
+			continue;
+
+		hdcp_output[valid_outputs++] = output;
+	}
+
+	if (hdcp)
+		igt_require_f(valid_outputs > 0, "No HDCP capable connector found\n");
+
+	igt_create_color_fb(i915, width, height, DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE, 0, 1, 0, &ref_fb);
+
+	/* Do a modeset on all outputs */
+	for_each_connected_output(display, output) {
+		mode = igt_output_get_mode(output);
+		pipe = &display->pipes[i];
+		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+		igt_require(igt_pipe_connector_valid(i, output));
+		igt_output_set_pipe(output, i);
+
+		igt_plane_set_fb(plane, &ref_fb);
+		igt_fb_set_size(&ref_fb, plane, mode->hdisplay, mode->vdisplay);
+		igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
+
+		igt_display_commit2(display, COMMIT_ATOMIC);
+		i++;
+	}
+
+	if (hdcp) {
+		/* Enable HDCP on all the valid connectors */
+		for (count = 0; count < valid_outputs; count++) {
+			igt_output_set_prop_value(hdcp_output[count], IGT_CONNECTOR_CONTENT_PROTECTION, CP_DESIRED);
+			if (output->props[IGT_CONNECTOR_HDCP_CONTENT_TYPE])
+				igt_output_set_prop_value(hdcp_output[count], IGT_CONNECTOR_HDCP_CONTENT_TYPE, 0);
+		}
+
+		igt_display_commit2(display, COMMIT_ATOMIC);
+
+		/*Verify that HDCP is enabled on all valid connectors */
+		for (count = 0; count < valid_outputs; count++) {
+			ret = wait_for_prop_value(hdcp_output[count], CP_ENABLED, KERNEL_AUTH_TIME_ALLOWED_MSEC);
+			igt_assert_f(ret, "Content Protection not enabled on %s\n", hdcp_output[count]->name);
+		}
+	}
+
+	setup_protected_fb(i915, width, height, &protected_fb, ctx);
+
+	for_each_connected_output(display, output) {
+		mode = igt_output_get_mode(output);
+		pipe = &display->pipes[output->pending_pipe];
+		pipe_crc = igt_pipe_crc_new(i915, pipe->pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
+		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+		igt_require(igt_pipe_connector_valid(pipe->pipe, output));
+		igt_output_set_pipe(output, pipe->pipe);
+
+		igt_plane_set_fb(plane, &ref_fb);
+		igt_fb_set_size(&ref_fb, plane, mode->hdisplay, mode->vdisplay);
+		igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
+
+		igt_display_commit2(display, COMMIT_ATOMIC);
+		igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
+
+		igt_plane_set_fb(plane, &protected_fb);
+		igt_fb_set_size(&protected_fb, plane, mode->hdisplay, mode->vdisplay);
+		igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
+
+		igt_display_commit2(display, COMMIT_ATOMIC);
+		igt_pipe_crc_collect_crc(pipe_crc, &new_crc);
+		igt_assert_crc_equal(&ref_crc, &new_crc);
+
+		if (hdcp) {
+			/* Disable HDCP and collect CRC */
+			igt_output_set_prop_value(hdcp_output[0], IGT_CONNECTOR_CONTENT_PROTECTION, CP_UNDESIRED);
+			igt_display_commit2(display, COMMIT_ATOMIC);
+			ret = wait_for_prop_value(hdcp_output[0], CP_UNDESIRED, KERNEL_DISABLE_TIME_ALLOWED_MSEC);
+			igt_assert_f(ret, "Content Protection not cleared\n");
+
+			igt_plane_set_fb(plane, &protected_fb);
+			igt_fb_set_size(&protected_fb, plane, mode->hdisplay, mode->vdisplay);
+			igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
+
+			igt_display_commit2(display, COMMIT_ATOMIC);
+			igt_pipe_crc_collect_crc(pipe_crc, &new_crc);
+			igt_assert_f(!igt_check_crc_equal(&ref_crc, &new_crc), "CRC's are expected to be different after HDCP is disabled\n");
+		}
+		/*
+		 * Testing with one pipe-output combination is sufficient.
+		 * So break the loop.
+		 */
+		break;
+	}
+
+	gem_context_destroy(i915, ctx);
+	igt_remove_fb(i915, &ref_fb);
+	igt_remove_fb(i915, &protected_fb);
+}
+
 igt_main
 {
 	int i915 = -1;
@@ -962,6 +1210,7 @@ igt_main
 	struct powermgt_data pm = {0};
 	igt_render_copyfunc_t rendercopy = NULL;
 	uint32_t devid = 0;
+	igt_display_t display;
 
 	igt_fixture
 	{
@@ -1051,6 +1300,24 @@ igt_main
 			test_pxp_pwrcycle_staleasset_execution(i915, &pm);
 		}
 	}
+	igt_subtest_group {
+		igt_fixture {
+			igt_require(pxp_supported);
+			devid = intel_get_drm_devid(i915);
+			igt_assert(devid);
+			rendercopy = igt_get_render_copyfunc(devid);
+			igt_require(rendercopy);
+
+			igt_require_pipe_crc(i915);
+			igt_display_require(&display, i915);
+		}
+		igt_describe("Test the display CRC");
+		igt_subtest("display-protected-crc-without-hdcp")
+			test_display_protected_crc(i915, &display, 0);
+		igt_subtest("display-protected-crc-with-hdcp")
+			test_display_protected_crc(i915, &display, 1);
+	}
+
 
 	igt_fixture {
 		close(i915);
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
