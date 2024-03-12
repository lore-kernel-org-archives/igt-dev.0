Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23861C54E58
	for <igt-dev@archiver.kernel.org>; Tue, 12 Mar 2024 09:39:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03CC510F87A;
	Tue, 12 Mar 2024 09:39:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="cSFjSjZR";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA05A10F345
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2024 09:39:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0706120012;
 Tue, 12 Mar 2024 09:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1710236344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IGQX5ZLXrwzpwXbmeI9SDEbZnNYbp335x+d9LDIdwxQ=;
 b=cSFjSjZRpTU5I9gpWzMxxqSE0eMNjnHuzz5siGhv40ZVUosV3AHOVtQ0XWqIR18GbLHVvV
 /9ITwSFMNuTNHOITmUQvQ/8+umVixDaZf28p5Dh1XNmCE5ikSdGYe2OHnu030Pq+kO+Y5p
 d/CbiL6mtnwHeOvpS3NvHwegT7KJ4Xr1SdunJLYjTjwzj86KnewjmUXcb6yA+g3xH2ZADk
 gMlP2K5jXJgZiymtROOBM26SHwbnT1HkJ+zxg33lYZwwUDBBJ92VuF2PdRbWF2C8Fx3+CX
 OHOPxpwtZ49n7i3oJSfTtAoBs2X2T0EA/0AgJHhuu5GQPwB31Tf5ztM2nc/aag==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 12 Mar 2024 10:38:59 +0100
Subject: [PATCH i-g-t 2/3] tests/kms_rotation: Add extensive rotation test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240312-new_rotation-v1-2-ed9fe82589df@bootlin.com>
References: <20240312-new_rotation-v1-0-ed9fe82589df@bootlin.com>
In-Reply-To: <20240312-new_rotation-v1-0-ed9fe82589df@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: miquel.raynal@bootlin.com, jeremie.dautheribes@bootlin.com, 
 thomas.petazzoni@bootlin.com, arthurgrillo@riseup.net, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=12702;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=VH2PrxDagKWMbc8oZcuOkNHhz5ofM9nWTD7boZWiGjI=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBl8CK23uBjjs1l40v9MU9skkz7L4Xf8hpnR0CRNFA7
 4W9kuLeJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZfAitgAKCRAgrS7GWxAs4ng+EA
 DE4DabUOzJJY1HrxmKDxiBLrz7qwCv33qDYdFfPP9yZy1wWD6FuCSj3dn+P/iyfzbFvn8J72cL0Pvj
 KCkTo7Y6nMv3WbM95AuhouGDIL/Uyeg2BzJuONsnNOTjPo7NKIdVh2FEmG3W0cd/+QpppI5QMMZGjb
 +xel8597h920oJqKAOG6XmSzGJ1mzuWdIuvgcV/BQl68Jp6HNIfR3BRJSSyMM4K/j1f5dH2BEx3aDi
 75/LIjnR+1PpYiiao79E2Zg7ODrk/veKhAX6a22FhNmGAEF6cYVXi7q//IxkmkUKP7xqV0Pp8pESwc
 C/n+1H2CCsgYamiw33ozYkg5BzRewfwSX+JPagx7AhBtAJahPcGjMgm2TfQvJqqzJ3Mg4KQYRsWR1m
 2vL3gKWc7605Nd9dGYTC1VVHvdKOybEGbBzFbFCw0sWxlPzJvkldpJdpzYZrhT0htwb2oIs/+lll3q
 i1e8RIf2CH2bSntbqjeCvlXzacS9sp890McWeNVsFruXvCEsSZJ6XwS9Ubd+Q3HAwPQuawEvnL97XR
 kMO6z7VQh7mrakHtAt+E9C+m6IyzWdpD7dgsLGMvwifqR7Z/1F2cNdj3hK4BoF2Y7+9cakqyHJqgAY
 8DaaF79rvUy8Y3lZcA+wwKVTLHfDuwRFmEtR/kiQ+HfrpnITA3ZjUtwv9bdA==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

The actual kms_rotation_crc test does not tes all the rotation with all
the formats. Create the test kms_rotation, which only test "full plane
rotation", but for all formats, planes and rotations.

This allow the detection of issues like in [1], where the YUV rotation is
not working for specific rotations.

[1]: https://lore.kernel.org/dri-devel/20240304-yuv-v4-11-76beac8e9793@bootlin.com/

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 tests/kms_rotation.c | 366 +++++++++++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build    |   1 +
 2 files changed, 367 insertions(+)

diff --git a/tests/kms_rotation.c b/tests/kms_rotation.c
new file mode 100644
index 000000000000..4062549a0beb
--- /dev/null
+++ b/tests/kms_rotation.c
@@ -0,0 +1,366 @@
+#include "igt.h"
+
+/**
+ * TEST: kms_rotation
+ * Category: Display
+ * Description: Tests all rotations for all planes and formats.
+ * Driver requirement: none
+ * Functionality: plane, rotation
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ */
+
+/**
+ * SUBTEST: rotations
+ * Description: Test for all rotations, planes and formats.
+ */
+
+/**
+ * struct data_t - Stores the test configuration
+ *
+ * @fd: file descriptor for the current drm device
+ * @display: display used for the tests
+ */
+struct data_t {
+	int fd;
+	igt_display_t display;
+};
+
+/**
+ * colors - List of colors used to put things on the plane
+ *
+ * Those colors are used to create a color pattern on the plane, which is not invariant by rotation or reflexion.
+ *
+ * At least black and white must be in this list to properly test black and white formats.
+ */
+static const struct igt_vec4 colors[] = {
+	{{1.0f, 0.0f, 0.0f, 0.0f}},
+	{{1.0f, 1.0f, 1.0f, 0.0f}},
+	{{0.0f, 0.0f, 0.0f, 0.0f}},
+	{{0.0f, 1.0f, 1.0f, 0.0f}},
+	{{0.0f, 0.0f, 0.0f, 0.0f}},
+};
+
+/**
+ * tested_rotation - List of all tested rotation configuration
+ */
+static uint32_t tested_rotation[] = {
+	IGT_ROTATION_0,
+	IGT_ROTATION_0 | IGT_REFLECT_X,
+	IGT_ROTATION_0 | IGT_REFLECT_Y,
+	IGT_ROTATION_0 | IGT_REFLECT_X | IGT_REFLECT_Y,
+	IGT_ROTATION_90,
+	IGT_ROTATION_90 | IGT_REFLECT_X,
+	IGT_ROTATION_90 | IGT_REFLECT_Y,
+	IGT_ROTATION_90 | IGT_REFLECT_X | IGT_REFLECT_Y,
+	IGT_ROTATION_180,
+	IGT_ROTATION_180 | IGT_REFLECT_X,
+	IGT_ROTATION_180 | IGT_REFLECT_Y,
+	IGT_ROTATION_180 | IGT_REFLECT_X | IGT_REFLECT_Y,
+	IGT_ROTATION_270,
+	IGT_ROTATION_270 | IGT_REFLECT_X,
+	IGT_ROTATION_270 | IGT_REFLECT_Y,
+	IGT_ROTATION_270 | IGT_REFLECT_X | IGT_REFLECT_Y,
+};
+
+/**
+ * non_equals_crc() - Check if at least one CRC is different
+ *
+ * Check if at least one CRC is different, so we can verify that the rendering is working.
+ *
+ * @crcs: List of all tested crcs
+ * @crc_count: Number of crcs in the list
+ */
+static bool non_equals_crc(igt_crc_t crcs[], int crc_count) {
+	if (!crc_count) {
+		return true;
+	}
+	for (int i = 0; i < crc_count; i++)
+		if (!igt_check_crc_equal(&crcs[i], &crcs[0]))
+			return true;
+	return false;
+}
+
+/**
+ * create_fb() - Create a framebuffer
+ *
+ * This create a framebuffer and fill it with a pattern. This pattern is not invariant by rotation and reflection.
+ *
+ * The @width and @height parameters are automaticaly inverted according to @rotation if needed. If the requested plane
+ * is 1024*768 with IGT_ROTATION_90, the returned plane will have the size 768*1024.
+ *
+ * @data: Current test configuration
+ * @rotation: Rotation to apply to the pattern
+ * @format: Format of the requested plane
+ * @modifier: Modifier for the requested plane
+ * @width: Width of the requested plane
+ * @height: Height of the requested plane
+ * @fb: Place to store the created framebuffer
+ */
+static void create_fb(struct data_t *data, igt_rotation_t rotation, uint32_t format, uint64_t modifier, int width,
+		      int height, igt_fb_t *fb)
+{
+	int step_x, step_y, color_index, current_n, current_m;
+	cairo_t *cr;
+
+	switch (rotation & IGT_ROTATION_MASK) {
+		case IGT_ROTATION_90:
+		case IGT_ROTATION_270:
+			igt_swap(width, height);
+			break;
+		case IGT_ROTATION_0:
+		case IGT_ROTATION_180:
+		default:
+			break;
+	}
+
+	igt_create_fb(data->fd, width, height, format, modifier, fb);
+	cr = igt_get_cairo_ctx(data->fd, fb);
+
+	step_x = (width) / ARRAY_SIZE(colors);
+	step_y = (height) / ARRAY_SIZE(colors);
+	/* Iterate over all colors in x and y direction. The pattern is a colored chessboard */
+	for (int n = 0; n < ARRAY_SIZE(colors); n++) {
+		for (int m = 0; m < ARRAY_SIZE(colors); m++) {
+			color_index = (n + m) % ARRAY_SIZE(colors);
+			current_n = n;
+			current_m = m;
+
+			/*
+			 * If a reflexion and a rotation is requested, apply this to the pattern rendering
+			 * If a reflexion is given, it must be applied before the rotation.
+			 */
+			switch (rotation & IGT_REFLECT_MASK) {
+				case IGT_REFLECT_X:
+					current_n = ARRAY_SIZE(colors) - 1 - current_n;
+					break;
+				case IGT_REFLECT_Y:
+					current_m = ARRAY_SIZE(colors) - 1 - current_m;
+					break;
+				case IGT_REFLECT_X | IGT_REFLECT_Y:
+					current_n = ARRAY_SIZE(colors) - 1 - current_n;
+					current_m = ARRAY_SIZE(colors) - 1 - current_m;
+					break;
+			}
+			switch (rotation & IGT_ROTATION_MASK) {
+				case IGT_ROTATION_0:
+					break;
+				case IGT_ROTATION_90:
+					igt_swap(current_n, current_m);
+					current_m = ARRAY_SIZE(colors) - 1 - current_m;
+					break;
+				case IGT_ROTATION_180:
+					current_n = ARRAY_SIZE(colors) - 1 - current_n;
+					current_m = ARRAY_SIZE(colors) - 1 - current_m;
+					break;
+				case IGT_ROTATION_270:
+					igt_swap(current_n, current_m);
+					current_n = ARRAY_SIZE(colors) - 1 - current_n;
+					break;
+			}
+
+			igt_paint_color(cr,
+					current_n * step_x,
+					current_m * step_y,
+					step_x,
+					step_y,
+					colors[color_index].d[0],
+					colors[color_index].d[1],
+					colors[color_index].d[2]);
+		}
+	}
+
+	igt_put_cairo_ctx(cr);
+}
+
+/**
+ * get_ref_crcs() - Compute the reference CRC for a specific format
+ *
+ * The rotation are done by create_fb in software.
+ *
+ * @data: Test configuration
+ * @output, @pipe, @plane: Plane to use for the test
+ * @format, @modifier: Format description to test
+ * @ref_crc: Array to store the resulting CRC. Its size must be at least ARRAY_SIZE(tested_rotation).
+ */
+static void get_ref_crcs(struct data_t *data, igt_output_t *output, enum pipe pipe, igt_plane_t *plane, uint32_t format,
+			 uint64_t modifier, igt_crc_t ref_crc[ARRAY_SIZE(tested_rotation)])
+{
+	drmModeModeInfo *mode;
+	igt_pipe_crc_t *pipe_crc;
+	igt_fb_t fb;
+
+	igt_display_reset(&data->display);
+	igt_output_set_pipe(output, pipe);
+
+
+	for (int r = 0; r < ARRAY_SIZE(tested_rotation); r++) {
+		int rotation = tested_rotation[r];
+		/* Configure the pipe for reference frame */
+		igt_display_reset(&data->display);
+		igt_output_set_pipe(output, pipe);
+		igt_plane_set_rotation(plane, IGT_ROTATION_0);
+		igt_display_commit2(&data->display, COMMIT_ATOMIC);
+		mode = igt_output_get_mode(output);
+
+		/* Start the CRC */
+		pipe_crc = igt_pipe_crc_new(data->fd, pipe, IGT_PIPE_CRC_SOURCE_AUTO);
+		igt_pipe_crc_start(pipe_crc);
+
+		create_fb(data, rotation, format, modifier, mode->vdisplay, mode->hdisplay, &fb);
+		igt_plane_set_fb(plane, &fb);
+		igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+		igt_pipe_crc_get_current(
+			data->display.drm_fd, pipe_crc,
+			&ref_crc[r]);
+
+		igt_pipe_crc_stop(pipe_crc);
+		igt_pipe_crc_free(pipe_crc);
+		igt_remove_fb(data->fd, &fb);
+	}
+}
+
+/**
+ * get_crcs() - Compute the CRC for a specific format
+ *
+ * @data: Test configuration
+ * @output, @pipe, @plane: Plane to use for the test
+ * @format, @modifier: Format description to test
+ * @crc: Array to store the resulting CRC. Its size must be at least ARRAY_SIZE(tested_rotation).
+ */
+static void get_crcs(struct data_t *data, igt_output_t *output, enum pipe pipe, igt_plane_t *plane, uint32_t format,
+		     uint64_t modifier, igt_crc_t crc[ARRAY_SIZE(tested_rotation)])
+{
+	drmModeModeInfo *mode;
+	igt_pipe_crc_t *pipe_crc;
+	igt_fb_t fb;
+
+	igt_display_reset(&data->display);
+	igt_output_set_pipe(output, pipe);
+
+
+	for (int r = 0; r < ARRAY_SIZE(tested_rotation); r++) {
+		int rotation = tested_rotation[r];
+		/* Configure the pipe for reference frame */
+		igt_display_reset(&data->display);
+		igt_output_set_pipe(output, pipe);
+		igt_plane_set_rotation(plane, rotation);
+
+		if (!igt_plane_has_rotation(plane, rotation))
+			continue;
+
+		igt_display_commit2(&data->display, COMMIT_ATOMIC);
+		mode = igt_output_get_mode(output);
+
+		/* Start the CRC */
+		pipe_crc = igt_pipe_crc_new(data->fd, pipe, IGT_PIPE_CRC_SOURCE_AUTO);
+		igt_pipe_crc_start(pipe_crc);
+
+		create_fb(data, IGT_ROTATION_0, format, modifier, mode->vdisplay, mode->hdisplay, &fb);
+		igt_plane_set_fb(plane, &fb);
+		if (igt_rotation_90_or_270(rotation))
+			igt_plane_set_size(plane, fb.height, fb.width);
+		igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+		igt_pipe_crc_get_current(
+			data->display.drm_fd, pipe_crc,
+			&crc[r]);
+
+		igt_pipe_crc_stop(pipe_crc);
+		igt_pipe_crc_free(pipe_crc);
+		igt_remove_fb(data->fd, &fb);
+	}
+}
+
+/**
+ * run_test() - Run the subtests for a specific plane
+ *
+ * @data: Test configuration
+ * @output, @pipe, @plane: Plane to use for the test
+ * @format, @modifier: Format description to test
+ */
+static void run_test(struct data_t *data, igt_output_t *output, enum pipe pipe, igt_plane_t *plane, uint32_t format, uint64_t modifier)
+{
+	igt_crc_t ref_crc[ARRAY_SIZE(tested_rotation)];
+	igt_crc_t crc[ARRAY_SIZE(tested_rotation)];
+
+	igt_display_reset(&data->display);
+	igt_output_set_pipe(output, pipe);
+	/* Check that the rotation is supported */
+	igt_require(igt_plane_has_prop(plane, IGT_PLANE_ROTATION));
+
+	/* Generate reference CRC with software rotation */
+	get_ref_crcs(data, output, pipe, plane, format, modifier, ref_crc);
+	igt_assert_f(non_equals_crc(ref_crc, ARRAY_SIZE(tested_rotation)), "All the reference CRC are equals.");
+
+	/* Generate CRC with hardware rotation */
+	get_crcs(data, output, pipe, plane, format, modifier, crc);
+
+	for (int c = 0; c < ARRAY_SIZE(tested_rotation); c++) {
+		int rotation = tested_rotation[c];
+		igt_dynamic_f("pipe-%s-format-%s-modifier-%s-rotation-%s-reflect-%s", kmstest_pipe_name(pipe),
+			      igt_format_str(format),
+			      igt_fb_modifier_name(modifier), igt_plane_rotation_name(rotation),
+			      igt_plane_reflect_name(rotation)) {
+			igt_assert_crc_equal(&ref_crc[c], &crc[c]);
+		}
+	}
+}
+
+/**
+ * test_all_formats() - Run all the tests for all planes
+ *
+ * @data: Test configuration
+ */
+static void test_all_formats(struct data_t *data)
+{
+	enum pipe pipe;
+	struct igt_plane *plane;
+	igt_output_t *output;
+	for_each_pipe_with_single_output(&data->display, pipe, output) {
+		for_each_plane_on_pipe(&data->display, pipe, plane) {
+			for (int f = 0; f < plane->format_mod_count; f++) {
+				uint32_t format = plane->formats[f];
+				uint32_t modifier = plane->modifiers[f];
+
+				if (!igt_fb_supported_format(format))
+					continue;
+				run_test(data, output, pipe, plane, format, modifier);
+			}
+		}
+	}
+}
+
+static int opt_handler(int opt, int opt_index, void *void_data)
+{
+	return IGT_OPT_HANDLER_SUCCESS;
+}
+
+static const struct option long_opts[] = {
+	{}
+};
+
+static const char help_str[] = "";
+
+static struct data_t global_data;
+
+igt_main_args("", long_opts, help_str, opt_handler, &global_data)
+{
+	igt_fixture {
+		global_data.fd = drm_open_driver_master(DRIVER_ANY);
+
+		kmstest_set_vt_graphics_mode();
+
+		igt_display_require(&global_data.display, global_data.fd);
+		igt_require(global_data.display.is_atomic);
+		igt_display_require_output(&global_data.display);
+		igt_display_reset(&global_data.display);
+	}
+
+	igt_describe("Testing different rotation and reflexions for different formats");
+	igt_subtest_with_dynamic_f("rotation") {
+		test_all_formats(&global_data);
+	}
+
+}
\ No newline at end of file
diff --git a/tests/meson.build b/tests/meson.build
index a856510fcea7..71b628b86e96 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -82,6 +82,7 @@ test_progs = [
 	'tools_test',
 	'vgem_basic',
 	'vgem_slow',
+	'kms_rotation',
 ]
 
 intel_i915_xe_progs = [

-- 
2.43.0

