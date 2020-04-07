Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F08FB6E82F
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Apr 2020 11:09:13 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id r7so3172014ljg.13
 for <igt-dev@lists.freedesktop.org>; Tue, 07 Apr 2020 04:09:13 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Tue,  7 Apr 2020 14:09:04 +0300
Message-Id: <20200407110904.13008-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane: survive cdclk caused
 modeset
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

This change will slow this test down a bit. In mid test starting
to use higher bpp pixel format (say 64bpp) can cause modeset.
Use blocking commit so there's wait for modeset to happen.

Fixes: https://gitlab.freedesktop.org/drm/intel/issues/1214
Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_plane.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 805795cd..2324fb6e 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -569,12 +569,10 @@ static void capture_format_crcs(data_t *data, enum pipe pipe,
 
 		if (data->display.is_atomic) {
 			/*
-			 * Use non-blocking commits to allow the next fb
-			 * to be prepared in parallel while the current fb
-			 * awaits to be latched.
+			 * Use blocking commit because there maybe
+			 * modeset when going to higher bpp pixel format.
 			 */
 			igt_display_commit_atomic(&data->display,
-						  DRM_MODE_ATOMIC_NONBLOCK |
 						  DRM_MODE_PAGE_FLIP_EVENT, NULL);
 		} else {
 			/*
-- 
2.17.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
