Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4BD3ECD6C8
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 16:34:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85DA210E628;
	Wed, 11 Feb 2026 16:34:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tn3ZjS4P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F9AA10E628
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Feb 2026 16:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770827653; x=1802363653;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=um8TNi9KUW3ZxnZRvMKE1EQHIMTZ2Uc57XOsd7LbeXQ=;
 b=Tn3ZjS4PzmkNoZROfZUjQiIbvfQYS/LNBMfFfkDIwex6zUqejR7jVwKM
 cn/wmyRydavvnaneIzIgVLi0KyNe+PchHhzlp4BhAplpvPMhwGyyY5tfP
 RDRLBgw2VcWIJh3Ieru3R/aKQtwRAQFRAcFr6YCqVhP/2WQbnQO61OOyL
 1ZHf0X1USB5YDEKmJoIP8oRHYn2ZIU4PGpCNm613+3I+F+ndwuulmVALz
 0m15fVB3huCYPJJQAjj8XmayoIGiabzGx8Qow3lfRnQLjproIH5tFvkTC
 4bk449LsAyRm7VT04CdO1MecO4Z+1kR1/Khu7eTDwzaoyxUvC4P/sZ0AJ w==;
X-CSE-ConnectionGUID: Xb3ON5d7TV2YveTbrYvSzA==
X-CSE-MsgGUID: RmcGiU4OSXeXPdA4iGKJkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="83082145"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="83082145"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 08:34:13 -0800
X-CSE-ConnectionGUID: gAsk83tNSLGjzOnoY8Jd7g==
X-CSE-MsgGUID: 6BonajHVR6a8CjJ+NVJu+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="211405338"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.23])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 08:34:12 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 01/17] tests/kms_plane_alpha_blend: Use igt_crtc_t
 instead of enum pipe
Date: Wed, 11 Feb 2026 18:33:48 +0200
Message-ID: <20260211163404.2018-2-ville.syrjala@linux.intel.com>
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
tests/kms_plane_alpha_blend.

The use of function pointers makes this a bit more
complicated than your average test.

 #include "scripts/iterators.cocci"

@func@
typedef igt_crtc_t;
identifier FUNC;
identifier PIPE;
parameter list[N] P;
@@
 FUNC(P
- ,enum pipe PIPE
+ ,igt_crtc_t *crtc
  ,...)
{
<...
(
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

@func_ptr@
parameter list[N] P;
identifier F, PIPE;
type T;
@@
struct {
       ...
       T (*F)(P
-      	 ,enum pipe
+      	 ,igt_crtc_t *crtc
	 ,...);
       ...
}

@depends on func_ptr@
identifier func_ptr.F;
expression list[func_ptr.N] EP;
expression PIPE;
@@
F(EP
-	,PIPE
+	,igt_crtc_for_pipe(display, PIPE)
	,...)

@func_ptr2@
parameter list[N] P;
identifier FUNC, F, PIPE;
type T;
@@
FUNC(...,
  T (*F)(P
-	,enum pipe
+	,igt_crtc_t *crtc
	,...), ...)
{ ... }

@@
igt_crtc_t *CRTC;
@@
- igt_crtc_for_pipe(..., CRTC->pipe)
+ CRTC

@@
identifier DISPLAY;
expression E;
@@
- igt_display_t *DISPLAY = E;
... when != DISPLAY

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_plane_alpha_blend.c | 61 +++++++++++++++++------------------
 1 file changed, 30 insertions(+), 31 deletions(-)

diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index 1f093a49c9b6..2ee74d30f558 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -168,11 +168,11 @@ static void draw_squares_coverage(struct igt_fb *fb, int w, int h, uint8_t as)
 	igt_put_cairo_ctx(cr);
 }
 
-static void reset_alpha(igt_display_t *display, enum pipe pipe)
+static void reset_alpha(igt_display_t *display, igt_crtc_t *crtc)
 {
 	igt_plane_t *plane;
 
-	for_each_plane_on_pipe(display, pipe, plane) {
+	for_each_plane_on_pipe(display, crtc->pipe, plane) {
 		if (igt_plane_has_prop(plane, IGT_PLANE_ALPHA))
 			igt_plane_set_prop_value(plane, IGT_PLANE_ALPHA, 0xffff);
 
@@ -209,11 +209,9 @@ static void remove_fbs(data_t *data)
 	igt_remove_fb(data->gfx_fd, &data->gray_fb);
 }
 
-static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe)
+static void prepare_crtc(data_t *data, igt_output_t *output, igt_crtc_t *crtc)
 {
 	drmModeModeInfo *mode;
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	int w, h;
 	igt_plane_t *primary = igt_crtc_get_plane_type(crtc,
 						       DRM_PLANE_TYPE_PRIMARY);
@@ -289,7 +287,7 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe)
 	igt_plane_set_fb(primary, &data->black_fb);
 }
 
-static void basic_alpha(data_t *data, enum pipe pipe, igt_plane_t *plane)
+static void basic_alpha(data_t *data, igt_crtc_t *crtc, igt_plane_t *plane)
 {
 	igt_display_t *display = &data->display;
 	igt_crc_t ref_crc, crc;
@@ -327,7 +325,7 @@ static void basic_alpha(data_t *data, enum pipe pipe, igt_plane_t *plane)
 	igt_assert_crc_equal(&ref_crc, &crc);
 }
 
-static void argb_opaque(data_t *data, enum pipe pipe, igt_plane_t *plane)
+static void argb_opaque(data_t *data, igt_crtc_t *crtc, igt_plane_t *plane)
 {
 	igt_display_t *display = &data->display;
 	igt_crc_t ref_crc, crc;
@@ -344,7 +342,8 @@ static void argb_opaque(data_t *data, enum pipe pipe, igt_plane_t *plane)
 	igt_assert_crc_equal(&ref_crc, &crc);
 }
 
-static void argb_transparent(data_t *data, enum pipe pipe, igt_plane_t *plane)
+static void argb_transparent(data_t *data, igt_crtc_t *crtc,
+			     igt_plane_t *plane)
 {
 	igt_display_t *display = &data->display;
 	igt_crc_t ref_crc, crc;
@@ -361,7 +360,8 @@ static void argb_transparent(data_t *data, enum pipe pipe, igt_plane_t *plane)
 	igt_assert_crc_equal(&ref_crc, &crc);
 }
 
-static void constant_alpha_min(data_t *data, enum pipe pipe, igt_plane_t *plane)
+static void constant_alpha_min(data_t *data, igt_crtc_t *crtc,
+			       igt_plane_t *plane)
 {
 	igt_display_t *display = &data->display;
 	igt_crc_t ref_crc, crc;
@@ -383,10 +383,10 @@ static void constant_alpha_min(data_t *data, enum pipe pipe, igt_plane_t *plane)
 	igt_assert_crc_equal(&ref_crc, &crc);
 }
 
-static void constant_alpha_mid(data_t *data, enum pipe pipe, igt_plane_t *plane)
+static void constant_alpha_mid(data_t *data, igt_crtc_t *crtc,
+			       igt_plane_t *plane)
 {
 	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	igt_crc_t ref_crc, crc;
 
 	if (plane->type != DRM_PLANE_TYPE_PRIMARY)
@@ -410,10 +410,10 @@ static void constant_alpha_mid(data_t *data, enum pipe pipe, igt_plane_t *plane)
 	igt_assert_crc_equal(&ref_crc, &crc);
 }
 
-static void constant_alpha_max(data_t *data, enum pipe pipe, igt_plane_t *plane)
+static void constant_alpha_max(data_t *data, igt_crtc_t *crtc,
+			       igt_plane_t *plane)
 {
 	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	igt_crc_t ref_crc, crc;
 
 	if (plane->type != DRM_PLANE_TYPE_PRIMARY)
@@ -442,10 +442,9 @@ static void constant_alpha_max(data_t *data, enum pipe pipe, igt_plane_t *plane)
 	igt_plane_set_fb(plane, NULL);
 }
 
-static void alpha_7efc(data_t *data, enum pipe pipe, igt_plane_t *plane)
+static void alpha_7efc(data_t *data, igt_crtc_t *crtc, igt_plane_t *plane)
 {
 	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	igt_crc_t ref_crc = {}, crc = {};
 
 	if (plane->type != DRM_PLANE_TYPE_PRIMARY)
@@ -471,7 +470,7 @@ static void alpha_7efc(data_t *data, enum pipe pipe, igt_plane_t *plane)
 	igt_pipe_crc_stop(data->pipe_crc);
 }
 
-static void coverage_7efc(data_t *data, enum pipe pipe, igt_plane_t *plane)
+static void coverage_7efc(data_t *data, igt_crtc_t *crtc, igt_plane_t *plane)
 {
 	igt_display_t *display = &data->display;
 	igt_crc_t ref_crc = {}, crc = {};
@@ -497,10 +496,10 @@ static void coverage_7efc(data_t *data, enum pipe pipe, igt_plane_t *plane)
 	igt_pipe_crc_stop(data->pipe_crc);
 }
 
-static void coverage_premult_constant(data_t *data, enum pipe pipe, igt_plane_t *plane)
+static void coverage_premult_constant(data_t *data, igt_crtc_t *crtc,
+				      igt_plane_t *plane)
 {
 	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	igt_crc_t ref_crc = {}, crc = {};
 
 	/* Set a background color on the primary fb for testing */
@@ -530,12 +529,12 @@ static void coverage_premult_constant(data_t *data, enum pipe pipe, igt_plane_t
 	igt_pipe_crc_stop(data->pipe_crc);
 }
 
-static void run_test_on_pipe_planes(data_t *data, enum pipe pipe, igt_output_t *output,
+static void run_test_on_pipe_planes(data_t *data, igt_crtc_t *crtc,
+				    igt_output_t *output,
 				    bool blend, bool must_multiply,
-				    void(*test)(data_t *, enum pipe, igt_plane_t *))
+				    void(*test)(data_t *, igt_crtc_t *crtc, igt_plane_t *))
 {
 	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	igt_plane_t *plane;
 	int first_plane = -1;
 	int last_plane = -1;
@@ -548,7 +547,7 @@ static void run_test_on_pipe_planes(data_t *data, enum pipe pipe, igt_output_t *
 			continue;
 
 		/* reset plane alpha properties between each plane */
-		reset_alpha(display, crtc->pipe);
+		reset_alpha(display, crtc);
 
 		if (must_multiply && !has_multiplied_alpha(data, plane))
 			continue;
@@ -568,7 +567,7 @@ static void run_test_on_pipe_planes(data_t *data, enum pipe pipe, igt_output_t *
 			continue;
 
 		/* Reset plane alpha properties between each plane. */
-		reset_alpha(display, crtc->pipe);
+		reset_alpha(display, crtc);
 
 		if (must_multiply && !has_multiplied_alpha(data, plane))
 			continue;
@@ -577,7 +576,7 @@ static void run_test_on_pipe_planes(data_t *data, enum pipe pipe, igt_output_t *
 			continue;
 
 		igt_info("Testing plane %u\n", plane->index);
-		test(data, crtc->pipe, plane);
+		test(data, crtc, plane);
 		igt_plane_set_fb(plane, NULL);
 
 		if (in_simulation)
@@ -590,7 +589,7 @@ static void run_test_on_pipe_planes(data_t *data, enum pipe pipe, igt_output_t *
 
 static const struct {
 	const char *name;
-	void (*test)(data_t *, enum pipe, igt_plane_t *);
+	void (*test)(data_t *, igt_crtc_t *crtc, igt_plane_t *);
 	bool blend;
 	bool must_multiply;
 	const char *desc;
@@ -653,11 +652,10 @@ static const struct {
 	},
 };
 
-static bool pipe_check(data_t *data, enum pipe pipe,
+static bool pipe_check(data_t *data, igt_crtc_t *crtc,
 		       bool blend, bool must_multiply)
 {
 	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	igt_plane_t *plane;
 	bool plane_alpha = false, plane_blend = false, multiply = false;
 
@@ -672,7 +670,7 @@ static bool pipe_check(data_t *data, enum pipe pipe,
 		plane_blend = true;
 
 		/* reset plane alpha properties between each plane */
-		reset_alpha(display, crtc->pipe);
+		reset_alpha(display, crtc);
 
 		if (must_multiply && !has_multiplied_alpha(data, plane))
 			continue;
@@ -718,15 +716,16 @@ static void run_subtests(data_t *data)
 				if (!intel_pipe_output_combo_valid(&data->display))
 					continue;
 
-				prepare_crtc(data, output, crtc->pipe);
-				if (!pipe_check(data, crtc->pipe, subtests[i].blend, subtests[i].must_multiply))
+				prepare_crtc(data, output,
+					     crtc);
+				if (!pipe_check(data, crtc, subtests[i].blend, subtests[i].must_multiply))
 					continue;
 
 				igt_dynamic_f("pipe-%s-%s",
 					      igt_crtc_name(crtc),
 					      output->name)
 					run_test_on_pipe_planes(data,
-								crtc->pipe,
+								crtc,
 								output,
 								subtests[i].blend,
 								subtests[i].must_multiply, subtests[i].test);
-- 
2.52.0

