Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D74F6E904
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Dec 2019 15:41:54 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id 2so1648473pfg.12
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Dec 2019 07:41:54 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Fri, 13 Dec 2019 17:41:46 +0200
Message-Id: <1576251706-32439-1-git-send-email-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] [PATCH i-g-t] tests/kms_frontbuffer_tracking: optimize
 test execution time
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Don't continuously start and stop crc calculation because it
take lot of time. Just start crc in beginning of test and
stop it in the end.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_frontbuffer_tracking.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/tests/kms_frontbuffer_tracking.c b/tests/kms_frontbuffer_tracking.c
index c788b59..e34580a 100644
--- a/tests/kms_frontbuffer_tracking.c
+++ b/tests/kms_frontbuffer_tracking.c
@@ -1172,15 +1172,19 @@ static void print_crc(const char *str, igt_crc_t *crc)
 
 static void collect_crc(igt_crc_t *crc)
 {
-	igt_pipe_crc_collect_crc(pipe_crc, crc);
+	igt_wait_for_vblank(drm.fd, prim_mode_params.pipe);
+	igt_pipe_crc_get_current(drm.fd, pipe_crc, crc);
 }
 
 static void init_blue_crc(enum pixel_format format)
 {
 	struct igt_fb blue;
 
-	if (blue_crcs[format].initialized)
+	if (blue_crcs[format].initialized) {
+		if (pipe_crc)
+			igt_pipe_crc_drain(pipe_crc);
 		return;
+	}
 
 	create_fb(format, prim_mode_params.mode->hdisplay,
 		  prim_mode_params.mode->vdisplay, opt.tiling, PLANE_PRI,
@@ -1196,6 +1200,7 @@ static void init_blue_crc(enum pixel_format format)
 	if (!pipe_crc) {
 		pipe_crc = igt_pipe_crc_new(drm.fd, prim_mode_params.pipe, INTEL_PIPE_CRC_SOURCE_AUTO);
 		igt_assert(pipe_crc);
+		igt_pipe_crc_start(pipe_crc);
 	}
 
 	collect_crc(&blue_crcs[format].crc);
@@ -1354,6 +1359,9 @@ static void teardown_crcs(void)
 			free(pattern4.crcs[f]);
 	}
 
+	if (pipe_crc != NULL)
+		igt_pipe_crc_stop(pipe_crc);
+
 	igt_pipe_crc_free(pipe_crc);
 }
 
@@ -1556,8 +1564,10 @@ static void do_crc_assertions(int flags)
 {
 	igt_crc_t crc;
 
-	if (!opt.check_crc || (flags & DONT_ASSERT_CRC))
+	if (!opt.check_crc || (flags & DONT_ASSERT_CRC)) {
+		igt_pipe_crc_drain(pipe_crc);
 		return;
+	}
 
 	collect_crc(&crc);
 	print_crc("Calculated CRC:", &crc);
@@ -2168,16 +2178,22 @@ static void slow_draw_subtest(const struct test_mode *t)
 	struct fb_region *target;
 
 	prepare_subtest(t, pattern);
+	igt_pipe_crc_stop(pipe_crc);
 	sleep(2);
 	target = pick_target(t, params);
+	igt_pipe_crc_start(pipe_crc);
 
 	for (r = 0; r < pattern->n_rects; r++) {
+		igt_pipe_crc_stop(pipe_crc);
+
 		sleep(2);
 		draw_rect(pattern, target, t->method, r);
 		sleep(2);
 
 		update_wanted_crc(t, &pattern->crcs[t->format][r]);
 
+		igt_pipe_crc_start(pipe_crc);
+
 		if (t->feature & FEATURE_DRRS)
 			do_assertions(ASSERT_DRRS_LOW);
 		else
@@ -2699,15 +2715,19 @@ static void suspend_subtest(const struct test_mode *t)
 	struct modeset_params *params = pick_params(t);
 
 	prepare_subtest(t, NULL);
+	igt_pipe_crc_stop(pipe_crc);
 	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
+	igt_pipe_crc_start(pipe_crc);
 	do_assertions(ASSERT_DRRS_LOW);
 
 	unset_all_crtcs();
+	igt_pipe_crc_stop(pipe_crc);
 	igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
 	do_assertions(ASSERT_FBC_DISABLED | ASSERT_PSR_DISABLED |
 		      DONT_ASSERT_CRC | ASSERT_DRRS_INACTIVE);
 
 	set_mode_for_params(params);
+	igt_pipe_crc_start(pipe_crc);
 	do_assertions(0);
 }
 
-- 
2.7.4

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
