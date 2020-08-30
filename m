Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1429F89C9D
 for <igt-dev@lists.freedesktop.org>; Sun, 30 Aug 2020 11:59:02 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id m34so2723402pgl.11
 for <igt-dev@lists.freedesktop.org>; Sun, 30 Aug 2020 04:59:02 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Sun, 30 Aug 2020 14:58:50 +0300
Message-Id: <20200830115850.4318-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_vblank: add hotplug detection
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

In case there's hpd during test execution try to restart
the test once before giving up. Here fixed vblank_query and vblank_wait
as they are ones affected by hpd's

needs_retry_after_link_reset() along with comments is direct cut'n'paste
from Imre's code in kms_flip for same issue.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_vblank.c | 86 +++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 73 insertions(+), 13 deletions(-)

diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index be001312..f81cb8ff 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -59,8 +59,33 @@ typedef struct {
 #define DPMS	0x20
 #define SUSPEND 0x40
 #define RPM	0x80
+	struct udev_monitor *mon;
+	bool retried;
+	bool escape;
 } data_t;
 
+/*
+ * Some monitors with odd behavior signal a bad link after waking from a power
+ * saving state and the subsequent (successful) modeset. This will result in a
+ * link-retraining (DP) or async modeset (HDMI), which in turn makes the test
+ * miss vblank/flip events and fail.  Work around this by retrying the test
+ * once in case of such a link reset event, which the driver signals with a
+ * hotplug event.
+ */
+static bool needs_retry_after_link_reset(struct udev_monitor *mon)
+{
+	bool hotplug_detected;
+
+	igt_suspend_signal_helper();
+	hotplug_detected = igt_hotplug_detected(mon, 3);
+	igt_resume_signal_helper();
+
+	if (hotplug_detected)
+		igt_debug("Retrying after a hotplug event\n");
+
+	return hotplug_detected;
+}
+
 static double elapsed(const struct timespec *start,
 		      const struct timespec *end,
 		      int loop)
@@ -119,7 +144,12 @@ static void run_test(data_t *data, void (*testfunc)(data_t *, int, int))
 	int fd = display->drm_fd;
 	igt_hang_t hang;
 
+	data->retried = false;
+	data->mon = igt_watch_uevents();
+retry:
 	prepare_crtc(data, fd, output);
+	igt_flush_uevents(data->mon);
+	data->escape = false;
 
 	if (data->flags & RPM)
 		igt_require(igt_setup_runtime_pm(fd));
@@ -153,7 +183,7 @@ static void run_test(data_t *data, void (*testfunc)(data_t *, int, int))
 	} else
 		testfunc(data, fd, 1);
 
-	if (data->flags & BUSY) {
+	if (data->flags & BUSY && !data->escape) {
 		struct drm_event_vblank buf;
 		igt_assert_eq(read(fd, &buf, sizeof(buf)), sizeof(buf));
 	}
@@ -163,11 +193,22 @@ static void run_test(data_t *data, void (*testfunc)(data_t *, int, int))
 	if (!(data->flags & NOHANG))
 		igt_post_hang_ring(fd, hang);
 
-	igt_info("\n%s on pipe %s, connector %s: PASSED\n\n",
-		 igt_subtest_name(), kmstest_pipe_name(data->pipe), igt_output_name(output));
-
 	/* cleanup what prepare_crtc() has done */
+
 	cleanup_crtc(data, fd, output);
+
+	if (data->escape)
+	{
+		igt_assert(!data->retried &&
+			   needs_retry_after_link_reset(data->mon));
+		data->retried = true;
+		goto retry;
+	}
+	igt_info("\n%s on pipe %s, connector %s: PASSED\n\n",
+		igt_subtest_name(), kmstest_pipe_name(data->pipe), igt_output_name(output));
+
+	data->retried = false;
+	igt_cleanup_uevents(data->mon);
 }
 
 static void crtc_id_subtest(data_t *data, int fd)
@@ -279,10 +320,15 @@ static void vblank_query(data_t *data, int fd, int nchildren)
 
 	clock_gettime(CLOCK_MONOTONIC, &start);
 	do {
+		int rval;
 		vbl.request.type = DRM_VBLANK_RELATIVE;
 		vbl.request.type |= pipe_id_flag;
 		vbl.request.sequence = 0;
-		igt_assert_eq(wait_vblank(fd, &vbl), 0);
+		rval = wait_vblank(fd, &vbl);
+		if (rval) {
+			data->escape = true;
+			return;
+		}
 		count++;
 	} while ((vbl.reply.sequence - sq) <= 120);
 	clock_gettime(CLOCK_MONOTONIC, &end);
@@ -308,10 +354,15 @@ static void vblank_wait(data_t *data, int fd, int nchildren)
 
 	clock_gettime(CLOCK_MONOTONIC, &start);
 	do {
+		int rval;
 		vbl.request.type = DRM_VBLANK_RELATIVE;
 		vbl.request.type |= pipe_id_flag;
 		vbl.request.sequence = 1;
-		igt_assert_eq(wait_vblank(fd, &vbl), 0);
+		rval = wait_vblank(fd, &vbl);
+		if (rval) {
+			data->escape = true;
+			return;
+		}
 		count++;
 	} while ((vbl.reply.sequence - sq) <= 120);
 	clock_gettime(CLOCK_MONOTONIC, &end);
@@ -514,22 +565,31 @@ static void invalid_subtest(data_t *data, int fd)
 igt_main
 {
 	int fd;
-	data_t data;
+	data_t *data;
 
 	igt_fixture {
+		// mmap data so forked tests can talk back.
+		data = mmap(NULL, sizeof(data_t), PROT_READ | PROT_WRITE,
+			    MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+		memset(data, 0, sizeof(data_t));
+
 		fd = drm_open_driver_master(DRIVER_ANY);
 		kmstest_set_vt_graphics_mode();
-		igt_display_require(&data.display, fd);
-		igt_display_require_output(&data.display);
+		igt_display_require(&data->display, fd);
+		igt_display_require_output(&data->display);
 	}
 
 	igt_subtest("invalid")
-		invalid_subtest(&data, fd);
+		invalid_subtest(data, fd);
 
 	igt_subtest("crtc-id")
-		crtc_id_subtest(&data, fd);
+		crtc_id_subtest(data, fd);
 
-	for_each_pipe_static(data.pipe)
+	for_each_pipe_static(data->pipe)
 		igt_subtest_group
-			run_subtests_for_pipe(&data);
+			run_subtests_for_pipe(data);
+
+	igt_fixture {
+		munmap(data, sizeof(data_t));
+	}
 }
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
