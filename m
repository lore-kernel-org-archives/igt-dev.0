Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B776E40A
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Apr 2021 08:26:09 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id f41so8415532lfv.8
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Apr 2021 01:26:09 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Wed, 14 Apr 2021 11:25:56 +0300
Message-Id: <20210414082556.14053-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_cursor_crc: Let's not create full
 screen framebuffers in a loop
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

Avoid creating full screen size fbs in a loop just to throw them
away.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_cursor_crc.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 2619e15e0..1463c5b3f 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -492,13 +492,6 @@ static void test_cursor_opaque(data_t *data)
 	test_cursor_alpha(data, 1.0);
 }
 
-static void run_test(data_t *data, void (*testfunc)(data_t *), int cursor_w, int cursor_h)
-{
-	prepare_crtc(data, data->output, cursor_w, cursor_h);
-	testfunc(data);
-	cleanup_crtc(data);
-}
-
 static void create_cursor_fb(data_t *data, int cur_w, int cur_h)
 {
 	cairo_t *cr;
@@ -567,6 +560,16 @@ static void require_cursor_size(data_t *data, int w, int h)
 	igt_skip_on_f(ret, "Cursor size %dx%d not supported by driver\n", w, h);
 }
 
+static void run_test(data_t *data, void (*testfunc)(data_t *), int cursor_w, int cursor_h)
+{
+	if (data->fb.fb_id != 0)
+		require_cursor_size(data, cursor_w, cursor_h);
+
+	prepare_crtc(data, data->output, cursor_w, cursor_h);
+	testfunc(data);
+	cleanup_crtc(data);
+}
+
 static void test_cursor_size(data_t *data)
 {
 	igt_display_t *display = &data->display;
@@ -687,7 +690,6 @@ static void run_size_tests(data_t *data, enum pipe pipe,
 				      w, h);
 		}
 		create_cursor_fb(data, w, h);
-		require_cursor_size(data, w, h);
 	}
 
 	/* Using created cursor FBs to test cursor support */
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
