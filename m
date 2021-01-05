Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32BD16E0D8
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Jan 2021 11:13:53 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id lj6so1484472pjb.0
 for <igt-dev@lists.freedesktop.org>; Tue, 05 Jan 2021 03:13:53 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Tue,  5 Jan 2021 13:13:43 +0200
Message-Id: <20210105111343.14332-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane_scaling: reduce repetitive
 work per round
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

create needed planes only when needed and not destroying them in between.

This reduces execution time for clipping clamping dynamic tests on my ICL
from 75s to 29s

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_plane_scaling.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 89b82416d..c63eb428f 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -483,19 +483,8 @@ test_plane_scaling_on_pipe(data_t *d, enum pipe pipe, igt_output_t *output)
 }
 
 static void
-__test_scaler_with_clipping_clamping_scenario(data_t *d, drmModeModeInfo *mode,
-					      uint32_t f1, uint32_t f2)
+__test_scaler_with_clipping_clamping_scenario(data_t *d, drmModeModeInfo *mode)
 {
-	cleanup_fbs(d);
-
-	igt_create_pattern_fb(d->drm_fd,
-			      mode->hdisplay, mode->vdisplay, f1,
-			      LOCAL_I915_FORMAT_MOD_X_TILED, &d->fb[1]);
-
-	igt_create_pattern_fb(d->drm_fd,
-			      mode->hdisplay, mode->vdisplay, f2,
-			      LOCAL_I915_FORMAT_MOD_Y_TILED, &d->fb[2]);
-
 	igt_plane_set_fb(d->plane1, &d->fb[1]);
 	igt_plane_set_fb(d->plane2, &d->fb[2]);
 
@@ -549,6 +538,10 @@ test_scaler_with_clipping_clamping_scenario(data_t *d, enum pipe pipe, igt_outpu
 
 		igt_vec_init(&tested_formats2, sizeof(uint32_t));
 
+		igt_create_pattern_fb(d->drm_fd,
+				      mode->hdisplay, mode->vdisplay, f1,
+				      LOCAL_I915_FORMAT_MOD_X_TILED, &d->fb[1]);
+
 		for (int j = 0; j < d->plane2->drm_plane->count_formats; j++) {
 			unsigned f2 = d->plane2->drm_plane->formats[j];
 
@@ -556,8 +549,15 @@ test_scaler_with_clipping_clamping_scenario(data_t *d, enum pipe pipe, igt_outpu
 			    !can_scale(d, f2))
 				continue;
 
-			__test_scaler_with_clipping_clamping_scenario(d, mode, f1, f2);
+			igt_create_pattern_fb(d->drm_fd,
+					      mode->hdisplay, mode->vdisplay, f2,
+					      LOCAL_I915_FORMAT_MOD_Y_TILED,
+					      &d->fb[2]);
+
+			__test_scaler_with_clipping_clamping_scenario(d, mode);
+			igt_remove_fb(d->drm_fd, &d->fb[2]);
 		}
+		igt_remove_fb(d->drm_fd, &d->fb[1]);
 
 		igt_vec_fini(&tested_formats2);
 	}
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
