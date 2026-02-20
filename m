Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF7BC54FD2
	for <igt-dev@archiver.kernel.org>; Fri, 20 Feb 2026 14:02:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D385F10E7E8;
	Fri, 20 Feb 2026 14:02:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AO0WkMG5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EDCD10E7E8
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 14:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771596174; x=1803132174;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=rDuhV0qgMUk7x8zrM1aUD3EfT8E9JIWC16NBiIjpZ/A=;
 b=AO0WkMG5VErz6BKq0VVfFWxh2J0UzUlqo3nIfET9/C7qvtb+RAiikHy0
 x+c4Ms6nq5n4j/VVZtBsUJXUF3ZCZU7DDlOjUd2FmhhwZ137gKWKaKdyk
 W8VfyqYPeIi1InXv29FJfObhJbSwVCV2Df/1cBJIkDYoc17+LFS+giIbZ
 19SYsU25O3UH32/lS6pChf1WuPMgYxZIdPofCyAhXQEG1fz8ux3Ty75o2
 AZwD8pnGfmdS9HuVwDWL+v5JeFCef2oN9EqwXkgOIeJjpmpoABe0WV9BU
 0UOg7ltT54I9g7tlwzkEI0eug0mlMbwEa2U+BlzrT7YzfooNRwfMgnsOs g==;
X-CSE-ConnectionGUID: EdBcSfwySWCJmHD8BbWo2A==
X-CSE-MsgGUID: OCV0KcHtQq+gXKxRoEI4Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72389002"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="72389002"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 06:02:54 -0800
X-CSE-ConnectionGUID: A+wq4ZKSQuilQkVius2qUw==
X-CSE-MsgGUID: YKJ5eP3pT6qoZyaSWhnazg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="252543962"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.247])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 06:02:52 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 13/21] tests/kms_plane_multiple: Use igt_crtc_t instead
 of enum pipe
Date: Fri, 20 Feb 2026 16:01:45 +0200
Message-ID: <20260220140154.4138-14-ville.syrjala@linux.intel.com>
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

Convert kms_plane_multiple from 'enum pipe' to 'igt_crtc_t'.

The use of multiple crtcs in some places causes some extra
complications here.

 #include "scripts/iterators.cocci"

@multi_func@
typedef igt_crtc_t;
identifier FUNC, PIPE1, PIPE2;
parameter list[N] P;
parameter list[N2] P2;
@@
FUNC(P
-	,enum pipe PIPE1
+	,igt_crtc_t *crtc1
	,P2
-	,enum pipe PIPE2
+	,igt_crtc_t *crtc2
	,...)
{
<+...
(
- igt_crtc_for_pipe(..., PIPE1)
+ crtc1
|
- kmsetst_crtc_name(PIPE1)
+ igt_crtc_name(crtc1)
|
- PIPE1
+ crtc1->pipe
|
- igt_crtc_for_pipe(..., PIPE2)
+ crtc2
|
- kmsetst_crtc_name(PIPE2)
+ igt_crtc_name(crtc2)
|
- PIPE2
+ crtc2->pipe
)
...+>
}

@depends on multi_func@
identifier multi_func.FUNC;
expression PIPE1, PIPE2;
expression list[multi_func.N] EP;
expression list[multi_func.N2] EP2;
@@
 FUNC(EP
-	,PIPE1
+	,igt_crtc_for_pipe(display, PIPE1)
	,EP2
-	,PIPE2
+	,igt_crtc_for_pipe(display, PIPE2)
	,...)

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
 tests/kms_plane_multiple.c | 88 ++++++++++++++++++++++----------------
 1 file changed, 52 insertions(+), 36 deletions(-)

diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index 105ea50d464e..1a7b319cdcb5 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -105,10 +105,9 @@ struct {
 /*
  * Common code across all tests, acting on data_t
  */
-static void test_init(data_t *data, enum pipe pipe, int n_planes)
+static void test_init(data_t *data, igt_crtc_t *crtc, int n_planes)
 {
-	igt_display_t *display = &data->display;
-	data->pipe_crc1 = igt_crtc_crc_new(igt_crtc_for_pipe(display, pipe),
+	data->pipe_crc1 = igt_crtc_crc_new(crtc,
 					   IGT_PIPE_CRC_SOURCE_AUTO);
 
 	data->plane1 = calloc(n_planes, sizeof(*data->plane1));
@@ -136,16 +135,17 @@ static void test_fini(data_t *data, igt_output_t *output, int n_planes)
 }
 
 static void
-get_reference_crc(data_t *data, igt_output_t *output, enum pipe pipe, igt_pipe_crc_t *pipe_crc,
-	      color_t *color, igt_plane_t **plane, uint64_t modifier, igt_crc_t *ref_crc)
+get_reference_crc(data_t *data, igt_output_t *output, igt_crtc_t *crtc,
+		  igt_pipe_crc_t *pipe_crc,
+		  color_t *color, igt_plane_t **plane, uint64_t modifier,
+		  igt_crc_t *ref_crc)
 {
-	igt_display_t *display = &data->display;
 	drmModeModeInfo *mode;
 	igt_plane_t *primary;
 	int ret;
 
 	igt_display_reset(&data->display);
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	plane[primary->index] = primary;
@@ -202,11 +202,10 @@ create_fb_for_mode_position(data_t *data, igt_output_t *output, drmModeModeInfo
 
 
 static void
-prepare_planes(data_t *data, enum pipe pipe_id, color_t *color, igt_plane_t **plane,
+prepare_planes(data_t *data, igt_crtc_t *crtc, color_t *color,
+	       igt_plane_t **plane,
 	       uint64_t modifier, int max_planes, igt_output_t *output, igt_fb_t *fb)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe_id);
 	drmModeModeInfo *mode;
 	igt_plane_t *primary;
 	int *x;
@@ -325,7 +324,7 @@ prepare_planes(data_t *data, enum pipe pipe_id, color_t *color, igt_plane_t **pl
  */
 
 static void
-test_plane_position_with_output(data_t *data, enum pipe pipe,
+test_plane_position_with_output(data_t *data, igt_crtc_t *crtc,
 				igt_output_t *output, int n_planes,
 				uint64_t modifier)
 {
@@ -339,7 +338,7 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
 	char info[256];
 
 	igt_info("Using (pipe %s + %s) to run the subtest.\n",
-		 kmstest_pipe_name(pipe), igt_output_name(output));
+		 igt_crtc_name(crtc), igt_output_name(output));
 
 	if (opt.iterations == LOOP_FOREVER) {
 		loop_forever = true;
@@ -350,18 +349,21 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
 			iterations, iterations > 1 ? "iterations" : "iteration");
 	}
 
-	test_init(data, pipe, n_planes);
+	test_init(data, crtc, n_planes);
 
-	get_reference_crc(data, output, pipe, data->pipe_crc1, &blue,
+	get_reference_crc(data, output,
+			  crtc,
+			  data->pipe_crc1, &blue,
 			  data->plane1, modifier, &data->ref_crc1);
 
 	/* Find out how many planes are allowed simultaneously */
 	do {
 		c++;
-		prepare_planes(data, pipe, &blue, data->plane1, modifier, c, output, data->fb1);
+		prepare_planes(data, crtc, &blue,
+			       data->plane1, modifier, c, output, data->fb1);
 		err = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
 
-		for_each_plane_on_pipe(&data->display, pipe, plane)
+		for_each_plane_on_pipe(&data->display, crtc->pipe, plane)
 			igt_plane_set_fb(plane, NULL);
 
 		igt_output_set_crtc(output, NULL);
@@ -375,14 +377,15 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
 		c--;
 
 	igt_info("Testing connector %s using pipe %s with %d planes %s with seed %d\n",
-		 igt_output_name(output), kmstest_pipe_name(pipe), c,
+		 igt_output_name(output), igt_crtc_name(crtc), c,
 		 info, opt.seed);
 
 	i = 0;
 	while (i < iterations || loop_forever) {
 
 		/* randomize planes and set up the holes */
-		prepare_planes(data, pipe, &blue, data->plane1, modifier, c, output, data->fb1);
+		prepare_planes(data, crtc, &blue,
+			       data->plane1, modifier, c, output, data->fb1);
 
 		igt_display_commit2(&data->display, COMMIT_ATOMIC);
 		igt_pipe_crc_start(data->pipe_crc1);
@@ -391,7 +394,7 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
 		igt_assert_crc_equal(&data->ref_crc1, &crc);
 		igt_pipe_crc_stop(data->pipe_crc1);
 
-		for_each_plane_on_pipe(&data->display, pipe, plane)
+		for_each_plane_on_pipe(&data->display, crtc->pipe, plane)
 			igt_plane_set_fb(plane, NULL);
 
 		igt_output_set_crtc(output, NULL);
@@ -407,27 +410,29 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
 }
 
 static void
-test_plane_position(data_t *data, enum pipe pipe, igt_output_t *output, uint64_t modifier)
+test_plane_position(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
+		    uint64_t modifier)
 {
-	igt_display_t *display = &data->display;
 	int n_planes = opt.all_planes ?
-			igt_crtc_for_pipe(display, pipe)->n_planes : DEFAULT_N_PLANES;
+			crtc->n_planes : DEFAULT_N_PLANES;
 
 	if (!opt.user_seed)
 		opt.seed = time(NULL);
 
 	srand(opt.seed);
 
-	test_plane_position_with_output(data, pipe, output,
+	test_plane_position_with_output(data,
+					crtc,
+					output,
 					n_planes, modifier);
 }
 
-static void test_init_2_display(data_t *data, enum pipe pipe1, enum pipe pipe2, int n_planes)
+static void test_init_2_display(data_t *data, igt_crtc_t *crtc1,
+				igt_crtc_t *crtc2, int n_planes)
 {
-	igt_display_t *display = &data->display;
-	data->pipe_crc1 = igt_crtc_crc_new(igt_crtc_for_pipe(display, pipe1),
+	data->pipe_crc1 = igt_crtc_crc_new(crtc1,
 					   IGT_PIPE_CRC_SOURCE_AUTO);
-	data->pipe_crc2 = igt_crtc_crc_new(igt_crtc_for_pipe(display, pipe2),
+	data->pipe_crc2 = igt_crtc_crc_new(crtc2,
 					   IGT_PIPE_CRC_SOURCE_AUTO);
 
 	data->plane1 = calloc(n_planes, sizeof(*data->plane1));
@@ -466,7 +471,8 @@ static void test_fini_2_display(data_t *data)
 	igt_display_reset(&data->display);
 }
 
-static void test_plane_position_2_display(data_t *data, enum pipe pipe1, enum pipe pipe2,
+static void test_plane_position_2_display(data_t *data, igt_crtc_t *crtc1,
+					  igt_crtc_t *crtc2,
 					  igt_output_t *output1, igt_output_t *output2,
 					  uint64_t modifier)
 {
@@ -483,15 +489,22 @@ static void test_plane_position_2_display(data_t *data, enum pipe pipe1, enum pi
 	 * default value. This might need to be tweaked if we see any bw related failures.
 	 */
 
-	test_init_2_display(data, pipe1, pipe2, n_planes);
-	get_reference_crc(data, output1, pipe1, data->pipe_crc1, &blue,
+	test_init_2_display(data, crtc1,
+			    crtc2, n_planes);
+	get_reference_crc(data, output1,
+			  crtc1,
+			  data->pipe_crc1, &blue,
 			  data->plane1, DRM_FORMAT_MOD_LINEAR, &data->ref_crc1);
-	get_reference_crc(data, output2, pipe2, data->pipe_crc2, &blue,
+	get_reference_crc(data, output2,
+			  crtc2,
+			  data->pipe_crc2, &blue,
 			  data->plane2, DRM_FORMAT_MOD_LINEAR, &data->ref_crc2);
 
-	prepare_planes(data, pipe1, &blue, data->plane1,
+	prepare_planes(data, crtc1, &blue,
+		       data->plane1,
 		       modifier, 2, output1, data->fb1);
-	prepare_planes(data, pipe2, &blue, data->plane2,
+	prepare_planes(data, crtc2, &blue,
+		       data->plane2,
 		       modifier, 2, output2, data->fb2);
 
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
@@ -554,8 +567,9 @@ static void run_2_display_test(data_t *data, uint64_t modifier, const char *name
 						       igt_crtc_name(crtc2),
 						       output2->name)
 						test_plane_position_2_display(data,
-									      crtc->pipe,
-									      crtc2->pipe,
+									      crtc
+									      ,
+									      crtc2,
 									      output1, output2,
 									      modifier);
 
@@ -584,7 +598,9 @@ static void run_test(data_t *data, uint64_t modifier, const char *name)
 			continue;
 
 		igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc), output->name)
-			test_plane_position(data, crtc->pipe, output,
+			test_plane_position(data,
+					    crtc,
+					    output,
 					    modifier);
 	}
 }
-- 
2.52.0

