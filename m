Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 769876E198
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2020 06:47:03 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id np9so4144021pjb.4
 for <igt-dev@lists.freedesktop.org>; Sun, 19 Apr 2020 23:47:03 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Mon, 20 Apr 2020 09:46:56 +0300
Message-Id: <20200420064656.6787-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_big_fb: Allow modeset to surivive
 change of cdclk
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

When testing 64bpp formats there will come modeset to change cdclk.
Allow modesets on atomic commits so commits will not produce error.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_big_fb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_big_fb.c b/tests/kms_big_fb.c
index eb144da9..a754b299 100644
--- a/tests/kms_big_fb.c
+++ b/tests/kms_big_fb.c
@@ -294,6 +294,7 @@ static bool test_plane(data_t *data)
 		 */
 		if (i == 0 && data->display.is_atomic &&
 		    igt_display_try_commit_atomic(&data->display,
+						  DRM_MODE_ATOMIC_ALLOW_MODESET |
 						  DRM_MODE_ATOMIC_TEST_ONLY,
 						  NULL) != 0) {
 			if (igt_plane_has_prop(plane, IGT_PLANE_ROTATION))
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
