Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B3266E135
 for <igt-dev@lists.freedesktop.org>; Sat,  4 Dec 2021 09:56:23 +0000 (UTC)
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Fri, 3 Dec 2021 19:49:19 -0800
Message-ID: <20211204034919.14779-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane_scaling: Increase buffer
 size if driver doesn't support larger scale factors
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: petri.latvala@intel.com, quic_khsieh@quicinc.com, swboyd@chromium.org, nganji@codeaurora.org, seanpaul@chromium.org, aravindh@codeaurora.org
List-ID: <igt-dev@lists.freedesktop.org>

Catch edge cases where driver doesn't support larger scale factors or
pipe doesn't support scaling.

Currently, a 20x20 framebuffer is passed in to be upscaled. However,
this will cause issues with other drivers as they may not support larger
scale factors or may not support scaling at all for certain planes.

This avoids failures due to invalid scale factor by trying
the original 20x20 framebuffer commit, then trying to commit larger
framebuffers up to and including unity scale.

Tested-on: Qualcomm RB5 (sdm845)

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 tests/kms_plane_scaling.c | 52 ++++++++++++++++++++++++++++++---------
 1 file changed, 41 insertions(+), 11 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 85db11ee..1f0143fc 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -1,5 +1,6 @@
 /*
  * Copyright © 2013,2014 Intel Corporation
+ * Copyright (c) 2021 Qualcomm Innovation Center, Inc. All rights reserved.
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
  * copy of this software and associated documentation files (the "Software"),
@@ -118,6 +119,30 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe,
 	igt_display_commit2(display, COMMIT_ATOMIC);
 }
 
+static int try_commit_with_fb_size(int width, int height, igt_rotation_t rot, igt_display_t *display, data_t *d, igt_plane_t *plane, drmModeModeInfo *mode)
+{
+	int ret;
+
+	cleanup_crtc(d);
+
+	/* Check min to full resolution upscaling */
+	igt_fb_set_position(&d->fb[0], plane, 0, 0);
+	igt_fb_set_size(&d->fb[0], plane, width, height);
+	igt_plane_set_position(plane, 0, 0);
+	igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
+	igt_plane_set_rotation(plane, rot);
+
+	ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
+
+	if (!ret) {
+		igt_display_commit2(display, COMMIT_ATOMIC);
+		igt_plane_set_fb(plane, NULL);
+		igt_plane_set_position(plane, 0, 0);
+	}
+
+	return ret;
+}
+
 static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
 					 uint32_t pixel_format,
 					 uint64_t modifier, enum pipe pipe,
@@ -126,10 +151,9 @@ static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
 {
 	igt_display_t *display = &d->display;
 	int width, height;
+	int commit_ret;
 	drmModeModeInfo *mode;
 
-	cleanup_crtc(d);
-
 	igt_output_set_pipe(output, pipe);
 	mode = igt_output_get_mode(output);
 
@@ -139,16 +163,22 @@ static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
 		       pixel_format, modifier, 0.0, 1.0, 0.0, &d->fb[0]);
 	igt_plane_set_fb(plane, &d->fb[0]);
 
-	/* Check min to full resolution upscaling */
-	igt_fb_set_position(&d->fb[0], plane, 0, 0);
-	igt_fb_set_size(&d->fb[0], plane, width, height);
-	igt_plane_set_position(plane, 0, 0);
-	igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
-	igt_plane_set_rotation(plane, rot);
-	igt_display_commit2(display, COMMIT_ATOMIC);
+	commit_ret = try_commit_with_fb_size(width, height, rot, display, d, plane, mode);
 
-	igt_plane_set_fb(plane, NULL);
-	igt_plane_set_position(plane, 0, 0);
+	if(commit_ret == -ERANGE) {
+		igt_debug("Scaling for %dx%d plane not supported, trying scale factor of 4x\n", width, height);
+		width = height = mode->vdisplay / 4;
+		commit_ret = try_commit_with_fb_size(width, height, rot, display, d, plane, mode);
+	}
+
+	if (commit_ret == -ERANGE) {
+		igt_debug("Scale factor of 4x (or scaling in general) not supported, trying unity scale\n");
+		width = mode->hdisplay;
+		height = mode->vdisplay;
+		commit_ret = try_commit_with_fb_size(width, height, rot, display, d, plane, mode);
+	}
+
+	igt_assert_eq(commit_ret, 0);
 }
 
 static const igt_rotation_t rotations[] = {
-- 
2.34.1
