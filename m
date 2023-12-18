Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8647010E371
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Dec 2023 18:43:34 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [i-g-t v3 1/9] tests/kms_vrr: Move fb0 and fb1 to an array
Date: Mon, 18 Dec 2023 13:51:59 +0530
Message-Id: <20231218082207.32719-2-bhanuprakash.modem@intel.com>
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

Consolidate the 2 fb variables into an array. No functional changes.

v2:
- Clarified commit msg (Bhanu)
v3: (Bhanu)
- Rebase

Cc: Mark Yacoub <markyacoub@chromium.org>
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vrr.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 1ace970a5..dda716ff3 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -104,8 +104,7 @@ typedef struct data {
 	igt_display_t display;
 	int drm_fd;
 	igt_plane_t *primary;
-	igt_fb_t fb0;
-	igt_fb_t fb1;
+	igt_fb_t fb[2];
 	range_t range;
 	drmModeModeInfo switch_modes[RR_MODES_COUNT];
 } data_t;
@@ -280,13 +279,13 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 	/* Prepare resources */
 	igt_create_color_fb(data->drm_fd, mode.hdisplay, mode.vdisplay,
 			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
-			    0.50, 0.50, 0.50, &data->fb0);
+			    0.50, 0.50, 0.50, &data->fb[0]);
 
 	igt_create_color_fb(data->drm_fd, mode.hdisplay, mode.vdisplay,
 			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
-			    0.50, 0.50, 0.50, &data->fb1);
+			    0.50, 0.50, 0.50, &data->fb[1]);
 
-	cr = igt_get_cairo_ctx(data->drm_fd, &data->fb0);
+	cr = igt_get_cairo_ctx(data->drm_fd, &data->fb[0]);
 
 	igt_paint_color(cr, 0, 0, mode.hdisplay / 10, mode.vdisplay / 10,
 			1.00, 0.00, 0.00);
@@ -295,7 +294,7 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 
 	/* Take care of any required modesetting before the test begins. */
 	data->primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
-	igt_plane_set_fb(data->primary, &data->fb0);
+	igt_plane_set_fb(data->primary, &data->fb[0]);
 
 	/* Clear vrr_enabled state before enabling it, because
 	 * it might be left enabled if the previous test fails.
@@ -345,7 +344,7 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
 	vtest_ns_t vtest_ns = get_test_rate_ns(data->range);
 
 	/* Align with the flip completion event to speed up convergence. */
-	do_flip(data, &data->fb0);
+	do_flip(data, &data->fb[0]);
 	start_ns = last_event_ns = target_ns = get_kernel_event_ns(data,
 							DRM_EVENT_FLIP_COMPLETE);
 
@@ -354,7 +353,7 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
 		int64_t diff_ns;
 
 		front = !front;
-		do_flip(data, front ? &data->fb1 : &data->fb0);
+		do_flip(data, front ? &data->fb[1] : &data->fb[0]);
 
 		/* We need to cpture flip event instead of vblank event,
 		 * because vblank is triggered after each frame, but depending
@@ -560,8 +559,8 @@ static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
 	igt_output_override_mode(output, NULL);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
-	igt_remove_fb(data->drm_fd, &data->fb1);
-	igt_remove_fb(data->drm_fd, &data->fb0);
+	igt_remove_fb(data->drm_fd, &data->fb[1]);
+	igt_remove_fb(data->drm_fd, &data->fb[0]);
 }
 
 static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags)
-- 
2.40.0
