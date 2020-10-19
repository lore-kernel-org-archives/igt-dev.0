Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 229706E0FE
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Oct 2020 11:25:13 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id e7so5816237pfn.12
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Oct 2020 04:25:13 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Mon, 19 Oct 2020 14:24:59 +0300
Message-Id: <20201019112459.18286-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane: try to detect mid test
 modeset
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

mid test happening modeset will mess up vblank counting in test.
Flag happened modeset and use this information to ignore vblank
frame value in case of modeset.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_plane.c | 34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index e42c71cd9..12c232385 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -539,11 +539,11 @@ static int num_unique_crcs(const igt_crc_t crc[], int num_crc)
 	return num_unique_crc;
 }
 
-static void capture_crc(data_t *data, unsigned int vblank, igt_crc_t *crc)
+static void capture_crc(data_t *data, unsigned int vblank, igt_crc_t *crc, bool modeset)
 {
 	igt_pipe_crc_get_for_frame(data->drm_fd, data->pipe_crc, vblank, crc);
 
-	igt_fail_on_f(crc->has_valid_frame && crc->frame != vblank,
+	igt_fail_on_f(crc->has_valid_frame && (crc->frame != vblank && !modeset),
 		      "Got CRC for the wrong frame (got %u, expected %u). CRC buffer overflow?\n",
 		      crc->frame, vblank);
 }
@@ -557,8 +557,9 @@ static void capture_format_crcs(data_t *data, enum pipe pipe,
 				igt_crc_t crc[], struct igt_fb *fb)
 {
 	unsigned int vblank[ARRAY_SIZE(colors_extended)];
+	bool modeset[ARRAY_SIZE(colors_extended)];
 	struct drm_event_vblank ev;
-	int i;
+	int i, ret;
 
 	for (i = 0; i < data->num_colors; i++) {
 		const color_t *c = &data->colors[i];
@@ -585,18 +586,25 @@ static void capture_format_crcs(data_t *data, enum pipe pipe,
 		 * is for frame N-2.
 		 */
 		if (i >= 2)
-			capture_crc(data, vblank[i - 2], &crc[i - 2]);
+			capture_crc(data, vblank[i - 2], &crc[i - 2], modeset[i - 2]);
 
 		if (data->display.is_atomic) {
+			modeset[i] = false;
 			/*
 			 * Use non-blocking commits to allow the next fb
 			 * to be prepared in parallel while the current fb
 			 * awaits to be latched.
 			 */
-			igt_display_commit_atomic(&data->display,
-						  DRM_MODE_ATOMIC_ALLOW_MODESET |
-						  DRM_MODE_ATOMIC_NONBLOCK |
-						  DRM_MODE_PAGE_FLIP_EVENT, NULL);
+			ret = igt_display_try_commit_atomic(&data->display,
+							    DRM_MODE_ATOMIC_NONBLOCK |
+							    DRM_MODE_PAGE_FLIP_EVENT, NULL);
+			if (ret) {
+				modeset[i] = true;
+				igt_display_commit_atomic(&data->display,
+							  DRM_MODE_ATOMIC_ALLOW_MODESET |
+							  DRM_MODE_ATOMIC_NONBLOCK |
+							  DRM_MODE_PAGE_FLIP_EVENT, NULL);
+			}
 		} else {
 			/*
 			 * Last moment to grab the previous crc
@@ -652,8 +660,8 @@ static void capture_format_crcs(data_t *data, enum pipe pipe,
 	 * between different pixel formats as well? Could get messy.
 	 */
 	if (i >= 2)
-		capture_crc(data, vblank[i - 2], &crc[i - 2]);
-	capture_crc(data, vblank[i - 1], &crc[i - 1]);
+		capture_crc(data, vblank[i - 2], &crc[i - 2], modeset[i - 2]);
+	capture_crc(data, vblank[i - 1], &crc[i - 1], modeset[i - 1]);
 }
 
 static bool test_format_plane_colors(data_t *data, enum pipe pipe,
@@ -815,7 +823,9 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
 
 		igt_plane_set_fb(plane, &test_fb);
 
-		ret = igt_display_try_commit_atomic(&data->display, DRM_MODE_ATOMIC_TEST_ONLY, NULL);
+		ret = igt_display_try_commit_atomic(&data->display,
+						    DRM_MODE_ATOMIC_ALLOW_MODESET |
+						    DRM_MODE_ATOMIC_TEST_ONLY, NULL);
 
 		if (!ret) {
 			width = test_fb.width;
@@ -1029,7 +1039,7 @@ static const struct option long_opts[] = {
 static const char help_str[] =
 	"  --extended\t\tRun the extended tests\n";
 
-static data_t data;
+static data_t data = {};
 
 igt_main_args("", long_opts, help_str, opt_handler, &data)
 {
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
