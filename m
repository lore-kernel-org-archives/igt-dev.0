Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B508C4450A
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 04:20:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C1D710E125;
	Wed, 15 Jul 2026 04:20:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EE2pmc7O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4817D10E125
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 04:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784089166; x=1815625166;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GliQXuFq709M/hAOdB/TDQCCaGzCSlmpLFx0Vh+18t4=;
 b=EE2pmc7OI0XXe+nnf3BSYRfhtnssmF27zh8lZE5qxiPgEDVGrpMREHNc
 XzDByr8ZOXUjgb8fe+9oy+VEym1HqeH4UqNFEBao3OM8JlDhgDz0xyzPN
 VKJBV+UUepMRVZnDMz7cw6bcWsfNSxwJsY5bCM9BnYOiHI4k4qObNzDRV
 364hKp049b9MTIgGANeMcaMVeBbxMPmXEp/PcXnjPzyQhmYliSDkoE5p4
 RUk+fYCAh1LZ7ac2p/pWh459VTxaCmsBCc4LrxXS3mGqKuqIrVejq38Gr
 7VerVT6d5yN30u9GLKuzslXL+jPFYsU/vpfDZsUv2r1mPQRxRw3yWH738 w==;
X-CSE-ConnectionGUID: F/I3q3HZRrmuEDh4eXZpsg==
X-CSE-MsgGUID: gBNxK5M+SV+/Irp1XHamQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84807140"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="84807140"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 21:19:26 -0700
X-CSE-ConnectionGUID: Azpw8mMJRgeQoxJ2Uxsn+Q==
X-CSE-MsgGUID: 6CBLZjwlSq2PAgWGttyCJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="256692256"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 21:19:25 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v2 2/2] tests/chamelium/kms_chamelium_color: Add
 multi-format coverage for pipe color tests
Date: Wed, 15 Jul 2026 10:02:26 +0530
Message-ID: <20260715043226.169521-3-pranay.samala@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260715043226.169521-1-pranay.samala@intel.com>
References: <20260715043226.169521-1-pranay.samala@intel.com>
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

Extend chamelium color tests to run across multiple pixel formats
at dynamic subtest level instead of being limited to single format
for gamma/degamma and CTM tests.

This improves coverage for format-dependent pipe color pipeline
behavior.

v2:
- Add formats (P010, RGB10bit, FP16)
- Rebase and split the patches

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/chamelium/kms_chamelium_color.c | 102 +++++++++++++++++---------
 1 file changed, 67 insertions(+), 35 deletions(-)

diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_chamelium_color.c
index 72d7716bc..77970fa7e 100644
--- a/tests/chamelium/kms_chamelium_color.c
+++ b/tests/chamelium/kms_chamelium_color.c
@@ -58,6 +58,19 @@
 
 IGT_TEST_DESCRIPTION("Test Color Features at Pipe level using Chamelium to verify instead of CRC");
 
+static const struct {
+	const char *name;
+	uint32_t format;
+	int bpc;
+} formats[] = {
+	{ "XRGB8888", DRM_FORMAT_XRGB8888, 8 },
+	{ "YUYV", DRM_FORMAT_YUYV, 8 },
+	{ "NV12", DRM_FORMAT_NV12, 8 },
+	{ "XRGB2101010", DRM_FORMAT_XRGB2101010, 10 },
+	{ "P010", DRM_FORMAT_P010, 10 },
+	{ "FP16", DRM_FORMAT_XRGB16161616F, 16 },
+};
+
 static unsigned int create_test_fb(data_t *data, int w, int h,
 				   uint32_t format,
 				   enum igt_color_encoding encoding,
@@ -504,15 +517,24 @@ run_gamma_degamma_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
 
 	igt_require(port_idx >= 0);
 
-	data->color_depth = 8;
-	data->drm_format = DRM_FORMAT_XRGB8888;
 	data->mode = igt_output_get_mode(data->output);
 
 	if (!crtc_output_combo_valid(data, crtc))
 		return;
-
-	igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc), data->output->name)
-		igt_assert(test_t(data, data->primary, data->ports[port_idx]));
+	for (int i = 0; i < ARRAY_SIZE(formats); i++) {
+		if (!igt_plane_has_format_mod(data->primary, formats[i].format,
+					      DRM_FORMAT_MOD_LINEAR))
+			continue;
+
+		igt_dynamic_f("pipe-%s-%s-%s", igt_crtc_name(crtc),
+			      data->output->name, formats[i].name) {
+			igt_info("Running on " IGT_FORMAT_FMT " format\n",
+				 IGT_FORMAT_ARGS(formats[i].format));
+			data->color_depth = formats[i].bpc;
+			data->drm_format = formats[i].format;
+			igt_assert(test_t(data, data->primary, data->ports[port_idx]));
+		}
+	}
 }
 
 static void
@@ -522,6 +544,7 @@ run_ctm_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
 		       int iter)
 {
 	double delta;
+	bool success;
 	color_t red_green_blue[] = {
 		{ 1.0, 0.0, 0.0 },
 		{ 0.0, 1.0, 0.0 },
@@ -542,43 +565,52 @@ run_ctm_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
 	 * We assume an 8bits depth per color for degamma/gamma LUTs
 	 * for CRC checks with framebuffer references.
 	 */
-	data->color_depth = 8;
-	delta = 1.0 / (1 << data->color_depth);
-	data->drm_format = DRM_FORMAT_XRGB8888;
 	data->mode = igt_output_get_mode(data->output);
 
 	if (!crtc_output_combo_valid(data, crtc))
 		return;
 
-	igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc), data->output->name) {
-		bool success = false;
-		int i;
-
-		if (!iter)
-			success = test_pipe_ctm(data, data->primary,
-						red_green_blue,
-						expected_colors, ctm,
-						data->ports[port_idx]);
-
-		/*
-		 * We tests a few values around the expected result because
-		 * it depends on the hardware we're dealing with, we can either
-		 * get clamped or rounded values and we also need to account
-		 * for odd number of items in the LUTs.
-		 */
-		for (i = 0; i < iter; i++) {
-			expected_colors[0].r =
-				expected_colors[1].g =
-				expected_colors[2].b =
-				ctm[0] + delta * (i - (iter / 2));
-			if (test_pipe_ctm(data, data->primary,
-					  red_green_blue, expected_colors,
-					  ctm, data->ports[port_idx])) {
-				success = true;
-				break;
+	for (int fi = 0; fi < ARRAY_SIZE(formats); fi++) {
+		if (!igt_plane_has_format_mod(data->primary, formats[fi].format,
+					      DRM_FORMAT_MOD_LINEAR))
+			continue;
+
+		igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc), data->output->name) {
+			data->color_depth = formats[fi].bpc;
+			delta = 1.0 / (1 << data->color_depth);
+			data->drm_format = formats[fi].format;
+			success = false;
+			int i;
+
+			igt_info("Running on " IGT_FORMAT_FMT " format\n",
+				 IGT_FORMAT_ARGS(formats[fi].format));
+
+			if (!iter)
+				success = test_pipe_ctm(data, data->primary,
+							red_green_blue,
+							expected_colors, ctm,
+							data->ports[port_idx]);
+
+			/*
+			 * We tests a few values around the expected result because
+			 * it depends on the hardware we're dealing with, we can either
+			 * get clamped or rounded values and we also need to account
+			 * for odd number of items in the LUTs.
+			 */
+			for (i = 0; i < iter; i++) {
+				expected_colors[0].r =
+					expected_colors[1].g =
+					expected_colors[2].b =
+					ctm[0] + delta * (i - (iter / 2));
+				if (test_pipe_ctm(data, data->primary,
+						  red_green_blue, expected_colors,
+						  ctm, data->ports[port_idx])) {
+					success = true;
+					break;
+				}
 			}
+			igt_assert(success);
 		}
-		igt_assert(success);
 	}
 }
 
-- 
2.53.0

