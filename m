Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EEA310E675
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jan 2024 21:07:13 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1d54b86538aso21945695ad.0
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jan 2024 13:07:13 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH] tests/kms_plane_cursor: Skip unneeded overlay requirement
Date: Wed, 10 Jan 2024 13:07:09 -0800
Message-ID: <20240110210709.219979-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Tests that aren't using an overlay plan should not require one.

Some qcom devices only have primary and cursor planes (but those planes
are not restricted to a single CRTC).  Requiring an overlay plane even
for subtests that didn't need one, was causing all the tests to SKIP.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 tests/kms_plane_cursor.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index dd33d8129626..5b3cdc06901b 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -91,7 +91,8 @@ typedef struct data {
 } data_t;
 
 /* Common test setup. */
-static void test_init(data_t *data, enum pipe pipe_id, igt_output_t *output)
+static void test_init(data_t *data, enum pipe pipe_id, igt_output_t *output,
+		      unsigned int flags)
 {
 	data->pipe_id = pipe_id;
 	data->pipe = &data->display.pipes[data->pipe_id];
@@ -100,7 +101,8 @@ static void test_init(data_t *data, enum pipe pipe_id, igt_output_t *output)
 	data->mode = igt_output_get_mode(data->output);
 
 	data->primary = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
-	data->overlay = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_OVERLAY);
+	if (flags & TEST_OVERLAY)
+		data->overlay = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_OVERLAY);
 	data->cursor = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_CURSOR);
 
 	igt_info("Using (pipe %s + %s) to run the subtest.\n",
@@ -123,7 +125,8 @@ static void test_fini(data_t *data)
 	igt_pipe_crc_free(data->pipe_crc);
 	igt_display_reset(&data->display);
 	igt_plane_set_fb(data->primary, NULL);
-	igt_plane_set_fb(data->overlay, NULL);
+	if (data->overlay)
+		igt_plane_set_fb(data->overlay, NULL);
 	igt_plane_set_fb(data->cursor, NULL);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 }
@@ -167,7 +170,8 @@ static void test_cursor_pos(data_t *data, int x, int y, unsigned int flags)
 	igt_paint_color(cr, x, y, cw, ch, 1.0, 0.0, 1.0);
 	igt_put_cairo_ctx(cr);
 
-	igt_plane_set_fb(data->overlay, NULL);
+	if (flags & TEST_OVERLAY)
+		igt_plane_set_fb(data->overlay, NULL);
 	igt_plane_set_fb(data->cursor, NULL);
 	igt_display_commit_atomic(&data->display, 0, NULL);
 
@@ -333,7 +337,7 @@ igt_main
 				if (!intel_pipe_output_combo_valid(display))
 					continue;
 
-				test_init(&data, pipe, output);
+				test_init(&data, pipe, output, tests[i].flags);
 
 				for (j = 0; j < ARRAY_SIZE(cursor_sizes); j++) {
 					int size = cursor_sizes[j];
-- 
2.43.0
