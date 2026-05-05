Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA1B7FF885A
	for <igt-dev@archiver.kernel.org>; Tue,  5 May 2026 03:51:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9986310E021;
	Tue,  5 May 2026 03:51:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ORMmhIRj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D26E410E021
 for <igt-dev@lists.freedesktop.org>; Tue,  5 May 2026 03:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777953064; x=1809489064;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H9iv9u2Up1n4v+fiACr17ZPxQazHBzHRdSJ2BUPCbgc=;
 b=ORMmhIRjQQQ1cAUc2yw6o+V3wpucUKZRfaJwpmrDab80SMQMoH8dgd2F
 x4AP+9MSpDT+uhvWSvGRuVQDMM41MOPLSeHF5/SCfEdMy924j2U8E3cQb
 cxONai9ImhnoSpJaF6diSSEcpgbjNqzwj3v60oLe5oKeVLVJ/MJpN/jdk
 fic2dKgQpeLTLQGNr9FuPVZPoRfPdftNE0qgvw6moybvkNFDO/8aqATMh
 JCO0/aCHaNc79eOjXKAFuadIFbKiGGmkMPT3XJ4HHWVUEV5YiWG/TG4tG
 IxoeBzSLNUqS8yZMIPBQwm30TIbK3wlZhEW2j3ZiAN1NOzZUEfA0VjQ4+ g==;
X-CSE-ConnectionGUID: e0BZY8ANReWXcEvU9C5Z0w==
X-CSE-MsgGUID: mIYu4wS0SViHjqLLonAOxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="104265463"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="104265463"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 20:51:03 -0700
X-CSE-ConnectionGUID: g66+j4gPSQmh0yBoB5HrFQ==
X-CSE-MsgGUID: xILBUelYRu2S5uJaoeojqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="259048907"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by fmviesa002.fm.intel.com with ESMTP; 04 May 2026 20:51:02 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v2 3/3] tests/kms_hdr: Move capability checks inside
 dynamic subtests
Date: Tue,  5 May 2026 09:31:44 +0530
Message-Id: <20260505040144.28354-4-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260505040144.28354-1-pranay.samala@intel.com>
References: <20260505040144.28354-1-pranay.samala@intel.com>
MIME-Version: 1.0
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

Earlier, output capability checks were done outside the dynamic
subtest scope using continue/break. This caused a problem where
if an earlier output (e.g., eDP) passed but a later output
(e.g., DP) failed a check (such as reading bpc), the entire
subtest would be skipped, discarding the earlier valid result
and reporting a false skip/failure.

Fix this by moving all output capability checks inside dynamic
block. Each pipe-output-format combination is now an independent
dynamic subtest that passes or skips on its own merit, without
affecting other combinations.

v2:
- Consider other pipe if pipe combo fails (Karthik)
- Handle test_fini wherever required (Karthik)

v3:
- Update the commit message (Karthik)

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4879
Signed-off-by: Pranay Samala <pranay.samala@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_hdr.c | 166 +++++++++++++++++++++---------------------------
 1 file changed, 72 insertions(+), 94 deletions(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index 56d0d2cd2..a170a5b90 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -323,17 +323,6 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
 	for_each_connected_output(display, output) {
 		igt_crtc_t *crtc;
 
-		if (!has_max_bpc(output)) {
-			igt_info("%s: Doesn't support IGT_CONNECTOR_MAX_BPC.\n",
-				 igt_output_name(output));
-			continue;
-		}
-
-		if (igt_get_output_max_bpc(output) < 10) {
-			igt_info("%s: Doesn't support 10 bpc.\n", igt_output_name(output));
-			continue;
-		}
-
 		for_each_crtc(display, crtc) {
 			igt_output_set_crtc(output,
 					    crtc);
@@ -343,17 +332,7 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
 			}
 
 			for (int i = 0; i < ARRAY_SIZE(hdr_test_formats); i++) {
-				prepare_test(data, output,
-					     crtc);
-
-				if (is_intel_device(data->fd) &&
-				    !igt_max_bpc_constraint(display, crtc, output, 10)) {
-					igt_info("%s: No suitable mode found to use 10 bpc.\n",
-						  igt_output_name(output));
-
-					test_fini(data);
-					break;
-				}
+				prepare_test(data, output, crtc);
 
 				data->mode = igt_output_get_mode(output);
 				data->w = data->mode->hdisplay;
@@ -361,10 +340,23 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
 
 				igt_dynamic_f("pipe-%s-%s-%s",
 					      igt_crtc_name(crtc), output->name,
-					      igt_format_str(hdr_test_formats[i]))
-					      test_bpc_switch_on_output(data,
-								       crtc,
-								       output, hdr_test_formats[i], flags);
+					      igt_format_str(hdr_test_formats[i])) {
+					igt_require_f(has_max_bpc(output),
+						      "%s: Doesn't support IGT_CONNECTOR_MAX_BPC.\n",
+						      igt_output_name(output));
+
+					igt_require_f(igt_get_output_max_bpc(output) >= 10,
+						      "%s: Doesn't support 10 bpc.\n",
+						      igt_output_name(output));
+
+					igt_require_f(!is_intel_device(data->fd) ||
+						      igt_max_bpc_constraint(display, crtc, output, 10),
+						      "%s: No suitable mode found to use 10 bpc.\n",
+						      igt_output_name(output));
+
+					test_bpc_switch_on_output(data, crtc, output,
+								  hdr_test_formats[i], flags);
+				}
 
 				test_fini(data);
 			}
@@ -715,43 +707,8 @@ static void test_hdr(data_t *data, uint32_t flags)
 	for_each_connected_output(display, output) {
 		igt_crtc_t *crtc;
 
-		/* To test HDR, 10 bpc is required, so we need to
-		 * set MAX_BPC property to 10bpc prior to setting
-		 * HDR metadata property. Therefore, checking.
-		 */
-		if (!has_max_bpc(output) || !has_hdr(output)) {
-			igt_info("%s: Doesn't support IGT_CONNECTOR_MAX_BPC or IGT_CONNECTOR_HDR_OUTPUT_METADATA.\n",
-				 igt_output_name(output));
-			continue;
-		}
-
-		/* For negative test, panel should be non-hdr. */
-		if ((flags & TEST_INVALID_HDR) && is_panel_hdr(data, output)) {
-			igt_info("%s: Can't run negative test on HDR panel.\n",
-				 igt_output_name(output));
-			continue;
-		}
-
-		if ((flags & ~TEST_INVALID_HDR) && !is_panel_hdr(data, output)) {
-			igt_info("%s: Can't run HDR tests on non-HDR panel.\n",
-				 igt_output_name(output));
-			continue;
-		}
-
-		if (igt_get_output_max_bpc(output) < 10) {
-			igt_info("%s: Doesn't support 10 bpc.\n", igt_output_name(output));
-			continue;
-		}
-
-		if ((flags & TEST_BRIGHTNESS) && !output_is_internal_panel(output)) {
-			igt_info("%s: Can't run brightness test on non-internal panel.\n",
-				 igt_output_name(output));
-			continue;
-		}
-
 		for_each_crtc(display, crtc) {
-			igt_output_set_crtc(output,
-					    crtc);
+			igt_output_set_crtc(output, crtc);
 			if (!intel_pipe_output_combo_valid(display)) {
 				igt_output_set_crtc(output, NULL);
 				continue;
@@ -761,42 +718,63 @@ static void test_hdr(data_t *data, uint32_t flags)
 				prepare_test(data, output,
 					     crtc);
 
-				/* Signal HDR requirement via metadata */
-				fill_hdr_output_metadata_st2084(&hdr);
-				set_hdr_output_metadata(data, &hdr);
-				if (igt_display_try_commit2(display, display->is_atomic ?
-							    COMMIT_ATOMIC : COMMIT_LEGACY)) {
-					igt_info("%s: Couldn't set HDR metadata\n",
-						  igt_output_name(output));
-					test_fini(data);
-					break;
-				}
-
-				if (is_intel_device(data->fd) &&
-				    !igt_max_bpc_constraint(display, crtc, output, 10)) {
-					igt_info("%s: No suitable mode found to use 10 bpc.\n",
-						  igt_output_name(output));
-
-					test_fini(data);
-					break;
-				}
-
-				if (igt_is_dsc_enabled(data->fd, output->name))
-					flags |= TEST_NEEDS_DSC;
-				else
-					flags &= ~TEST_NEEDS_DSC;
-
-				set_hdr_output_metadata(data, NULL);
-				igt_display_commit2(display, display->is_atomic ?
-						    COMMIT_ATOMIC : COMMIT_LEGACY);
-
 				data->mode = igt_output_get_mode(output);
 				data->w = data->mode->hdisplay;
 				data->h = data->mode->vdisplay;
 
-				igt_dynamic_f("pipe-%s-%s-%s",
-					       igt_crtc_name(crtc), output->name,
-					       igt_format_str(hdr_test_formats[i])) {
+				igt_dynamic_f("pipe-%s-%s-%s", igt_crtc_name(crtc), output->name,
+					      igt_format_str(hdr_test_formats[i])) {
+					igt_require_f(has_max_bpc(output) && has_hdr(output),
+						      "%s: Doesn't support IGT_CONNECTOR_MAX_BPC "
+						      "or IGT_CONNECTOR_HDR_OUTPUT_METADATA.\n",
+						      igt_output_name(output));
+
+					if (flags & TEST_INVALID_HDR)
+						igt_require_f(!is_panel_hdr(data, output),
+							      "%s: Can't run negative test on "
+							      "HDR panel.\n",
+							      igt_output_name(output));
+
+					if (!(flags & TEST_INVALID_HDR))
+						igt_require_f(is_panel_hdr(data, output),
+							      "%s: Can't run HDR tests on "
+							      "non-HDR panel.\n",
+							      igt_output_name(output));
+
+					igt_require_f(igt_get_output_max_bpc(output) >= 10,
+						      "%s: Doesn't support 10 bpc.\n",
+						      igt_output_name(output));
+
+					if (flags & TEST_BRIGHTNESS)
+						igt_require_f(output_is_internal_panel(output),
+							      "%s: Can't run brightness test on "
+							      "non-internal panel.\n",
+							      igt_output_name(output));
+
+					/* Signal HDR requirement via metadata */
+					fill_hdr_output_metadata_st2084(&hdr);
+					set_hdr_output_metadata(data, &hdr);
+					igt_require_f(!igt_display_try_commit2(display,
+									       display->is_atomic ?
+									       COMMIT_ATOMIC :
+									       COMMIT_LEGACY),
+						      "%s: Couldn't set HDR metadata\n",
+						      igt_output_name(output));
+
+					igt_require_f(!is_intel_device(data->fd) ||
+						      igt_max_bpc_constraint(display, crtc, output, 10),
+						      "%s: No suitable mode found to use 10 bpc.\n",
+						      igt_output_name(output));
+
+					if (igt_is_dsc_enabled(data->fd, output->name))
+						flags |= TEST_NEEDS_DSC;
+					else
+						flags &= ~TEST_NEEDS_DSC;
+
+					set_hdr_output_metadata(data, NULL);
+					igt_display_commit2(display, display->is_atomic ?
+							    COMMIT_ATOMIC : COMMIT_LEGACY);
+
 					if (flags & (TEST_NONE | TEST_DPMS | TEST_SUSPEND |
 						     TEST_INVALID_HDR | TEST_BRIGHTNESS))
 						test_static_toggle(data,
-- 
2.34.1

