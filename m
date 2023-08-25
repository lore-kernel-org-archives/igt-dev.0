Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com
 [IPv6:2607:f8b0:4864:20::e2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5ABC10E6DC
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Aug 2023 18:39:41 +0000 (UTC)
Received: by mail-vs1-xe2a.google.com with SMTP id
 ada2fe7eead31-44e8d9e6ca0so466360137.3
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Aug 2023 11:39:41 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: igt-dev@lists.freedesktop.org
Date: Fri, 25 Aug 2023 18:36:20 +0000
Message-ID: <20230825183934.1271156-6-sean@poorly.run>
In-Reply-To: <20230825183934.1271156-1-sean@poorly.run>
References: <20230825183934.1271156-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 5/6] tests/kms_vrr: Change the pattern displayed
 in the test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Sean Paul <seanpaul@chromium.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Upgrade the tiny box in the top left corner to some vertical color
bars with horizontal grey and white bars at the bottom.

Cc: Mark Yacoub <markyacoub@chromium.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 tests/kms_vrr.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 67d13d4bf..e6820a0d1 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -242,6 +242,7 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 {
 	drmModeModeInfo mode;
 	cairo_t *cr;
+	int bar_width;
 
 	/* Reset output */
 	igt_display_reset(&data->display);
@@ -284,11 +285,18 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
 			    0.50, 0.50, 0.50, &data->fb[1]);
 
+	bar_width = mode.hdisplay / 3;
 	cr = igt_get_cairo_ctx(data->drm_fd, &data->fb[0]);
-
-	igt_paint_color(cr, 0, 0, mode.hdisplay / 10, mode.vdisplay / 10,
-			1.00, 0.00, 0.00);
-
+	for (int j = 0; j < 3; ++j) {
+		unsigned int color = 1 << j;
+		igt_paint_color(cr, bar_width * j, 0, bar_width,
+				mode.vdisplay - 200,
+				color >> 0 & 1,
+				color >> 1 & 1,
+				color >> 2 & 1);
+	}
+	igt_paint_color(cr, 0, mode.vdisplay - 100, mode.hdisplay, 100,
+			1.00, 1.00, 1.00);
 	igt_put_cairo_ctx(cr);
 
 	/* Take care of any required modesetting before the test begins. */
-- 
Sean Paul, Software Engineer, Google / Chromium OS
