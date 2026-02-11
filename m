Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E8D0ECD6C5
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 16:35:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08BFE10E628;
	Wed, 11 Feb 2026 16:35:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="brbCEC6Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1734A10E628
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Feb 2026 16:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770827704; x=1802363704;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=mWIpv4xxpxJnyJDI4+AmNiEnonrbl0kSWnzS66b9QT0=;
 b=brbCEC6Zd4PhoJekyl7bDthKFbUCR4Mi+IxNkFsCBkI7a2foVI0ILKNl
 VpMTN4JVUA7Nl5VpgyK1Y7/aD8PjQj1dqjYu8wLRb4bkhXe6Ux+LNwsek
 ZUr6B0yxpbiCcKBC6k/Ds25uT9LdWkK0W55C1yDPm8qjODNpUx997KBep
 eT7pJUF85Px5qmt+vbrwXrrCIZAGl6oYVj5FoCjabd3gD8vJXejG9Dv1C
 YPUExIBoGvH68j3sR+VJaMfiHjrjYnTjx6lm+fRK4N/l5rdBoozhMlcW3
 mkmO22tvE0klAe5pW0wSUee57fM/QPfSmng28oyXuw9y6mOmPtZT2m6Kp w==;
X-CSE-ConnectionGUID: G32XnxNRRgKqr42dQOJnVw==
X-CSE-MsgGUID: ETYnnBsXTiyX1He1iANaEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="71879799"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="71879799"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 08:34:59 -0800
X-CSE-ConnectionGUID: sYnAww8jTDuKDD7GONiiCQ==
X-CSE-MsgGUID: QhRCik5HTu+DsL+kD7sn7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="212394292"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.23])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 08:34:58 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 12/17] tests/intel/kms_pipe_b_c_ivb: Use igt_crtc_t
 instead of enum pipe
Date: Wed, 11 Feb 2026 18:33:59 +0200
Message-ID: <20260211163404.2018-13-ville.syrjala@linux.intel.com>
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
tests/intel/kms_pipe_b_c_ivb.

This test wants to specifically use pipes B and C,
thus we are left with a few igt_crtc_for_pipe()
calls even after the conversion.

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
expression list[func1.N] EP;
expression PIPE;
@@
 FUNC(EP
-	,PIPE
+	,igt_crtc_for_pipe(&data->display, PIPE)
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
expression list[func2.N] EP;
expression PIPE;
@@
FUNC(EP
-	,PIPE
+	,igt_crtc_for_pipe(&data->display, PIPE)
	,...)

@@
identifier FUNC;
expression DISPLAY;
@@
FUNC(...)
{
+ igt_crtc_t *crtc_b = igt_crtc_for_pipe(DISPLAY, PIPE_B);
+ igt_crtc_t *crtc_c = igt_crtc_for_pipe(DISPLAY, PIPE_C);
<+...
(
- igt_crtc_for_pipe(DISPLAY, PIPE_B)
+ crtc_b
|
- igt_crtc_for_pipe(DISPLAY, PIPE_C)
+ crtc_c
)
...+>
}

@@
identifier CRTC;
expression PIPE;
@@
 igt_crtc_t *CRTC = igt_crtc_for_pipe(..., PIPE);
<+...
(
- kmstest_pipe_name(PIPE)
+ igt_crtc_name(CRTC)
|
- PIPE
+ CRTC->pipe
)
...+>

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
 tests/intel/kms_pipe_b_c_ivb.c | 102 ++++++++++++++++++++++-----------
 1 file changed, 68 insertions(+), 34 deletions(-)

diff --git a/tests/intel/kms_pipe_b_c_ivb.c b/tests/intel/kms_pipe_b_c_ivb.c
index 184d3b38fee7..d5c1ab3ff758 100644
--- a/tests/intel/kms_pipe_b_c_ivb.c
+++ b/tests/intel/kms_pipe_b_c_ivb.c
@@ -98,10 +98,8 @@ drmModeModeInfo mode_2_lanes = {
 };
 
 static int
-disable_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
+disable_pipe(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	igt_plane_t *primary;
 
 	igt_output_set_crtc(output, crtc);
@@ -111,10 +109,8 @@ disable_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 }
 
 static int
-set_mode_on_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
+set_mode_on_pipe(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	igt_plane_t *primary;
 	drmModeModeInfo *mode;
 	struct igt_fb fb;
@@ -137,17 +133,19 @@ set_mode_on_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 }
 
 static int
-set_big_mode_on_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
+set_big_mode_on_pipe(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
 {
 	igt_output_override_mode(output, &mode_3_lanes);
-	return set_mode_on_pipe(data, pipe, output);
+	return set_mode_on_pipe(data, crtc,
+				output);
 }
 
 static int
-set_normal_mode_on_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
+set_normal_mode_on_pipe(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
 {
 	igt_output_override_mode(output, &mode_2_lanes);
-	return set_mode_on_pipe(data, pipe, output);
+	return set_mode_on_pipe(data, crtc,
+				output);
 }
 
 static void
@@ -175,6 +173,8 @@ find_outputs(data_t *data, igt_output_t **output1, igt_output_t **output2)
 static void
 test_dpms(data_t *data)
 {
+	igt_crtc_t *crtc_b = igt_crtc_for_pipe(&data->display, PIPE_B);
+	igt_crtc_t *crtc_c = igt_crtc_for_pipe(&data->display, PIPE_C);
 	igt_output_t *output1, *output2;
 	int ret;
 
@@ -182,22 +182,28 @@ test_dpms(data_t *data)
 	find_outputs(data, &output1, &output2);
 
 	igt_info("Pipe %s will use connector %s\n",
-		 kmstest_pipe_name(PIPE_B), igt_output_name(output1));
+		 igt_crtc_name(crtc_b), igt_output_name(output1));
 	igt_info("Pipe %s will use connector %s\n",
-		 kmstest_pipe_name(PIPE_C), igt_output_name(output2));
+		 igt_crtc_name(crtc_c), igt_output_name(output2));
 
-	ret = set_big_mode_on_pipe(data, PIPE_B, output1);
+	ret = set_big_mode_on_pipe(data,
+				   crtc_b,
+				   output1);
 	igt_assert_eq(ret, 0);
 
 	kmstest_set_connector_dpms(data->drm_fd, output1->config.connector, DRM_MODE_DPMS_OFF);
 
-	ret = set_big_mode_on_pipe(data, PIPE_C, output2);
+	ret = set_big_mode_on_pipe(data,
+				   crtc_c,
+				   output2);
 	igt_assert_neq(ret, 0);
 }
 
 static void
 test_lane_reduction(data_t *data)
 {
+	igt_crtc_t *crtc_b = igt_crtc_for_pipe(&data->display, PIPE_B);
+	igt_crtc_t *crtc_c = igt_crtc_for_pipe(&data->display, PIPE_C);
 	igt_output_t *output1, *output2;
 	int ret;
 
@@ -206,23 +212,31 @@ test_lane_reduction(data_t *data)
 	find_outputs(data, &output1, &output2);
 
 	igt_info("Pipe %s will use connector %s\n",
-		 kmstest_pipe_name(PIPE_B), igt_output_name(output1));
+		 igt_crtc_name(crtc_b), igt_output_name(output1));
 	igt_info("Pipe %s will use connector %s\n",
-		 kmstest_pipe_name(PIPE_C), igt_output_name(output2));
+		 igt_crtc_name(crtc_c), igt_output_name(output2));
 
-	ret = set_big_mode_on_pipe(data, PIPE_B, output1);
+	ret = set_big_mode_on_pipe(data,
+				   crtc_b,
+				   output1);
 	igt_assert_eq(ret, 0);
 
-	ret = set_normal_mode_on_pipe(data, PIPE_B, output1);
+	ret = set_normal_mode_on_pipe(data,
+				      crtc_b,
+				      output1);
 	igt_assert_eq(ret, 0);
 
-	ret = set_normal_mode_on_pipe(data, PIPE_C, output2);
+	ret = set_normal_mode_on_pipe(data,
+				      crtc_c,
+				      output2);
 	igt_assert_eq(ret, 0);
 }
 
 static void
 test_disable_pipe_B(data_t *data)
 {
+	igt_crtc_t *crtc_b = igt_crtc_for_pipe(&data->display, PIPE_B);
+	igt_crtc_t *crtc_c = igt_crtc_for_pipe(&data->display, PIPE_C);
 	igt_output_t *output1, *output2;
 	int ret;
 
@@ -230,26 +244,35 @@ test_disable_pipe_B(data_t *data)
 	find_outputs(data, &output1, &output2);
 
 	igt_info("Pipe %s will use connector %s\n",
-		 kmstest_pipe_name(PIPE_B), igt_output_name(output1));
+		 igt_crtc_name(crtc_b), igt_output_name(output1));
 	igt_info("Pipe %s will use connector %s\n",
-		 kmstest_pipe_name(PIPE_C), igt_output_name(output2));
+		 igt_crtc_name(crtc_c), igt_output_name(output2));
 
-	ret = set_big_mode_on_pipe(data, PIPE_B, output1);
+	ret = set_big_mode_on_pipe(data,
+				   crtc_b,
+				   output1);
 	igt_assert_eq(ret, 0);
 
-	ret = disable_pipe(data, PIPE_B, output1);
+	ret = disable_pipe(data, crtc_b,
+			   output1);
 	igt_assert_eq(ret, 0);
 
-	ret = set_normal_mode_on_pipe(data, PIPE_C, output2);
+	ret = set_normal_mode_on_pipe(data,
+				      crtc_c,
+				      output2);
 	igt_assert_eq(ret, 0);
 
-	ret = set_normal_mode_on_pipe(data, PIPE_B, output1);
+	ret = set_normal_mode_on_pipe(data,
+				      crtc_b,
+				      output1);
 	igt_assert_eq(ret, 0);
 }
 
 static void
 test_from_C_to_B_with_3_lanes(data_t *data)
 {
+	igt_crtc_t *crtc_b = igt_crtc_for_pipe(&data->display, PIPE_B);
+	igt_crtc_t *crtc_c = igt_crtc_for_pipe(&data->display, PIPE_C);
 	igt_output_t *output1, *output2;
 	int ret;
 
@@ -257,23 +280,30 @@ test_from_C_to_B_with_3_lanes(data_t *data)
 	find_outputs(data, &output1, &output2);
 
 	igt_info("Pipe %s will use connector %s\n",
-		 kmstest_pipe_name(PIPE_B), igt_output_name(output1));
+		 igt_crtc_name(crtc_b), igt_output_name(output1));
 	igt_info("Pipe %s will use connector %s\n",
-		 kmstest_pipe_name(PIPE_C), igt_output_name(output2));
+		 igt_crtc_name(crtc_c), igt_output_name(output2));
 
-	ret = set_normal_mode_on_pipe(data, PIPE_C, output2);
+	ret = set_normal_mode_on_pipe(data,
+				      crtc_c,
+				      output2);
 	igt_assert_eq(ret, 0);
 
-	ret = disable_pipe(data, PIPE_C, output2);
+	ret = disable_pipe(data, crtc_c,
+			   output2);
 	igt_assert_eq(ret, 0);
 
-	ret = set_big_mode_on_pipe(data, PIPE_B, output1);
+	ret = set_big_mode_on_pipe(data,
+				   crtc_b,
+				   output1);
 	igt_assert_eq(ret, 0);
 }
 
 static void
 test_fail_enable_pipe_C_while_B_has_3_lanes(data_t *data)
 {
+	igt_crtc_t *crtc_b = igt_crtc_for_pipe(&data->display, PIPE_B);
+	igt_crtc_t *crtc_c = igt_crtc_for_pipe(&data->display, PIPE_C);
 	igt_output_t *output1, *output2;
 	int ret;
 
@@ -281,14 +311,18 @@ test_fail_enable_pipe_C_while_B_has_3_lanes(data_t *data)
 	find_outputs(data, &output1, &output2);
 
 	igt_info("Pipe %s will use connector %s\n",
-		 kmstest_pipe_name(PIPE_B), igt_output_name(output1));
+		 igt_crtc_name(crtc_b), igt_output_name(output1));
 	igt_info("Pipe %s will use connector %s\n",
-		 kmstest_pipe_name(PIPE_C), igt_output_name(output2));
+		 igt_crtc_name(crtc_c), igt_output_name(output2));
 
-	ret = set_big_mode_on_pipe(data, PIPE_B, output1);
+	ret = set_big_mode_on_pipe(data,
+				   crtc_b,
+				   output1);
 	igt_assert_eq(ret, 0);
 
-	ret = set_normal_mode_on_pipe(data, PIPE_C, output2);
+	ret = set_normal_mode_on_pipe(data,
+				      crtc_c,
+				      output2);
 	igt_assert_neq(ret, 0);
 }
 
-- 
2.52.0

