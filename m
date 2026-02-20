Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 444F8C55ABE
	for <igt-dev@archiver.kernel.org>; Fri, 20 Feb 2026 14:03:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB0EA10E7DD;
	Fri, 20 Feb 2026 14:03:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kj0HGY18";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49F110E7E8
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 14:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771596209; x=1803132209;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=cR5SUZkQbYWgYXaGu9TREvxp/dmIOwVWtyywMPBWOwo=;
 b=Kj0HGY18Rk2v9o5NZu17EkXK16+tl2l3FHhIxCFLozGskkcRB2k2gcY1
 jg7VBrpaBhCwiNterdMPxxQPcQ0iogYSK0Sjr8ZHxIrRH93dmLpcd4CSv
 rHpeWiLapvbrYonw1oqd49pFKmataytFQ8/ibTwRCEQnD7Hf2Jfupgj1Q
 UeOmH1p5jRVPsGlHeaBoh1qySuKOsjTqkO7bNY4ORnCaf45TqYHVYsVLB
 9OgJJuaXHrKdnlcC4PI2QYnnXJiXZ/xZcr8S7CEenPxkSx1YF984k6LCX
 7XZF3Qr0vkLvrx2d1ytsAan+pHzngI6DEXgOoD691jyHRjQHEC9sbhOfR A==;
X-CSE-ConnectionGUID: EeDy0pjpRXig+7Pv6QiboA==
X-CSE-MsgGUID: Ko4Seyj2QsGcmzWUaweTpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="60261868"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="60261868"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 06:03:28 -0800
X-CSE-ConnectionGUID: aNUayQcLRlCZUDDz0fN6Kw==
X-CSE-MsgGUID: 11kT2AN+QBqEPS/IsXeOvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="213416368"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.247])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 06:03:26 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 21/21] tests/kms: Use igt_crtc_t instead of enum pipe,
 part 4
Date: Fri, 20 Feb 2026 16:01:53 +0200
Message-ID: <20260220140154.4138-22-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260220140154.4138-1-ville.syrjala@linux.intel.com>
References: <20260220140154.4138-1-ville.syrjala@linux.intel.com>
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

Convert several kms tests to use igt_crtc_t instead
of enum pipe. This covers the remaining simple
cases.

 #include "scripts/iterators.cocci"

@func1@
typedef igt_output_t;
typedef igt_crtc_t;
identifier FUNC, PIPE, CRTC;
parameter list[N] P;
@@
FUNC(P
-	,enum pipe PIPE
+	,igt_crtc_t *CRTC
	,...)
{
...
(
- igt_crtc_t *CRTC = igt_crtc_for_pipe(..., PIPE);
|
- igt_crtc_t *CRTC;
... when != PIPE = ...
- CRTC = igt_crtc_for_pipe(..., PIPE);
)
<... when != PIPE = ...
(
- igt_crtc_for_pipe(..., PIPE)
+ CRTC
|
- kmstest_pipe_name(PIPE)
+ igt_crtc_name(CRTC)
|
- PIPE
+ CRTC->pipe
)
...>
}

@depends on func1@
identifier func1.FUNC;
expression list[func1.N] EP;
expression PIPE;
@@
FUNC(EP
-	,PIPE
+	,igt_crtc_for_pipe(display, PIPE)
	,...)

@func2@
typedef igt_crtc_t;
identifier FUNC, PIPE;
parameter list[N] P;
@@
FUNC(P
-	,enum pipe PIPE
+	,igt_crtc_t *crtc
	,...)
{
<+... when != PIPE = ...
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
...+>
}

@depends on func2@
identifier func2.FUNC;
expression list[func2.N] EP;
expression PIPE;
@@
FUNC(EP
-	,PIPE
+	,igt_crtc_for_pipe(display, PIPE)
	,...)

@@
igt_crtc_t *CRTC;
@@
- igt_crtc_for_pipe(..., CRTC->pipe)
+ CRTC

@@
typedef igt_display_t;
identifier DISPLAY;
@@
- igt_display_t *DISPLAY = ...;
... when != DISPLAY

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/amdgpu/amd_cursor_overlay.c             | 14 ++--
 .../kms_chamelium_sharpness_filter.c          | 20 +++---
 tests/intel/kms_cdclk.c                       | 16 +++--
 tests/intel/kms_flip_tiling.c                 | 12 ++--
 tests/intel/kms_pipe_stress.c                 | 65 +++++++++++--------
 tests/kms_concurrent.c                        | 33 +++++-----
 tests/kms_content_protection.c                |  5 +-
 tests/kms_cursor_crc.c                        | 26 ++++----
 tests/kms_hdr.c                               | 28 ++++----
 tests/kms_plane_cursor.c                      |  8 +--
 10 files changed, 119 insertions(+), 108 deletions(-)

diff --git a/tests/amdgpu/amd_cursor_overlay.c b/tests/amdgpu/amd_cursor_overlay.c
index 8d3ef31c936f..73e1cbcc7919 100644
--- a/tests/amdgpu/amd_cursor_overlay.c
+++ b/tests/amdgpu/amd_cursor_overlay.c
@@ -84,12 +84,12 @@ typedef struct data {
 } data_t;
 
 /* Retuns the number of available overlay planes. */
-static int get_overlay_planes_count(igt_display_t *display, enum pipe pipe)
+static int get_overlay_planes_count(igt_display_t *display, igt_crtc_t *crtc)
 {
 	int count = 0;
 	igt_plane_t *plane;
 
-	for_each_plane_on_pipe(display, pipe, plane)
+	for_each_plane_on_pipe(display, crtc->pipe, plane)
 		if (plane->type == DRM_PLANE_TYPE_OVERLAY)
 			count++;
 
@@ -130,11 +130,9 @@ static bool can_support_all_overlay_planes(int available_overlay_planes, int fam
 }
 
 /* Common test setup. */
-static void test_init(data_t *data, enum pipe pipe_id, igt_output_t *output,
+static void test_init(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
 		      unsigned int flags, int available_overlay_planes)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe_id);
 	int i;
 
 	data->crtc = crtc;
@@ -487,7 +485,7 @@ int igt_main()
 					crtc);
 
 				available_overlay_planes = get_overlay_planes_count(display,
-										    crtc->pipe);
+										    crtc);
 
 				/* Require at least one overlay plane. */
 				if (!available_overlay_planes)
@@ -503,7 +501,9 @@ int igt_main()
 					igt_skip("%s subtest requires 3 overlay planes with a supported DCN.\n",
 						 tests[i].name);
 
-				test_init(&data, crtc->pipe, output,
+				test_init(&data,
+					  crtc,
+					  output,
 					  tests[i].flags,
 					  available_overlay_planes);
 
diff --git a/tests/chamelium/kms_chamelium_sharpness_filter.c b/tests/chamelium/kms_chamelium_sharpness_filter.c
index b7a70d4a2f15..a68b6c80ae16 100644
--- a/tests/chamelium/kms_chamelium_sharpness_filter.c
+++ b/tests/chamelium/kms_chamelium_sharpness_filter.c
@@ -38,10 +38,8 @@ typedef struct {
 	int port_count;
 } data_t;
 
-static bool pipe_output_combo_valid(data_t *data, enum pipe pipe)
+static bool pipe_output_combo_valid(data_t *data, igt_crtc_t *crtc)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	bool ret = true;
 
 	igt_output_set_crtc(data->output,
@@ -177,10 +175,8 @@ static void test_t(data_t *data, igt_plane_t *primary,
 		     "Observed: Frame[0]==Frame[1]: %d, Frame[1]==Frame[2]: %d, Frame[0]==Frame[2]: %d, Frame[1]==Frame[3]: %d\n", match[0], match[1], match[2], match[3]);
 }
 
-static int test_setup(data_t *data, enum pipe p)
+static int test_setup(data_t *data, igt_crtc_t *crtc)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, p);
 	int i = 0;
 
 	igt_display_reset(&data->display);
@@ -217,16 +213,15 @@ static int test_setup(data_t *data, enum pipe p)
 	return -1;
 }
 
-static void test_sharpness_filter(data_t *data,  enum pipe p)
+static void test_sharpness_filter(data_t *data, igt_crtc_t *crtc)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, p);
-	int port_idx = test_setup(data, crtc->pipe);
+	int port_idx = test_setup(data,
+				  crtc);
 
 	igt_require(port_idx >= 0);
 	igt_require(igt_crtc_has_prop(crtc, IGT_CRTC_SHARPNESS_STRENGTH));
 
-	if (!pipe_output_combo_valid(data, crtc->pipe))
+	if (!pipe_output_combo_valid(data, crtc))
 		return;
 
 	igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc), data->output->name)
@@ -243,7 +238,8 @@ run_sharpness_filter_test(data_t *data)
 	igt_subtest_with_dynamic("filter-basic") {
 		for_each_crtc(display, crtc) {
 			data->filter_strength = MID_FILTER_STRENGTH;
-			test_sharpness_filter(data, crtc->pipe);
+			test_sharpness_filter(data,
+					      crtc);
 		}
 	}
 }
diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
index eb8b79c447bc..9f2b81985361 100644
--- a/tests/intel/kms_cdclk.c
+++ b/tests/intel/kms_cdclk.c
@@ -128,10 +128,10 @@ static void do_cleanup_display(igt_display_t *dpy)
 	igt_display_commit2(dpy, dpy->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 }
 
-static void test_plane_scaling(data_t *data, enum pipe pipe, igt_output_t *output)
+static void test_plane_scaling(data_t *data, igt_crtc_t *crtc,
+			       igt_output_t *output)
 {
 	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	int cdclk_ref, cdclk_new;
 	struct igt_fb fb;
 	igt_plane_t *primary;
@@ -184,10 +184,10 @@ static void test_plane_scaling(data_t *data, enum pipe pipe, igt_output_t *outpu
 	}
 }
 
-static void test_mode_transition(data_t *data, enum pipe pipe, igt_output_t *output)
+static void test_mode_transition(data_t *data, igt_crtc_t *crtc,
+				 igt_output_t *output)
 {
 	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	int cdclk_ref, cdclk_new;
 	struct igt_fb fb;
 	igt_plane_t *primary;
@@ -338,9 +338,13 @@ static void run_cdclk_test(data_t *data, uint32_t flags)
 
 		igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc), output->name) {
 			if (flags & TEST_PLANESCALING)
-				test_plane_scaling(data, crtc->pipe, output);
+				test_plane_scaling(data,
+						   crtc,
+						   output);
 			if (flags & TEST_MODETRANSITION)
-				test_mode_transition(data, crtc->pipe, output);
+				test_mode_transition(data,
+						     crtc,
+						     output);
 		}
 	}
 }
diff --git a/tests/intel/kms_flip_tiling.c b/tests/intel/kms_flip_tiling.c
index 54446f2478ae..beb963287dba 100644
--- a/tests/intel/kms_flip_tiling.c
+++ b/tests/intel/kms_flip_tiling.c
@@ -67,13 +67,12 @@ static void pipe_crc_free(data_t *data)
 	data->pipe_crc = NULL;
 }
 
-static void pipe_crc_new(data_t *data, enum pipe pipe)
+static void pipe_crc_new(data_t *data, igt_crtc_t *crtc)
 {
-	igt_display_t *display = &data->display;
 	if (data->pipe_crc)
 		return;
 
-	data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, pipe),
+	data->pipe_crc = igt_crtc_crc_new(crtc,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 	igt_assert(data->pipe_crc);
 	igt_pipe_crc_start(data->pipe_crc);
@@ -108,7 +107,8 @@ static uint64_t pageflip_timeout_us(drmModeModeInfo *mode)
 }
 
 static void
-test_flip_tiling(data_t *data, enum pipe pipe, igt_output_t *output, uint64_t modifier[2])
+test_flip_tiling(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
+		 uint64_t modifier[2])
 {
 	drmModeModeInfo *mode;
 	igt_plane_t *primary;
@@ -139,7 +139,7 @@ test_flip_tiling(data_t *data, enum pipe pipe, igt_output_t *output, uint64_t mo
 	igt_require_f(try_commit(&data->display) == 0,
 		      "commit failed with " IGT_MODIFIER_FMT "\n",
 		      IGT_MODIFIER_ARGS(modifier[1]));
-	pipe_crc_new(data, pipe);
+	pipe_crc_new(data, crtc);
 	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &reference_crc);
 
 	/* Commit the first fb. */
@@ -266,7 +266,7 @@ int igt_main()
 						      igt_fb_modifier_name(modifier[0]),
 						      igt_fb_modifier_name(modifier[1]))
 						test_flip_tiling(&data,
-								 crtc->pipe,
+								 crtc,
 								 output,
 								 modifier);
 
diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
index 47e7524c6aa4..7b7a65ff5630 100644
--- a/tests/intel/kms_pipe_stress.c
+++ b/tests/intel/kms_pipe_stress.c
@@ -315,22 +315,22 @@ static void *gpu_load(void *ptr)
 	return NULL;
 }
 
-static inline uint32_t pipe_select(enum pipe pipe)
+static inline uint32_t pipe_select(igt_crtc_t *crtc)
 {
-	if (pipe > 1)
-		return pipe << DRM_VBLANK_HIGH_CRTC_SHIFT;
-	else if (pipe > 0)
+	if (crtc->pipe > 1)
+		return crtc->pipe << DRM_VBLANK_HIGH_CRTC_SHIFT;
+	else if (crtc->pipe > 0)
 		return DRM_VBLANK_SECONDARY;
 	else
 		return 0;
 }
 
-static unsigned get_vblank(int fd, enum pipe pipe, unsigned flags)
+static unsigned get_vblank(int fd, igt_crtc_t *crtc, unsigned flags)
 {
 	union drm_wait_vblank vbl;
 
 	memset(&vbl, 0, sizeof(vbl));
-	vbl.request.type = DRM_VBLANK_RELATIVE | pipe_select(pipe) | flags;
+	vbl.request.type = DRM_VBLANK_RELATIVE | pipe_select(crtc) | flags;
 	if (drmIoctl(fd, DRM_IOCTL_WAIT_VBLANK, &vbl))
 		return 0;
 
@@ -338,10 +338,8 @@ static unsigned get_vblank(int fd, enum pipe pipe, unsigned flags)
 }
 
 static int commit_mode(struct data *data, igt_output_t *output,
-		       enum pipe pipe, drmModeModeInfo *mode)
+		       igt_crtc_t *crtc, drmModeModeInfo *mode)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	int ret;
 
 	igt_output_override_mode(output, mode);
@@ -403,20 +401,21 @@ static int try_plane_scaling(struct data *data, igt_plane_t *plane,
 	return ret;
 }
 
-static void cleanup_plane_fbs(struct data *data, enum pipe pipe, int start, int end)
+static void cleanup_plane_fbs(struct data *data, igt_crtc_t *crtc, int start,
+			      int end)
 {
 	int i = start;
 
 	while (i < end) {
 		igt_remove_fb(data->display.drm_fd,
-			      &data->fb[pipe * MAX_PLANES + i]);
-		data->fb[pipe * MAX_PLANES + i].fb_id = 0;
+			      &data->fb[crtc->pipe * MAX_PLANES + i]);
+		data->fb[crtc->pipe * MAX_PLANES + i].fb_id = 0;
 		i++;
 	}
 }
 
 static int pipe_stress(struct data *data, igt_output_t *output,
-		       enum pipe pipe, drmModeModeInfo *mode)
+		       igt_crtc_t *crtc, drmModeModeInfo *mode)
 {
 	igt_plane_t *plane;
 	int i = 0;
@@ -430,13 +429,14 @@ static int pipe_stress(struct data *data, igt_output_t *output,
 	if (!mode)
 		mode = igt_output_get_mode(output);
 
-	if (data->last_mode[pipe] != mode) {
-		ret = commit_mode(data, output, pipe, mode);
+	if (data->last_mode[crtc->pipe] != mode) {
+		ret = commit_mode(data, output,
+				  crtc, mode);
 
 		if (!ret)
 			return ret;
 
-		data->last_mode[pipe] = mode;
+		data->last_mode[crtc->pipe] = mode;
 		new_mode = true;
 	}
 
@@ -444,18 +444,20 @@ static int pipe_stress(struct data *data, igt_output_t *output,
 	 * Looks like we can't have planes on that pipe at all
 	 * or mode hasn't changed
 	 */
-	if (!data->num_planes[pipe] || !new_mode)
+	if (!data->num_planes[crtc->pipe] || !new_mode)
 		return 0;
 
-	for_each_plane_on_pipe(&data->display, pipe, plane) {
+	for_each_plane_on_pipe(&data->display, crtc->pipe, plane) {
 		int plane_width, plane_height;
 		if (plane->type == DRM_PLANE_TYPE_CURSOR) {
-			cursor_plane_set_fb(plane, &data->cursor_fb[pipe],
+			cursor_plane_set_fb(plane,
+					    &data->cursor_fb[crtc->pipe],
 					    cursor_width, cursor_height);
 			plane_width = cursor_width;
 			plane_height = cursor_height;
 		} else {
-			universal_plane_set_fb(plane, &data->fb[pipe * MAX_PLANES + i],
+			universal_plane_set_fb(plane,
+					       &data->fb[crtc->pipe * MAX_PLANES + i],
 					       mode->hdisplay, mode->vdisplay);
 
 			plane_width = (mode->hdisplay * 3) / 4;
@@ -476,19 +478,24 @@ static int pipe_stress(struct data *data, igt_output_t *output,
 					 plane->index, plane_width, plane_height);
 			}
 			if (ret) {
-				igt_info("Plane %d pipe %d try commit failed, exiting\n", i, pipe);
-				data->num_planes[pipe] = i;
-				igt_info("Max num planes for pipe %d set to %d\n", pipe, i);
+				igt_info("Plane %d pipe %d try commit failed, exiting\n", i,
+					 crtc->pipe);
+				data->num_planes[crtc->pipe] = i;
+				igt_info("Max num planes for pipe %d set to %d\n",
+					 crtc->pipe, i);
 				/*
 				 * We have now determined max amount of full sized planes, we will just
 				 * keep it in mind and be smarter next time. Also lets remove unneeded fbs.
 				 * Don't destroy cursor_fb as will take care about it at the end.
 				 */
 				igt_plane_set_fb(plane, NULL);
-				cleanup_plane_fbs(data, pipe, i, MAX_PLANES);
+				cleanup_plane_fbs(data,
+						  crtc,
+						  i,
+						  MAX_PLANES);
 			}
 
-			if (++i >= data->num_planes[pipe])
+			if (++i >= data->num_planes[crtc->pipe])
 				break;
 		}
 	}
@@ -595,14 +602,16 @@ static void stress_pipes(struct data *data, struct timespec *start,
 			     "Currently we don't support more than %d planes!",
 			     MAX_PLANES);
 
-		ret = pipe_stress(data, output, pipe,
-				 data->highest_mode[pipe]);
+		ret = pipe_stress(data, output,
+				  igt_crtc_for_pipe(display, pipe),
+				  data->highest_mode[pipe]);
 		if (ret)
 			break;
 
 		igt_pipe_crc_start(data->pipe_crc[pipe]);
 		igt_pipe_crc_get_current(data->display.drm_fd, data->pipe_crc[pipe], &crc);
-		get_vblank(data->display.drm_fd, pipe,
+		get_vblank(data->display.drm_fd,
+			   igt_crtc_for_pipe(display, pipe),
 			   DRM_VBLANK_NEXTONMISS);
 		igt_pipe_crc_get_current(data->display.drm_fd, data->pipe_crc[pipe], &crc2);
 		igt_pipe_crc_stop(data->pipe_crc[pipe]);
diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index f31992a514a0..158a13923f82 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -154,11 +154,9 @@ create_fb_for_mode_position(data_t *data, drmModeModeInfo *mode,
 }
 
 static void
-prepare_planes(data_t *data, enum pipe pipe, int max_planes,
+prepare_planes(data_t *data, igt_crtc_t *crtc, int max_planes,
 	       igt_output_t *output)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	drmModeModeInfo *mode;
 	igt_plane_t *primary;
 	int *x;
@@ -228,11 +226,10 @@ prepare_planes(data_t *data, enum pipe pipe, int max_planes,
 }
 
 static void
-test_plane_position_with_output(data_t *data, enum pipe pipe, int max_planes,
+test_plane_position_with_output(data_t *data, igt_crtc_t *crtc,
+				int max_planes,
 				igt_output_t *output)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	int i;
 	int iterations = opt.iterations < 1 ? max_planes : opt.iterations;
 	bool loop_forever = opt.iterations == LOOP_FOREVER ? true : false;
@@ -242,7 +239,8 @@ test_plane_position_with_output(data_t *data, enum pipe pipe, int max_planes,
 
 	i = 0;
 	while (i < iterations || loop_forever) {
-		prepare_planes(data, crtc->pipe, max_planes, output);
+		prepare_planes(data, crtc,
+			       max_planes, output);
 		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
 
 		for (int c = 0; c < max_planes; c++)
@@ -277,10 +275,9 @@ get_lowres_mode(data_t *data, const drmModeModeInfo *mode_default,
 }
 
 static void
-test_resolution_with_output(data_t *data, enum pipe pipe, int max_planes, igt_output_t *output)
+test_resolution_with_output(data_t *data, igt_crtc_t *crtc, int max_planes,
+			    igt_output_t *output)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	int iterations = opt.iterations < 1 ? max_planes : opt.iterations;
 	bool loop_forever = opt.iterations == LOOP_FOREVER ? true : false;
 	int i;
@@ -312,10 +309,8 @@ test_resolution_with_output(data_t *data, enum pipe pipe, int max_planes, igt_ou
 }
 
 static void
-run_test(data_t *data, enum pipe pipe, igt_output_t *output)
+run_test(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	int n_planes = crtc->n_planes;
 	igt_display_reset(&data->display);
 
@@ -330,11 +325,15 @@ run_test(data_t *data, enum pipe pipe, igt_output_t *output)
 	test_init(data, n_planes, output);
 
 	igt_fork(child, 1) {
-		test_plane_position_with_output(data, crtc->pipe, n_planes,
+		test_plane_position_with_output(data,
+						crtc,
+						n_planes,
 						output);
 	}
 
-	test_resolution_with_output(data, crtc->pipe, n_planes, output);
+	test_resolution_with_output(data,
+				    crtc,
+				    n_planes, output);
 
 	igt_waitchildren();
 
@@ -361,7 +360,9 @@ run_tests_for_pipe(data_t *data)
 			igt_require(crtc->n_planes > 0);
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 				      igt_output_name(output))
-				run_test(data, crtc->pipe, output);
+				run_test(data,
+					 crtc,
+					 output);
 		}
 	}
 }
diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 37c439af7455..2c2ffa150c41 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -444,12 +444,11 @@ static bool write_srm_as_fw(const __u8 *srm, int len)
 }
 
 static void test_content_protection_on_output(igt_output_t *output,
-					      enum pipe pipe,
+					      igt_crtc_t *crtc,
 					      enum igt_commit_style commit_style,
 					      int content_type)
 {
 	igt_display_t *display = &data.display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	bool ret;
 
 	test_cp_enable_with_retry(output, commit_style, 3, content_type, false,
@@ -747,7 +746,7 @@ test_content_protection(enum igt_commit_style commit_style, int content_type)
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 				      output->name)
 				test_content_protection_on_output(output,
-								  crtc->pipe,
+								  crtc,
 								  commit_style,
 								  content_type);
 
diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index b6b155130edb..bd0226c4800f 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -897,15 +897,15 @@ static bool valid_pipe_output_combo(data_t *data)
 	return ret;
 }
 
-static bool execution_constraint(enum pipe pipe)
+static bool execution_constraint(igt_crtc_t *crtc)
 {
 	if (!extended &&
-	    pipe != active_pipes[0] &&
-	    pipe != active_pipes[last_pipe])
+	    crtc->pipe != active_pipes[0] &&
+	    crtc->pipe != active_pipes[last_pipe])
 		return true;
 
 	if (!extended && igt_run_in_simulation() &&
-	    pipe != active_pipes[0])
+	    crtc->pipe != active_pipes[0])
 		return true;
 
 	return false;
@@ -1008,7 +1008,7 @@ static void run_size_tests(data_t *data, int w, int h)
 
 			for_each_crtc_with_single_output(&data->display, crtc,
 							 data->output) {
-				if (execution_constraint(crtc->pipe))
+				if (execution_constraint(crtc))
 					continue;
 
 				data->crtc = crtc;
@@ -1049,7 +1049,7 @@ static void run_tests_on_pipe(data_t *data)
 	igt_subtest_with_dynamic("cursor-size-change") {
 		for_each_crtc_with_single_output(&data->display, crtc,
 						 data->output) {
-			if (execution_constraint(crtc->pipe))
+			if (execution_constraint(crtc))
 				continue;
 
 			data->crtc = crtc;
@@ -1070,7 +1070,7 @@ static void run_tests_on_pipe(data_t *data)
 	igt_subtest_with_dynamic("cursor-alpha-opaque") {
 		for_each_crtc_with_single_output(&data->display, crtc,
 						 data->output) {
-			if (execution_constraint(crtc->pipe))
+			if (execution_constraint(crtc))
 				continue;
 
 			data->crtc = crtc;
@@ -1091,7 +1091,7 @@ static void run_tests_on_pipe(data_t *data)
 	igt_subtest_with_dynamic("cursor-alpha-transparent") {
 		for_each_crtc_with_single_output(&data->display, crtc,
 						 data->output) {
-			if (execution_constraint(crtc->pipe))
+			if (execution_constraint(crtc))
 				continue;
 
 			data->crtc = crtc;
@@ -1121,7 +1121,7 @@ static void run_tests_on_pipe(data_t *data)
 	igt_subtest_with_dynamic("cursor-tearing-framebuffer-change") {
 		for_each_crtc_with_single_output(&data->display, crtc,
 						 data->output) {
-			if (execution_constraint(crtc->pipe))
+			if (execution_constraint(crtc))
 				continue;
 
 			data->crtc = crtc;
@@ -1141,7 +1141,7 @@ static void run_tests_on_pipe(data_t *data)
 	igt_subtest_with_dynamic("cursor-tearing-position-change") {
 		for_each_crtc_with_single_output(&data->display, crtc,
 						 data->output) {
-			if (execution_constraint(crtc->pipe))
+			if (execution_constraint(crtc))
 				continue;
 
 			data->crtc = crtc;
@@ -1168,7 +1168,7 @@ static void run_tests_on_pipe(data_t *data)
 	igt_subtest_with_dynamic("cursor-dpms") {
 		for_each_crtc_with_single_output(&data->display, crtc,
 						 data->output) {
-			if (execution_constraint(crtc->pipe))
+			if (execution_constraint(crtc))
 				continue;
 
 			data->crtc = crtc;
@@ -1190,7 +1190,7 @@ static void run_tests_on_pipe(data_t *data)
 	igt_subtest_with_dynamic("cursor-suspend") {
 		for_each_crtc_with_single_output(&data->display, crtc,
 						 data->output) {
-			if (execution_constraint(crtc->pipe))
+			if (execution_constraint(crtc))
 				continue;
 
 			data->crtc = crtc;
@@ -1215,7 +1215,7 @@ static void run_tests_on_pipe(data_t *data)
 	igt_subtest_with_dynamic("cursor-size-hints") {
 		for_each_crtc_with_single_output(&data->display, crtc,
 						 data->output) {
-			if (execution_constraint(crtc->pipe))
+			if (execution_constraint(crtc))
 				continue;
 
 			data->crtc = crtc;
diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index 0addd72a0472..5a2e3f1cfdcc 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -202,10 +202,9 @@ static void set_hdr_output_metadata(data_t *data,
 }
 
 /* Prepare test data. */
-static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
+static void prepare_test(data_t *data, igt_output_t *output, igt_crtc_t *crtc)
 {
 	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 
 	data->crtc = crtc;
 	igt_assert(data->crtc);
@@ -232,12 +231,11 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 	data->h = data->mode->vdisplay;
 }
 
-static void test_bpc_switch_on_output(data_t *data, enum pipe pipe,
+static void test_bpc_switch_on_output(data_t *data, igt_crtc_t *crtc,
 				      igt_output_t *output,
 				      uint32_t flags)
 {
 	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	igt_crc_t ref_crc, new_crc;
 	igt_fb_t afb;
 	int afb_id, ret;
@@ -336,7 +334,8 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
 				continue;
 			}
 
-			prepare_test(data, output, crtc->pipe);
+			prepare_test(data, output,
+				     crtc);
 
 			if (is_intel_device(data->fd) &&
 			    !igt_max_bpc_constraint(display, crtc->pipe, output, 10)) {
@@ -353,7 +352,8 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
 
 			igt_dynamic_f("pipe-%s-%s",
 				      igt_crtc_name(crtc), output->name)
-				test_bpc_switch_on_output(data, crtc->pipe,
+				test_bpc_switch_on_output(data,
+							  crtc,
 							  output, flags);
 
 			/* One pipe is enough */
@@ -470,12 +470,11 @@ static void adjust_brightness(data_t *data, uint32_t flags)
 	igt_assert_eq(igt_backlight_write(context.old, "brightness", &context), 0);
 }
 
-static void test_static_toggle(data_t *data, enum pipe pipe,
+static void test_static_toggle(data_t *data, igt_crtc_t *crtc,
 			       igt_output_t *output,
 			       uint32_t flags)
 {
 	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	struct hdr_output_metadata hdr;
 	igt_crc_t ref_crc, new_crc;
 	igt_fb_t afb;
@@ -584,10 +583,10 @@ static void fill_hdr_output_metadata_sdr(struct hdr_output_metadata *meta)
 	meta->hdmi_metadata_type1.max_cll = 0;
 }
 
-static void test_static_swap(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
+static void test_static_swap(data_t *data, igt_crtc_t *crtc,
+			     igt_output_t *output, uint32_t flags)
 {
 	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	igt_crc_t ref_crc, new_crc;
 	igt_fb_t afb;
 	int afb_id;
@@ -748,7 +747,8 @@ static void test_hdr(data_t *data, uint32_t flags)
 				continue;
 			}
 
-			prepare_test(data, output, crtc->pipe);
+			prepare_test(data, output,
+				     crtc);
 
 			/* Signal HDR requirement via metadata */
 			fill_hdr_output_metadata_st2084(&hdr);
@@ -787,10 +787,12 @@ static void test_hdr(data_t *data, uint32_t flags)
 				      igt_crtc_name(crtc), output->name) {
 				if (flags & (TEST_NONE | TEST_DPMS | TEST_SUSPEND |
 					     TEST_INVALID_HDR | TEST_BRIGHTNESS))
-					test_static_toggle(data, crtc->pipe,
+					test_static_toggle(data,
+							   crtc,
 							   output, flags);
 				if (flags & TEST_SWAP)
-					test_static_swap(data, crtc->pipe,
+					test_static_swap(data,
+							 crtc,
 							 output, flags);
 				if (flags & TEST_INVALID_METADATA_SIZES)
 					test_invalid_metadata_sizes(data, output);
diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index bf0f89844595..4b69f1a17e24 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -89,11 +89,9 @@ typedef struct data {
 } data_t;
 
 /* Common test setup. */
-static void test_init(data_t *data, enum pipe pipe_id, igt_output_t *output,
+static void test_init(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
 		      unsigned int flags)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe_id);
 	data->crtc = crtc;
 	data->output = output;
 
@@ -343,7 +341,9 @@ int igt_main()
 				if (!intel_pipe_output_combo_valid(display))
 					continue;
 
-				test_init(&data, crtc->pipe, output,
+				test_init(&data,
+					  crtc,
+					  output,
 					  tests[i].flags);
 
 				for (j = 0; j < ARRAY_SIZE(cursor_sizes); j++) {
-- 
2.52.0

