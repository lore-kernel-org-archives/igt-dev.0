Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DCE7ECD6C1
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 16:34:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C09110E62C;
	Wed, 11 Feb 2026 16:34:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hvr+vUDX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FBAA10E628
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Feb 2026 16:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770827686; x=1802363686;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=YCXss2LGfPJ7avBCPWX0gPcoqKz7vG1mYCmQCKd7qC0=;
 b=hvr+vUDX1OKTSC5rzsrdqYPbNyft9DfszolvokgHqU1y4QrX9JPNaxLG
 vdTCW21MaxxO8zvo6+NgwTGPAdYEnfUSIIi1D7aO2PeAAVHjEXPZg7pMg
 5RdgXQdCZN8I5tAU/GT9Lh4PFqDSa5+YaFF/n7BRZ+p4G9aLbz24H4vvN
 amSt3AzZa6vlfHUTQdNiwymsHzC8Gah4ax1kckWihv3hAA5CdmoMB2WCY
 wK8fzY+SO5kVTvOUzqzw3fllPMsz8SKeSf2uP24V9OIcnudcBUj3onVTX
 oXaJiH410BwSX3bV9eqNU6t/pZkMnC4jyBrNmmjxvEBHtm7EjFzjH0Qry w==;
X-CSE-ConnectionGUID: PbEQcA1eSmS+rXgBC/rjHQ==
X-CSE-MsgGUID: XsB9d6qYTZG4DEEmfqjAqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="71879740"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="71879740"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 08:34:43 -0800
X-CSE-ConnectionGUID: FzAS1D7lTTGUnOxmuPj2ag==
X-CSE-MsgGUID: iRSt3u95THWZjQ94y5KpoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="212394058"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.23])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 08:34:40 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 08/17] tests/kms_cursor_legacy: Use igt_crtc_t instead
 of enum pipe
Date: Wed, 11 Feb 2026 18:33:55 +0200
Message-ID: <20260211163404.2018-9-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260211163404.2018-1-ville.syrjala@linux.intel.com>
References: <20260211163404.2018-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Convert the use of enum pipe to igt_crtc_t in
tests/kms_cursor_legacy.

This one was messy enough that I ended up doing
most of it by hand. 'git show --word-diff' might
be the best way to double check the result.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_cursor_legacy.c | 343 +++++++++++++++++++-------------------
 1 file changed, 170 insertions(+), 173 deletions(-)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 459f3c696ac8..248fc3b06cae 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -261,13 +261,12 @@ static void override_output_modes(igt_display_t *display,
 }
 
 static void stress(igt_display_t *display,
-		   enum pipe pipe, int num_children, unsigned mode,
+		   igt_crtc_t *crtc, int num_children, unsigned mode,
 		   int timeout)
 {
 	struct drm_mode_cursor arg;
 	uint64_t *results;
 	bool torture;
-	igt_crtc_t *crtc;
 	unsigned crtc_id[IGT_MAX_PIPES] = {0}, num_crtcs;
 
 	torture = false;
@@ -286,7 +285,7 @@ static void stress(igt_display_t *display,
 	arg.height = 64;
 	arg.handle = kmstest_dumb_create(display->drm_fd, 64, 64, 32, NULL, NULL);
 
-	if (pipe < 0) {
+	if (!crtc) {
 		num_crtcs = igt_display_n_crtcs(display);
 		for_each_crtc(display, crtc) {
 			arg.crtc_id = crtc_id[crtc->pipe] = crtc->crtc_id;
@@ -294,11 +293,8 @@ static void stress(igt_display_t *display,
 		}
 	} else {
 		num_crtcs = 1;
-		if(igt_crtc_for_pipe(display, pipe)->valid) {
-			arg.crtc_id = crtc_id[0] = igt_crtc_for_pipe(display,
-								     pipe)->crtc_id;
-			do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg);
-		}
+		arg.crtc_id = crtc_id[0] = crtc->crtc_id;
+		do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg);
 	}
 
 	arg.flags = mode;
@@ -366,13 +362,13 @@ static void stress(igt_display_t *display,
 	munmap(results, PAGE_SIZE);
 }
 
-static void set_fb_on_crtc(igt_display_t *display, enum pipe pipe,
+static void set_fb_on_crtc(igt_display_t *display, igt_crtc_t *crtc,
 			   igt_output_t *output, struct igt_fb *fb_info)
 {
 	drmModeModeInfoPtr mode;
 	igt_plane_t *primary;
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 	mode = igt_output_get_mode(output);
 
 	igt_create_pattern_fb(display->drm_fd,
@@ -384,11 +380,11 @@ static void set_fb_on_crtc(igt_display_t *display, enum pipe pipe,
 }
 
 static	igt_plane_t
-*set_cursor_on_pipe(igt_display_t *display, enum pipe pipe, struct igt_fb *fb)
+*set_cursor_on_pipe(igt_display_t *display, igt_crtc_t *crtc, struct igt_fb *fb)
 {
 	igt_plane_t *plane, *cursor = NULL;
 
-	for_each_plane_on_pipe(display, pipe, plane) {
+	for_each_plane_on_pipe(display, crtc->pipe, plane) {
 		if (plane->type != DRM_PLANE_TYPE_CURSOR)
 			continue;
 
@@ -408,10 +404,10 @@ static void set_cursor_hotspot(igt_plane_t *cursor, int  hot_x, int hot_y)
 	igt_plane_set_prop_value(cursor, IGT_PLANE_HOTSPOT_Y, hot_y);
 }
 
-static void populate_cursor_args(igt_display_t *display, enum pipe pipe,
+static void populate_cursor_args(igt_display_t *display, igt_crtc_t *crtc,
 				 struct drm_mode_cursor *arg, struct igt_fb *fb)
 {
-	arg->crtc_id = igt_crtc_for_pipe(display, pipe)->crtc_id;
+	arg->crtc_id = crtc->crtc_id;
 	arg->flags = DRM_MODE_CURSOR_MOVE;
 	arg->x = 128;
 	arg->y = 128;
@@ -421,7 +417,7 @@ static void populate_cursor_args(igt_display_t *display, enum pipe pipe,
 	arg[1] = *arg;
 }
 
-static enum pipe
+static igt_crtc_t *
 find_connected_pipe(igt_display_t *display, bool second, igt_output_t **output)
 {
 	igt_crtc_t *crtc;
@@ -465,12 +461,11 @@ find_connected_pipe(igt_display_t *display, bool second, igt_output_t **output)
 	else
 		igt_require_f(found, "No valid outputs found\n");
 
-	return crtc->pipe;
+	return crtc;
 }
 
-static void flip_nonblocking(igt_display_t *display, enum pipe pipe_id, bool atomic, struct igt_fb *fb, void *data)
+static void flip_nonblocking(igt_display_t *display, igt_crtc_t *crtc, bool atomic, struct igt_fb *fb, void *data)
 {
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe_id);
 	igt_plane_t *primary = igt_crtc_get_plane_type(crtc,
 						       DRM_PLANE_TYPE_PRIMARY);
 	int ret;
@@ -532,11 +527,10 @@ static bool mode_requires_extra_vblank(enum flip_test mode)
 	return false;
 }
 
-static void transition_nonblocking(igt_display_t *display, enum pipe pipe_id,
+static void transition_nonblocking(igt_display_t *display, igt_crtc_t *crtc,
 				   struct igt_fb *prim_fb, struct igt_fb *argb_fb,
 				   bool hide_sprite)
 {
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe_id);
 	igt_plane_t *primary = igt_crtc_get_plane_type(crtc,
 						       DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_t *sprite = igt_crtc_get_plane_type(crtc,
@@ -565,7 +559,7 @@ static void transition_nonblocking(igt_display_t *display, enum pipe pipe_id,
 
 static void prepare_flip_test(igt_display_t *display,
 			      enum flip_test mode,
-			      enum pipe flip_pipe,
+			      igt_crtc_t *crtc,
 			      struct drm_mode_cursor *arg,
 			      const struct igt_fb *prim_fb,
 			      struct igt_fb *argb_fb,
@@ -605,8 +599,8 @@ static void prepare_flip_test(igt_display_t *display,
 
 	if (mode == flip_test_atomic_transitions ||
 	    mode == flip_test_atomic_transitions_varying_size) {
-		igt_require(igt_crtc_for_pipe(display, flip_pipe)->n_planes > 1 &&
-		            igt_crtc_for_pipe(display, flip_pipe)->planes[1].type != DRM_PLANE_TYPE_CURSOR);
+		igt_require(crtc->n_planes > 1 &&
+		            crtc->planes[1].type != DRM_PLANE_TYPE_CURSOR);
 
 		igt_create_color_pattern_fb(display->drm_fd, prim_fb->width, prim_fb->height,
 					    DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR, .1, .1, .1, argb_fb);
@@ -620,37 +614,38 @@ static void flip(igt_display_t *display,
 	struct drm_mode_cursor arg[2];
 	uint64_t *results;
 	struct igt_fb fb_info, fb_info2, argb_fb, cursor_fb, cursor_fb2;
+	igt_crtc_t *cursor_crtc, *flip_crtc;
 	igt_output_t *output, *output2;
 	igt_plane_t *cursor;
 
 	results = mmap(NULL, PAGE_SIZE, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
 	igt_assert(results != MAP_FAILED);
 
-	flip_pipe = find_connected_pipe(display, !!flip_pipe, &output);
-	cursor_pipe = find_connected_pipe(display, !!cursor_pipe, &output2);
+	flip_crtc = find_connected_pipe(display, !!flip_pipe, &output);
+	cursor_crtc = find_connected_pipe(display, !!cursor_pipe, &output2);
 	igt_skip_on(!output || !output2);
 
 	igt_info("Using pipe %s for page flip, pipe %s for cursor\n",
-		  kmstest_pipe_name(flip_pipe), kmstest_pipe_name(cursor_pipe));
+		 igt_crtc_name(flip_crtc), igt_crtc_name(cursor_crtc));
 
 	if (mode >= flip_test_atomic)
 		igt_require(display->is_atomic);
 
 	if (mode == flip_test_atomic_transitions ||
 		mode == flip_test_atomic_transitions_varying_size) {
-		igt_require(igt_crtc_get_plane_type(igt_crtc_for_pipe(display, flip_pipe),
+		igt_require(igt_crtc_get_plane_type(flip_crtc,
 						    DRM_PLANE_TYPE_OVERLAY));
 	}
 
-	set_fb_on_crtc(display, flip_pipe, output, &fb_info);
-	if (flip_pipe != cursor_pipe) {
-		set_fb_on_crtc(display, cursor_pipe, output2, &fb_info2);
+	set_fb_on_crtc(display, flip_crtc, output, &fb_info);
+	if (flip_crtc != cursor_crtc) {
+		set_fb_on_crtc(display, cursor_crtc, output2, &fb_info2);
 
 		if (try_commit(display)) {
 			override_output_modes(display, output, output2);
 
-			set_fb_on_crtc(display, flip_pipe, output, &fb_info);
-			set_fb_on_crtc(display, cursor_pipe, output2, &fb_info2);
+			set_fb_on_crtc(display, flip_crtc, output, &fb_info);
+			set_fb_on_crtc(display, cursor_crtc, output2, &fb_info2);
 		}
 	}
 
@@ -659,10 +654,10 @@ static void flip(igt_display_t *display,
 
 	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
 			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
-	cursor = set_cursor_on_pipe(display, cursor_pipe, &cursor_fb);
-	populate_cursor_args(display, cursor_pipe, arg, &cursor_fb);
+	cursor = set_cursor_on_pipe(display, cursor_crtc, &cursor_fb);
+	populate_cursor_args(display, cursor_crtc, arg, &cursor_fb);
 
-	prepare_flip_test(display, mode, flip_pipe, arg, &fb_info, &argb_fb, &cursor_fb2);
+	prepare_flip_test(display, mode, flip_crtc, arg, &fb_info, &argb_fb, &cursor_fb2);
 
 	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
@@ -685,11 +680,11 @@ static void flip(igt_display_t *display,
 
 			switch (mode) {
 			default:
-				flip_nonblocking(display, flip_pipe, mode >= flip_test_atomic, &fb_info, NULL);
+				flip_nonblocking(display, flip_crtc, mode >= flip_test_atomic, &fb_info, NULL);
 				break;
 			case flip_test_atomic_transitions:
 			case flip_test_atomic_transitions_varying_size:
-				transition_nonblocking(display, flip_pipe, &fb_info, &argb_fb, count & 1);
+				transition_nonblocking(display, flip_crtc, &fb_info, &argb_fb, count & 1);
 				break;
 			}
 
@@ -711,7 +706,7 @@ static void flip(igt_display_t *display,
 	igt_plane_set_fb(igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY),
 			 NULL);
 	igt_output_set_crtc(output, NULL);
-	if (flip_pipe != cursor_pipe) {
+	if (flip_crtc != cursor_crtc) {
 		igt_plane_set_fb(igt_output_get_plane_type(output2, DRM_PLANE_TYPE_PRIMARY),
 			 NULL);
 		igt_output_set_crtc(output2, NULL);
@@ -719,7 +714,7 @@ static void flip(igt_display_t *display,
 	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
 	igt_remove_fb(display->drm_fd, &fb_info);
-	if (flip_pipe != cursor_pipe)
+	if (flip_crtc != cursor_crtc)
 		igt_remove_fb(display->drm_fd, &fb_info2);
 	igt_remove_fb(display->drm_fd, &cursor_fb);
 	if (argb_fb.gem_handle)
@@ -744,7 +739,7 @@ static void basic_flip_cursor(igt_display_t *display,
 	struct drm_event_vblank vbl;
 	struct igt_fb fb_info, cursor_fb, cursor_fb2, argb_fb;
 	unsigned vblank_start;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	uint64_t ahnd = 0;
 	igt_spin_t *spin;
 	int i, miss1 = 0, miss2 = 0, delta;
@@ -763,28 +758,28 @@ static void basic_flip_cursor(igt_display_t *display,
 	if (mode >= flip_test_atomic)
 		igt_require(display->is_atomic);
 
-	pipe = find_connected_pipe(display, false, &output);
+	crtc = find_connected_pipe(display, false, &output);
 	igt_require(output);
 
 	igt_info("Using pipe %s & %s\n",
-		 kmstest_pipe_name(pipe), igt_output_name(output));
+		 igt_crtc_name(crtc), igt_output_name(output));
 
-	set_fb_on_crtc(display, pipe, output, &fb_info);
+	set_fb_on_crtc(display, crtc, output, &fb_info);
 
 	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
 			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
-	cursor = set_cursor_on_pipe(display, pipe, &cursor_fb);
-	populate_cursor_args(display, pipe, arg, &cursor_fb);
+	cursor = set_cursor_on_pipe(display, crtc, &cursor_fb);
+	populate_cursor_args(display, crtc, arg, &cursor_fb);
 
-	prepare_flip_test(display, mode, pipe, arg, &fb_info, &argb_fb, &cursor_fb2);
+	prepare_flip_test(display, mode, crtc, arg, &fb_info, &argb_fb, &cursor_fb2);
 
 	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
 	/* Quick sanity check that we can update a cursor in a single vblank */
-	vblank_start = kmstest_get_vblank(display->drm_fd, pipe, DRM_VBLANK_NEXTONMISS);
-	igt_assert_eq(kmstest_get_vblank(display->drm_fd, pipe, 0), vblank_start);
+	vblank_start = kmstest_get_vblank(display->drm_fd, crtc->pipe, DRM_VBLANK_NEXTONMISS);
+	igt_assert_eq(kmstest_get_vblank(display->drm_fd, crtc->pipe, 0), vblank_start);
 	do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg[0]);
-	igt_assert_eq(kmstest_get_vblank(display->drm_fd, pipe, 0), vblank_start);
+	igt_assert_eq(kmstest_get_vblank(display->drm_fd, crtc->pipe, 0), vblank_start);
 
 	for (i = 0; i < 25; i++) {
 		bool miss;
@@ -799,21 +794,21 @@ static void basic_flip_cursor(igt_display_t *display,
 					    .dependency = fb_info.gem_handle);
 
 		/* Start with a synchronous query to align with the vblank */
-		vblank_start = kmstest_get_vblank(display->drm_fd, pipe, DRM_VBLANK_NEXTONMISS);
+		vblank_start = kmstest_get_vblank(display->drm_fd, crtc->pipe, DRM_VBLANK_NEXTONMISS);
 
 		switch (order) {
 		case FLIP_BEFORE_CURSOR:
 			switch (mode) {
 			default:
-				flip_nonblocking(display, pipe, mode >= flip_test_atomic, &fb_info, NULL);
+				flip_nonblocking(display, crtc, mode >= flip_test_atomic, &fb_info, NULL);
 				break;
 			case flip_test_atomic_transitions:
 			case flip_test_atomic_transitions_varying_size:
-				transition_nonblocking(display, pipe, &fb_info, &argb_fb, 0);
+				transition_nonblocking(display, crtc, &fb_info, &argb_fb, 0);
 				break;
 			}
 
-			delta = kmstest_get_vblank(display->drm_fd, pipe, 0) - vblank_start;
+			delta = kmstest_get_vblank(display->drm_fd, crtc->pipe, 0) - vblank_start;
 			miss = delta != 0;
 
 			do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg[0]);
@@ -822,21 +817,21 @@ static void basic_flip_cursor(igt_display_t *display,
 		case FLIP_AFTER_CURSOR:
 			do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg[0]);
 
-			delta = kmstest_get_vblank(display->drm_fd, pipe, 0) - vblank_start;
+			delta = kmstest_get_vblank(display->drm_fd, crtc->pipe, 0) - vblank_start;
 			miss = delta != 0;
 
 			switch (mode) {
 			default:
-				flip_nonblocking(display, pipe, mode >= flip_test_atomic, &fb_info, NULL);
+				flip_nonblocking(display, crtc, mode >= flip_test_atomic, &fb_info, NULL);
 				break;
 			case flip_test_atomic_transitions:
 			case flip_test_atomic_transitions_varying_size:
-				transition_nonblocking(display, pipe, &fb_info, &argb_fb, 0);
+				transition_nonblocking(display, crtc, &fb_info, &argb_fb, 0);
 				break;
 			}
 		}
 
-		delta = kmstest_get_vblank(display->drm_fd, pipe, 0) - vblank_start;
+		delta = kmstest_get_vblank(display->drm_fd, crtc->pipe, 0) - vblank_start;
 
 		if (spin) {
 			struct pollfd pfd = { display->drm_fd, POLLIN };
@@ -860,7 +855,7 @@ static void basic_flip_cursor(igt_display_t *display,
 		if (miss1)
 			continue;
 
-		delta = kmstest_get_vblank(display->drm_fd, pipe, 0) - vblank_start;
+		delta = kmstest_get_vblank(display->drm_fd, crtc->pipe, 0) - vblank_start;
 
 		if (!mode_requires_extra_vblank(mode))
 			miss2 += delta != 1;
@@ -890,19 +885,19 @@ static void basic_flip_cursor(igt_display_t *display,
 }
 
 static int
-get_cursor_updates_per_vblank(igt_display_t *display, enum pipe pipe,
+get_cursor_updates_per_vblank(igt_display_t *display, igt_crtc_t *crtc,
 			      struct drm_mode_cursor *arg)
 {
 	int target;
 
 	for (target = 65536; target; target /= 2) {
-		unsigned vblank_start = kmstest_get_vblank(display->drm_fd, pipe, DRM_VBLANK_NEXTONMISS);
+		unsigned vblank_start = kmstest_get_vblank(display->drm_fd, crtc->pipe, DRM_VBLANK_NEXTONMISS);
 
-		igt_assert_eq(kmstest_get_vblank(display->drm_fd, pipe, 0), vblank_start);
+		igt_assert_eq(kmstest_get_vblank(display->drm_fd, crtc->pipe, 0), vblank_start);
 
 		for (int n = 0; n < target; n++)
 			do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, arg);
-		if (kmstest_get_vblank(display->drm_fd, pipe, 0) == vblank_start)
+		if (kmstest_get_vblank(display->drm_fd, crtc->pipe, 0) == vblank_start)
 			break;
 	}
 
@@ -925,7 +920,7 @@ static void flip_vs_cursor(igt_display_t *display, enum flip_test mode, int nloo
 	struct igt_fb fb_info, cursor_fb, cursor_fb2, argb_fb;
 	unsigned vblank_start;
 	int target, cpu;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	volatile unsigned long *shared;
 	cpu_set_t mask, oldmask;
 	igt_output_t *output;
@@ -934,33 +929,33 @@ static void flip_vs_cursor(igt_display_t *display, enum flip_test mode, int nloo
 	if (mode >= flip_test_atomic)
 		igt_require(display->is_atomic);
 
-	pipe = find_connected_pipe(display, false, &output);
+	crtc = find_connected_pipe(display, false, &output);
 	igt_require(output);
 
 	igt_info("Using pipe %s & %s\n",
-		 kmstest_pipe_name(pipe), igt_output_name(output));
+		 igt_crtc_name(crtc), igt_output_name(output));
 
-	set_fb_on_crtc(display, pipe, output, &fb_info);
+	set_fb_on_crtc(display, crtc, output, &fb_info);
 
 	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
 			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
-	cursor = set_cursor_on_pipe(display, pipe, &cursor_fb);
-	populate_cursor_args(display, pipe, arg, &cursor_fb);
+	cursor = set_cursor_on_pipe(display, crtc, &cursor_fb);
+	populate_cursor_args(display, crtc, arg, &cursor_fb);
 
-	prepare_flip_test(display, mode, pipe, arg, &fb_info, &argb_fb, &cursor_fb2);
+	prepare_flip_test(display, mode, crtc, arg, &fb_info, &argb_fb, &cursor_fb2);
 
 	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
 	if (nloops)
-		target = get_cursor_updates_per_vblank(display, pipe, &arg[0]);
+		target = get_cursor_updates_per_vblank(display, crtc, &arg[0]);
 	else
 		target = 1;
 
-	vblank_start = kmstest_get_vblank(display->drm_fd, pipe, DRM_VBLANK_NEXTONMISS);
-	igt_assert_eq(kmstest_get_vblank(display->drm_fd, pipe, 0), vblank_start);
+	vblank_start = kmstest_get_vblank(display->drm_fd, crtc->pipe, DRM_VBLANK_NEXTONMISS);
+	igt_assert_eq(kmstest_get_vblank(display->drm_fd, crtc->pipe, 0), vblank_start);
 	for (int n = 0; n < target; n++)
 		do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg[0]);
-	igt_assert_eq(kmstest_get_vblank(display->drm_fd, pipe, 0), vblank_start);
+	igt_assert_eq(kmstest_get_vblank(display->drm_fd, crtc->pipe, 0), vblank_start);
 
 	/*
 	 * There are variations caused by using cpu frequency changing. To
@@ -998,37 +993,37 @@ static void flip_vs_cursor(igt_display_t *display, enum flip_test mode, int nloo
 		do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg[nloops & 1]);
 
 		/* Start with a synchronous query to align with the vblank */
-		vblank_start = kmstest_get_vblank(display->drm_fd, pipe, DRM_VBLANK_NEXTONMISS);
+		vblank_start = kmstest_get_vblank(display->drm_fd, crtc->pipe, DRM_VBLANK_NEXTONMISS);
 		switch (mode) {
 		default:
-			flip_nonblocking(display, pipe, mode >= flip_test_atomic, &fb_info, NULL);
+			flip_nonblocking(display, crtc, mode >= flip_test_atomic, &fb_info, NULL);
 			break;
 		case flip_test_atomic_transitions:
 		case flip_test_atomic_transitions_varying_size:
-			transition_nonblocking(display, pipe, &fb_info, &argb_fb, (nloops & 2) /2);
+			transition_nonblocking(display, crtc, &fb_info, &argb_fb, (nloops & 2) /2);
 			break;
 		}
 
 		/* The nonblocking flip should not have delayed us */
-		igt_assert_eq(kmstest_get_vblank(display->drm_fd, pipe, 0), vblank_start);
+		igt_assert_eq(kmstest_get_vblank(display->drm_fd, crtc->pipe, 0), vblank_start);
 		for (int n = 0; n < target; n++)
 			do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg[nloops & 1]);
 
 		/* Nor should it have delayed the following cursor update */
 		if (!cursor_slowpath(display, mode))
-			igt_assert_eq(kmstest_get_vblank(display->drm_fd, pipe, 0), vblank_start);
+			igt_assert_eq(kmstest_get_vblank(display->drm_fd, crtc->pipe, 0), vblank_start);
 		else if (mode_requires_extra_vblank(mode))
-			igt_assert_lte(kmstest_get_vblank(display->drm_fd, pipe, 0), vblank_start + 2);
+			igt_assert_lte(kmstest_get_vblank(display->drm_fd, crtc->pipe, 0), vblank_start + 2);
 		else
-			igt_assert_lte(kmstest_get_vblank(display->drm_fd, pipe, 0), vblank_start + 1);
+			igt_assert_lte(kmstest_get_vblank(display->drm_fd, crtc->pipe, 0), vblank_start + 1);
 
 		igt_set_timeout(1, "Stuck page flip");
 		igt_ignore_warn(read(display->drm_fd, &vbl, sizeof(vbl)));
 
 		if (!mode_requires_extra_vblank(mode))
-			igt_assert_eq(kmstest_get_vblank(display->drm_fd, pipe, 0), vblank_start + 1);
+			igt_assert_eq(kmstest_get_vblank(display->drm_fd, crtc->pipe, 0), vblank_start + 1);
 		else
-			igt_assert_lte(kmstest_get_vblank(display->drm_fd, pipe, 0), vblank_start + 2);
+			igt_assert_lte(kmstest_get_vblank(display->drm_fd, crtc->pipe, 0), vblank_start + 2);
 
 		igt_reset_timeout();
 	} while (nloops--);
@@ -1060,23 +1055,23 @@ static void nonblocking_modeset_vs_cursor(igt_display_t *display, int loops)
 {
 	struct igt_fb fb_info, cursor_fb;
 	igt_output_t *output;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	struct drm_mode_cursor arg[2];
 	igt_plane_t *primary, *cursor = NULL;
 
 	igt_require(display->is_atomic);
-	pipe = find_connected_pipe(display, false, &output);
+	crtc = find_connected_pipe(display, false, &output);
 	igt_require(output);
 
 	igt_info("Using pipe %s & %s\n",
-		 kmstest_pipe_name(pipe), igt_output_name(output));
+		 igt_crtc_name(crtc), igt_output_name(output));
 
-	set_fb_on_crtc(display, pipe, output, &fb_info);
+	set_fb_on_crtc(display, crtc, output, &fb_info);
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
 			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
-	cursor = set_cursor_on_pipe(display, pipe, &cursor_fb);
-	populate_cursor_args(display, pipe, arg, &cursor_fb);
+	cursor = set_cursor_on_pipe(display, crtc, &cursor_fb);
+	populate_cursor_args(display, crtc, arg, &cursor_fb);
 	arg[0].flags |= DRM_MODE_CURSOR_BO;
 
 	/*
@@ -1101,7 +1096,7 @@ static void nonblocking_modeset_vs_cursor(igt_display_t *display, int loops)
 		 */
 
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(display, pipe));
+				    crtc);
 		igt_plane_set_fb(cursor, NULL);
 		igt_display_commit_atomic(display, flags, NULL);
 
@@ -1160,7 +1155,7 @@ static void two_screens_flip_vs_cursor(igt_display_t *display, int nloops, bool
 {
 	struct drm_mode_cursor arg1[2], arg2[2];
 	struct igt_fb fb_info, fb2_info, cursor_fb;
-	enum pipe pipe, pipe2;
+	igt_crtc_t *crtc, *crtc2;
 	igt_output_t *output, *output2;
 	bool enabled = false;
 	volatile unsigned long *shared;
@@ -1182,33 +1177,33 @@ static void two_screens_flip_vs_cursor(igt_display_t *display, int nloops, bool
 	shared = mmap(NULL, PAGE_SIZE, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
 	igt_assert(shared != MAP_FAILED);
 
-	pipe = find_connected_pipe(display, false, &output);
-	pipe2 = find_connected_pipe(display, true, &output2);
+	crtc = find_connected_pipe(display, false, &output);
+	crtc2 = find_connected_pipe(display, true, &output2);
 	igt_skip_on(!output || !output2);
 
 	igt_info("Using pipe %s & %s and pipe %s & %s\n",
-		 kmstest_pipe_name(pipe), igt_output_name(output),
-		 kmstest_pipe_name(pipe2), igt_output_name(output2));
+		 igt_crtc_name(crtc), igt_output_name(output),
+		 igt_crtc_name(crtc2), igt_output_name(output2));
 
-	set_fb_on_crtc(display, pipe, output, &fb_info);
-	set_fb_on_crtc(display, pipe2, output2, &fb2_info);
+	set_fb_on_crtc(display, crtc, output, &fb_info);
+	set_fb_on_crtc(display, crtc2, output2, &fb2_info);
 
 	if (try_commit(display)) {
 		override_output_modes(display, output, output2);
 
-		set_fb_on_crtc(display, pipe, output, &fb_info);
-		set_fb_on_crtc(display, pipe2, output2, &fb2_info);
+		set_fb_on_crtc(display, crtc, output, &fb_info);
+		set_fb_on_crtc(display, crtc2, output2, &fb2_info);
 	}
 
 	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
 			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
-	cursor = set_cursor_on_pipe(display, pipe, &cursor_fb);
-	populate_cursor_args(display, pipe, arg1, &cursor_fb);
+	cursor = set_cursor_on_pipe(display, crtc, &cursor_fb);
+	populate_cursor_args(display, crtc, arg1, &cursor_fb);
 
 	arg1[1].x = arg1[1].y = 192;
 
-	cursor2 = set_cursor_on_pipe(display, pipe2, &cursor_fb);
-	populate_cursor_args(display, pipe2, arg2, &cursor_fb);
+	cursor2 = set_cursor_on_pipe(display, crtc2, &cursor_fb);
+	populate_cursor_args(display, crtc2, arg2, &cursor_fb);
 
 	arg2[1].x = arg2[1].y = 192;
 
@@ -1228,7 +1223,7 @@ static void two_screens_flip_vs_cursor(igt_display_t *display, int nloops, bool
 		flags = DRM_MODE_ATOMIC_ALLOW_MODESET |
 			DRM_MODE_ATOMIC_NONBLOCK | DRM_MODE_PAGE_FLIP_EVENT;
 
-		/* Disable pipe2 */
+		/* Disable crtc2 */
 		igt_output_set_crtc(output2, NULL);
 		igt_display_commit_atomic(display, flags, NULL);
 		enabled = false;
@@ -1237,7 +1232,7 @@ static void two_screens_flip_vs_cursor(igt_display_t *display, int nloops, bool
 		 * Try a page flip on crtc 1, if we succeed pump page flips and
 		 * modesets interleaved, else do a single atomic commit with both.
 		 */
-		vblank_start = kmstest_get_vblank(display->drm_fd, pipe, DRM_VBLANK_NEXTONMISS);
+		vblank_start = kmstest_get_vblank(display->drm_fd, crtc->pipe, DRM_VBLANK_NEXTONMISS);
 		igt_plane_set_fb(plane, &fb_info);
 		ret = igt_display_try_commit_atomic(display, flags, (void*)(ptrdiff_t)vblank_start);
 		igt_assert(!ret || ret == -EBUSY);
@@ -1260,7 +1255,7 @@ static void two_screens_flip_vs_cursor(igt_display_t *display, int nloops, bool
 				/* Commit page flip and modeset simultaneously. */
 				igt_plane_set_fb(plane, &fb_info);
 				igt_output_set_crtc(output2,
-						    igt_crtc_for_pipe(display, enabled ? PIPE_NONE : pipe2));
+						    enabled ? NULL : crtc2);
 				enabled = !enabled;
 
 				wait_for_modeset(display, flags, 5, "Scheduling modeset");
@@ -1269,11 +1264,11 @@ static void two_screens_flip_vs_cursor(igt_display_t *display, int nloops, bool
 			goto done;
 		}
 	} else {
-		vblank_start = kmstest_get_vblank(display->drm_fd, pipe, DRM_VBLANK_NEXTONMISS);
-		flip_nonblocking(display, pipe, atomic, &fb_info, (void*)(ptrdiff_t)vblank_start);
+		vblank_start = kmstest_get_vblank(display->drm_fd, crtc->pipe, DRM_VBLANK_NEXTONMISS);
+		flip_nonblocking(display, crtc, atomic, &fb_info, (void*)(ptrdiff_t)vblank_start);
 
-		vblank_start = kmstest_get_vblank(display->drm_fd, pipe2, DRM_VBLANK_NEXTONMISS);
-		flip_nonblocking(display, pipe2, atomic, &fb2_info, (void*)(ptrdiff_t)vblank_start);
+		vblank_start = kmstest_get_vblank(display->drm_fd, crtc2->pipe, DRM_VBLANK_NEXTONMISS);
+		flip_nonblocking(display, crtc2, atomic, &fb2_info, (void*)(ptrdiff_t)vblank_start);
 	}
 
 	while (nloops) {
@@ -1296,20 +1291,20 @@ static void two_screens_flip_vs_cursor(igt_display_t *display, int nloops, bool
 			continue;
 		}
 
-		if (vbl.crtc_id == igt_crtc_for_pipe(display, pipe)->crtc_id) {
-			vblank_start = kmstest_get_vblank(display->drm_fd, pipe, DRM_VBLANK_NEXTONMISS);
-			flip_nonblocking(display, pipe, atomic, &fb_info, (void*)(ptrdiff_t)vblank_start);
+		if (vbl.crtc_id == crtc->crtc_id) {
+			vblank_start = kmstest_get_vblank(display->drm_fd, crtc->pipe, DRM_VBLANK_NEXTONMISS);
+			flip_nonblocking(display, crtc, atomic, &fb_info, (void*)(ptrdiff_t)vblank_start);
 		} else {
-			igt_assert(vbl.crtc_id == igt_crtc_for_pipe(display, pipe2)->crtc_id);
+			igt_assert(vbl.crtc_id == crtc2->crtc_id);
 
 			nloops--;
 
 			if (!modeset) {
-				vblank_start = kmstest_get_vblank(display->drm_fd, pipe2, DRM_VBLANK_NEXTONMISS);
-				flip_nonblocking(display, pipe2, atomic, &fb2_info, (void*)(ptrdiff_t)vblank_start);
+				vblank_start = kmstest_get_vblank(display->drm_fd, crtc2->pipe, DRM_VBLANK_NEXTONMISS);
+				flip_nonblocking(display, crtc2, atomic, &fb2_info, (void*)(ptrdiff_t)vblank_start);
 			} else {
 				igt_output_set_crtc(output2,
-						    igt_crtc_for_pipe(display, enabled ? PIPE_NONE : pipe2));
+						    enabled ? NULL : crtc2);
 
 				igt_set_timeout(1, "Scheduling modeset\n");
 				do {
@@ -1353,7 +1348,7 @@ static void cursor_vs_flip(igt_display_t *display, enum flip_test mode, int nloo
 	unsigned vblank_start, vblank_last;
 	volatile unsigned long *shared;
 	long target;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	igt_output_t *output;
 	uint32_t vrefresh;
 	int fail_count;
@@ -1365,25 +1360,25 @@ static void cursor_vs_flip(igt_display_t *display, enum flip_test mode, int nloo
 	shared = mmap(NULL, PAGE_SIZE, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
 	igt_assert(shared != MAP_FAILED);
 
-	pipe = find_connected_pipe(display, false, &output);
+	crtc = find_connected_pipe(display, false, &output);
 	igt_require(output);
 
 	igt_info("Using pipe %s & %s\n",
-		 kmstest_pipe_name(pipe), igt_output_name(output));
+		 igt_crtc_name(crtc), igt_output_name(output));
 
-	set_fb_on_crtc(display, pipe, output, &fb_info);
+	set_fb_on_crtc(display, crtc, output, &fb_info);
 	vrefresh = igt_output_get_mode(output)->vrefresh;
 
 	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
 			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
-	cursor = set_cursor_on_pipe(display, pipe, &cursor_fb);
-	populate_cursor_args(display, pipe, arg, &cursor_fb);
+	cursor = set_cursor_on_pipe(display, crtc, &cursor_fb);
+	populate_cursor_args(display, crtc, arg, &cursor_fb);
 
-	prepare_flip_test(display, mode, pipe, arg, &fb_info, &argb_fb, &cursor_fb2);
+	prepare_flip_test(display, mode, crtc, arg, &fb_info, &argb_fb, &cursor_fb2);
 
 	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
-	target = get_cursor_updates_per_vblank(display, pipe, &arg[0]);
+	target = get_cursor_updates_per_vblank(display, crtc, &arg[0]);
 
 	fail_count = 0;
 
@@ -1401,18 +1396,18 @@ static void cursor_vs_flip(igt_display_t *display, enum flip_test mode, int nloo
 
 		switch (mode) {
 		default:
-			flip_nonblocking(display, pipe, mode >= flip_test_atomic, &fb_info, NULL);
+			flip_nonblocking(display, crtc, mode >= flip_test_atomic, &fb_info, NULL);
 			break;
 		case flip_test_atomic_transitions:
 		case flip_test_atomic_transitions_varying_size:
-			transition_nonblocking(display, pipe, &fb_info, &argb_fb, (i & 2) >> 1);
+			transition_nonblocking(display, crtc, &fb_info, &argb_fb, (i & 2) >> 1);
 			break;
 		}
 
 		igt_assert_eq(read(display->drm_fd, &vbl, sizeof(vbl)), sizeof(vbl));
 		vblank_start = vblank_last = vbl.sequence;
 		for (int n = 0; n < vrefresh / 2; n++) {
-			flip_nonblocking(display, pipe, mode >= flip_test_atomic, &fb_info, NULL);
+			flip_nonblocking(display, crtc, mode >= flip_test_atomic, &fb_info, NULL);
 
 			igt_assert_eq(read(display->drm_fd, &vbl, sizeof(vbl)), sizeof(vbl));
 			if (vbl.sequence != vblank_last + 1) {
@@ -1464,7 +1459,7 @@ static void two_screens_cursor_vs_flip(igt_display_t *display, int nloops, bool
 	struct igt_fb fb_info[2], cursor_fb;
 	volatile unsigned long *shared;
 	int target[2];
-	enum pipe pipe[2];
+	igt_crtc_t *crtc[2];
 	igt_output_t *outputs[2];
 	igt_plane_t *cursors[2];
 
@@ -1474,39 +1469,39 @@ static void two_screens_cursor_vs_flip(igt_display_t *display, int nloops, bool
 	if (atomic)
 		igt_require(display->is_atomic);
 
-	pipe[0] = find_connected_pipe(display, false, &outputs[0]);
-	pipe[1] = find_connected_pipe(display, true, &outputs[1]);
+	crtc[0] = find_connected_pipe(display, false, &outputs[0]);
+	crtc[1] = find_connected_pipe(display, true, &outputs[1]);
 	igt_skip_on(!outputs[0] || !outputs[1]);
 
 	igt_info("Using pipe %s & %s and pipe %s & %s\n",
-		 kmstest_pipe_name(pipe[0]), igt_output_name(outputs[0]),
-		 kmstest_pipe_name(pipe[1]), igt_output_name(outputs[1]));
+		 igt_crtc_name(crtc[0]), igt_output_name(outputs[0]),
+		 igt_crtc_name(crtc[1]), igt_output_name(outputs[1]));
 
-	set_fb_on_crtc(display, pipe[0], outputs[0], &fb_info[0]);
-	set_fb_on_crtc(display, pipe[1], outputs[1], &fb_info[1]);
+	set_fb_on_crtc(display, crtc[0], outputs[0], &fb_info[0]);
+	set_fb_on_crtc(display, crtc[1], outputs[1], &fb_info[1]);
 
 	if (try_commit(display)) {
 		override_output_modes(display, outputs[0], outputs[1]);
 
-		set_fb_on_crtc(display, pipe[0], outputs[0], &fb_info[0]);
-		set_fb_on_crtc(display, pipe[1], outputs[1], &fb_info[1]);
+		set_fb_on_crtc(display, crtc[0], outputs[0], &fb_info[0]);
+		set_fb_on_crtc(display, crtc[1], outputs[1], &fb_info[1]);
 	}
 
 	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
 			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
 
-	cursors[0] = set_cursor_on_pipe(display, pipe[0], &cursor_fb);
-	populate_cursor_args(display, pipe[0], arg[0], &cursor_fb);
+	cursors[0] = set_cursor_on_pipe(display, crtc[0], &cursor_fb);
+	populate_cursor_args(display, crtc[0], arg[0], &cursor_fb);
 	arg[0][1].x = arg[0][1].y = 192;
 
-	cursors[1] = set_cursor_on_pipe(display, pipe[1], &cursor_fb);
-	populate_cursor_args(display, pipe[1], arg[1], &cursor_fb);
+	cursors[1] = set_cursor_on_pipe(display, crtc[1], &cursor_fb);
+	populate_cursor_args(display, crtc[1], arg[1], &cursor_fb);
 	arg[1][1].x =  arg[1][1].y = 192;
 
 	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
-	target[0] = get_cursor_updates_per_vblank(display, pipe[0], &arg[0][0]);
-	target[1] = get_cursor_updates_per_vblank(display, pipe[1], &arg[1][0]);
+	target[0] = get_cursor_updates_per_vblank(display, crtc[0], &arg[0][0]);
+	target[1] = get_cursor_updates_per_vblank(display, crtc[1], &arg[1][0]);
 
 	for (int i = 0; i < nloops; i++) {
 		unsigned long vrefresh[2];
@@ -1529,8 +1524,8 @@ static void two_screens_cursor_vs_flip(igt_display_t *display, int nloops, bool
 			shared[child] = count;
 		}
 
-		flip_nonblocking(display, pipe[0], atomic, &fb_info[0], (void *)0UL);
-		flip_nonblocking(display, pipe[1], atomic, &fb_info[1], (void *)1UL);
+		flip_nonblocking(display, crtc[0], atomic, &fb_info[0], (void *)0UL);
+		flip_nonblocking(display, crtc[1], atomic, &fb_info[1], (void *)1UL);
 
 		for (int n = 0; n < vrefresh[0] / 2 + vrefresh[1] / 2; n++) {
 			unsigned long child;
@@ -1547,7 +1542,7 @@ static void two_screens_cursor_vs_flip(igt_display_t *display, int nloops, bool
 			vblank_last[child] = vbl.sequence;
 
 			if (done[child] < vrefresh[child] / 2) {
-				flip_nonblocking(display, pipe[child], atomic, &fb_info[child], (void *)child);
+				flip_nonblocking(display, crtc[child], atomic, &fb_info[child], (void *)child);
 			} else {
 				igt_assert_lte(vbl.sequence, vblank_start[child] + 5 * vrefresh[child] / 8);
 
@@ -1591,7 +1586,7 @@ static void flip_vs_cursor_crc(igt_display_t *display, bool atomic)
 	struct drm_event_vblank vbl;
 	struct igt_fb fb_info, cursor_fb;
 	unsigned vblank_start;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	igt_crc_t crcs[3];
 	igt_output_t *output;
 	igt_plane_t *cursor;
@@ -1599,24 +1594,24 @@ static void flip_vs_cursor_crc(igt_display_t *display, bool atomic)
 	if (atomic)
 		igt_require(display->is_atomic);
 
-	pipe = find_connected_pipe(display, false, &output);
+	crtc = find_connected_pipe(display, false, &output);
 	igt_require(output);
 
 	igt_info("Using pipe %s & %s\n",
-		 kmstest_pipe_name(pipe), igt_output_name(output));
+		 igt_crtc_name(crtc), igt_output_name(output));
 
-	set_fb_on_crtc(display, pipe, output, &fb_info);
+	set_fb_on_crtc(display, crtc, output, &fb_info);
 
 	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
 			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
-	populate_cursor_args(display, pipe, arg, &cursor_fb);
+	populate_cursor_args(display, crtc, arg, &cursor_fb);
 
 	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
-	pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, pipe),
+	pipe_crc = igt_crtc_crc_new(crtc,
 				    IGT_PIPE_CRC_SOURCE_AUTO);
 
-	cursor = set_cursor_on_pipe(display, pipe, &cursor_fb);
+	cursor = set_cursor_on_pipe(display, crtc, &cursor_fb);
 	igt_display_commit2(display, COMMIT_UNIVERSAL);
 
 	/* Collect reference crcs, crcs[0] last. */
@@ -1628,18 +1623,18 @@ static void flip_vs_cursor_crc(igt_display_t *display, bool atomic)
 
 	/* Disable cursor, and immediately queue a flip. Check if resulting crc is correct. */
 	for (int i = 1; i >= 0; i--) {
-		vblank_start = kmstest_get_vblank(display->drm_fd, pipe, DRM_VBLANK_NEXTONMISS);
+		vblank_start = kmstest_get_vblank(display->drm_fd, crtc->pipe, DRM_VBLANK_NEXTONMISS);
 
-		flip_nonblocking(display, pipe, atomic, &fb_info, NULL);
+		flip_nonblocking(display, crtc, atomic, &fb_info, NULL);
 		do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg[i]);
 
-		igt_assert_eq(kmstest_get_vblank(display->drm_fd, pipe, 0), vblank_start);
+		igt_assert_eq(kmstest_get_vblank(display->drm_fd, crtc->pipe, 0), vblank_start);
 
 		igt_set_timeout(1, "Stuck page flip");
 		igt_ignore_warn(read(display->drm_fd, &vbl, sizeof(vbl)));
 		igt_reset_timeout();
 
-		igt_assert_eq(kmstest_get_vblank(display->drm_fd, pipe, 0), vblank_start + 1);
+		igt_assert_eq(kmstest_get_vblank(display->drm_fd, crtc->pipe, 0), vblank_start + 1);
 
 		igt_pipe_crc_collect_crc(pipe_crc, &crcs[2]);
 
@@ -1663,7 +1658,7 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
 	struct drm_event_vblank vbl;
 	struct igt_fb fb_info[2], cursor_fb;
 	unsigned vblank_start;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	igt_plane_t *plane_primary;
 	igt_crc_t crcs[2], test_crc;
 	uint64_t ahnd;
@@ -1677,27 +1672,27 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
 	if (atomic)
 		igt_require(display->is_atomic);
 
-	pipe = find_connected_pipe(display, false, &output);
+	crtc = find_connected_pipe(display, false, &output);
 	igt_require(output);
 
 	igt_info("Using pipe %s & %s\n",
-		 kmstest_pipe_name(pipe), igt_output_name(output));
+		 igt_crtc_name(crtc), igt_output_name(output));
 
-	set_fb_on_crtc(display, pipe, output, &fb_info[0]);
+	set_fb_on_crtc(display, crtc, output, &fb_info[0]);
 	plane_primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_create_color_pattern_fb(display->drm_fd, fb_info[0].width, fb_info[0].height,
 				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, .1, .1, .1, &fb_info[1]);
 
 	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
 			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
-	populate_cursor_args(display, pipe, arg, &cursor_fb);
+	populate_cursor_args(display, crtc, arg, &cursor_fb);
 
 	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
-	pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, pipe),
+	pipe_crc = igt_crtc_crc_new(crtc,
 				    IGT_PIPE_CRC_SOURCE_AUTO);
 
-	cursor = set_cursor_on_pipe(display, pipe, &cursor_fb);
+	cursor = set_cursor_on_pipe(display, crtc, &cursor_fb);
 	igt_display_commit2(display, COMMIT_UNIVERSAL);
 
 	/* Collect reference crcs, crc[0] last for the loop. */
@@ -1733,12 +1728,12 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
 				    .dependency = fb_info[1].gem_handle,
 				    .dependency_size = fb_info[1].size);
 
-		vblank_start = kmstest_get_vblank(display->drm_fd, pipe, DRM_VBLANK_NEXTONMISS);
+		vblank_start = kmstest_get_vblank(display->drm_fd, crtc->pipe, DRM_VBLANK_NEXTONMISS);
 
-		flip_nonblocking(display, pipe, atomic, &fb_info[1], NULL);
+		flip_nonblocking(display, crtc, atomic, &fb_info[1], NULL);
 		do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg[i]);
 
-		igt_assert_eq(kmstest_get_vblank(display->drm_fd, pipe, 0), vblank_start);
+		igt_assert_eq(kmstest_get_vblank(display->drm_fd, crtc->pipe, 0), vblank_start);
 
 		igt_pipe_crc_get_current(display->drm_fd, pipe_crc, &test_crc);
 
@@ -1748,7 +1743,7 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
 		igt_ignore_warn(read(display->drm_fd, &vbl, sizeof(vbl)));
 		igt_reset_timeout();
 
-		igt_assert_lte(vblank_start + 1, kmstest_get_vblank(display->drm_fd, pipe, 0));
+		igt_assert_lte(vblank_start + 1, kmstest_get_vblank(display->drm_fd, crtc->pipe, 0));
 
 		igt_plane_set_fb(plane_primary, &fb_info[0]);
 		igt_display_commit2(display, COMMIT_UNIVERSAL);
@@ -1774,7 +1769,7 @@ static void modeset_atomic_cursor_hotspot(igt_display_t *display)
 {
 	struct igt_fb cursor_fb;
 	igt_output_t *output;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	igt_plane_t *cursor = NULL;
 	bool has_hotspot_prop;
 	uint64_t cursor_width, cursor_height;
@@ -1782,11 +1777,11 @@ static void modeset_atomic_cursor_hotspot(igt_display_t *display)
 
 	igt_require(display->is_atomic);
 	igt_require(display->has_virt_cursor_plane);
-	pipe = find_connected_pipe(display, false, &output);
+	crtc = find_connected_pipe(display, false, &output);
 	igt_require(output);
 
 	igt_info("Using pipe %s & %s\n",
-		 kmstest_pipe_name(pipe), igt_output_name(output));
+		 igt_crtc_name(crtc), igt_output_name(output));
 
 	cursor_width = cursor_height = 64;
 	igt_create_color_fb(display->drm_fd, cursor_width, cursor_height, DRM_FORMAT_ARGB8888,
@@ -1794,7 +1789,7 @@ static void modeset_atomic_cursor_hotspot(igt_display_t *display)
 
 	igt_display_commit2(display, COMMIT_ATOMIC);
 
-	cursor = set_cursor_on_pipe(display, pipe, &cursor_fb);
+	cursor = set_cursor_on_pipe(display, crtc, &cursor_fb);
 
 	has_hotspot_prop = cursor->props[IGT_PLANE_HOTSPOT_X] ||
 		cursor->props[IGT_PLANE_HOTSPOT_Y];
@@ -1888,14 +1883,16 @@ int igt_main()
 
 					igt_dynamic_f("pipe-%s",
 						      igt_crtc_name(crtc))
-						stress(&display, crtc->pipe,
+						stress(&display, crtc,
 						       tests[i].ncpus,
 						       tests[i].flags, 5);
 				}
 
 				errno = 0;
 				igt_dynamic("all-pipes")
-					stress(&display, -1, tests[i].ncpus, tests[i].flags, 5);
+					stress(&display, NULL,
+					       tests[i].ncpus,
+					       tests[i].flags, 5);
 			}
 		}
 	}
-- 
2.52.0

