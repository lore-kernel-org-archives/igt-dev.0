Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEFB6F531CA
	for <igt-dev@archiver.kernel.org>; Mon, 13 Apr 2026 20:01:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86D2210E031;
	Mon, 13 Apr 2026 20:01:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GYtbowUW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A73C10E031
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Apr 2026 20:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776110438; x=1807646438;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=aXbjagnH1myPJdkbRMRC4w2XDZMY56w5aIkYMlOXFVg=;
 b=GYtbowUWV7Vv7Ps3LjUL2lJn2J2bwkdIsOPsld8+Jp7m+0NjWyiEr8V7
 uyH77MtVI8tf04uDl7x4pTUbS9ZTBDZfzKI3aKDfp9P/0DjtBl3Ve8q4G
 DJTfegxmRIcK33QqoWWWBy3fuSr+Ld3fhI8DqAg+M9kDUFxDCZQQVvcW1
 Pbn3x8kqOf8Fugze95BjC59mMWeWSh+T4U2jkXlDzXQPJ9wKbNAboV8ta
 q8xAP/vd0RlVACjXNSnnq1H7B+8ggv1vNLMdOvYk37NvkeHdC8j/wVL06
 Ulw4xqgThdjd+oTs+hdeMzDnpLqQT3Fs8rBUkHGyEk79NZPspD0W5LaTw Q==;
X-CSE-ConnectionGUID: ZubjQErhSv2UJaRJ7Zw0mQ==
X-CSE-MsgGUID: kjwkW8cgTKqYfuUISFkmLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="87357150"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="87357150"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 13:00:38 -0700
X-CSE-ConnectionGUID: Ll7NEqs4TP2HZR2DFhRvrQ==
X-CSE-MsgGUID: kbZ7xW6ETPevyCR1OLaOPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="234860997"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.97])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 13:00:37 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 3/3] tests/kms: Use for_each_crtc_with_valid_output()
Date: Mon, 13 Apr 2026 23:00:21 +0300
Message-ID: <20260413200021.29485-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260413200021.29485-1-ville.syrjala@linux.intel.com>
References: <20260413200021.29485-1-ville.syrjala@linux.intel.com>
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

A few tests are doing nested for_each_crtc() and
for_each_valid_output_on_crtc() loops. This is basically
the same as for_each_crtc_with_valid_output(), so just
use that instead. This drops the indentation by two levels,
which is nice.

Note that the original code had the crtc as the outer loop
and output as the inner loop, whereas for_each_crtc_with_valid_output()
does it the other way around. I don't think the difference
should matter here.

And while at it, rename the 'crtc' variable to 'crtc1'
to match the naming of the corresponding output variables.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_display_modes.c  | 61 +++++++++++++++---------------------
 tests/kms_plane_multiple.c | 63 +++++++++++++++-----------------------
 2 files changed, 49 insertions(+), 75 deletions(-)

diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index 76e73152a2ab..d8aae4256122 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -178,49 +178,36 @@ static void run_extendedmode_basic(data_t *data, igt_crtc_t *crtc1,
 }
 
 static void run_extendedmode_test(data_t *data) {
-	igt_crtc_t *crtc2;
-	igt_crtc_t *crtc;
 	bool sim_flag = igt_run_in_simulation();
+	igt_crtc_t *crtc1, *crtc2;
 	igt_output_t *output1, *output2;
 	igt_display_t *display = &data->display;
 
 	igt_display_reset(display);
 
-	for_each_crtc(display, crtc) {
-		for_each_valid_output_on_crtc(display,
-					      crtc,
-					      output1) {
-
-			for_each_crtc(display, crtc2) {
-				if (crtc == crtc2)
-					continue;
-
-				for_each_valid_output_on_crtc(display, crtc2, output2) {
-					if (output1 == output2)
-						continue;
-
-					igt_display_reset(display);
-
-					igt_output_set_crtc(output1,
-							    crtc);
-					igt_output_set_crtc(output2,
-							    crtc2);
-
-					if (!intel_pipe_output_combo_valid(display))
-						continue;
-
-					igt_dynamic_f("pipe-%s-%s-pipe-%s-%s",
-						      igt_crtc_name(crtc),
-						      igt_output_name(output1),
-						      igt_crtc_name(crtc2),
-						      igt_output_name(output2))
-						run_extendedmode_basic(data,
-								       crtc,
-								       output1,
-								       crtc2,
-								       output2);
-				}
-			}
+	for_each_crtc_with_valid_output(display, crtc1, output1) {
+		for_each_crtc_with_valid_output(display, crtc2, output2) {
+			if (crtc1 == crtc2)
+				continue;
+
+			if (output1 == output2)
+				continue;
+
+			igt_display_reset(display);
+
+			igt_output_set_crtc(output1, crtc1);
+			igt_output_set_crtc(output2, crtc2);
+
+			if (!intel_pipe_output_combo_valid(display))
+				continue;
+
+			igt_dynamic_f("pipe-%s-%s-pipe-%s-%s",
+				      igt_crtc_name(crtc1), igt_output_name(output1),
+				      igt_crtc_name(crtc2), igt_output_name(output2))
+				run_extendedmode_basic(data,
+						       crtc1, output1,
+						       crtc2, output2);
+
 			/*
 			 * In simulation env, only run the test once with a
 			 * single valid pipe/output pair instead of all combos.
diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index 55cee260d01f..0d338eeb5acb 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -524,8 +524,7 @@ static void test_plane_position_2_display(data_t *data, igt_crtc_t *crtc1,
 
 static void run_2_display_test(data_t *data, uint64_t modifier, const char *name)
 {
-	igt_crtc_t *crtc2;
-	igt_crtc_t *crtc;
+	igt_crtc_t *crtc1, *crtc2;
 	igt_output_t *output1, *output2;
 	igt_display_t *display = &data->display;
 
@@ -534,42 +533,30 @@ static void run_2_display_test(data_t *data, uint64_t modifier, const char *name
 
 	igt_display_reset(display);
 
-	for_each_crtc(display, crtc) {
-		for_each_valid_output_on_crtc(display,
-					      crtc,
-					      output1) {
-			for_each_crtc(display, crtc2) {
-				if (crtc == crtc2)
-					continue;
-
-				for_each_valid_output_on_crtc(display, crtc2, output2) {
-					if (output1 == output2)
-						continue;
-
-					igt_display_reset(display);
-
-					igt_output_set_crtc(output1,
-							    crtc);
-					igt_output_set_crtc(output2,
-							    crtc2);
-
-					if (!intel_pipe_output_combo_valid(display))
-						continue;
-
-					igt_dynamic_f("pipe-%s-%s-pipe-%s-%s",
-						       igt_crtc_name(crtc),
-						       output1->name,
-						       igt_crtc_name(crtc2),
-						       output2->name)
-						test_plane_position_2_display(data,
-									      crtc,
-									      crtc2,
-									      output1, output2,
-									      modifier);
-
-					test_fini_2_display(data);
-				}
-			}
+	for_each_crtc_with_valid_output(display, crtc1, output1) {
+		for_each_crtc_with_valid_output(display, crtc2, output2) {
+			if (crtc1 == crtc2)
+				continue;
+
+			if (output1 == output2)
+				continue;
+
+			igt_display_reset(display);
+
+			igt_output_set_crtc(output1, crtc1);
+			igt_output_set_crtc(output2, crtc2);
+
+			if (!intel_pipe_output_combo_valid(display))
+				continue;
+
+			igt_dynamic_f("pipe-%s-%s-pipe-%s-%s",
+				      igt_crtc_name(crtc1), output1->name,
+				      igt_crtc_name(crtc2), output2->name)
+				test_plane_position_2_display(data,
+							      crtc1, crtc2,
+							      output1, output2,
+							      modifier);
+			test_fini_2_display(data);
 		}
 	}
 }
-- 
2.52.0

