Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Date: Thu, 23 Apr 2020 21:26:05 -0400
Message-Id: <20200424012605.2279679-5-rodrigosiqueiramelo@gmail.com>
In-Reply-To: <20200424012605.2279679-1-rodrigosiqueiramelo@gmail.com>
References: <20200424012605.2279679-1-rodrigosiqueiramelo@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v8 4/4] kms_writeback: Add
 writeback-check-output
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
To: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, nd <nd@arm.com>
Cc: Petri Latvala <petri.latvala@intel.com>, Simon Ser <contact@emersion.fr>, Liviu Dudau <liviu.dudau@arm.com>, Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel@ffwll.ch>, Brian Starkey <brian.starkey@arm.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Brian Starkey <rodrigosiqueiramelo@gmail.com>

Add a test which makes commits using the writeback connector, and
checks the output buffer hash to make sure it is/isn't written as
appropriate.

Changes since V7 (Maxime Ripard):
* Make fb_fill cross-platform

Changes since v6 (Simon Ser):
* Add a descriptive error message if sync_fence_wait fail
* Drop color_idx variable
* Compute expected CRC based on input framebuffer in writeback_sequence
* Remove unnecessary parentheses
* Replace int variable for unsigned int

Signed-off-by: Brian Starkey <brian.starkey@arm.com>
[rebased and updated]
Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
---
 tests/kms_writeback.c | 127 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index e08eb611..bba1fb01 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -30,6 +30,7 @@
 #include "igt.h"
 #include "igt_core.h"
 #include "igt_fb.h"
+#include "sw_sync.h"
 
 static drmModePropertyBlobRes *get_writeback_formats_blob(igt_output_t *output)
 {
@@ -217,6 +218,118 @@ static void writeback_fb_id(igt_output_t *output, igt_fb_t *valid_fb, igt_fb_t *
 	igt_assert(ret == 0);
 }
 
+static void fill_fb(igt_fb_t *fb, uint32_t pixel)
+{
+	void *ptr;
+
+	igt_assert(fb->drm_format == DRM_FORMAT_XRGB8888);
+
+	ptr = igt_fb_map_buffer(fb->fd, fb);
+	igt_assert(ptr);
+
+	memset(ptr, pixel, fb->strides[0] * fb->height);
+
+	igt_fb_unmap_buffer(fb, ptr);
+}
+
+static void get_and_wait_out_fence(igt_output_t *output)
+{
+	int ret;
+
+	igt_assert(output->writeback_out_fence_fd >= 0);
+
+	ret = sync_fence_wait(output->writeback_out_fence_fd, 1000);
+	igt_assert_f(ret == 0, "sync_fence_wait failed: %s\n", strerror(-ret));
+	close(output->writeback_out_fence_fd);
+	output->writeback_out_fence_fd = -1;
+}
+
+static void writeback_sequence(igt_output_t *output, igt_plane_t *plane,
+				igt_fb_t *in_fb, igt_fb_t *out_fbs[], int n_commits)
+{
+	int i = 0;
+	uint32_t in_fb_colors[2] = { 0xffff0000, 0xff00ff00 };
+	uint32_t clear_color = 0xffffffff;
+
+	igt_crc_t cleared_crc, out_expected;
+
+	for (i = 0; i < n_commits; i++) {
+		/* Change the input color each time */
+		fill_fb(in_fb, in_fb_colors[i % 2]);
+
+		if (out_fbs[i]) {
+			igt_crc_t out_before;
+
+			/* Get the expected CRC */
+			igt_fb_get_fnv1a_crc(in_fb, &out_expected);
+			fill_fb(out_fbs[i], clear_color);
+
+			if (i == 0)
+				igt_fb_get_fnv1a_crc(out_fbs[i], &cleared_crc);
+			igt_fb_get_fnv1a_crc(out_fbs[i], &out_before);
+			igt_assert_crc_equal(&cleared_crc, &out_before);
+		}
+
+		/* Commit */
+		igt_plane_set_fb(plane, in_fb);
+		igt_output_set_writeback_fb(output, out_fbs[i]);
+
+		igt_display_commit_atomic(output->display,
+					  DRM_MODE_ATOMIC_ALLOW_MODESET,
+					  NULL);
+		if (out_fbs[i])
+			get_and_wait_out_fence(output);
+
+		/* Make sure the old output buffer is untouched */
+		if (i > 0 && out_fbs[i - 1] && out_fbs[i] != out_fbs[i - 1]) {
+			igt_crc_t out_prev;
+			igt_fb_get_fnv1a_crc(out_fbs[i - 1], &out_prev);
+			igt_assert_crc_equal(&cleared_crc, &out_prev);
+		}
+
+		/* Make sure this output buffer is written */
+		if (out_fbs[i]) {
+			igt_crc_t out_after;
+			igt_fb_get_fnv1a_crc(out_fbs[i], &out_after);
+			igt_assert_crc_equal(&out_expected, &out_after);
+
+			/* And clear it, for the next time */
+			fill_fb(out_fbs[i], clear_color);
+		}
+	}
+}
+
+static void writeback_check_output(igt_output_t *output, igt_plane_t *plane,
+				   igt_fb_t *input_fb, igt_fb_t *output_fb)
+{
+	igt_fb_t *out_fbs[2] = { 0 };
+	igt_fb_t second_out_fb;
+	unsigned int fb_id;
+
+	/* One commit, with a writeback. */
+	writeback_sequence(output, plane, input_fb, &output_fb, 1);
+
+	/* Two commits, the second with no writeback */
+	out_fbs[0] = output_fb;
+	writeback_sequence(output, plane, input_fb, out_fbs, 2);
+
+	/* Two commits, both with writeback */
+	out_fbs[1] = output_fb;
+	writeback_sequence(output, plane, input_fb, out_fbs, 2);
+
+	fb_id = igt_create_fb(output_fb->fd, output_fb->width, output_fb->height,
+			      DRM_FORMAT_XRGB8888,
+			      igt_fb_mod_to_tiling(0),
+			      &second_out_fb);
+	igt_require(fb_id > 0);
+
+	/* Two commits, with different writeback buffers */
+	out_fbs[1] = &second_out_fb;
+	writeback_sequence(output, plane, input_fb, out_fbs, 2);
+
+	igt_remove_fb(output_fb->fd, &second_out_fb);
+}
+
 igt_main
 {
 	igt_display_t display;
@@ -309,6 +422,20 @@ igt_main
 		igt_remove_fb(display.drm_fd, &output_fb);
 	}
 
+	igt_describe("Check writeback output with CRC validation");
+	igt_subtest("writeback-check-output") {
+		igt_fb_t output_fb;
+		fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
+				      DRM_FORMAT_XRGB8888,
+				      igt_fb_mod_to_tiling(0),
+				      &output_fb);
+		igt_require(fb_id > 0);
+
+		writeback_check_output(output, plane, &input_fb, &output_fb);
+
+		igt_remove_fb(display.drm_fd, &output_fb);
+	}
+
 	igt_fixture {
 		igt_remove_fb(display.drm_fd, &input_fb);
 		igt_display_fini(&display);
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
