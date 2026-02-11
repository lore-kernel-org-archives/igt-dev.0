Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6BB2ECD6C8
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 16:35:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 563EA10E628;
	Wed, 11 Feb 2026 16:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RSgT6WjI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0937110E628
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Feb 2026 16:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770827712; x=1802363712;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=4uTM4+B/XnYCyXIaSjprFZpDjLY8ChyoIb2p0gIvotw=;
 b=RSgT6WjI11CNJ6Kbdc1fAGzvQ0yIV5F8XylVZrserohitwo22Ff+ku32
 ges90qfZITOZJ385RDcKjf9auikmkprpSGYht4iNajr5N9ZlzBOcTEN8K
 sq/BrBPslUo+5CE6b0VXKMUyaY0fOAjhZLcfTH9FNn1f76nsWF1kQPrWP
 /3Cxw0b+EKst75KcLy7ZXx91lQ4wWfUxZySFPnCj3wxUWfSNmXWzvNNEC
 gMDks4Y+cxtdIcO+dc31oAwHVNEU/2Vq24YuevZaTwbk3RZ5JQB55mpDh
 KwUzO44RLS91+ZGhwd8q0kP/Dw3HiUnI078LhPkhzQsFlAk8zdstCrEUw g==;
X-CSE-ConnectionGUID: g1i9GAQhSWK9r83h9w+Llg==
X-CSE-MsgGUID: C0G6xzkZQoukPBbQ5Z284Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="71695360"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="71695360"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 08:35:11 -0800
X-CSE-ConnectionGUID: Lbm5B2k3Rjy3rwj48A8A0w==
X-CSE-MsgGUID: ziN7pHl8T4md9PpYsjSAeg==
X-ExtLoop1: 1
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.23])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 08:35:10 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 15/17] tests/kms_rotation_crc: Use igt_crtc_t instead of
 enum pipe
Date: Wed, 11 Feb 2026 18:34:02 +0200
Message-ID: <20260211163404.2018-16-ville.syrjala@linux.intel.com>
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
tests/kms_rotation_crc.

The oddball thing here is the explicit use of PIPE_A
for some of the tests. Thus we are left with a few
igt_crtc_for_pipe() calls even after the tests. Someone
should probably review what this test actually doing and
try do something a bit more sensible.

 #include "scripts/iterators.cocci"

@func1@
typedef igt_crtc_t;
identifier FUNC, PIPE, CRTC;
parameter list[N] P;
@@
FUNC(P
- ,enum pipe PIPE
+ ,igt_crtc_t *CRTC
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
- kmsetst_crtc_name(PIPE)
+ igt_crtc_name(CRTC)
|
- PIPE
+ CRTC->pipe
)
...>
}

@depends on func1@
identifier func1.FUNC;
expression PIPE;
expression list[func1.N] EP;
@@
 FUNC(EP
-	,PIPE
+	,igt_crtc_for_pipe(&data.display, PIPE)
	,...)

@func2@
typedef igt_crtc_t;
identifier FUNC, PIPE;
parameter list[N] P;
@@
FUNC(P
- ,enum pipe PIPE
+ ,igt_crtc_t *crtc
 ,...)
{
<+... when != PIPE = ...
(
- igt_crtc_for_pipe(..., PIPE)
+ crtc
|
- kmsetst_crtc_name(PIPE)
+ igt_crtc_name(crtc)
|
- PIPE
+ crtc->pipe
)
...+>
}

@depends on func2@
identifier func2.FUNC;
expression PIPE;
expression list[func2.N] EP;
@@
FUNC(EP
-	,PIPE
+	,igt_crtc_for_pipe(&data.display, PIPE)
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
 tests/kms_rotation_crc.c | 42 ++++++++++++++++++++++++----------------
 1 file changed, 25 insertions(+), 17 deletions(-)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 8721a8311b8c..cd0873b3bf8d 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -292,11 +292,10 @@ static void cleanup_crtc(data_t *data)
 	igt_display_reset(display);
 }
 
-static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe,
+static void prepare_crtc(data_t *data, igt_output_t *output, igt_crtc_t *crtc,
 			 igt_plane_t *plane, bool start_crc)
 {
 	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 
 	cleanup_crtc(data);
 
@@ -462,13 +461,12 @@ static void prepare_fbs(data_t *data, igt_output_t *output,
 		igt_plane_set_position(plane, data->pos_x, data->pos_y);
 }
 
-static void test_single_case(data_t *data, enum pipe pipe,
+static void test_single_case(data_t *data, igt_crtc_t *crtc,
 			     igt_output_t *output, igt_plane_t *plane,
 			     enum rectangle_type rect,
 			     uint32_t format, bool test_bad_format)
 {
 	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	igt_crc_t crc_output;
 	int ret;
 
@@ -655,7 +653,9 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
 		plane = igt_output_get_plane_type(output, plane_type);
 		igt_require(plane_rotation_requirements(data, plane));
 
-		prepare_crtc(data, output, crtc->pipe, plane, true);
+		prepare_crtc(data, output,
+			     crtc,
+			     plane, true);
 
 		for (i = 0; i < num_rectangle_types; i++) {
 			/* Unsupported on intel */
@@ -687,13 +687,17 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
 					if (!test_format(data, &tested_formats, format))
 						continue;
 
-					test_single_case(data, crtc->pipe, output, plane, i,
+					test_single_case(data,
+							 crtc,
+							 output, plane, i,
 							 format, test_bad_format);
 				}
 
 				igt_vec_fini(&tested_formats);
 			} else {
-				test_single_case(data, crtc->pipe, output, plane, i,
+				test_single_case(data,
+						 crtc,
+						 output, plane, i,
 						 data->override_fmt, test_bad_format);
 			}
 		}
@@ -904,10 +908,9 @@ static bool reusecrcfromlastround(planeinfos p[2], int lastroundp1format,
  * It is left here if this test ever was wanted to be run on
  * different pipes.
  */
-static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
+static void test_multi_plane_rotation(data_t *data, igt_crtc_t *crtc)
 {
 	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	igt_output_t *output;
 	igt_crc_t retcrc_sw, retcrc_hw;
 	planeinfos p[2];
@@ -1102,13 +1105,11 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 	igt_require_f(found, "No valid pipe/output combo found.\n");
 }
 
-static void test_plane_rotation_exhaust_fences(data_t *data,
-					       enum pipe pipe,
+static void test_plane_rotation_exhaust_fences(data_t *data, igt_crtc_t *crtc,
 					       igt_output_t *output,
 					       igt_plane_t *plane)
 {
 	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	uint64_t modifier = I915_FORMAT_MOD_Y_TILED;
 	uint32_t format = DRM_FORMAT_XRGB8888;
 	int fd = data->gfx_fd;
@@ -1123,7 +1124,9 @@ static void test_plane_rotation_exhaust_fences(data_t *data,
 	igt_require(igt_plane_has_rotation(plane, IGT_ROTATION_0 | IGT_ROTATION_90));
 	igt_require(gem_available_fences(display->drm_fd) > 0);
 
-	prepare_crtc(data, output, crtc->pipe, plane, false);
+	prepare_crtc(data, output,
+		     crtc, plane,
+		     false);
 
 	mode = igt_output_get_mode(output);
 	w = mode->hdisplay;
@@ -1319,7 +1322,8 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 		data.planepos[1].origo = p_top | p_right;
 		data.planepos[1].x = -.4f;
 		data.planepos[1].y = .1f;
-		test_multi_plane_rotation(&data, PIPE_A);
+		test_multi_plane_rotation(&data,
+					  igt_crtc_for_pipe(&data.display, PIPE_A));
 	}
 
 	igt_describe("Rotation test on both planes by cropping left/top corner of primary plane and"
@@ -1333,7 +1337,8 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 		data.planepos[1].origo = p_top | p_right;
 		data.planepos[1].x = -.15f;
 		data.planepos[1].y = -.15f;
-		test_multi_plane_rotation(&data, PIPE_A);
+		test_multi_plane_rotation(&data,
+					  igt_crtc_for_pipe(&data.display, PIPE_A));
 	}
 
 	igt_describe("Rotation test on both planes by cropping left/bottom corner of primary plane"
@@ -1347,7 +1352,8 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 		data.planepos[1].origo = p_bottom | p_right;
 		data.planepos[1].x = -.15f;
 		data.planepos[1].y = -.20f;
-		test_multi_plane_rotation(&data, PIPE_A);
+		test_multi_plane_rotation(&data,
+					  igt_crtc_for_pipe(&data.display, PIPE_A));
 	}
 
 	/*
@@ -1365,7 +1371,9 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 		for_each_crtc_with_valid_output(&data.display, crtc, output) {
 			igt_plane_t *primary = &crtc->planes[0];
 
-			test_plane_rotation_exhaust_fences(&data, crtc->pipe, output, primary);
+			test_plane_rotation_exhaust_fences(&data,
+							   crtc,
+							   output, primary);
 			break;
 		}
 	}
-- 
2.52.0

