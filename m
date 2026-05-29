Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A224CD6E45
	for <igt-dev@archiver.kernel.org>; Fri, 29 May 2026 06:22:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E307C10F956;
	Fri, 29 May 2026 06:22:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CVu5NH+7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DF6810F952
 for <igt-dev@lists.freedesktop.org>; Fri, 29 May 2026 06:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780035698; x=1811571698;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A9jp1DOZx/ATVpyzPpFJ4Mlein2U1cux5wjVD01+dUc=;
 b=CVu5NH+77ENpVVPsZJmU0VYTest1gObcImDcIB/dBVoQlMcjj/9p5zgk
 +Xxh8tZtjTHdZRs/wHhmzPuDuixV795UwLgRH4aO8Z5QXQjph1QCk1ruY
 aRGxfjzRaj/K/hX0hGNxElzgSNBCJmZX2vQQUBtxnJ2y7gSCN9rSVSkg5
 rtop9hOSQ/qMRZ6F9ECnlmVzLcpdI4iCCYwVqCT9G0Ma/rKXbt9c6hXvA
 wJmF5frpErcCF6vvLg43G+PuhHtp8iGt6OBnkiNT0cp3KE9sHxbzc0dXS
 F1lnnb0W5BXBJLtRqaTzPZv8UWrFWPQHmwLh0FJ8AZh77Dvb5vpWqTa2m w==;
X-CSE-ConnectionGUID: 7A45Hd+gSmSQV87hsN98wQ==
X-CSE-MsgGUID: 7wJ4FBdlTdyuj4bPN7BbuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="98300230"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; d="scan'208";a="98300230"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 23:21:38 -0700
X-CSE-ConnectionGUID: W9U2OdMwSfKMdlniz4EiCA==
X-CSE-MsgGUID: xCTy++C5QYmhEwLNW/lCCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; d="scan'208";a="238576471"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by fmviesa010.fm.intel.com with ESMTP; 28 May 2026 23:21:36 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v3 1/2] Revert "tests/kms_hdr: Move capability checks
 inside dynamic subtests"
Date: Fri, 29 May 2026 12:02:29 +0530
Message-Id: <20260529063230.754253-2-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260529063230.754253-1-pranay.samala@intel.com>
References: <20260529063230.754253-1-pranay.samala@intel.com>
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

The previous change moved output capability checks inside dynamic
subtests to avoid losing valid results when a later output failed a
check. However, the real issue is in the helper behavior rather
than the kms_hdr test flow itself.

Move the checks back outside the dynamic subtests and restore the
previous behavior. The issue will instead be handled at the
helper/API level by updating igt_get_output_max_bpc() to return
status, allowing callers to handle read/parse failures explicitly
without changing the existing kms_hdr control flow.

v2:
- Update commit message (Karthik)

v3:
- Sync the missing recently merged changes (Swati)

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_hdr.c | 175 +++++++++++++++++++++++++++---------------------
 1 file changed, 99 insertions(+), 76 deletions(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index affd38887..7127a56b3 100644
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
@@ -266,29 +277,24 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
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
 								  hdr_test_formats[i], flags);
-				}
 
 				test_fini(data);
 			}
@@ -530,6 +536,40 @@ static void test_hdr(data_t *data, uint32_t flags)
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
@@ -545,73 +585,56 @@ static void test_hdr(data_t *data, uint32_t flags)
 				data->w = data->mode->hdisplay;
 				data->h = data->mode->vdisplay;
 
-				igt_dynamic_f("pipe-%s-%s-%s", igt_crtc_name(crtc), output->name,
-					      igt_format_str(hdr_test_formats[i])) {
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
-					/* Signal HDR requirement via metadata.
-					 * A framebuffer must be present for the driver to accept
-					 * a metadata commit. Use TEST_ONLY so hardware state is
-					 * unchanged.
-					 */
-					igt_create_fb(data->fd,
-						      data->w, data->h,
-						      hdr_test_formats[i],
-						      DRM_FORMAT_MOD_LINEAR,
-						      &data->afb);
-					igt_plane_set_fb(data->primary, &data->afb);
-					igt_plane_set_size(data->primary, data->w, data->h);
-					igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
-					igt_hdr_fill_st2084(&hdr);
-					igt_hdr_set_metadata(data->output, &hdr);
-					igt_require_f(!igt_display_try_commit_atomic(display,
-										     DRM_MODE_ATOMIC_TEST_ONLY |
-										     DRM_MODE_ATOMIC_ALLOW_MODESET,
-										     NULL),
-						      "%s: Couldn't set HDR metadata\n",
-						      igt_output_name(output));
-
-					/* Reset IGT display state; hardware was not changed. */
+				/* Signal HDR requirement via metadata.
+				 * A framebuffer must be present for the driver to accept
+				 * a metadata commit. Use TEST_ONLY so hardware state is
+				 * unchanged.
+				 */
+				igt_create_fb(data->fd,
+					      data->w, data->h,
+					      hdr_test_formats[i],
+					      DRM_FORMAT_MOD_LINEAR,
+					      &data->afb);
+				igt_plane_set_fb(data->primary, &data->afb);
+				igt_plane_set_size(data->primary, data->w, data->h);
+				igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
+				igt_hdr_fill_st2084(&hdr);
+				igt_hdr_set_metadata(data->output, &hdr);
+				if (igt_display_try_commit_atomic(display,
+								  DRM_MODE_ATOMIC_TEST_ONLY |
+								  DRM_MODE_ATOMIC_ALLOW_MODESET,
+								  NULL)) {
+					igt_info("%s: Couldn't set HDR metadata\n",
+						 igt_output_name(output));
 					igt_hdr_set_metadata(data->output, NULL);
 					igt_plane_set_fb(data->primary, NULL);
 					igt_remove_fb(data->fd, &data->afb);
+					test_fini(data);
+					break;
+				}
+
+				/* Reset IGT display state; hardware was not changed. */
+				igt_hdr_set_metadata(data->output, NULL);
+				igt_plane_set_fb(data->primary, NULL);
+				igt_remove_fb(data->fd, &data->afb);
 
-					igt_require_f(!is_intel_device(data->fd) ||
-						      igt_max_bpc_constraint(display, crtc, output, 10),
-						      "%s: No suitable mode found to use 10 bpc.\n",
-						      igt_output_name(output));
+				if (is_intel_device(data->fd) &&
+				    !igt_max_bpc_constraint(display, crtc, output, 10)) {
+					igt_info("%s: No suitable mode found to use 10 bpc.\n",
+						 igt_output_name(output));
+
+					test_fini(data);
+					break;
+				}
 
-					if (igt_is_dsc_enabled(data->fd, output->name))
-						flags |= TEST_NEEDS_DSC;
-					else
-						flags &= ~TEST_NEEDS_DSC;
+				if (igt_is_dsc_enabled(data->fd, output->name))
+					flags |= TEST_NEEDS_DSC;
+				else
+					flags &= ~TEST_NEEDS_DSC;
 
+				igt_dynamic_f("pipe-%s-%s-%s",
+					      igt_crtc_name(crtc), output->name,
+					      igt_format_str(hdr_test_formats[i])) {
 					if (flags & (TEST_NONE | TEST_DPMS | TEST_SUSPEND |
 						     TEST_INVALID_HDR | TEST_BRIGHTNESS))
 						test_static_toggle(data,
-- 
2.34.1

