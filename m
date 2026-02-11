Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C7FECD6C9
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 16:35:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F10BA10E62C;
	Wed, 11 Feb 2026 16:35:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mXQ0Zgkd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF70B10E628
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Feb 2026 16:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770827705; x=1802363705;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=uWMwSkhw+8AvQxkx0dSgo39kzN0xjdplASYa277Dg0Q=;
 b=mXQ0ZgkdcFQD806sjTYQW1UEeBYB0djF06J6RIQcZOOB0pwrPOiYdgAF
 RLqal+HaGxYUnX5zvNCUJpURy3OcT766UTuW0lldbpy2TRKv9rpX7E0Jt
 EDr3Mj2XOMC8YW3O6S8q7PtDMGF9OG42MzuIW01opdirNVmV3dXUno/KG
 MtyfacJlwcfRKCtmdA4qTvxNUB7b1d6mc4Jf82AfhPRhreWgMwDeWdWLM
 E1mZWGAtuHa+jTVYJbBjhX8lW/WX5R23SUUCSOd5RCxE9U2K1Gu2Gdv9H
 Ol+iIRkSj4rUgqV19Vh7UJJMvZZAiZHA3iCaBLlSo5J5MhAbxfHi6fW+7 A==;
X-CSE-ConnectionGUID: p6GixJ4lR4me9tusr67aAQ==
X-CSE-MsgGUID: BybYqr5qSUuKIyNLn36OAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="71879816"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="71879816"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 08:35:03 -0800
X-CSE-ConnectionGUID: JeAdtQVtSp6ibxBi9wMUvg==
X-CSE-MsgGUID: BaPN5upvQr2N5AINcFFV+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="212394327"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.23])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 08:35:02 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 13/17] tests/kms_vrr: Use igt_crtc_t instead of enum pipe
Date: Wed, 11 Feb 2026 18:34:00 +0200
Message-ID: <20260211163404.2018-14-ville.syrjala@linux.intel.com>
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
tests/kms_vrr.

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
-	,enum pipe PIPE
+	,igt_crtc_t *crtc
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
type T, FT;
@@
typedef T (*FT)(P
-	,enum pipe
+	,igt_crtc_t *crtc
	,...);

@depends on func_ptr@
func_ptr.FT FUNC;
expression list[func_ptr.N] EP;
expression PIPE;
@@
FUNC(EP
- ,PIPE
+ ,igt_crtc_for_pipe(display, PIPE)
 ,...)

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
 tests/kms_vrr.c | 66 ++++++++++++++++++++++++++++---------------------
 1 file changed, 38 insertions(+), 28 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 55671c71e095..f500d7a59120 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -158,7 +158,7 @@ typedef struct data {
 	uint32_t flag;
 } data_t;
 
-typedef void (*test_t)(data_t*, enum pipe, igt_output_t*, uint32_t);
+typedef void (*test_t)(data_t*, igt_crtc_t *crtc, igt_output_t*, uint32_t);
 
 /* Converts a timespec structure to nanoseconds. */
 static uint64_t timespec_to_ns(struct timespec *ts)
@@ -306,11 +306,9 @@ static bool vrr_capable(igt_output_t *output)
 }
 
 /* Toggles variable refresh rate on the pipe. */
-static void set_vrr_on_pipe(data_t *data, enum pipe pipe,
+static void set_vrr_on_pipe(data_t *data, igt_crtc_t *crtc,
 			    bool need_modeset, bool enabled)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	igt_crtc_set_prop_value(crtc,
 				    IGT_CRTC_VRR_ENABLED,
 				    enabled);
@@ -339,10 +337,8 @@ static void paint_bar(cairo_t *cr, unsigned int x, unsigned int y,
 }
 
 /* Prepare the display for testing on the given pipe. */
-static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
+static void prepare_test(data_t *data, igt_output_t *output, igt_crtc_t *crtc)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	unsigned int num_bars = 256;
 	drmModeModeInfo mode;
 	cairo_t *cr;
@@ -657,24 +653,26 @@ flip_and_measure_cmrr(data_t *data, igt_output_t *output,
 
 /* Basic VRR flip functionality test - enable, measure, disable, measure */
 static void
-test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
+test_basic(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
+	   uint32_t flags)
 {
 	uint32_t result;
 	vtest_ns_t vtest_ns;
 	range_t range;
 	uint64_t rate[] = {0};
 
-	prepare_test(data, output, pipe);
+	prepare_test(data, output, crtc);
 	range = data->range;
 	vtest_ns = data->vtest_ns;
 	rate[0] = vtest_ns.rate_ns;
 
 	igt_info("VRR Test execution on %s, PIPE_%s with VRR range: (%u-%u) Hz\n",
-		 output->name, kmstest_pipe_name(pipe), range.min, range.max);
+		 output->name, igt_crtc_name(crtc), range.min, range.max);
 	igt_info("Override Mode: ");
 	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
 
-	set_vrr_on_pipe(data, pipe, !(flags & TEST_FASTSET), true);
+	set_vrr_on_pipe(data, crtc,
+			!(flags & TEST_FASTSET), true);
 
 	/*
 	 * Do a short run with VRR, but don't check the result.
@@ -756,7 +754,9 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	 * modeset. And the expected behavior is the same as disabling VRR on
 	 * a VRR capable panel.
 	 */
-	set_vrr_on_pipe(data, pipe, !(flags & TEST_FASTSET), (flags & TEST_NEGATIVE) ? true : false);
+	set_vrr_on_pipe(data, crtc,
+			!(flags & TEST_FASTSET),
+			(flags & TEST_NEGATIVE) ? true : false);
 	rate[0] = vtest_ns.rate_ns;
 	result = flip_and_measure(data, output, rate, 1, data->duration_ns);
 	igt_assert_f(result < 10,
@@ -765,7 +765,8 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 }
 
 static void
-test_seamless_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
+test_seamless_rr_basic(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
+		       uint32_t flags)
 {
 	uint32_t result;
 	vtest_ns_t vtest_ns;
@@ -775,11 +776,12 @@ test_seamless_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint3
 	igt_info("Use HIGH_RR Mode as default (VRR: %s): ", vrr ? "ON" : "OFF");
 	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
 
-	prepare_test(data, output, pipe);
+	prepare_test(data, output, crtc);
 	vtest_ns = data->vtest_ns;
 
 	if (vrr)
-		set_vrr_on_pipe(data, pipe, false, true);
+		set_vrr_on_pipe(data, crtc,
+				false, true);
 	else {
 		/*
 		 * Sink with DRRS and VRR can be in downclock mode.
@@ -822,7 +824,8 @@ test_seamless_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint3
 }
 
 static void
-test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
+test_seamless_virtual_rr_basic(data_t *data, igt_crtc_t *crtc,
+			       igt_output_t *output, uint32_t flags)
 {
 	uint32_t result;
 	unsigned int vrefresh;
@@ -833,7 +836,7 @@ test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_output_t *outpu
 	igt_info("Use HIGH_RR Mode as default\n");
 	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
 
-	prepare_test(data, output, pipe);
+	prepare_test(data, output, crtc);
 	rate[0] = igt_kms_frame_time_from_vrefresh(data->switch_modes[HIGH_RR_MODE].vrefresh);
 
 	/*
@@ -889,18 +892,20 @@ test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_output_t *outpu
  */
 
 static void
-test_lobf(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
+test_lobf(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
+	  uint32_t flags)
 {
 	uint64_t rate[] = {0};
 	uint32_t step_size, vrefresh;
 	bool lobf_enabled = false;
 
 	rate[0] = igt_kms_frame_time_from_vrefresh(data->switch_modes[HIGH_RR_MODE].vrefresh);
-	prepare_test(data, output, pipe);
+	prepare_test(data, output, crtc);
 	data->flag |= flags;
 
 	igt_info("LOBF test execution on %s, PIPE %s with VRR range: (%u-%u) Hz\n",
-		 output->name, kmstest_pipe_name(pipe), data->range.min, data->range.max);
+		 output->name, igt_crtc_name(crtc), data->range.min,
+		 data->range.max);
 
 	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
 	flip_and_measure(data, output, rate, 1, TEST_DURATION_NS);
@@ -928,7 +933,8 @@ test_lobf(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 }
 
 static void
-test_cmrr(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
+test_cmrr(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
+	  uint32_t flags)
 {
 	uint32_t result;
 	int i;
@@ -937,7 +943,8 @@ test_cmrr(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	drmModeModeInfo mode = *igt_output_get_mode(output);
 
 	igt_info("CMRR test execution on %s, PIPE_%s with VRR range: (%u-%u) Hz\n",
-		 output->name, kmstest_pipe_name(pipe), data->range.min, data->range.max);
+		 output->name, igt_crtc_name(crtc), data->range.min,
+		 data->range.max);
 
 	for (i = 0; i < connector->count_modes; i++) {
 		if (is_cmrr_mode(&connector->modes[i])) {
@@ -963,7 +970,8 @@ test_cmrr(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	igt_output_override_mode(output, &mode);
 
 	if (!igt_display_try_commit2(&data->display, COMMIT_ATOMIC)) {
-		prepare_test(data, output, pipe);
+		prepare_test(data, output,
+			     crtc);
 		result = flip_and_measure_cmrr(data, output, TEST_DURATION_NS * 2);
 		igt_assert_f(result > 75,
 			     "Refresh rate (%u Hz) %"PRIu64"ns: Target CMRR on threshold not reached, result was %u%%\n",
@@ -972,10 +980,8 @@ test_cmrr(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	}
 }
 
-static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
+static void test_cleanup(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	igt_crtc_set_prop_value(crtc,
 				    IGT_CRTC_VRR_ENABLED, false);
 
@@ -1112,9 +1118,13 @@ run_vrr_test(data_t *data, test_t test, uint32_t flags)
 
 			igt_dynamic_f("pipe-%s-%s",
 				      igt_crtc_name(crtc), output->name)
-				test(data, crtc->pipe, output, flags);
+				test(data,
+				     crtc,
+				     output, flags);
 
-			test_cleanup(data, crtc->pipe, output);
+			test_cleanup(data,
+				     crtc,
+				     output);
 
 			break;
 		}
-- 
2.52.0

