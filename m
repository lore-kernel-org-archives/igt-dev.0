Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CBE06E938
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Mar 2021 15:08:57 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id q26so9388737qkm.6
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Mar 2021 08:08:57 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
Date: Tue, 23 Mar 2021 11:08:51 -0400
Message-Id: <20210323150851.209365-1-markyacoub@chromium.org>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] tests/kms_atomic_transition: Enable Primary Plane
 on Enabling CRTC.
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

Tested on Delbin and Volteer with no regression or added latency.

---
 tests/kms_atomic_transition.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 9689bf4d..cfa04dcd 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -172,7 +172,7 @@ wm_setup_plane(data_t *data, enum pipe pipe,
 			continue;
 
 		if (!mask || !(parms[i].mask & mask)) {
-			if (plane->values[IGT_PLANE_FB_ID]) {
+			if (plane->values[IGT_PLANE_FB_ID] && plane->type != DRM_PLANE_TYPE_PRIMARY) {
 				igt_plane_set_fb(plane, NULL);
 				planes_set_up++;
 			}
@@ -516,10 +516,9 @@ run_transition_test(data_t *data, enum pipe pipe, igt_output_t *output,
 		igt_output_set_pipe(output, pipe);
 	}
 
-	igt_display_commit2(&data->display, COMMIT_ATOMIC);
-
 	setup_parms(data, pipe, mode, &fb, &argb_fb, &sprite_fb, parms, &iter_max);
-
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+	
 	/*
 	 * In some configurations the tests may not run to completion with all
 	 * sprite planes lit up at 4k resolution, try decreasing width/size of secondary
-- 
2.31.0.rc2.261.g7f71774620-goog

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
