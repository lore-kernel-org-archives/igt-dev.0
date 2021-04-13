Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BC006E7E6
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Apr 2021 16:35:49 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id h7so13194000qtx.3
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Apr 2021 09:35:49 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
Date: Tue, 13 Apr 2021 12:35:39 -0400
Message-Id: <20210413163539.949686-1-markyacoub@chromium.org>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v2] tests/kms_atomic_transition: Enable Primary
 Plane on Enabling CRTC.
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
Cc: seanpaul@chromium.org, petri.latvala@intel.com, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mark Yacoub <markyacoub@google.com>

Setup all plane params before committing anything.
Do not disable Primary Plane whenever a CRTC is getting enabled.

AMD Driver requires the primary plane to be enabled whenever the CRTC is, otherwise
drm_mode_cursor_universal may end up trying to enable the cursor plane while all other
planes are disabled, which is not supported by the hardware.

=== Changes from v1 ===
Remove product names from commit message

Cc: khaled.almahallawy@intel.com
Change-Id: Ice483e988b1ad8837e8a1efe824078f406edec80
---
 tests/kms_atomic_transition.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index be60940d..172e6cec 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -173,7 +173,7 @@ wm_setup_plane(data_t *data, enum pipe pipe,
 			continue;
 
 		if (!mask || !(parms[i].mask & mask)) {
-			if (plane->values[IGT_PLANE_FB_ID]) {
+			if (plane->values[IGT_PLANE_FB_ID] && plane->type != DRM_PLANE_TYPE_PRIMARY) {
 				igt_plane_set_fb(plane, NULL);
 				planes_set_up++;
 			}
@@ -520,10 +520,9 @@ run_transition_test(data_t *data, enum pipe pipe, igt_output_t *output,
 		igt_output_set_pipe(output, pipe);
 	}
 
-	igt_display_commit2(&data->display, COMMIT_ATOMIC);
-
 	setup_parms(data, pipe, mode, &data->fb, &data->argb_fb, &data->sprite_fb, parms, &iter_max);
-
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+	
 	/*
 	 * In some configurations the tests may not run to completion with all
 	 * sprite planes lit up at 4k resolution, try decreasing width/size of secondary
-- 
2.31.1.295.g9ea45b61b8-goog

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
