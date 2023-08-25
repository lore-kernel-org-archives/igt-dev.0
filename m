Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 846B510E6C0
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Aug 2023 18:39:42 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-58ca499456dso15700677b3.1
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Aug 2023 11:39:42 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: igt-dev@lists.freedesktop.org
Date: Fri, 25 Aug 2023 18:36:21 +0000
Message-ID: <20230825183934.1271156-7-sean@poorly.run>
In-Reply-To: <20230825183934.1271156-1-sean@poorly.run>
References: <20230825183934.1271156-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 6/6] test/kms_vrr: Add ability to flip static
 image for flicker profiling
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

Add a --static-image argument which will paint both framebuffers
identically. This allows us to profile VRR flicker on the panel.

Cc: Mark Yacoub <markyacoub@chromium.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 tests/kms_vrr.c | 36 ++++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index e6820a0d1..0a6e89ddb 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -115,6 +115,7 @@ typedef struct data {
 	range_t range;
 	vtest_ns_t vtest_ns;
 	uint64_t duration_ns;
+	bool static_image;
 } data_t;
 
 typedef void (*test_t)(data_t*, enum pipe, igt_output_t*, uint32_t);
@@ -241,8 +242,7 @@ static void set_vrr_on_pipe(data_t *data, enum pipe pipe, bool enabled)
 static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 {
 	drmModeModeInfo mode;
-	cairo_t *cr;
-	int bar_width;
+	int bar_width, num_painted_fbs;
 
 	/* Reset output */
 	igt_display_reset(&data->display);
@@ -286,18 +286,21 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 			    0.50, 0.50, 0.50, &data->fb[1]);
 
 	bar_width = mode.hdisplay / 3;
-	cr = igt_get_cairo_ctx(data->drm_fd, &data->fb[0]);
-	for (int j = 0; j < 3; ++j) {
-		unsigned int color = 1 << j;
-		igt_paint_color(cr, bar_width * j, 0, bar_width,
-				mode.vdisplay - 200,
-				color >> 0 & 1,
-				color >> 1 & 1,
-				color >> 2 & 1);
+	num_painted_fbs = data->static_image ? 2 : 1;
+	for (int i = 0; i < num_painted_fbs; ++i) {
+		cairo_t *cr = igt_get_cairo_ctx(data->drm_fd, &data->fb[i]);
+		for (int j = 0; j < 3; ++j) {
+			unsigned int color = 1 << j;
+			igt_paint_color(cr, bar_width * j, 0, bar_width,
+					mode.vdisplay - 200,
+					color >> 0 & 1,
+					color >> 1 & 1,
+					color >> 2 & 1);
+		}
+		igt_paint_color(cr, 0, mode.vdisplay - 100, mode.hdisplay, 100,
+				1.00, 1.00, 1.00);
+		igt_put_cairo_ctx(cr);
 	}
-	igt_paint_color(cr, 0, mode.vdisplay - 100, mode.hdisplay, 100,
-			1.00, 1.00, 1.00);
-	igt_put_cairo_ctx(cr);
 
 	/* Take care of any required modesetting before the test begins. */
 	data->primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
@@ -561,6 +564,9 @@ static int opt_handler(int opt, int opt_index, void *_data)
 	case 'r':
 		data->vtest_ns.rate_ns = rate_from_refresh(atoi(optarg));
 		break;
+	case 's':
+		data->static_image = true;
+		break;
 	}
 	return IGT_OPT_HANDLER_SUCCESS;
 }
@@ -568,12 +574,14 @@ static int opt_handler(int opt, int opt_index, void *_data)
 static const struct option long_opts[] = {
 	{ .name = "duration", .has_arg = true, .val = 'd', },
 	{ .name = "refresh-rate", .has_arg = true, .val = 'r', },
+	{ .name = "static-image", .has_arg = false, .val = 's', },
 	{}
 };
 
 static const char help_str[] =
 	"  --duration <duration-seconds>\t\tHow long to run the test for\n"
-	"  --refresh-rate <refresh-hz>\t\tThe refresh rate to flip at\n";
+	"  --refresh-rate <refresh-hz>\t\tThe refresh rate to flip at\n"
+	"  --static-image\t\tFlip a static image for flicker profiling\n";
 
 static data_t data;
 
-- 
Sean Paul, Software Engineer, Google / Chromium OS
