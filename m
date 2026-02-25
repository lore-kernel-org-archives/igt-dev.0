Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E81FD3758
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 12:51:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9EFD10E76F;
	Wed, 25 Feb 2026 12:51:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dxBaTvey";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A650010E76F
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 12:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772023915; x=1803559915;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=uuCclWdp2l0HUOXFoq4evJsj7yPnfQPIdfhDN5sH+0Y=;
 b=dxBaTvey2cZrDEcovRGQ4JGAseA36HsRALiGD5XMXAVMKfR14B6Hp5p6
 TY/7nZuA3IErNcNTrVUc7x5bOI/kpFeKG47fKul339+9WowRyT0wkNkQ7
 GH1PGNvBJYyXQw3ojIA5fnM8ed6CEMZS5rJiMmrjN4xqLqINy1gnJZjIL
 mNFnFqF5m473nvmXv1O4jT6RFufhsnVnmuVC9SuKKqnKPqnq/Dc6TWTEk
 G3a7nJ8HD/a8SXno9H4elYqDZ+8jVPU/GZSN3bQXkMB+Pv/3VDtJkkyiT
 osqVTGxnEEDAtydziI46n4Tl98sbO0lKC5gRMhC/jpfh7gvGbIihiw9+B Q==;
X-CSE-ConnectionGUID: W9rJcNeFT1mGKPIxy3Yl8A==
X-CSE-MsgGUID: 4FQ/DhPzTKyOGDQDtQbmeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="76927671"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="76927671"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 04:51:55 -0800
X-CSE-ConnectionGUID: Busip1FlQwaNtyBiqV8p5w==
X-CSE-MsgGUID: 83mQqtzlSduD398RQNChsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="221226983"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.16])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 04:51:54 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 12/19] tests/kms: Use for_each_plane_on_crtc()
Date: Wed, 25 Feb 2026 14:51:01 +0200
Message-ID: <20260225125108.31119-13-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260225125108.31119-1-ville.syrjala@linux.intel.com>
References: <20260225125108.31119-1-ville.syrjala@linux.intel.com>
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

Replace for_each_plane_on_pipe() with
for_each_plane_on_crtc(). All callers already have
the crtc around anyway.

 #include "scripts/iterators.cocci"

@@
iterator name for_each_plane_on_pipe;
iterator name for_each_plane_on_crtc;
expression DISPLAY, PIPE, PLANE;
@@
- for_each_plane_on_pipe(DISPLAY, PIPE, PLANE)
+ for_each_plane_on_crtc(igt_crtc_for_pipe(DISPLAY, PIPE), PLANE)
{ ... }

@@
igt_crtc_t *CRTC;
@@
- igt_crtc_for_pipe(..., CRTC->pipe)
+ CRTC

@@
identifier DISPLAY;
@@
- igt_display_t *DISPLAY = ...;
... when != DISPLAY

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c                          | 18 +++++++++++------
 tests/amdgpu/amd_cursor_overlay.c      |  2 +-
 tests/intel/kms_big_fb.c               |  3 ++-
 tests/intel/kms_busy.c                 |  3 ++-
 tests/intel/kms_ccs.c                  |  3 +--
 tests/intel/kms_cdclk.c                |  3 ++-
 tests/intel/kms_frontbuffer_tracking.c |  3 ++-
 tests/intel/kms_legacy_colorkey.c      |  5 +++--
 tests/intel/kms_pipe_stress.c          |  3 ++-
 tests/kms_atomic.c                     |  3 ++-
 tests/kms_atomic_transition.c          | 27 +++++++++++++++++---------
 tests/kms_colorop.c                    |  3 ++-
 tests/kms_cursor_legacy.c              |  2 +-
 tests/kms_debugfs.c                    |  3 ++-
 tests/kms_plane.c                      |  3 ++-
 tests/kms_plane_alpha_blend.c          |  8 ++++----
 tests/kms_plane_lowres.c               |  3 ++-
 tests/kms_plane_multiple.c             |  6 ++++--
 tests/kms_plane_scaling.c              |  9 +++------
 tests/kms_properties.c                 | 12 +++++++-----
 tests/kms_rmfb.c                       |  6 ++++--
 21 files changed, 78 insertions(+), 50 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 8855ba845ed2..b6d3467c598d 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2797,7 +2797,8 @@ void igt_display_reset(igt_display_t *display)
 	for_each_crtc(display, crtc) {
 		igt_plane_t *plane;
 
-		for_each_plane_on_pipe(display, crtc->pipe, plane)
+		for_each_plane_on_crtc(crtc,
+				       plane)
 			igt_plane_reset(plane);
 
 		igt_crtc_reset(crtc);
@@ -4777,7 +4778,8 @@ static int igt_atomic_commit(igt_display_t *display, uint32_t flags, void *user_
 		if (crtc->changed)
 			igt_atomic_prepare_crtc_commit(crtc, req);
 
-		for_each_plane_on_pipe(display, crtc->pipe, plane) {
+		for_each_plane_on_crtc(crtc,
+				       plane) {
 			/* skip planes that are handled by another pipe */
 			if (plane->ref->crtc != crtc)
 				continue;
@@ -4841,7 +4843,8 @@ display_commit_changed(igt_display_t *display, enum igt_commit_style s)
 			}
 		}
 
-		for_each_plane_on_pipe(display, crtc->pipe, plane) {
+		for_each_plane_on_crtc(crtc,
+				       plane) {
 			if (s == COMMIT_ATOMIC) {
 				int fd;
 				plane->changed = 0;
@@ -6242,7 +6245,8 @@ static int igt_count_display_format_mod(igt_display_t *display)
 	for_each_crtc(display, crtc) {
 		igt_plane_t *plane;
 
-		for_each_plane_on_pipe(display, crtc->pipe, plane) {
+		for_each_plane_on_crtc(crtc,
+				       plane) {
 			count += plane->format_mod_count;
 		}
 	}
@@ -6284,7 +6288,8 @@ static void igt_fill_display_format_mod(igt_display_t *display)
 	for_each_crtc(display, crtc) {
 		igt_plane_t *plane;
 
-		for_each_plane_on_pipe(display, crtc->pipe, plane) {
+		for_each_plane_on_crtc(crtc,
+				       plane) {
 			for (int i = 0; i < plane->format_mod_count; i++) {
 				igt_add_display_format_mod(display,
 							   plane->formats[i],
@@ -7384,7 +7389,8 @@ int igt_crtc_num_scalers(igt_crtc_t *crtc)
 		 * as a rough approximation of the # of scalars.. it may
 		 * undercount on some hw, but it will not overcount
 		 */
-		for_each_plane_on_pipe(display, crtc->pipe, plane) {
+		for_each_plane_on_crtc(crtc,
+				       plane) {
 			for (unsigned i = 0; i < plane->format_mod_count; i++) {
 				if (igt_format_is_yuv(plane->formats[i])) {
 					num_scalers++;
diff --git a/tests/amdgpu/amd_cursor_overlay.c b/tests/amdgpu/amd_cursor_overlay.c
index 73e1cbcc7919..41c9905b8a6c 100644
--- a/tests/amdgpu/amd_cursor_overlay.c
+++ b/tests/amdgpu/amd_cursor_overlay.c
@@ -89,7 +89,7 @@ static int get_overlay_planes_count(igt_display_t *display, igt_crtc_t *crtc)
 	int count = 0;
 	igt_plane_t *plane;
 
-	for_each_plane_on_pipe(display, crtc->pipe, plane)
+	for_each_plane_on_crtc(crtc, plane)
 		if (plane->type == DRM_PLANE_TYPE_OVERLAY)
 			count++;
 
diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index 66d7c5428d1e..c99cf51df64d 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -569,7 +569,8 @@ static bool test_pipe(data_t *data)
 	data->pipe_crc = igt_crtc_crc_new(data->crtc,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
-	for_each_plane_on_pipe(&data->display, data->crtc->pipe, data->plane) {
+	for_each_plane_on_crtc(data->crtc,
+			       data->plane) {
 		ret = test_plane(data);
 		if (ret || run_in_simulation)
 			break;
diff --git a/tests/intel/kms_busy.c b/tests/intel/kms_busy.c
index b109766fc4f0..400174faef33 100644
--- a/tests/intel/kms_busy.c
+++ b/tests/intel/kms_busy.c
@@ -97,8 +97,9 @@ static void do_cleanup_display(igt_display_t *dpy)
 	igt_plane_t *plane;
 
 	for_each_crtc(dpy, crtc)
-		for_each_plane_on_pipe(dpy, crtc->pipe, plane)
+	{for_each_plane_on_crtc(crtc, plane)
 			igt_plane_set_fb(plane, NULL);
+	}
 
 	for_each_connected_output(dpy, output)
 		igt_output_set_crtc(output, NULL);
diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index 19d12027b68f..2b570af355fc 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -1174,8 +1174,7 @@ static void test_output(data_t *data, const int testnum)
 						igt_display_require_output_on_pipe(&data->display,
 										   crtc->pipe);
 
-						for_each_plane_on_pipe(&data->display,
-								       crtc->pipe,
+						for_each_plane_on_crtc(crtc,
 								       data->plane) {
 							if (skip_plane(data, data->plane))
 								continue;
diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
index 73cb962c0fe9..069bf267a170 100644
--- a/tests/intel/kms_cdclk.c
+++ b/tests/intel/kms_cdclk.c
@@ -119,8 +119,9 @@ static void do_cleanup_display(igt_display_t *dpy)
 	igt_plane_t *plane;
 
 	for_each_crtc(dpy, crtc)
-		for_each_plane_on_pipe(dpy, crtc->pipe, plane)
+	{for_each_plane_on_crtc(crtc, plane)
 			igt_plane_set_fb(plane, NULL);
+	}
 
 	for_each_connected_output(dpy, output)
 		igt_output_set_crtc(output, NULL);
diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index ce0a646d4e80..101ceea1f0bc 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -2768,7 +2768,8 @@ static void plane_fbc_rte_subtest(const struct test_mode *t)
 
 	wanted_crc = &blue_crcs[t->format].crc;
 
-	for_each_plane_on_pipe(&drm.display, prim_mode_params.crtc->pipe, plane) {
+	for_each_plane_on_crtc(prim_mode_params.crtc,
+			       plane) {
 		if (!is_valid_plane(plane))
 			continue;
 
diff --git a/tests/intel/kms_legacy_colorkey.c b/tests/intel/kms_legacy_colorkey.c
index 15def4f35936..1063a4df309c 100644
--- a/tests/intel/kms_legacy_colorkey.c
+++ b/tests/intel/kms_legacy_colorkey.c
@@ -67,7 +67,8 @@ int igt_main()
 
 		igt_display_require(&display, drm_fd);
 		for_each_crtc(&display, crtc) {
-			for_each_plane_on_pipe(&display, crtc->pipe, plane) {
+			for_each_plane_on_crtc(crtc,
+					       plane) {
 				max_id = max(max_id, plane->drm_plane->plane_id);
 			}
 		}
@@ -79,7 +80,7 @@ int igt_main()
 	igt_subtest_with_dynamic("basic") {
 		for_each_crtc(&display, crtc) {
 			igt_dynamic_f("pipe-%s", igt_crtc_name(crtc)) {
-				for_each_plane_on_pipe(&display, crtc->pipe,
+				for_each_plane_on_crtc(crtc,
 						       plane) {
 					bool is_valid = (plane->type == DRM_PLANE_TYPE_PRIMARY ||
 							 plane->type == DRM_PLANE_TYPE_CURSOR);
diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
index 72f8a7be23cc..ae8de0de7f80 100644
--- a/tests/intel/kms_pipe_stress.c
+++ b/tests/intel/kms_pipe_stress.c
@@ -447,7 +447,8 @@ static int pipe_stress(struct data *data, igt_output_t *output,
 	if (!data->num_planes[crtc->pipe] || !new_mode)
 		return 0;
 
-	for_each_plane_on_pipe(&data->display, crtc->pipe, plane) {
+	for_each_plane_on_crtc(crtc,
+			       plane) {
 		int plane_width, plane_height;
 		if (plane->type == DRM_PLANE_TYPE_CURSOR) {
 			cursor_plane_set_fb(plane,
diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index 5e6d1123874e..10d8f991d78a 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -1406,7 +1406,8 @@ static void atomic_clear(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
 {
 	igt_plane_t *plane;
 
-	for_each_plane_on_pipe(&data->display, crtc->pipe, plane) {
+	for_each_plane_on_crtc(crtc,
+			       plane) {
 		igt_plane_set_fb(plane, NULL);
 		igt_plane_set_position(plane, 0, 0);
 	}
diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 701503136b92..80c6f49de274 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -238,7 +238,8 @@ wm_setup_plane(data_t *data, igt_crtc_t *crtc,
 	* because most of the modeset operations must be fast
 	* later on.
 	*/
-	for_each_plane_on_pipe(&data->display, crtc->pipe, plane) {
+	for_each_plane_on_crtc(crtc,
+			       plane) {
 		int i = plane->index;
 
 		if (skip_plane(data, plane))
@@ -288,7 +289,8 @@ static void set_sprite_wh(data_t *data, igt_crtc_t *crtc,
 {
 	igt_plane_t *plane;
 
-	for_each_plane_on_pipe(&data->display, crtc->pipe, plane) {
+	for_each_plane_on_crtc(crtc,
+			       plane) {
 		int i = plane->index;
 
 		if (plane->type == DRM_PLANE_TYPE_PRIMARY ||
@@ -338,7 +340,8 @@ static void setup_parms(data_t *data, igt_crtc_t *crtc,
 	if (cursor_height >= mode->vdisplay)
 		cursor_height = mode->vdisplay;
 
-	for_each_plane_on_pipe(&data->display, crtc->pipe, plane) {
+	for_each_plane_on_crtc(crtc,
+			       plane) {
 		int i = plane->index;
 
 		if (plane->type == DRM_PLANE_TYPE_PRIMARY) {
@@ -489,7 +492,8 @@ static void prepare_fencing(data_t *data, igt_crtc_t *crtc)
 	seqno = calloc(n_planes, sizeof(*seqno));
 	igt_assert_f(seqno != NULL, "Failed to allocate memory for seqno\n");
 
-	for_each_plane_on_pipe(&data->display, crtc->pipe, plane)
+	for_each_plane_on_crtc(crtc,
+			       plane)
 		timeline[plane->index] = sw_sync_timeline_create();
 }
 
@@ -501,7 +505,8 @@ static void unprepare_fencing(data_t *data, igt_crtc_t *crtc)
 	if (!timeline)
 		return;
 
-	for_each_plane_on_pipe(&data->display, crtc->pipe, plane)
+	for_each_plane_on_crtc(crtc,
+			       plane)
 		close(timeline[plane->index]);
 
 	free(timeline);
@@ -627,7 +632,8 @@ run_transition_test(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
 			break;
 
 		ret = 0;
-		for_each_plane_on_pipe(&data->display, crtc->pipe, plane) {
+		for_each_plane_on_crtc(crtc,
+				       plane) {
 			i = plane->index;
 
 			if (plane->type == DRM_PLANE_TYPE_PRIMARY ||
@@ -661,7 +667,8 @@ run_transition_test(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
 		}
 
 		/* force planes to be part of commit */
-		for_each_plane_on_pipe(&data->display, crtc->pipe, plane) {
+		for_each_plane_on_crtc(crtc,
+				       plane) {
 			if (parms[plane->index].mask)
 				igt_plane_set_position(plane, 0, 0);
 		}
@@ -772,7 +779,8 @@ static void test_cleanup(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
 
 	igt_output_set_crtc(output, NULL);
 
-	for_each_plane_on_pipe(&data->display, crtc->pipe, plane)
+	for_each_plane_on_crtc(crtc,
+			       plane)
 		igt_plane_set_fb(plane, NULL);
 
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
@@ -913,7 +921,8 @@ static void refresh_primaries(data_t  *data, int mask)
 		if (!((1 << crtc->pipe) & mask))
 			continue;
 
-		for_each_plane_on_pipe(&data->display, crtc->pipe, plane)
+		for_each_plane_on_crtc(crtc,
+				       plane)
 			if (plane->type == DRM_PLANE_TYPE_PRIMARY)
 				igt_plane_set_position(plane, 0, 0);
 	}
diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index bb15350efc66..d535be4e5287 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -308,7 +308,8 @@ static void check_plane_colorop_ids(igt_display_t *display)
 	GHashTable *id_set = g_hash_table_new(g_direct_hash, g_direct_equal);
 
 	for_each_crtc(display, crtc) {
-		for_each_plane_on_pipe(display, crtc->pipe, plane) {
+		for_each_plane_on_crtc(crtc,
+				       plane) {
 			/* Skip when a drm_plane is already scanned */
 			if (g_hash_table_contains(plane_set, GINT_TO_POINTER(plane->drm_plane->plane_id)))
 				continue;
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 248fc3b06cae..9720a76dc71b 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -384,7 +384,7 @@ static	igt_plane_t
 {
 	igt_plane_t *plane, *cursor = NULL;
 
-	for_each_plane_on_pipe(display, crtc->pipe, plane) {
+	for_each_plane_on_crtc(crtc, plane) {
 		if (plane->type != DRM_PLANE_TYPE_CURSOR)
 			continue;
 
diff --git a/tests/kms_debugfs.c b/tests/kms_debugfs.c
index 1f23eac69979..3b7224fbd4a1 100644
--- a/tests/kms_debugfs.c
+++ b/tests/kms_debugfs.c
@@ -88,8 +88,9 @@ static void igt_display_all_off(igt_display_t *display)
 		igt_output_set_crtc(output, NULL);
 
 	for_each_crtc(display, crtc)
-		for_each_plane_on_pipe(display, crtc->pipe, plane)
+	{for_each_plane_on_crtc(crtc, plane)
 			igt_plane_set_fb(plane, NULL);
+	}
 
 	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 }
diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 30655b75c7ea..15924f550ebf 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1312,7 +1312,8 @@ test_pixel_formats(data_t *data, igt_crtc_t *crtc)
 
 	set_legacy_lut(data, crtc, LUT_MASK);
 
-	for_each_plane_on_pipe(&data->display, crtc->pipe, plane) {
+	for_each_plane_on_crtc(crtc,
+			       plane) {
 		if (skip_plane(data, plane))
 			continue;
 		/* Cursor planes do not support cropping, skip generating subtest on cursor plane */
diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index 2ee74d30f558..41a3b71c3861 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -172,7 +172,7 @@ static void reset_alpha(igt_display_t *display, igt_crtc_t *crtc)
 {
 	igt_plane_t *plane;
 
-	for_each_plane_on_pipe(display, crtc->pipe, plane) {
+	for_each_plane_on_crtc(crtc, plane) {
 		if (igt_plane_has_prop(plane, IGT_PLANE_ALPHA))
 			igt_plane_set_prop_value(plane, IGT_PLANE_ALPHA, 0xffff);
 
@@ -539,7 +539,7 @@ static void run_test_on_pipe_planes(data_t *data, igt_crtc_t *crtc,
 	int first_plane = -1;
 	int last_plane = -1;
 
-	for_each_plane_on_pipe(display, crtc->pipe, plane) {
+	for_each_plane_on_crtc(crtc, plane) {
 		if (!igt_plane_has_prop(plane, IGT_PLANE_ALPHA))
 			continue;
 
@@ -559,7 +559,7 @@ static void run_test_on_pipe_planes(data_t *data, igt_crtc_t *crtc,
 		last_plane = j__;
 	}
 
-	for_each_plane_on_pipe(display, crtc->pipe, plane) {
+	for_each_plane_on_crtc(crtc, plane) {
 		if (!igt_plane_has_prop(plane, IGT_PLANE_ALPHA))
 			continue;
 
@@ -660,7 +660,7 @@ static bool pipe_check(data_t *data, igt_crtc_t *crtc,
 	bool plane_alpha = false, plane_blend = false, multiply = false;
 
 	igt_display_require_output_on_pipe(display, crtc->pipe);
-	for_each_plane_on_pipe(display, crtc->pipe, plane) {
+	for_each_plane_on_crtc(crtc, plane) {
 		if (!igt_plane_has_prop(plane, IGT_PLANE_ALPHA))
 			continue;
 		plane_alpha = true;
diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
index 8b4e5809d14e..c9ecd6f56c4e 100644
--- a/tests/kms_plane_lowres.c
+++ b/tests/kms_plane_lowres.c
@@ -273,7 +273,8 @@ test_planes_on_pipe(data_t *data, uint64_t modifier)
 	igt_plane_t *plane;
 	unsigned tested = 0;
 
-	for_each_plane_on_pipe(&data->display, data->crtc->pipe, plane)
+	for_each_plane_on_crtc(data->crtc,
+			       plane)
 		tested += test_planes_on_pipe_with_output(data, plane, modifier);
 
 	igt_assert(tested > 0);
diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index e1b5e8bce47f..297ac7ec2ccf 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -363,7 +363,8 @@ test_plane_position_with_output(data_t *data, igt_crtc_t *crtc,
 			       data->plane1, modifier, c, output, data->fb1);
 		err = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
 
-		for_each_plane_on_pipe(&data->display, crtc->pipe, plane)
+		for_each_plane_on_crtc(crtc,
+				       plane)
 			igt_plane_set_fb(plane, NULL);
 
 		igt_output_set_crtc(output, NULL);
@@ -394,7 +395,8 @@ test_plane_position_with_output(data_t *data, igt_crtc_t *crtc,
 		igt_assert_crc_equal(&data->ref_crc1, &crc);
 		igt_pipe_crc_stop(data->pipe_crc1);
 
-		for_each_plane_on_pipe(&data->display, crtc->pipe, plane)
+		for_each_plane_on_crtc(crtc,
+				       plane)
 			igt_plane_set_fb(plane, NULL);
 
 		igt_output_set_crtc(output, NULL);
diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index ac301924f937..6957defd1f3b 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -717,7 +717,6 @@ test_scaler_with_modifier_pipe(data_t *d,
 			       bool is_upscale, igt_crtc_t *crtc,
 			       igt_output_t *output)
 {
-	igt_display_t *display = &d->display;
 	unsigned format = DRM_FORMAT_XRGB8888;
 	igt_plane_t *plane;
 	uint32_t ret;
@@ -726,7 +725,7 @@ test_scaler_with_modifier_pipe(data_t *d,
 
 	igt_output_set_crtc(output, crtc);
 
-	for_each_plane_on_pipe(display, crtc->pipe, plane) {
+	for_each_plane_on_crtc(crtc, plane) {
 		if (plane->type == DRM_PLANE_TYPE_CURSOR)
 			continue;
 
@@ -755,7 +754,6 @@ test_scaler_with_rotation_pipe(data_t *d,
 			       bool is_upscale, igt_crtc_t *crtc,
 			       igt_output_t *output)
 {
-	igt_display_t *display = &d->display;
 	unsigned format = DRM_FORMAT_XRGB8888;
 	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
 	igt_plane_t *plane;
@@ -765,7 +763,7 @@ test_scaler_with_rotation_pipe(data_t *d,
 
 	igt_output_set_crtc(output, crtc);
 
-	for_each_plane_on_pipe(display, crtc->pipe, plane) {
+	for_each_plane_on_crtc(crtc, plane) {
 		if (plane->type == DRM_PLANE_TYPE_CURSOR)
 			continue;
 
@@ -793,7 +791,6 @@ test_scaler_with_pixel_format_pipe(data_t *d, double sf_plane,
 				   bool is_upscale, igt_crtc_t *crtc,
 				   igt_output_t *output)
 {
-	igt_display_t *display = &d->display;
 	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
 	igt_plane_t *plane;
 	uint32_t ret;
@@ -802,7 +799,7 @@ test_scaler_with_pixel_format_pipe(data_t *d, double sf_plane,
 
 	igt_output_set_crtc(output, crtc);
 
-	for_each_plane_on_pipe(display, crtc->pipe, plane) {
+	for_each_plane_on_crtc(crtc, plane) {
 		struct igt_vec tested_formats;
 
 		if (plane->type == DRM_PLANE_TYPE_CURSOR)
diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index 2fbcce6ad864..4f74170949e1 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -93,7 +93,7 @@ static void cleanup_pipe(igt_display_t *display, igt_crtc_t *crtc,
 {
 	igt_plane_t *plane;
 
-	for_each_plane_on_pipe(display, crtc->pipe, plane)
+	for_each_plane_on_crtc(crtc, plane)
 		igt_plane_set_fb(plane, NULL);
 
 	igt_output_set_crtc(output, NULL);
@@ -246,7 +246,7 @@ static void run_colorop_property_tests(igt_display_t *display,
 	prepare_pipe(display, crtc, output,
 		     &fb);
 
-	for_each_plane_on_pipe(display, crtc->pipe, plane) {
+	for_each_plane_on_crtc(crtc, plane) {
 		igt_info("Testing colorop properties on plane %s.#%d-%s (output: %s)\n",
 			 igt_crtc_name(crtc), plane->index,
 			 kmstest_plane_type_name(plane->type), output->name);
@@ -283,7 +283,7 @@ static void run_plane_property_tests(igt_display_t *display, igt_crtc_t *crtc,
 	prepare_pipe(display, crtc, output,
 		     &fb);
 
-	for_each_plane_on_pipe(display, crtc->pipe, plane) {
+	for_each_plane_on_crtc(crtc, plane) {
 		igt_info("Testing plane properties on %s.#%d-%s (output: %s)\n",
 			 igt_crtc_name(crtc), plane->index,
 			 kmstest_plane_type_name(plane->type), output->name);
@@ -528,8 +528,9 @@ static void test_object_invalid_properties(igt_display_t *display,
 				        DRM_MODE_OBJECT_CRTC, atomic);
 
 	for_each_crtc(display, crtc)
-		for_each_plane_on_pipe(display, crtc->pipe, plane)
+	{for_each_plane_on_crtc(crtc, plane)
 			test_invalid_properties(display->drm_fd, id, type, plane->drm_plane->plane_id, DRM_MODE_OBJECT_PLANE, atomic);
+	}
 
 	for_each_output(display, output)
 		test_invalid_properties(display->drm_fd, id, type, output->id, DRM_MODE_OBJECT_CONNECTOR, atomic);
@@ -936,8 +937,9 @@ static void invalid_properties(igt_display_t *display, bool atomic)
 				               DRM_MODE_OBJECT_CRTC, atomic);
 
 	for_each_crtc(display, crtc)
-		for_each_plane_on_pipe(display, crtc->pipe, plane)
+	{for_each_plane_on_crtc(crtc, plane)
 			test_object_invalid_properties(display, plane->drm_plane->plane_id, DRM_MODE_OBJECT_PLANE, atomic);
+	}
 
 	for_each_output(display, output)
 		test_object_invalid_properties(display, output->id, DRM_MODE_OBJECT_CONNECTOR, atomic);
diff --git a/tests/kms_rmfb.c b/tests/kms_rmfb.c
index 3055dd3b0fe8..80bd51bcb22c 100644
--- a/tests/kms_rmfb.c
+++ b/tests/kms_rmfb.c
@@ -104,7 +104,8 @@ test_rmfb(struct rmfb_data *data, igt_output_t *output, igt_crtc_t *crtc,
 	 * because most of the modeset operations must be fast
 	 * later on.
 	 */
-	for_each_plane_on_pipe(&data->display, crtc->pipe, plane) {
+	for_each_plane_on_crtc(crtc,
+			       plane) {
 		if (plane->type == DRM_PLANE_TYPE_CURSOR) {
 			igt_plane_set_fb(plane, &argb_fb);
 			igt_fb_set_size(&argb_fb, plane, cursor_width, cursor_height);
@@ -161,7 +162,8 @@ test_rmfb(struct rmfb_data *data, igt_output_t *output, igt_crtc_t *crtc,
 
 	drmModeFreeCrtc(drm_crtc);
 
-	for_each_plane_on_pipe(&data->display, crtc->pipe, plane) {
+	for_each_plane_on_crtc(crtc,
+			       plane) {
 		drmModePlanePtr planeres = drmModeGetPlane(data->drm_fd, plane->drm_plane->plane_id);
 
 		igt_assert_eq(planeres->fb_id, 0);
-- 
2.52.0

