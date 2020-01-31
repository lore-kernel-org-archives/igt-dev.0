Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 877F96E204
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2020 11:41:18 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id j9so107652pfa.8
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2020 03:41:18 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Fri, 31 Jan 2020 13:41:09 +0200
Message-Id: <1580470869-698-1-git-send-email-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] [PATCH i-g-t] tests/kms_frontbuffer_tracking: fix fbc
 checking rules
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

Fix FBC checking rules for scaledprimary subtests

References: https://gitlab.freedesktop.org/drm/intel/issues/160
Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_frontbuffer_tracking.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/kms_frontbuffer_tracking.c b/tests/kms_frontbuffer_tracking.c
index c788b59..2c765c3 100644
--- a/tests/kms_frontbuffer_tracking.c
+++ b/tests/kms_frontbuffer_tracking.c
@@ -2614,16 +2614,16 @@ static void scaledprimary_subtest(const struct test_mode *t)
 	do_assertions(DONT_ASSERT_CRC);
 
 	/*
-	 * On gen <= 10 HW, FBC is not enabled on a plane with a Y offset
+	 * On gen >= 9 HW, FBC is not enabled on a plane with a Y offset
 	 * that isn't divisible by 4, because it causes FIFO underruns.
 	 *
 	 * Check that FBC is disabled.
 	 */
 	igt_fb_set_position(&new_fb, reg->plane,
-			    reg->x + reg->w / 4, reg->y + src_y_upscale + 3);
+			    reg->x + reg->w / 4, (reg->y + src_y_upscale) | 3);
 	igt_fb_set_size(&new_fb, reg->plane, reg->w / 2, reg->h / 2);
 	igt_display_commit2(&drm.display, COMMIT_UNIVERSAL);
-	do_assertions(DONT_ASSERT_CRC | (gen <= 10 ? ASSERT_FBC_DISABLED : 0));
+	do_assertions(DONT_ASSERT_CRC | (gen >= 9 ? ASSERT_FBC_DISABLED : 0));
 
 	/* Back to the good and old blue fb. */
 	igt_plane_set_fb(reg->plane, old_fb);
-- 
2.7.4

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
