Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2271210E65B
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jan 2024 20:04:39 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-5cedfc32250so2178435a12.0
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jan 2024 12:04:39 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH] tests/kms_universal_plane: Re-work expectations for non-intel
 hw
Date: Wed, 10 Jan 2024 12:04:34 -0800
Message-ID: <20240110200434.218120-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The expectation assumptions do not fit for non-intel hw.  So re-work the
expectations and add msm support.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 tests/kms_universal_plane.c | 102 +++++++++++++++++++++++++-----------
 1 file changed, 72 insertions(+), 30 deletions(-)

diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 6a39f93cc5aa..3158ff816046 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -402,8 +402,7 @@ sanity_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	sanity_test_t test = { .data = data };
 	igt_plane_t *primary;
 	drmModeModeInfo *mode;
-	int i;
-	int expect = 0;
+	int i, ret;
 
 	igt_output_set_pipe(output, pipe);
 	mode = igt_output_get_mode(output);
@@ -418,43 +417,86 @@ sanity_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 
 	/*
 	 * Try to use universal plane API to set primary plane that
-	 * doesn't cover CRTC (should fail on pre-gen9 and succeed on
-	 * gen9+).
+	 * doesn't cover CRTC.
 	 */
 	igt_plane_set_fb(primary, &test.undersized_fb);
-	if (is_intel_device(data->drm_fd))
-		expect = (data->display_ver < 9) ? -EINVAL : 0;
-	igt_assert(igt_display_try_commit2(&data->display, COMMIT_UNIVERSAL) == expect);
+	ret = igt_display_try_commit2(&data->display, COMMIT_UNIVERSAL);
+
+	if (is_intel_device(data->drm_fd)) {
+		/* should fail on pre-gen9 and succeed on gen9+: */
+		if (data->display_ver < 9)
+			igt_assert_eq(ret, -EINVAL);
+		else
+			igt_assert_eq(ret, 0);
+	} else if (is_msm_device(data->drm_fd)) {
+		/* Should be supported on all gens: */
+		igt_assert_eq(ret, 0);
+	} else {
+		igt_assert_eq(ret, 0);
+	}
 
-	/* Same as above, but different plane positioning. */
+	/* Same as above, but different plane positioning: */
 	igt_plane_set_position(primary, 100, 100);
-	igt_assert(igt_display_try_commit2(&data->display, COMMIT_UNIVERSAL) == expect);
+	ret = igt_display_try_commit2(&data->display, COMMIT_UNIVERSAL);
+
+	if (is_intel_device(data->drm_fd)) {
+		/* should fail on pre-gen9 and succeed on gen9+: */
+		if (data->display_ver < 9)
+			igt_assert_eq(ret, -EINVAL);
+		else
+			igt_assert_eq(ret, 0);
+	} else if (is_msm_device(data->drm_fd)) {
+		/* Should be supported on all gens: */
+		igt_assert_eq(ret, 0);
+	} else {
+		igt_assert_eq(ret, 0);
+	}
 
 	igt_plane_set_position(primary, 0, 0);
 
-	/* Try to use universal plane API to scale down (should fail on pre-gen9) */
-	if (is_intel_device(data->drm_fd))
-		expect = (data->display_ver < 9) ? -ERANGE : 0;
-	igt_assert(drmModeSetPlane(data->drm_fd, primary->drm_plane->plane_id,
-				   output->config.crtc->crtc_id,
-				   test.oversized_fb.fb_id, 0,
-				   0, 0,
-				   mode->hdisplay + 100,
-				   mode->vdisplay + 100,
-				   IGT_FIXED(0,0), IGT_FIXED(0,0),
-				   IGT_FIXED(mode->hdisplay,0),
-				   IGT_FIXED(mode->vdisplay,0)) == expect);
+	/* Try to use universal plane API to scale down */
+	ret = drmModeSetPlane(data->drm_fd, primary->drm_plane->plane_id,
+			      output->config.crtc->crtc_id,
+			      test.oversized_fb.fb_id, 0,
+			      0, 0,
+			      mode->hdisplay + 100,
+			      mode->vdisplay + 100,
+			      IGT_FIXED(0,0), IGT_FIXED(0,0),
+			      IGT_FIXED(mode->hdisplay,0),
+			      IGT_FIXED(mode->vdisplay,0));
+
+	if (is_intel_device(data->drm_fd)) {
+		/* should fail on pre-gen9 and succeed on gen9+: */
+		if (data->display_ver < 9)
+			igt_assert_eq(ret, -ERANGE);
+		else
+			igt_assert_eq(ret, 0);
+	} else {
+		/* Could succeed or fail with -ERANGE depending on hw limits: */
+		igt_assert((ret == 0) || (ret == -ERANGE));
+	}
 
 	/* Try to use universal plane API to scale up (should fail on pre-gen9) */
-	igt_assert(drmModeSetPlane(data->drm_fd, primary->drm_plane->plane_id,
-				   output->config.crtc->crtc_id,
-				   test.oversized_fb.fb_id, 0,
-				   0, 0,
-				   mode->hdisplay,
-				   mode->vdisplay,
-				   IGT_FIXED(0,0), IGT_FIXED(0,0),
-				   IGT_FIXED(mode->hdisplay - 100,0),
-				   IGT_FIXED(mode->vdisplay - 100,0)) == expect);
+	ret = drmModeSetPlane(data->drm_fd, primary->drm_plane->plane_id,
+			      output->config.crtc->crtc_id,
+			      test.oversized_fb.fb_id, 0,
+			      0, 0,
+			      mode->hdisplay,
+			      mode->vdisplay,
+			      IGT_FIXED(0,0), IGT_FIXED(0,0),
+			      IGT_FIXED(mode->hdisplay - 100,0),
+			      IGT_FIXED(mode->vdisplay - 100,0));
+
+	if (is_intel_device(data->drm_fd)) {
+		/* should fail on pre-gen9 and succeed on gen9+: */
+		if (data->display_ver < 9)
+			igt_assert_eq(ret, -ERANGE);
+		else
+			igt_assert_eq(ret, 0);
+	} else {
+		/* Could succeed or fail with -ERANGE depending on hw limits: */
+		igt_assert((ret == 0) || (ret == -ERANGE));
+	}
 
 	/* Find other crtcs and try to program our primary plane on them */
 	for (i = 0; i < test.moderes->count_crtcs; i++)
-- 
2.43.0
