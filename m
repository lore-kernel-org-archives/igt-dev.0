Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E485ECD6C5
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 16:35:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF0710E631;
	Wed, 11 Feb 2026 16:35:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Msi7ET4o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D290B10E63C
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Feb 2026 16:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770827700; x=1802363700;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=TSEnvEi25GoS5MuadjKV9Dj8e2ci7T+NaIGWqkvcrOk=;
 b=Msi7ET4oGTF9RpGTpAbIG18AAHvLZD1SyD5WU1b3gTrs8n+MXV/8FWUG
 YCJKtXFNUXwL0IPHIgG0Ssjt6ZYnMlQQBZAOxTrmQLsscSUNRuMlXFXvS
 BveRhegWP2GTjAXpaNkKaGo15r+XSBdWMlhkcZgfLo8LOYOxIP0zqK0VH
 J9zmHmEFIcPNwF85LJ8pg4nnDhU5w8xZwsUviDsVI/JnjA2OgTclHvy+O
 CaEHu6nU33ahAEzGLLsaixu+eRHPFE2kcQleqsC1c0EKXPa0hVqU0blI2
 mcW4m7NOSN02EB/3Z0fELSKDW08L2FxOAtaZ8bABaXAST91rKs6UMNZhm A==;
X-CSE-ConnectionGUID: MDfv/oB3QWyDhw5n0f1VEg==
X-CSE-MsgGUID: BoNwdxePTB6mLsZAnhc2Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="71879792"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="71879792"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 08:34:58 -0800
X-CSE-ConnectionGUID: Vj5qOQLzQ3ixlSxMiPM3PA==
X-CSE-MsgGUID: Gov+j0U3RTmsTplVB8Ektw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="212394236"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.23])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 08:34:54 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 11/17] tests/kms_plane: Use igt_crtc_t instead of enum
 pipe
Date: Wed, 11 Feb 2026 18:33:58 +0200
Message-ID: <20260211163404.2018-12-ville.syrjala@linux.intel.com>
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
tests/kms_plane.

The use of function pointers makes this a bit more
complicated than your average test.

 #include "scripts/iterators.cocci"

@@
typedef igt_crtc_t;
typedef igt_display_t;
identifier DISPLAY, PIPE;
expression E;
constant P;
@@
{...
igt_display_t *DISPLAY = E;
...
- enum pipe PIPE = P;
+ igt_crtc_t *crtc = igt_crtc_for_pipe(DISPLAY, P);
<+... when != PIPE = ...
(
- PIPE
+ crtc->pipe
)
...+>
}

@func@
typedef igt_crtc_t;
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
expression list[func.N] EP;
expression PIPE;
@@
FUNC(EP
-    ,PIPE
+    ,igt_crtc_for_pipe(display, PIPE)
   ,...)

@func_ptr@
identifier FUNC;
parameter list[N] P;
type T;
@@
run_test(...,	T (*FUNC)(P
-	   ,enum pipe
+	   ,igt_crtc_t *crtc
	      ,...), ...)
{...}

@depends on func_ptr@
identifier func_ptr.FUNC;
expression list[func_ptr.N] EP;
expression PIPE;
@@
FUNC(EP
-	,PIPE
+	,igt_crtc_for_pipe(display, PIPE)
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
igt_crtc_t *CRTC;
@@
- igt_crtc_for_pipe(..., CRTC->pipe)
+ CRTC

@@
identifier DISPLAY;
expression E;
@@
{...
- igt_display_t *DISPLAY = E;
... when != DISPLAY
}

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_plane.c | 179 ++++++++++++++++++++++++++--------------------
 1 file changed, 101 insertions(+), 78 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 1ce3d98041ec..46459383d3c5 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -145,10 +145,8 @@ static color_t blue  = { 0.0f, 0.0f, 1.0f };
 /*
  * Common code across all tests, acting on data_t
  */
-static void test_init(data_t *data, enum pipe pipe)
+static void test_init(data_t *data, igt_crtc_t *crtc)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	igt_require(crtc->n_planes > 0);
 	if (data->pipe_crc)
 		igt_pipe_crc_free(data->pipe_crc);
@@ -231,11 +229,9 @@ create_fb_for_mode(data_t *data, drmModeModeInfo *mode,
 }
 
 static void
-test_grab_crc(data_t *data, igt_output_t *output, enum pipe pipe,
+test_grab_crc(data_t *data, igt_output_t *output, igt_crtc_t *crtc,
 	      color_t *fb_color, unsigned int flags, igt_crc_t *crc /* out */)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	struct igt_fb fb;
 	drmModeModeInfo *mode;
 	igt_plane_t *primary;
@@ -303,15 +299,12 @@ typedef struct {
 } test_position_t;
 
 static void
-test_plane_position_with_output(data_t *data,
-				enum pipe pipe,
+test_plane_position_with_output(data_t *data, igt_crtc_t *crtc,
 				int plane,
 				igt_output_t *output,
 				igt_crc_t *reference_crc,
 				unsigned int flags)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	rectangle_t rect = { .x = 100, .y = 100, .color = { 0.0, 0.0, 0.0 }};
 	igt_plane_t *primary, *sprite;
 	struct igt_fb primary_fb, sprite_fb;
@@ -385,10 +378,8 @@ test_plane_position_with_output(data_t *data,
 }
 
 static void
-test_plane_position(data_t *data, enum pipe pipe)
+test_plane_position(data_t *data, igt_crtc_t *crtc)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	int n_planes = crtc->n_planes;
 	igt_output_t *output = data->output;
 	igt_crc_t reference_crc;
@@ -396,13 +387,15 @@ test_plane_position(data_t *data, enum pipe pipe)
 	igt_info("Using (pipe %s + %s) to run the subtest.\n",
 		 igt_crtc_name(crtc), igt_output_name(output));
 
-	test_init(data, crtc->pipe);
-	test_grab_crc(data, output, crtc->pipe, &green, data->flags,
+	test_init(data, crtc);
+	test_grab_crc(data, output, crtc,
+		      &green, data->flags,
 		      &reference_crc);
 
 	for (int plane = 1; plane < n_planes; plane++) {
 		igt_dynamic_f("pipe-%s-plane-%d", igt_crtc_name(crtc), plane)
-			test_plane_position_with_output(data, crtc->pipe,
+			test_plane_position_with_output(data,
+							crtc,
 							plane, output,
 							&reference_crc, data->flags);
 	}
@@ -450,14 +443,11 @@ create_fb_for_mode_panning(data_t *data, drmModeModeInfo *mode,
 }
 
 static void
-test_plane_panning_with_output(data_t *data,
-			       enum pipe pipe,
+test_plane_panning_with_output(data_t *data, igt_crtc_t *crtc,
 			       igt_output_t *output,
 			       igt_crc_t *ref_crc,
 			       unsigned int flags)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	igt_plane_t *primary;
 	struct igt_fb primary_fb;
 	drmModeModeInfo *mode;
@@ -500,7 +490,7 @@ test_plane_panning_with_output(data_t *data,
 }
 
 static void
-test_plane_panning(data_t *data, enum pipe pipe)
+test_plane_panning(data_t *data, igt_crtc_t *crtc)
 {
 	bool mode_found = false;
 	uint64_t mem_size = 0;
@@ -508,9 +498,9 @@ test_plane_panning(data_t *data, enum pipe pipe)
 	igt_crc_t ref_crc;
 
 	igt_info("Using (pipe %s + %s) to run the subtest.\n",
-		 kmstest_pipe_name(pipe), igt_output_name(output));
+		 igt_crtc_name(crtc), igt_output_name(output));
 
-	test_init(data, pipe);
+	test_init(data, crtc);
 
 	if (is_i915_device(data->drm_fd)) {
 		for_each_memory_region(r, data->drm_fd)
@@ -548,11 +538,20 @@ test_plane_panning(data_t *data, enum pipe pipe)
 	igt_require_f(mode_found, "All connector modes are skipped due to low memory\n");
 
 	if (data->flags & TEST_PANNING_TOP_LEFT)
-		test_grab_crc(data, output, pipe, &red, data->flags, &ref_crc);
+		test_grab_crc(data, output,
+			      crtc, &red,
+			      data->flags,
+			      &ref_crc);
 	else
-		test_grab_crc(data, output, pipe, &blue, data->flags, &ref_crc);
+		test_grab_crc(data, output,
+			      crtc, &blue,
+			      data->flags,
+			      &ref_crc);
 
-	test_plane_panning_with_output(data, pipe, output, &ref_crc, data->flags);
+	test_plane_panning_with_output(data,
+				       crtc,
+				       output, &ref_crc,
+				       data->flags);
 
 	test_fini(data);
 }
@@ -575,11 +574,9 @@ static const color_t colors_reduced[] = {
 	{ 0.0f, 1.0f, 1.0f, },
 };
 
-static void set_legacy_lut(data_t *data, enum pipe pipe,
+static void set_legacy_lut(data_t *data, igt_crtc_t *crtc,
 			   uint16_t mask)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	drmModeCrtc *drm_crtc;
 	uint16_t *lut;
 	int i, lut_size;
@@ -603,11 +600,9 @@ static void set_legacy_lut(data_t *data, enum pipe pipe,
 	free(lut);
 }
 
-static bool set_c8_legacy_lut(data_t *data, enum pipe pipe,
+static bool set_c8_legacy_lut(data_t *data, igt_crtc_t *crtc,
 			      uint16_t mask)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	drmModeCrtc *drm_crtc;
 	uint16_t *r, *g, *b;
 	int i, lut_size;
@@ -745,7 +740,7 @@ static void capture_crc(data_t *data, unsigned int vblank, igt_crc_t *crc)
 		      crc->frame, vblank);
 }
 
-static void capture_format_crcs_single(data_t *data, enum pipe pipe,
+static void capture_format_crcs_single(data_t *data, igt_crtc_t *crtc,
 				       igt_plane_t *plane,
 				       uint32_t format, uint64_t modifier,
 				       int width, int height,
@@ -767,7 +762,7 @@ static void capture_format_crcs_single(data_t *data, enum pipe pipe,
 	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &crc[0]);
 }
 
-static void capture_format_crcs_multiple(data_t *data, enum pipe pipe,
+static void capture_format_crcs_multiple(data_t *data, igt_crtc_t *crtc,
 					 igt_plane_t *plane,
 					 uint32_t format, uint64_t modifier,
 					 int width, int height,
@@ -837,7 +832,9 @@ restart_round:
 			 * is when the next flip latches.
 			 */
 			if (i >= 1)
-				vblank[i - 1] = kmstest_get_vblank(data->drm_fd, pipe, 0) + 1;
+				vblank[i - 1] = kmstest_get_vblank(data->drm_fd,
+								   crtc->pipe,
+								   0) + 1;
 
 			/*
 			 * Can't use drmModePageFlip() since we need to
@@ -848,9 +845,7 @@ restart_round:
 
 			/* setplane for the cursor does not block */
 			if (plane->type == DRM_PLANE_TYPE_CURSOR) {
-				igt_display_t *display = &data->display;
-
-				igt_wait_for_vblank(igt_crtc_for_pipe(display, pipe));
+				igt_wait_for_vblank(crtc);
 			}
 		}
 
@@ -875,7 +870,8 @@ restart_round:
 		 * The last crc is available earliest one
 		 * frame after the last flip latched.
 		 */
-		vblank[i - 1] = kmstest_get_vblank(data->drm_fd, pipe, 0) + 1;
+		vblank[i - 1] = kmstest_get_vblank(data->drm_fd, crtc->pipe,
+						   0) + 1;
 	}
 
 	/*
@@ -894,7 +890,7 @@ static bool use_multiple_colors(data_t *data, uint32_t format)
 	return data->extended || igt_format_is_yuv_semiplanar(format);
 }
 
-static bool test_format_plane_colors(data_t *data, enum pipe pipe,
+static bool test_format_plane_colors(data_t *data, igt_crtc_t *crtc,
 				     igt_plane_t *plane,
 				     uint32_t format, uint64_t modifier,
 				     int width, int height,
@@ -910,12 +906,18 @@ static bool test_format_plane_colors(data_t *data, enum pipe pipe,
 	int i, total_crcs = 1;
 
 	if (use_multiple_colors(data, format)) {
-		capture_format_crcs_multiple(data, pipe, plane, format, modifier,
+		capture_format_crcs_multiple(data,
+					     crtc,
+					     plane, format,
+					     modifier,
 					     width, height, encoding, range, crc,
 					     fb);
 		total_crcs = data->num_colors;
 	} else {
-		capture_format_crcs_single(data, pipe, plane, format, modifier,
+		capture_format_crcs_single(data,
+					   crtc,
+					   plane, format,
+					   modifier,
 					   width, height, encoding, range, crc,
 					   fb);
 	}
@@ -930,14 +932,14 @@ static bool test_format_plane_colors(data_t *data, enum pipe pipe,
 
 	igt_warn_on_f(crc_mismatch_count,
 		      "CRC mismatches with format " IGT_FORMAT_FMT " on %s.%u with %d/%d solid colors tested (0x%X)\n",
-		      IGT_FORMAT_ARGS(format), kmstest_pipe_name(pipe),
+		      IGT_FORMAT_ARGS(format), igt_crtc_name(crtc),
 		      plane->index, crc_mismatch_count, data->num_colors,
 		      crc_mismatch_mask);
 
 	return result;
 }
 
-static bool test_format_plane_rgb(data_t *data, enum pipe pipe,
+static bool test_format_plane_rgb(data_t *data, igt_crtc_t *crtc,
 				  igt_plane_t *plane,
 				  uint32_t format, uint64_t modifier,
 				  int width, int height,
@@ -946,9 +948,11 @@ static bool test_format_plane_rgb(data_t *data, enum pipe pipe,
 {
 	igt_info("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
 		 IGT_FORMAT_ARGS(format), IGT_MODIFIER_ARGS(modifier),
-		 kmstest_pipe_name(pipe), plane->index);
+		 igt_crtc_name(crtc), plane->index);
 
-	return test_format_plane_colors(data, pipe, plane,
+	return test_format_plane_colors(data,
+					crtc,
+					plane,
 					format, modifier,
 					width, height,
 					IGT_COLOR_YCBCR_BT601,
@@ -956,7 +960,7 @@ static bool test_format_plane_rgb(data_t *data, enum pipe pipe,
 					ref_crc, fb);
 }
 
-static bool test_format_plane_yuv(data_t *data, enum pipe pipe,
+static bool test_format_plane_yuv(data_t *data, igt_crtc_t *crtc,
 				  igt_plane_t *plane,
 				  uint32_t format, uint64_t modifier,
 				  int width, int height,
@@ -991,10 +995,12 @@ static bool test_format_plane_yuv(data_t *data, enum pipe pipe,
 				 IGT_MODIFIER_ARGS(modifier),
 				 igt_color_encoding_to_str(e),
 				 igt_color_range_to_str(r),
-				 kmstest_pipe_name(pipe),
+				 igt_crtc_name(crtc),
 				 plane->index);
 
-			result &= test_format_plane_colors(data, pipe, plane,
+			result &= test_format_plane_colors(data,
+							   crtc,
+							   plane,
 							   format, modifier,
 							   width, height,
 							   e, r, ref_crc, fb);
@@ -1090,7 +1096,7 @@ static bool skip_format_mod(data_t *data,
 	return false;
 }
 
-static void test_format_plane(data_t *data, enum pipe pipe,
+static void test_format_plane(data_t *data, igt_crtc_t *crtc,
 			      igt_output_t *output, igt_plane_t *plane, igt_fb_t *primary_fb)
 {
 	struct igt_fb fb = {};
@@ -1141,22 +1147,28 @@ static void test_format_plane(data_t *data, enum pipe pipe,
 
 	igt_debug("Testing connector %s on %s plane %s.%u\n",
 		  igt_output_name(output), kmstest_plane_type_name(plane->type),
-		  kmstest_pipe_name(pipe), plane->index);
+		  igt_crtc_name(crtc), plane->index);
 
 	igt_pipe_crc_start(data->pipe_crc);
 
 	igt_info("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
 		 IGT_FORMAT_ARGS(ref.format), IGT_MODIFIER_ARGS(ref.modifier),
-		 kmstest_pipe_name(pipe), plane->index);
+		 igt_crtc_name(crtc), plane->index);
 
 	check_allowed_plane_size_64x64(data, plane, &width, &height, ref.format);
 
-	capture_format_crcs_single(data, pipe, plane, ref.format, ref.modifier,
+	capture_format_crcs_single(data,
+				   crtc,
+				   plane, ref.format,
+				   ref.modifier,
 				   width, height, IGT_COLOR_YCBCR_BT709,
 				   IGT_COLOR_YCBCR_LIMITED_RANGE,
 				   ref_crc[SINGLE_CRC_SET], &fb);
 
-	capture_format_crcs_multiple(data, pipe, plane, ref.format, ref.modifier,
+	capture_format_crcs_multiple(data,
+				     crtc,
+				     plane, ref.format,
+				     ref.modifier,
 				     width, height, IGT_COLOR_YCBCR_BT709,
 				     IGT_COLOR_YCBCR_LIMITED_RANGE,
 				     ref_crc[MULTIPLE_CRC_SET], &fb);
@@ -1186,13 +1198,13 @@ static void test_format_plane(data_t *data, enum pipe pipe,
 				 IGT_MODIFIER_FMT " on %s.%u\n",
 				 IGT_FORMAT_ARGS(f.format),
 				 IGT_MODIFIER_ARGS(f.modifier),
-				 kmstest_pipe_name(pipe),
+				 igt_crtc_name(crtc),
 				 plane->index);
 			continue;
 		}
 
 		if (f.format == DRM_FORMAT_C8) {
-			if (!set_c8_legacy_lut(data, pipe, LUT_MASK))
+			if (!set_c8_legacy_lut(data, crtc, LUT_MASK))
 				continue;
 		} else {
 			if (!igt_fb_supported_format(f.format))
@@ -1203,18 +1215,24 @@ static void test_format_plane(data_t *data, enum pipe pipe,
 				 MULTIPLE_CRC_SET : SINGLE_CRC_SET];
 
 		if (igt_format_is_yuv(f.format))
-			result &= test_format_plane_yuv(data, pipe, plane,
+			result &= test_format_plane_yuv(data,
+							crtc,
+							plane,
 							f.format, f.modifier,
 							width, height,
 							crcset, &fb);
 		else
-			result &= test_format_plane_rgb(data, pipe, plane,
+			result &= test_format_plane_rgb(data,
+							crtc,
+							plane,
 							f.format, f.modifier,
 							width, height,
 							crcset, &fb);
 
 		if (f.format == DRM_FORMAT_C8)
-			set_legacy_lut(data, pipe, LUT_MASK);
+			set_legacy_lut(data,
+				       crtc,
+				       LUT_MASK);
 	}
 
 	igt_pipe_crc_stop(data->pipe_crc);
@@ -1265,10 +1283,8 @@ static bool skip_plane(data_t *data, igt_plane_t *plane)
 }
 
 static void
-test_pixel_formats(data_t *data, enum pipe pipe)
+test_pixel_formats(data_t *data, igt_crtc_t *crtc)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	struct igt_fb primary_fb;
 	igt_plane_t *primary;
 	drmModeModeInfo *mode;
@@ -1286,7 +1302,7 @@ test_pixel_formats(data_t *data, enum pipe pipe)
 	igt_info("Using (pipe %s + %s) to run the subtest.\n",
 		 igt_crtc_name(crtc), igt_output_name(output));
 
-	test_init(data, crtc->pipe);
+	test_init(data, crtc);
 
 	mode = igt_output_get_mode(output);
 
@@ -1299,20 +1315,22 @@ test_pixel_formats(data_t *data, enum pipe pipe)
 
 	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
-	set_legacy_lut(data, crtc->pipe, LUT_MASK);
+	set_legacy_lut(data, crtc, LUT_MASK);
 
 	for_each_plane_on_pipe(&data->display, crtc->pipe, plane) {
 		if (skip_plane(data, plane))
 			continue;
 		igt_dynamic_f("pipe-%s-plane-%u", igt_crtc_name(crtc),
 			      plane->index)
-			test_format_plane(data, crtc->pipe, output, plane,
+			test_format_plane(data,
+					  crtc,
+					  output, plane,
 					  &primary_fb);
 	}
 
 	test_fini(data);
 
-	set_legacy_lut(data, crtc->pipe, 0xffff);
+	set_legacy_lut(data, crtc, 0xffff);
 
 	igt_plane_set_fb(primary, NULL);
 	igt_output_set_crtc(output, NULL);
@@ -1324,7 +1342,7 @@ test_pixel_formats(data_t *data, enum pipe pipe)
 static void test_planar_settings(data_t *data)
 {
 	igt_display_t *display = &data->display;
-	enum pipe pipe = PIPE_A;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, PIPE_A);
 	igt_output_t *output;
 	igt_fb_t fb, fb_ref;
 	igt_plane_t *primary;
@@ -1346,10 +1364,10 @@ static void test_planar_settings(data_t *data)
 		igt_require(display_ver >= 9);
 	}
 
-	output = igt_get_single_output_for_pipe(&data->display, pipe);
+	output = igt_get_single_output_for_pipe(&data->display, crtc->pipe);
 	igt_require(output);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
 	igt_display_commit_atomic(&data->display,
@@ -1443,10 +1461,12 @@ static void test_planar_settings(data_t *data)
 						     DRM_MODE_ATOMIC_ALLOW_MODESET,
 						     NULL);
 		if (rval == 0) {
-			set_legacy_lut(data, pipe, LUT_MASK);
-			igt_wait_for_vblank_count(igt_crtc_for_pipe(display, pipe),
+			set_legacy_lut(data,
+				       crtc,
+				       LUT_MASK);
+			igt_wait_for_vblank_count(crtc,
 						  1);
-			data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, pipe),
+			data->pipe_crc = igt_crtc_crc_new(crtc,
 							  IGT_PIPE_CRC_SOURCE_AUTO);
 			igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
 
@@ -1461,7 +1481,9 @@ static void test_planar_settings(data_t *data)
 						     NULL);
 
 			igt_pipe_crc_collect_crc(data->pipe_crc, &crc_ref);
-			set_legacy_lut(data, pipe, 0xffff);
+			set_legacy_lut(data,
+				       crtc,
+				       0xffff);
 
 			igt_pipe_crc_free(data->pipe_crc);
 			data->pipe_crc = NULL;
@@ -1485,7 +1507,7 @@ static bool is_pipe_limit_reached(int count)
 		return count >= CRTC_RESTRICT_CNT && !all_pipes;
 }
 
-static void run_test(data_t *data, void (*test)(data_t *, enum pipe))
+static void run_test(data_t *data, void (*test)(data_t *, igt_crtc_t *crtc))
 {
 	igt_crtc_t *crtc;
 	int count = 0;
@@ -1499,17 +1521,18 @@ static void run_test(data_t *data, void (*test)(data_t *, enum pipe))
 			continue;
 
 		igt_output_set_crtc(data->output, NULL);
-		test(data, crtc->pipe);
+		test(data, crtc);
 
 		if (is_pipe_limit_reached(++count))
 			break;
 	}
 }
 
-static void dynamic_test_handler(data_t *data, enum pipe pipe)
+static void dynamic_test_handler(data_t *data, igt_crtc_t *crtc)
 {
-	igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
-		test_plane_panning(data, pipe);
+	igt_dynamic_f("pipe-%s", igt_crtc_name(crtc))
+		test_plane_panning(data,
+				   crtc);
 }
 
 static void
-- 
2.52.0

