Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF6AC10E381
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Dec 2023 18:43:34 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [i-g-t v3 6/9] tests/kms_vrr: Add ability to flip static image for
 flicker profiling
Date: Mon, 18 Dec 2023 13:52:04 +0530
Message-Id: <20231218082207.32719-7-bhanuprakash.modem@intel.com>
In-Reply-To: <20231218082207.32719-1-bhanuprakash.modem@intel.com>
References: <20231218082207.32719-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

v2:
- Add short opt to the main callsite (Bhanu)
v3: (Bhanu)
- Rebase
- Nit: 's/d:r:s:/drs:/'

Cc: Mark Yacoub <markyacoub@chromium.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vrr.c | 53 ++++++++++++++++++++++++++++++-------------------
 1 file changed, 33 insertions(+), 20 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 8f0483db1..5d25a4672 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -115,6 +115,7 @@ typedef struct data {
 	drmModeModeInfo switch_modes[RR_MODES_COUNT];
 	vtest_ns_t vtest_ns;
 	uint64_t duration_ns;
+	bool static_image;
 } data_t;
 
 typedef void (*test_t)(data_t*, enum pipe, igt_output_t*, uint32_t);
@@ -283,6 +284,7 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 	drmModeModeInfo mode;
 	cairo_t *cr;
 	int bar_width, bar_height, bar_remaining, horizontal_bar_height;
+	int num_painted_fbs;
 
 	mode = *igt_output_get_mode(output);
 
@@ -315,25 +317,31 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 	horizontal_bar_height = mode.vdisplay / 8;
 	bar_height = mode.vdisplay - horizontal_bar_height * 2;
 	bar_remaining = mode.hdisplay % bar_width;
-	cr = igt_get_cairo_ctx(data->drm_fd, &data->fb[0]);
-	for (int j = 0; j < num_bars; ++j) {
-		unsigned int width = bar_width;
-		if (j == num_bars - 1)
-			width += bar_remaining;
-
-		/* Red->Green->Blue gradient */
-		if (j < num_bars / 2)
-			paint_bar(cr, j * bar_width, 0, width, bar_height,
-				  j, num_bars / 2,
-				  1.0, 0.0, 0.0, 0.0, 1.0, 0.0);
-		else
-			paint_bar(cr, j * bar_width, 0, width, bar_height,
-				  j - num_bars / 2, num_bars / 2,
-				  0.0, 1.0, 0.0, 0.0, 0.0, 1.0);
+	num_painted_fbs = data->static_image ? 2 : 1;
+	for (int i = 0; i < num_painted_fbs; ++i) {
+		cr = igt_get_cairo_ctx(data->drm_fd, &data->fb[i]);
+		for (int j = 0; j < num_bars; ++j) {
+			unsigned int width = bar_width;
+			if (j == num_bars - 1)
+				width += bar_remaining;
+
+			/* Red->Green->Blue gradient */
+			if (j < num_bars / 2)
+				paint_bar(cr, j * bar_width, 0, width,
+					  bar_height,
+					  j, num_bars / 2,
+					  1.0, 0.0, 0.0, 0.0, 1.0, 0.0);
+			else
+				paint_bar(cr, j * bar_width, 0, width,
+					  bar_height,
+					  j - num_bars / 2, num_bars / 2,
+					  0.0, 1.0, 0.0, 0.0, 0.0, 1.0);
+		}
+		igt_paint_color(cr, 0, mode.vdisplay - horizontal_bar_height,
+				mode.hdisplay, horizontal_bar_height,
+				1.00, 1.00, 1.00);
+		igt_put_cairo_ctx(cr);
 	}
-	igt_paint_color(cr, 0, mode.vdisplay - horizontal_bar_height,
-			mode.hdisplay, horizontal_bar_height, 1.00, 1.00, 1.00);
-	igt_put_cairo_ctx(cr);
 
 	/* Take care of any required modesetting before the test begins. */
 	data->primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
@@ -715,6 +723,9 @@ static int opt_handler(int opt, int opt_index, void *_data)
 	case 'r':
 		data->vtest_ns.rate_ns = rate_from_refresh(atoi(optarg));
 		break;
+	case 's':
+		data->static_image = true;
+		break;
 	}
 	return IGT_OPT_HANDLER_SUCCESS;
 }
@@ -722,16 +733,18 @@ static int opt_handler(int opt, int opt_index, void *_data)
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
 
-igt_main_args("dr:", long_opts, help_str, opt_handler, &data)
+igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
 {
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
-- 
2.40.0
