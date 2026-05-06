Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C542ECD3424
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 04:05:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60B9A10EC6B;
	Wed,  6 May 2026 04:05:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lnpqpq3S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F53810E0E0
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 04:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778040286; x=1809576286;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b4MUHkLc5mPyRbrYsAHIATHU8kVTlG8OrAdetUw91g8=;
 b=Lnpqpq3SuLSK+3w5EdVqARwZmQW6JF2tiiSANrbD1tjDpE1EzFlT9Nw8
 ww/uUrG1Wugc0fid90DqylCVgd8feQr9RRRCpxl7I2F8lq3S8g+7ZwtoC
 dDjl1HTMnX2Fto86+WQD9NaOrRL1WMJEraRgna2cQFQT+mT49l4HLfZGS
 LjIiMGm7y0UoC2gvdxK07IM9YFcuJ+KiTc7tWQXJ0wp5JvNcfqPg4iBqF
 QIsjdqaUDvl/WCY7A7hMtJYPL0z+TD9xIZpj0xW9t3qzBTp9onVFstv4b
 vMAU5vA+j6/MdRHpcOMtz3EhpLlvxvlLxKC2+Q8UgJLUQ+3+YZc/zlSwG g==;
X-CSE-ConnectionGUID: e4iAXpU5Rs+X7SGGPas86A==
X-CSE-MsgGUID: Mv2NoIkzQgaCIvdr6qBl2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="104381087"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="104381087"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 21:04:46 -0700
X-CSE-ConnectionGUID: 40oDJzWnQeeLHbr7pc8vRg==
X-CSE-MsgGUID: GqFouUYVQIekLRQ2np0qwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="235010149"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by orviesa006.jf.intel.com with ESMTP; 05 May 2026 21:04:44 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v3 3/3] tests/kms_hdr: Move capability checks inside
 dynamic subtests
Date: Wed,  6 May 2026 09:45:27 +0530
Message-Id: <20260506041527.56862-4-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260506041527.56862-1-pranay.samala@intel.com>
References: <20260506041527.56862-1-pranay.samala@intel.com>
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

v4:
- Rebase

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4879
Signed-off-by: Pranay Samala <pranay.samala@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_hdr.c | 168 +++++++++++++++++++++---------------------------
 1 file changed, 74 insertions(+), 94 deletions(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index ded375a23..d50f87787 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -255,17 +255,6 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
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
@@ -275,17 +264,7 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
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
@@ -293,10 +272,24 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
 
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
+
 				test_fini(data);
 			}
 
@@ -533,43 +526,8 @@ static void test_hdr(data_t *data, uint32_t flags)
 	for_each_connected_output(display, output) {
 		igt_crtc_t *crtc;
 
-		/* To test HDR, 10 bpc is required, so we need to
-		 * set MAX_BPC property to 10bpc prior to setting
-		 * HDR metadata property. Therefore, checking.
-		 */
-		if (!has_max_bpc(output) || !igt_output_supports_hdr(output)) {
-			igt_info("%s: Doesn't support IGT_CONNECTOR_MAX_BPC or IGT_CONNECTOR_HDR_OUTPUT_METADATA.\n",
-				 igt_output_name(output));
-			continue;
-		}
-
-		/* For negative test, panel should be non-hdr. */
-		if ((flags & TEST_INVALID_HDR) && igt_is_panel_hdr(data->fd, output)) {
-			igt_info("%s: Can't run negative test on HDR panel.\n",
-				 igt_output_name(output));
-			continue;
-		}
-
-		if ((flags & ~TEST_INVALID_HDR) && !igt_is_panel_hdr(data->fd, output)) {
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
@@ -579,42 +537,64 @@ static void test_hdr(data_t *data, uint32_t flags)
 				prepare_test(data, output,
 					     crtc);
 
-				/* Signal HDR requirement via metadata */
-				igt_hdr_fill_st2084(&hdr);
-				igt_hdr_set_metadata(data->output, &hdr);
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
-				igt_hdr_set_metadata(data->output, NULL);
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
+					igt_require_f(has_max_bpc(output) &&
+						      igt_output_supports_hdr(output),
+						      "%s: Doesn't support IGT_CONNECTOR_MAX_BPC "
+						      "or IGT_CONNECTOR_HDR_OUTPUT_METADATA.\n",
+						      igt_output_name(output));
+
+					if (flags & TEST_INVALID_HDR)
+						igt_require_f(!igt_is_panel_hdr(data->fd, output),
+							      "%s: Can't run negative test on "
+							      "HDR panel.\n",
+							      igt_output_name(output));
+
+					if (!(flags & TEST_INVALID_HDR))
+						igt_require_f(igt_is_panel_hdr(data->fd, output),
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
+					igt_hdr_fill_st2084(&hdr);
+					igt_hdr_set_metadata(data->output, &hdr);
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
+					igt_hdr_set_metadata(data->output, NULL);
+					igt_display_commit2(display, display->is_atomic ?
+							    COMMIT_ATOMIC : COMMIT_LEGACY);
+
 					if (flags & (TEST_NONE | TEST_DPMS | TEST_SUSPEND |
 						     TEST_INVALID_HDR | TEST_BRIGHTNESS))
 						test_static_toggle(data,
-- 
2.34.1

