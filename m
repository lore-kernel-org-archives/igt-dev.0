Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03F8B6E91E
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Aug 2020 08:48:04 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Thu, 20 Aug 2020 22:12:47 +0530
Message-Id: <20200820164248.1153-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20200820164248.1153-1-bhanuprakash.modem@intel.com>
References: <20200820164248.1153-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v3 1/2] tests/kms_vrr: Use atomic API for page flip
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
To: bhanuprakash.modem@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

We should avoid using drmModePageFlip as it'll only be used for
legacy drivers, instead, use igt_display_commit_atomic() API to
page flip for atomic display code path.

v2:
* Look for the page flip event not for the vblank event (Nicholas)
* Fix to flip with different FBs (Bhanu)
v3:
* s/get_vblank_event_ns/get_kernel_event_ns/ (Manasi)
* Add a comment to capture the flip event (Manasi)
* Make sure we are reading valid event (Bhanu)
* Test clean-up (Bhanu)

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Cc: Manasi Navare <manasi.d.navare@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vrr.c | 66 +++++++++++++++++++++++++------------------------
 1 file changed, 34 insertions(+), 32 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index a0db90006d..15db7695e8 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -47,6 +47,7 @@ typedef struct range {
 typedef struct data {
 	igt_display_t display;
 	int drm_fd;
+	igt_plane_t *primary;
 	igt_fb_t fb0;
 	igt_fb_t fb1;
 } data_t;
@@ -60,15 +61,18 @@ static uint64_t timespec_to_ns(struct timespec *ts)
 }
 
 /*
- * Gets a vblank event from DRM and returns its timestamp in nanoseconds.
+ * Gets an event from DRM and returns its timestamp in nanoseconds.
+ * Asserts if the event from DRM is not matched with requested one.
+ *
  * This blocks until the event is received.
  */
-static uint64_t get_vblank_event_ns(data_t *data)
+static uint64_t get_kernel_event_ns(data_t *data, uint32_t event)
 {
 	struct drm_event_vblank ev;
 
-	igt_set_timeout(1, "Waiting for vblank event\n");
+	igt_set_timeout(1, "Waiting for an event\n");
 	igt_assert_eq(read(data->drm_fd, &ev, sizeof(ev)), sizeof(ev));
+	igt_assert_eq(ev.base.type, event);
 	igt_reset_timeout();
 
 	return ev.tv_sec * NSECS_PER_SEC + ev.tv_usec * 1000ull;
@@ -126,11 +130,11 @@ static range_t get_vrr_range(data_t *data, igt_output_t *output)
 }
 
 /* Returns a suitable vrr test frequency. */
-static uint32_t get_test_rate_ns(data_t *data, igt_output_t *output)
+static uint64_t get_test_rate_ns(data_t *data, igt_output_t *output)
 {
 	drmModeModeInfo *mode = igt_output_get_mode(output);
 	range_t range;
-	uint32_t vtest;
+	uint64_t vtest;
 
 	/*
 	 * The frequency with the fastest convergence speed should be
@@ -165,7 +169,6 @@ static void set_vrr_on_pipe(data_t *data, enum pipe pipe, bool enabled)
 static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 {
 	drmModeModeInfo mode = *igt_output_get_mode(output);
-	igt_plane_t *primary;
 	cairo_t *cr;
 
 	/* Reset output */
@@ -189,8 +192,8 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 	igt_put_cairo_ctx(cr);
 
 	/* Take care of any required modesetting before the test begins. */
-	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
-	igt_plane_set_fb(primary, &data->fb0);
+	data->primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	igt_plane_set_fb(data->primary, &data->fb0);
 
 	igt_display_commit_atomic(&data->display,
 				  DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
@@ -207,35 +210,28 @@ wait_for_vblank(data_t *data, enum pipe pipe)
 	vbl.request.sequence = 1;
 	drmWaitVBlank(data->drm_fd, &vbl);
 
-	return get_vblank_event_ns(data);
+	return get_kernel_event_ns(data, DRM_EVENT_VBLANK);
 }
 
-/* Performs an asynchronous non-blocking page-flip on a pipe. */
-static int
-do_flip(data_t *data, enum pipe pipe_id, igt_fb_t *fb)
+/* Performs an atomic non-blocking page-flip on a pipe. */
+static void
+do_flip(data_t *data, igt_fb_t *fb)
 {
-	igt_pipe_t *pipe = &data->display.pipes[pipe_id];
 	int ret;
 
 	igt_set_timeout(1, "Scheduling page flip\n");
 
-	/*
-	 * Only the legacy flip ioctl supports async flips.
-	 * It's also non-blocking, but returns -EBUSY if flipping too fast.
-	 * 2x monitor tests will need async flips in the atomic API.
-	 */
+	igt_plane_set_fb(data->primary, fb);
+
 	do {
-		ret = drmModePageFlip(data->drm_fd, pipe->crtc_id,
-				      fb->fb_id,
-				      DRM_MODE_PAGE_FLIP_EVENT |
-				      DRM_MODE_PAGE_FLIP_ASYNC,
-				      data);
+		ret = igt_display_try_commit_atomic(&data->display,
+				  DRM_MODE_ATOMIC_NONBLOCK |
+				  DRM_MODE_PAGE_FLIP_EVENT,
+				  data);
 	} while (ret == -EBUSY);
 
 	igt_assert_eq(ret, 0);
 	igt_reset_timeout();
-
-	return 0;
 }
 
 /*
@@ -246,11 +242,6 @@ do_flip(data_t *data, enum pipe pipe_id, igt_fb_t *fb)
  * can arbitrarily restrict the bounds further than the absolute
  * min and max range. But VRR is really about extending the flip
  * to prevent stuttering or to match a source content rate.
- *
- * The only way to "present" at a fixed rate like userspace in a vendor
- * neutral manner is to do it with async flips. This avoids the need
- * to wait for next vblank and it should eventually converge at the
- * desired rate.
  */
 static uint32_t
 flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
@@ -269,9 +260,14 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
 		int64_t diff_ns;
 
 		front = !front;
-		do_flip(data, pipe, front ? &data->fb1 : &data->fb0);
+		do_flip(data, front ? &data->fb1 : &data->fb0);
 
-		vblank_ns = get_vblank_event_ns(data);
+		/* We need to cpture flip event instead of vblank event,
+		 * because vblank is triggered after each frame, but depending
+		 * on the vblank evasion time flip might or might not happen in
+		 * that same frame.
+		 */
+		vblank_ns = get_kernel_event_ns(data, DRM_EVENT_FLIP_COMPLETE);
 		diff_ns = rate_ns - (vblank_ns - last_vblank_ns);
 		last_vblank_ns = vblank_ns;
 
@@ -359,6 +355,12 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 		     "Target VRR off threshold exceeded, result was %u%%\n",
 		     result);
 
+	/* Clean-up */
+	igt_plane_set_fb(data->primary, NULL);
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit_atomic(&data->display,
+				  DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
 	igt_remove_fb(data->drm_fd, &data->fb1);
 	igt_remove_fb(data->drm_fd, &data->fb0);
 }
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
