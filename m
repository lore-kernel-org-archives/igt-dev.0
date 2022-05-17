Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46EF310ECB5
 for <igt-dev@lists.freedesktop.org>; Tue, 17 May 2022 12:06:59 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 17 May 2022 17:32:41 +0530
Message-Id: <20220517120245.3521494-8-bhanuprakash.modem@intel.com>
In-Reply-To: <20220517120245.3521494-1-bhanuprakash.modem@intel.com>
References: <20220517120245.3521494-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V5 07/11] tests/kms_cursor_crc: Test Cleanup
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

Sanitize the system state before starting the subtest.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_cursor_crc.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index e489a870..5c90537b 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -448,22 +448,23 @@ static void cleanup_crtc(data_t *data)
 	cairo_surface_destroy(data->surface);
 	data->surface = NULL;
 
+	igt_output_set_pipe(data->output, PIPE_NONE);
 	igt_plane_set_fb(data->primary, NULL);
 	igt_display_commit(display);
 
 	igt_remove_fb(data->drm_fd, &data->primary_fb[HWCURSORBUFFER]);
 	igt_remove_fb(data->drm_fd, &data->primary_fb[SWCOMPARISONBUFFER1]);
 	igt_remove_fb(data->drm_fd, &data->primary_fb[SWCOMPARISONBUFFER2]);
-
-	igt_display_reset(display);
 }
 
-static void prepare_crtc(data_t *data, igt_output_t *output,
-			 int cursor_w, int cursor_h)
+static void prepare_crtc(data_t *data, int cursor_w, int cursor_h)
 {
 	drmModeModeInfo *mode;
 	igt_display_t *display = &data->display;
 	cairo_t *cr;
+	igt_output_t *output = data->output;
+
+	igt_display_reset(display);
 
 	/* select the pipe we want to use */
 	igt_output_set_pipe(output, data->pipe);
@@ -587,6 +588,7 @@ static void require_cursor_size(data_t *data, int w, int h)
 	igt_require(w <= data->cursor_max_w &&
 		    h <= data->cursor_max_h);
 
+	igt_display_reset(display);
 	igt_output_set_pipe(output, data->pipe);
 
 	mode = igt_output_get_mode(output);
@@ -624,7 +626,7 @@ static void run_test(data_t *data, void (*testfunc)(data_t *), int cursor_w, int
 	if (data->fb.fb_id != 0)
 		require_cursor_size(data, cursor_w, cursor_h);
 
-	prepare_crtc(data, data->output, cursor_w, cursor_h);
+	prepare_crtc(data, cursor_w, cursor_h);
 	testfunc(data);
 	cleanup_crtc(data);
 }
@@ -883,9 +885,6 @@ igt_main
 
 		igt_display_require(&data.display, data.drm_fd);
 		igt_display_require_output(&data.display);
-		igt_display_reset(&data.display);
-		igt_display_commit2(&data.display, data.display.is_atomic ?
-				    COMMIT_ATOMIC : COMMIT_LEGACY);
 	}
 
 	data.cursor_max_w = cursor_width;
-- 
2.35.1
