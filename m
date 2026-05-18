Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29DFECD4F3C
	for <igt-dev@archiver.kernel.org>; Mon, 18 May 2026 03:53:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A9CE10E2CC;
	Mon, 18 May 2026 03:53:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mkg3i6xu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C858310E2CC
 for <igt-dev@lists.freedesktop.org>; Mon, 18 May 2026 03:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779076385; x=1810612385;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wtATnqQkFl3Jq6Ok+F7ag8cO25sEuwezkC0UNNA2V2Q=;
 b=mkg3i6xuIM/X0JIzMTHAlpgqfQV0Z85eaWb0e8Ivu5r9fY8lVJl4VMfJ
 hkkl5gLD9Qv8yZtjqfMcnZ7u5wm0LEE9J97RGTunvUGJftw90tx2Liigt
 x3d1QH5EavQF5iBp3fE1KId5TLc2UKY7uddbmc7OWci+gEWSDbt4IgFdf
 rm4wnt4+dgicJhQlVkVVCbFo6z8h1M8LRdUq6ggtZlL2hz7zPtaYAw2Ec
 usx79vvdc/eXr14NiB69O1bmFDvWH6Y6c0aUYrGUyy4xk6egXRT8wliFn
 +EHJzlmySq7F8AeWWZaLr4s9ZfJHzyQ3wuJGW0+cxs1RazYDGCQzwBS4J Q==;
X-CSE-ConnectionGUID: O5v/aAkCTgK27odQxS83Xg==
X-CSE-MsgGUID: xmfblgYSTum6EZiqXjCAbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="79970572"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="79970572"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 20:53:05 -0700
X-CSE-ConnectionGUID: 7yD7/RENTwqIuDkc7Zi5LQ==
X-CSE-MsgGUID: 8AMxkrgSQHeeXrzPpMbedw==
X-ExtLoop1: 1
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by fmviesa003.fm.intel.com with ESMTP; 17 May 2026 20:53:03 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t 1/3] Revert "tests/kms_hdr: Move capability checks
 inside dynamic subtests"
Date: Mon, 18 May 2026 09:33:51 +0530
Message-Id: <20260518040353.212734-2-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260518040353.212734-1-pranay.samala@intel.com>
References: <20260518040353.212734-1-pranay.samala@intel.com>
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

This reverts commit d9667a6fd6468adcdb5542d741ac423339a20556.

Move output capability checks back outside dynamic subtests to
restore the previous behavior while backing out this change.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_hdr.c | 157 +++++++++++++++++++++++++++---------------------
 1 file changed, 88 insertions(+), 69 deletions(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index d50f87787..bcc912d15 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -255,6 +255,17 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
 	for_each_connected_output(display, output) {
 		igt_crtc_t *crtc;
 
+		if (!has_max_bpc(output)) {
+			igt_info("%s: Doesn't support IGT_CONNECTOR_MAX_BPC.\n",
+				 igt_output_name(output));
+			continue;
+		}
+
+		if (igt_get_output_max_bpc(output) < 10) {
+			igt_info("%s: Doesn't support 10 bpc.\n", igt_output_name(output));
+			continue;
+		}
+
 		for_each_crtc(display, crtc) {
 			igt_output_set_crtc(output,
 					    crtc);
@@ -266,29 +277,25 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
 			for (int i = 0; i < ARRAY_SIZE(hdr_test_formats); i++) {
 				prepare_test(data, output, crtc);
 
+				if (is_intel_device(data->fd) &&
+				    !igt_max_bpc_constraint(display, crtc, output, 10)) {
+					igt_info("%s: No suitable mode found to use 10 bpc.\n",
+						 igt_output_name(output));
+
+					test_fini(data);
+					break;
+				}
+
 				data->mode = igt_output_get_mode(output);
 				data->w = data->mode->hdisplay;
 				data->h = data->mode->vdisplay;
 
 				igt_dynamic_f("pipe-%s-%s-%s",
 					      igt_crtc_name(crtc), output->name,
-					      igt_format_str(hdr_test_formats[i])) {
-					igt_require_f(has_max_bpc(output),
-						      "%s: Doesn't support IGT_CONNECTOR_MAX_BPC.\n",
-						      igt_output_name(output));
-
-					igt_require_f(igt_get_output_max_bpc(output) >= 10,
-						      "%s: Doesn't support 10 bpc.\n",
-						      igt_output_name(output));
-
-					igt_require_f(!is_intel_device(data->fd) ||
-						      igt_max_bpc_constraint(display, crtc, output, 10),
-						      "%s: No suitable mode found to use 10 bpc.\n",
-						      igt_output_name(output));
-
+					      igt_format_str(hdr_test_formats[i]))
 					test_bpc_switch_on_output(data, crtc, output,
-								  hdr_test_formats[i], flags);
-				}
+								  hdr_test_formats[i],
+								  flags);
 
 				test_fini(data);
 			}
@@ -526,6 +533,40 @@ static void test_hdr(data_t *data, uint32_t flags)
 	for_each_connected_output(display, output) {
 		igt_crtc_t *crtc;
 
+		/* To test HDR, 10 bpc is required, so we need to
+		 * set MAX_BPC property to 10bpc prior to setting
+		 * HDR metadata property. Therefore, checking.
+		 */
+		if (!has_max_bpc(output) || !igt_output_supports_hdr(output)) {
+			igt_info("%s: Doesn't support IGT_CONNECTOR_MAX_BPC or IGT_CONNECTOR_HDR_OUTPUT_METADATA.\n",
+				 igt_output_name(output));
+			continue;
+		}
+
+		/* For negative test, panel should be non-hdr. */
+		if ((flags & TEST_INVALID_HDR) && igt_is_panel_hdr(data->fd, output)) {
+			igt_info("%s: Can't run negative test on HDR panel.\n",
+				 igt_output_name(output));
+			continue;
+		}
+
+		if ((flags & ~TEST_INVALID_HDR) && !igt_is_panel_hdr(data->fd, output)) {
+			igt_info("%s: Can't run HDR tests on non-HDR panel.\n",
+				 igt_output_name(output));
+			continue;
+		}
+
+		if (igt_get_output_max_bpc(output) < 10) {
+			igt_info("%s: Doesn't support 10 bpc.\n", igt_output_name(output));
+			continue;
+		}
+
+		if ((flags & TEST_BRIGHTNESS) && !output_is_internal_panel(output)) {
+			igt_info("%s: Can't run brightness test on non-internal panel.\n",
+				 igt_output_name(output));
+			continue;
+		}
+
 		for_each_crtc(display, crtc) {
 			igt_output_set_crtc(output, crtc);
 			if (!intel_pipe_output_combo_valid(display)) {
@@ -537,64 +578,42 @@ static void test_hdr(data_t *data, uint32_t flags)
 				prepare_test(data, output,
 					     crtc);
 
+				/* Signal HDR requirement via metadata */
+				igt_hdr_fill_st2084(&hdr);
+				igt_hdr_set_metadata(data->output, &hdr);
+				if (igt_display_try_commit2(display, display->is_atomic ?
+							    COMMIT_ATOMIC : COMMIT_LEGACY)) {
+					igt_info("%s: Couldn't set HDR metadata\n",
+						 igt_output_name(output));
+					test_fini(data);
+					break;
+				}
+
+				if (is_intel_device(data->fd) &&
+				    !igt_max_bpc_constraint(display, crtc, output, 10)) {
+					igt_info("%s: No suitable mode found to use 10 bpc.\n",
+						 igt_output_name(output));
+
+					test_fini(data);
+					break;
+				}
+
+				if (igt_is_dsc_enabled(data->fd, output->name))
+					flags |= TEST_NEEDS_DSC;
+				else
+					flags &= ~TEST_NEEDS_DSC;
+
+				igt_hdr_set_metadata(data->output, NULL);
+				igt_display_commit2(display, display->is_atomic ?
+						    COMMIT_ATOMIC : COMMIT_LEGACY);
+
 				data->mode = igt_output_get_mode(output);
 				data->w = data->mode->hdisplay;
 				data->h = data->mode->vdisplay;
 
-				igt_dynamic_f("pipe-%s-%s-%s", igt_crtc_name(crtc), output->name,
+				igt_dynamic_f("pipe-%s-%s-%s",
+					      igt_crtc_name(crtc), output->name,
 					      igt_format_str(hdr_test_formats[i])) {
-					igt_require_f(has_max_bpc(output) &&
-						      igt_output_supports_hdr(output),
-						      "%s: Doesn't support IGT_CONNECTOR_MAX_BPC "
-						      "or IGT_CONNECTOR_HDR_OUTPUT_METADATA.\n",
-						      igt_output_name(output));
-
-					if (flags & TEST_INVALID_HDR)
-						igt_require_f(!igt_is_panel_hdr(data->fd, output),
-							      "%s: Can't run negative test on "
-							      "HDR panel.\n",
-							      igt_output_name(output));
-
-					if (!(flags & TEST_INVALID_HDR))
-						igt_require_f(igt_is_panel_hdr(data->fd, output),
-							      "%s: Can't run HDR tests on "
-							      "non-HDR panel.\n",
-							      igt_output_name(output));
-
-					igt_require_f(igt_get_output_max_bpc(output) >= 10,
-						      "%s: Doesn't support 10 bpc.\n",
-						      igt_output_name(output));
-
-					if (flags & TEST_BRIGHTNESS)
-						igt_require_f(output_is_internal_panel(output),
-							      "%s: Can't run brightness test on "
-							      "non-internal panel.\n",
-							      igt_output_name(output));
-
-					/* Signal HDR requirement via metadata */
-					igt_hdr_fill_st2084(&hdr);
-					igt_hdr_set_metadata(data->output, &hdr);
-					igt_require_f(!igt_display_try_commit2(display,
-									       display->is_atomic ?
-									       COMMIT_ATOMIC :
-									       COMMIT_LEGACY),
-						      "%s: Couldn't set HDR metadata\n",
-						      igt_output_name(output));
-
-					igt_require_f(!is_intel_device(data->fd) ||
-						      igt_max_bpc_constraint(display, crtc, output, 10),
-						      "%s: No suitable mode found to use 10 bpc.\n",
-						      igt_output_name(output));
-
-					if (igt_is_dsc_enabled(data->fd, output->name))
-						flags |= TEST_NEEDS_DSC;
-					else
-						flags &= ~TEST_NEEDS_DSC;
-
-					igt_hdr_set_metadata(data->output, NULL);
-					igt_display_commit2(display, display->is_atomic ?
-							    COMMIT_ATOMIC : COMMIT_LEGACY);
-
 					if (flags & (TEST_NONE | TEST_DPMS | TEST_SUSPEND |
 						     TEST_INVALID_HDR | TEST_BRIGHTNESS))
 						test_static_toggle(data,
-- 
2.34.1

