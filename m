Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C593ECD6C1
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 16:34:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F77610E628;
	Wed, 11 Feb 2026 16:34:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AA+BLrj4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F007F10E628
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Feb 2026 16:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770827694; x=1802363694;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=36OOcfs8g+BkXxSVAfvJYXRS/sU5irKqMXhtYEzkjE0=;
 b=AA+BLrj4l9nRjlpoggG0VgJ5X0T7IU5ozyiUWcl0gVdhYFqyIU+uN6Lw
 h168IuQzM19iqJf1SvrRlhB2apv8TVBDhVOAA25wHqjNlpIC2BonYEG+z
 CWiqtV+Ne6sP3p8RnH40ylDFblE43LrrqOqTFiYYd9vvKEBtqjTbVMdxV
 diEPmihiqIyn40jBPDUKkahPwOVZvpaphfPjpez92tOIHx1HmS7b8YmGx
 1ZsV6fgXkJqb8czQLc5jJFH5fmAe8NXFUNOSYg2NmW1tgiZcH4sj3sVOD
 M2uBbAPq12fxddzOzzIdzAkcL0DVjflUtjmjZMGLa9t7Q0uskXqxrumPP w==;
X-CSE-ConnectionGUID: FoObNo8fT/2s62GUB3JclQ==
X-CSE-MsgGUID: 5AitWe8ERPaZOZTFVhMb8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="71879776"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="71879776"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 08:34:52 -0800
X-CSE-ConnectionGUID: JI5wpb67TtySdwYGxSaG3w==
X-CSE-MsgGUID: Nl4YUFkhQCKvRIPLIXrBIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="212394159"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.23])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 08:34:49 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 10/17] tests/kms_atomic_transition: Use igt_crtc_t
 instead of enum pipe
Date: Wed, 11 Feb 2026 18:33:57 +0200
Message-ID: <20260211163404.2018-11-ville.syrjala@linux.intel.com>
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
tests/kms_atomic_transition.

The somewhat unusual part here is the old vs. new
pipe/crtc handling for planes in set_combinations().

 #include "scripts/iterators.cocci"

@func@
identifier FUNC, PIPE;
parameter list[N] P;
@@
 FUNC(P
- ,enum pipe PIPE
+ ,igt_crtc_t *crtc
  ,...)
{
<...
(
- igt_crtc_for_pipe(..., PIPE)
+ crtc
|
- kmstest_pipe_name(PIPE)
+ igt_crtc_name(crtc)
|
- PIPE
+ crtc->pipe
)
...>
}

@depends on func@
identifier func.FUNC;
expression PIPE;
expression list[func.N] EP;
@@
FUNC(EP
-    ,PIPE
+    ,igt_crtc_for_pipe(display, PIPE)
   ,...)

@@
identifier FUNC, CRTC;
@@
FUNC(..., igt_crtc_t *CRTC, ...)
{
...
(
- igt_crtc_t *CRTC = CRTC;
|
- igt_crtc_t *CRTC = igt_crtc_for_pipe(...);
|
- igt_crtc_t *CRTC;
...
- CRTC = igt_crtc_for_pipe(...);
)
...
}

@@
typedef igt_plane_t;
identifier PLANE;
identifier PIPE;
@@
{...
igt_plane_t *PLANE = ...;
...
- enum pipe PIPE = PLANE->ref->crtc->pipe;
+ igt_crtc_t *old_crtc = PLANE->ref->crtc;
<+...
- PIPE
+ old_crtc->pipe
...+>
}

@@
igt_crtc_t *CRTC;
@@
- igt_crtc_for_pipe(..., CRTC->pipe)
+ CRTC

@@
igt_crtc_t *CRTC1;
igt_crtc_t *CRTC2;
binary operator OP = { ==, != };
@@
- CRTC1->pipe OP CRTC2->pipe
+ CRTC1 OP CRTC2

@@
identifier DISPLAY;
expression E;
@@
- igt_display_t *DISPLAY = E;
... when != DISPLAY

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_atomic_transition.c | 147 +++++++++++++++++++---------------
 1 file changed, 84 insertions(+), 63 deletions(-)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 27072c4f1d06..701503136b92 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -131,10 +131,8 @@ pthread_t *thread;
 int *seqno;
 
 static void
-run_primary_test(data_t *data, enum pipe pipe, igt_output_t *output)
+run_primary_test(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	drmModeModeInfo *mode;
 	igt_plane_t *primary;
 	igt_fb_t *fb = &data->fbs[0];
@@ -229,7 +227,7 @@ static bool skip_plane(data_t *data, igt_plane_t *plane)
 }
 
 static int
-wm_setup_plane(data_t *data, enum pipe pipe,
+wm_setup_plane(data_t *data, igt_crtc_t *crtc,
 	       uint32_t mask, struct plane_parms *parms, bool fencing)
 {
 	igt_plane_t *plane;
@@ -240,7 +238,7 @@ wm_setup_plane(data_t *data, enum pipe pipe,
 	* because most of the modeset operations must be fast
 	* later on.
 	*/
-	for_each_plane_on_pipe(&data->display, pipe, plane) {
+	for_each_plane_on_pipe(&data->display, crtc->pipe, plane) {
 		int i = plane->index;
 
 		if (skip_plane(data, plane))
@@ -284,13 +282,13 @@ enum transition_type {
 	TRANSITION_MODESET_DISABLE,
 };
 
-static void set_sprite_wh(data_t *data, enum pipe pipe,
+static void set_sprite_wh(data_t *data, igt_crtc_t *crtc,
 			  struct plane_parms *parms, struct igt_fb *sprite_fb,
 			  bool alpha, unsigned w, unsigned h)
 {
 	igt_plane_t *plane;
 
-	for_each_plane_on_pipe(&data->display, pipe, plane) {
+	for_each_plane_on_pipe(&data->display, crtc->pipe, plane) {
 		int i = plane->index;
 
 		if (plane->type == DRM_PLANE_TYPE_PRIMARY ||
@@ -316,7 +314,7 @@ static void set_sprite_wh(data_t *data, enum pipe pipe,
 #define is_atomic_check_plane_size_errno(errno) \
 		(errno == -EINVAL)
 
-static void setup_parms(data_t *data, enum pipe pipe,
+static void setup_parms(data_t *data, igt_crtc_t *crtc,
 			const drmModeModeInfo *mode,
 			struct igt_fb *primary_fb,
 			struct igt_fb *argb_fb,
@@ -324,8 +322,6 @@ static void setup_parms(data_t *data, enum pipe pipe,
 			struct plane_parms *parms,
 			unsigned *iter_max)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	uint64_t cursor_width, cursor_height;
 	unsigned sprite_width, sprite_height, prev_w, prev_h;
 	bool max_sprite_width, max_sprite_height, alpha = true;
@@ -408,10 +404,12 @@ static void setup_parms(data_t *data, enum pipe pipe,
 	while (!max_sprite_width && !max_sprite_height) {
 		int ret;
 
-		set_sprite_wh(data, crtc->pipe, parms, sprite_fb,
+		set_sprite_wh(data, crtc,
+			      parms, sprite_fb,
 			      alpha, sprite_width, sprite_height);
 
-		wm_setup_plane(data, crtc->pipe, (1 << n_planes) - 1, parms,
+		wm_setup_plane(data, crtc,
+			       (1 << n_planes) - 1, parms,
 			       false);
 		ret = igt_display_try_commit_atomic(&data->display, DRM_MODE_ATOMIC_TEST_ONLY | DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 		igt_assert(!is_atomic_check_failure_errno(ret));
@@ -467,7 +465,8 @@ static void setup_parms(data_t *data, enum pipe pipe,
 			max_sprite_height = true;
 	}
 
-	set_sprite_wh(data, crtc->pipe, parms, sprite_fb,
+	set_sprite_wh(data, crtc, parms,
+			sprite_fb,
 			alpha, sprite_width, sprite_height);
 
 	igt_info("Running test on pipe %s with resolution %dx%d and sprite size %dx%d alpha %i\n",
@@ -475,10 +474,8 @@ static void setup_parms(data_t *data, enum pipe pipe,
 		 sprite_width, sprite_height, alpha);
 }
 
-static void prepare_fencing(data_t *data, enum pipe pipe)
+static void prepare_fencing(data_t *data, igt_crtc_t *crtc)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	igt_plane_t *plane;
 	int n_planes;
 
@@ -496,7 +493,7 @@ static void prepare_fencing(data_t *data, enum pipe pipe)
 		timeline[plane->index] = sw_sync_timeline_create();
 }
 
-static void unprepare_fencing(data_t *data, enum pipe pipe)
+static void unprepare_fencing(data_t *data, igt_crtc_t *crtc)
 {
 	igt_plane_t *plane;
 
@@ -504,7 +501,7 @@ static void unprepare_fencing(data_t *data, enum pipe pipe)
 	if (!timeline)
 		return;
 
-	for_each_plane_on_pipe(&data->display, pipe, plane)
+	for_each_plane_on_pipe(&data->display, crtc->pipe, plane)
 		close(timeline[plane->index]);
 
 	free(timeline);
@@ -512,10 +509,9 @@ static void unprepare_fencing(data_t *data, enum pipe pipe)
 	free(seqno);
 }
 
-static void atomic_commit(data_t *data_v, enum pipe pipe, unsigned int flags, void *data, bool fencing)
+static void atomic_commit(data_t *data_v, igt_crtc_t *crtc,
+			  unsigned int flags, void *data, bool fencing)
 {
-	igt_display_t *display = &data_v->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	if (fencing)
 		igt_crtc_request_out_fence(crtc);
 
@@ -532,10 +528,9 @@ static int fd_completed(int fd)
 	return ret;
 }
 
-static void wait_for_transition(data_t *data, enum pipe pipe, bool nonblocking, bool fencing)
+static void wait_for_transition(data_t *data, igt_crtc_t *crtc,
+				bool nonblocking, bool fencing)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	if (fencing) {
 		int fence_fd = crtc->out_fence_fd;
 
@@ -561,11 +556,9 @@ static void wait_for_transition(data_t *data, enum pipe pipe, bool nonblocking,
  * so test this and make sure it works.
  */
 static void
-run_transition_test(data_t *data, enum pipe pipe, igt_output_t *output,
-		enum transition_type type, bool nonblocking, bool fencing)
+run_transition_test(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
+		    enum transition_type type, bool nonblocking, bool fencing)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	drmModeModeInfo *mode, override_mode;
 	igt_plane_t *plane;
 	uint32_t iter_max, i;
@@ -577,7 +570,7 @@ run_transition_test(data_t *data, enum pipe pipe, igt_output_t *output,
 		 igt_crtc_name(crtc), igt_output_name(output));
 
 	if (fencing)
-		prepare_fencing(data, crtc->pipe);
+		prepare_fencing(data, crtc);
 	else
 		flags |= DRM_MODE_PAGE_FLIP_EVENT;
 
@@ -597,7 +590,8 @@ run_transition_test(data_t *data, enum pipe pipe, igt_output_t *output,
 
 	igt_output_set_crtc(output, crtc);
 
-	wm_setup_plane(data, crtc->pipe, 0, NULL, false);
+	wm_setup_plane(data, crtc, 0, NULL,
+		       false);
 
 	if (flags & DRM_MODE_ATOMIC_ALLOW_MODESET) {
 		igt_output_set_crtc(output, NULL);
@@ -608,7 +602,8 @@ run_transition_test(data_t *data, enum pipe pipe, igt_output_t *output,
 				    crtc);
 	}
 
-	setup_parms(data, crtc->pipe, mode, &data->fbs[0], &data->argb_fb,
+	setup_parms(data, crtc, mode,
+		    &data->fbs[0], &data->argb_fb,
 		    &data->sprite_fb, parms, &iter_max);
 
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
@@ -619,7 +614,8 @@ run_transition_test(data_t *data, enum pipe pipe, igt_output_t *output,
 	 * planes to fix this
 	 */
 	while (1) {
-		wm_setup_plane(data, crtc->pipe, iter_max - 1, parms, false);
+		wm_setup_plane(data, crtc,
+			       iter_max - 1, parms, false);
 
 		if (fencing)
 			igt_crtc_request_out_fence(crtc);
@@ -653,9 +649,11 @@ run_transition_test(data_t *data, enum pipe pipe, igt_output_t *output,
 	if (type == TRANSITION_AFTER_FREE) {
 		int fence_fd = -1;
 
-		wm_setup_plane(data, crtc->pipe, 0, parms, fencing);
+		wm_setup_plane(data, crtc,
+			       0, parms, fencing);
 
-		atomic_commit(data, crtc->pipe, flags,
+		atomic_commit(data, crtc,
+			      flags,
 			      (void *)(unsigned long)0, fencing);
 		if (fencing) {
 			fence_fd = crtc->out_fence_fd;
@@ -675,7 +673,9 @@ run_transition_test(data_t *data, enum pipe pipe, igt_output_t *output,
 			close(fence_fd);
 		} else {
 			igt_assert(fd_completed(data->drm_fd));
-			wait_for_transition(data, crtc->pipe, false, fencing);
+			wait_for_transition(data,
+					    crtc,
+					    false, fencing);
 		}
 		return;
 	}
@@ -691,22 +691,29 @@ run_transition_test(data_t *data, enum pipe pipe, igt_output_t *output,
 		igt_output_set_crtc(output,
 				    crtc);
 
-		if (!wm_setup_plane(data, crtc->pipe, i, parms, fencing))
+		if (!wm_setup_plane(data, crtc, i, parms, fencing))
 			continue;
 
-		atomic_commit(data, crtc->pipe, flags,
+		atomic_commit(data, crtc,
+			      flags,
 			      (void *)(unsigned long)i, fencing);
-		wait_for_transition(data, crtc->pipe, nonblocking, fencing);
+		wait_for_transition(data,
+				    crtc,
+				    nonblocking, fencing);
 
 		if (type == TRANSITION_MODESET_DISABLE) {
 			igt_output_set_crtc(output, NULL);
 
-			if (!wm_setup_plane(data, crtc->pipe, 0, parms, fencing))
+			if (!wm_setup_plane(data, crtc, 0, parms, fencing))
 				continue;
 
-			atomic_commit(data, crtc->pipe, flags, (void *) 0UL,
+			atomic_commit(data,
+				      crtc,
+				      flags, (void *) 0UL,
 				      fencing);
-			wait_for_transition(data, crtc->pipe, nonblocking,
+			wait_for_transition(data,
+					    crtc,
+					    nonblocking,
 					    fencing);
 		} else {
 			uint32_t j;
@@ -720,44 +727,52 @@ run_transition_test(data_t *data, enum pipe pipe, igt_output_t *output,
 				    n_enable_planes < crtc->n_planes)
 					continue;
 
-				if (!wm_setup_plane(data, crtc->pipe, j, parms, fencing))
+				if (!wm_setup_plane(data, crtc, j, parms, fencing))
 					continue;
 
 				if (type >= TRANSITION_MODESET)
 					igt_output_override_mode(output, &override_mode);
 
-				atomic_commit(data, crtc->pipe, flags,
+				atomic_commit(data,
+					      crtc,
+					      flags,
 					      (void *)(unsigned long) j,
 					      fencing);
-				wait_for_transition(data, crtc->pipe,
+				wait_for_transition(data,
+						    crtc,
 						    nonblocking, fencing);
 
-				if (!wm_setup_plane(data, crtc->pipe, i, parms, fencing))
+				if (!wm_setup_plane(data, crtc, i, parms, fencing))
 					continue;
 
 				if (type >= TRANSITION_MODESET)
 					igt_output_override_mode(output, NULL);
 
-				atomic_commit(data, crtc->pipe, flags,
+				atomic_commit(data,
+					      crtc,
+					      flags,
 					      (void *)(unsigned long) i,
 					      fencing);
-				wait_for_transition(data, crtc->pipe,
+				wait_for_transition(data,
+						    crtc,
 						    nonblocking, fencing);
 			}
 		}
 	}
 }
 
-static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output, bool fencing)
+static void test_cleanup(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
+			 bool fencing)
 {
 	igt_plane_t *plane;
 
 	if (fencing)
-		unprepare_fencing(data, pipe);
+		unprepare_fencing(data,
+				  crtc);
 
 	igt_output_set_crtc(output, NULL);
 
-	for_each_plane_on_pipe(&data->display, pipe, plane)
+	for_each_plane_on_pipe(&data->display, crtc->pipe, plane)
 		igt_plane_set_fb(plane, NULL);
 
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
@@ -820,7 +835,6 @@ static void unset_output_pipe(igt_display_t *display)
 
 static unsigned set_combinations(data_t *data, unsigned mask, struct igt_fb *fb)
 {
-	igt_display_t *display = &data->display;
 	igt_output_t *output;
 	igt_crtc_t *crtc;
 	unsigned event_mask = 0;
@@ -831,14 +845,14 @@ static unsigned set_combinations(data_t *data, unsigned mask, struct igt_fb *fb)
 		igt_plane_t *plane = igt_crtc_get_plane_type(crtc,
 							     DRM_PLANE_TYPE_PRIMARY);
 
-		enum pipe old_pipe = plane->ref->crtc->pipe;
+		igt_crtc_t *old_crtc = plane->ref->crtc;
 
 		/*
 		 * If a plane is being shared by multiple pipes, we must disable the pipe that
 		 * currently is holding the plane
 		 */
-		if (old_pipe != crtc->pipe) {
-			igt_plane_t *old_plane = igt_crtc_get_plane_type(igt_crtc_for_pipe(display, old_pipe),
+		if (old_crtc != crtc) {
+			igt_plane_t *old_plane = igt_crtc_get_plane_type(old_crtc,
 									 DRM_PLANE_TYPE_PRIMARY);
 
 			igt_plane_set_fb(old_plane, NULL);
@@ -1113,14 +1127,14 @@ static void run_modeset_transition(data_t *data, int requested_outputs, bool non
 		run_modeset_tests(data, requested_outputs, nonblocking, fencing);
 }
 
-static bool pipe_output_combo_valid(igt_display_t *display,
-				    enum pipe pipe, igt_output_t *output)
+static bool pipe_output_combo_valid(igt_display_t *display, igt_crtc_t *crtc,
+				    igt_output_t *output)
 {
 	bool ret = true;
 
 	igt_display_reset(display);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 	if (!intel_pipe_output_combo_valid(display))
 		ret = false;
 	igt_output_set_crtc(output, NULL);
@@ -1231,14 +1245,18 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 			if (pipe_count == 2 * count && !data.extended)
 				break;
 
-			if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
+			if (!pipe_output_combo_valid(&data.display, crtc, output))
 				continue;
 
 			pipe_count++;
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 				      igt_output_name(output))
-				run_primary_test(&data, crtc->pipe, output);
-			test_cleanup(&data, crtc->pipe, output, false);
+				run_primary_test(&data,
+						 crtc,
+						 output);
+			test_cleanup(&data,
+				     crtc,
+				     output, false);
 		}
 	}
 
@@ -1268,20 +1286,23 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 				if (pipe_count == 2 * count && !data.extended)
 					break;
 
-				if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
+				if (!pipe_output_combo_valid(&data.display, crtc, output))
 					continue;
 
 				pipe_count++;
 				igt_dynamic_f("pipe-%s-%s",
 					      igt_crtc_name(crtc),
 					      igt_output_name(output))
-					run_transition_test(&data, crtc->pipe,
+					run_transition_test(&data,
+							    crtc,
 							    output,
 							    transition_tests[i].type,
 							    transition_tests[i].nonblocking,
 							    transition_tests[i].fencing);
 
-				test_cleanup(&data, crtc->pipe, output,
+				test_cleanup(&data,
+					     crtc,
+					     output,
 					     transition_tests[i].fencing);
 			}
 		}
-- 
2.52.0

