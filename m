Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ACED10E256
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Oct 2023 20:59:15 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id
 6a1803df08f44-66d134a019cso27072826d6.3
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Oct 2023 13:59:15 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: igt-dev@lists.freedesktop.org
Date: Mon, 23 Oct 2023 20:56:31 +0000
Message-ID: <20231023205910.3556533-2-sean@poorly.run>
In-Reply-To: <20231023205910.3556533-1-sean@poorly.run>
References: <20231023205910.3556533-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 1/8] tests/kms_vrr: Move fb0 and fb1 to an array
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

Cc: Mark Yacoub <markyacoub@chromium.org>
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Sean Paul <seanpaul@chromium.org>

Changes in v2:
- Clarified commit msg (Bhanu)
---
 tests/kms_vrr.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index e203fd4d5..4eeae4747 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -100,8 +100,7 @@ typedef struct data {
 	igt_display_t display;
 	int drm_fd;
 	igt_plane_t *primary;
-	igt_fb_t fb0;
-	igt_fb_t fb1;
+	igt_fb_t fb[2];
 	range_t range;
 } data_t;
 
@@ -268,13 +267,13 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
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
@@ -283,7 +282,7 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 
 	/* Take care of any required modesetting before the test begins. */
 	data->primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
-	igt_plane_set_fb(data->primary, &data->fb0);
+	igt_plane_set_fb(data->primary, &data->fb[0]);
 
 	/* Clear vrr_enabled state before enabling it, because
 	 * it might be left enabled if the previous test fails.
@@ -333,7 +332,7 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
 	vtest_ns_t vtest_ns = get_test_rate_ns(data->range);
 
 	/* Align with the flip completion event to speed up convergence. */
-	do_flip(data, &data->fb0);
+	do_flip(data, &data->fb[0]);
 	start_ns = last_event_ns = target_ns = get_kernel_event_ns(data,
 							DRM_EVENT_FLIP_COMPLETE);
 
@@ -342,7 +341,7 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
 		int64_t diff_ns;
 
 		front = !front;
-		do_flip(data, front ? &data->fb1 : &data->fb0);
+		do_flip(data, front ? &data->fb[1] : &data->fb[0]);
 
 		/* We need to cpture flip event instead of vblank event,
 		 * because vblank is triggered after each frame, but depending
@@ -492,8 +491,8 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	igt_output_override_mode(output, NULL);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
-	igt_remove_fb(data->drm_fd, &data->fb1);
-	igt_remove_fb(data->drm_fd, &data->fb0);
+	igt_remove_fb(data->drm_fd, &data->fb[1]);
+	igt_remove_fb(data->drm_fd, &data->fb[0]);
 }
 
 /* Runs tests on outputs that are VRR capable. */
-- 
Sean Paul, Software Engineer, Google / Chromium OS
