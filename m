Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAAC2D609DF
	for <igt-dev@archiver.kernel.org>; Tue, 16 Dec 2025 18:45:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7960D10E3D2;
	Tue, 16 Dec 2025 18:45:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kt1BZelB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD5410E3D2
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Dec 2025 18:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765910713; x=1797446713;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W0QfAW5w+5vQ/G2FNY08KWCta0NsC76ZR8vMlUet32E=;
 b=Kt1BZelB5rQLbIEgeuzWZx1cUJIFJtGEQYjlOuh0NPZivyyerMQ/ctQL
 HLzIVS/dQ5Echfas/NV5ZDqxLdghl3eSC/ltsvv02UtJahx/0RR43/kMn
 XOoL52xAFv8HJQ9InNYkh8cKWg8bxRJxzwN8mVECqpZvlOo5XCkWBr9lw
 S9xBMa4oZZ7PtmAtVnH3zl/MtkdlhruzgOxd5FScEPTgwDLd5sGkNYp28
 jIQ7/+QKM4+BtApVfB+uvWf5h7lMpcPLidhxJcnvVs/+MxZ2LoF5EJvgR
 /XqYm2QVsXW/PkitAWv6ZU/LrSH2V3ZWHUGj20iAQozxSF2Psyl/Iiv9a w==;
X-CSE-ConnectionGUID: admkAF3/SAaynP3M3sZ5cw==
X-CSE-MsgGUID: DB9V5XigTiWL0NUN6P/SVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="70416025"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="70416025"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 10:45:13 -0800
X-CSE-ConnectionGUID: SBO39UkjQtawGSox+xPLlA==
X-CSE-MsgGUID: eQm+39ZQTFCspcjr0+vh0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="198148604"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 10:45:12 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>,
	Heikkila@freedesktop.org
Subject: [PATCH i-g-t 2/7] tests/intel/kms_flip_scaled_crc: add flip to
 reflect-x tests
Date: Wed, 17 Dec 2025 00:22:10 +0530
Message-Id: <20251216185215.1281390-3-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251216185215.1281390-1-swati2.sharma@intel.com>
References: <20251216185215.1281390-1-swati2.sharma@intel.com>
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

From: "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>

Here added possibility to use rotation flags in tests, including
reflect flags. Then use the new flags to create xrgb888, xyuv8888
nv12 and P016 reflect-x tests.

Signed-off-by: Heikkila, Juha-pekka <juha-pekka.heikkila@intel.com>
---
 tests/intel/kms_flip_scaled_crc.c | 158 ++++++++++++++++++++++++++++++
 1 file changed, 158 insertions(+)

diff --git a/tests/intel/kms_flip_scaled_crc.c b/tests/intel/kms_flip_scaled_crc.c
index f057b5070..d4a72ca03 100644
--- a/tests/intel/kms_flip_scaled_crc.c
+++ b/tests/intel/kms_flip_scaled_crc.c
@@ -122,6 +122,20 @@
  * @downscaling:        Downscaled
  * @upscaling:          Upscaled
  */
+/**
+ * SUBTEST: flip-32bpp-linear-to-32bpp-linear-reflect-x
+ * Description: Flip from 32bpp non scaled fb to 32bpp non scaled x mirrored fb
+ *
+ * SUBTEST: flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x
+ * Description: Flip from 32bpp xyuv non scaled fb to 32bpp xyuv non scaled
+ *              x mirrored fb
+ *
+ * SUBTEST: flip-NV12-linear-to-NV12-linear-reflect-x
+ * Description: Flip from NV12 non scaled fb to NV12 non scaled x mirrored fb
+ *
+ * SUBTEST: flip-P016-linear-to-P016-linear-reflect-x
+ * Description: Flip from P016 non scaled fb to P016 non scaled x mirrored fb
+ */
 
 IGT_TEST_DESCRIPTION("Test flipping between scaled/nonscaled framebuffers");
 
@@ -148,6 +162,8 @@ const struct {
 	const uint32_t secondformat;
 	const double firstmultiplier;
 	const double secondmultiplier;
+	const igt_rotation_t firstrotation;
+	const igt_rotation_t secondrotation;
 } flip_scenario_test[] = {
 	{
 		"flip-32bpp-ytile-to-64bpp-ytile-downscaling",
@@ -156,6 +172,8 @@ const struct {
 		I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB16161616F,
 		1.0,
 		2.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0,
 	},
 	{
 		"flip-32bpp-yftile-to-64bpp-yftile-downscaling",
@@ -164,6 +182,8 @@ const struct {
 		I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_XRGB16161616F,
 		1.0,
 		2.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0,
 	},
 	{
 		"flip-32bpp-xtile-to-64bpp-xtile-downscaling",
@@ -172,6 +192,8 @@ const struct {
 		I915_FORMAT_MOD_X_TILED, DRM_FORMAT_XRGB16161616F,
 		1.0,
 		2.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0,
 	},
 	{
 		"flip-32bpp-4tile-to-64bpp-4tile-downscaling",
@@ -180,6 +202,8 @@ const struct {
 		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB16161616F,
 		1.0,
 		2.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0,
 	},
 	{
 		"flip-32bpp-linear-to-64bpp-linear-downscaling",
@@ -188,6 +212,8 @@ const struct {
 		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_XRGB16161616F,
 		1.0,
 		2.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0,
 	},
 	{
 		"flip-64bpp-ytile-to-32bpp-ytile-downscaling",
@@ -196,6 +222,8 @@ const struct {
 		I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB8888,
 		1.0,
 		2.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0,
 	},
 	{
 		"flip-64bpp-yftile-to-32bpp-yftile-downscaling",
@@ -204,6 +232,8 @@ const struct {
 		I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_XRGB8888,
 		1.0,
 		2.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0,
 	},
 	{
 		"flip-64bpp-xtile-to-32bpp-xtile-downscaling",
@@ -212,6 +242,8 @@ const struct {
 		I915_FORMAT_MOD_X_TILED, DRM_FORMAT_XRGB8888,
 		1.0,
 		2.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0,
 	},
 	{
 		"flip-64bpp-4tile-to-32bpp-4tile-downscaling",
@@ -220,6 +252,8 @@ const struct {
 		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB8888,
 		1.0,
 		2.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0,
 	},
 	{
 		"flip-64bpp-linear-to-32bpp-linear-downscaling",
@@ -228,6 +262,8 @@ const struct {
 		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_XRGB8888,
 		1.0,
 		2.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0,
 	},
 	{
 		"flip-64bpp-ytile-to-16bpp-ytile-downscaling",
@@ -236,6 +272,8 @@ const struct {
 		I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_RGB565,
 		1.0,
 		2.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0,
 	},
 	{
 		"flip-64bpp-yftile-to-16bpp-yftile-downscaling",
@@ -244,6 +282,8 @@ const struct {
 		I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_RGB565,
 		1.0,
 		2.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0,
 	},
 	{
 		"flip-64bpp-xtile-to-16bpp-xtile-downscaling",
@@ -252,6 +292,8 @@ const struct {
 		I915_FORMAT_MOD_X_TILED, DRM_FORMAT_RGB565,
 		1.0,
 		2.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0,
 	},
 	{
 		"flip-64bpp-4tile-to-16bpp-4tile-downscaling",
@@ -260,6 +302,8 @@ const struct {
 		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_RGB565,
 		1.0,
 		2.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0,
 	},
 	{
 		"flip-64bpp-linear-to-16bpp-linear-downscaling",
@@ -268,6 +312,8 @@ const struct {
 		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_RGB565,
 		1.0,
 		2.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0,
 	},
 	{
 		"flip-32bpp-ytileccs-to-64bpp-ytile-downscaling",
@@ -276,6 +322,8 @@ const struct {
 		I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB16161616F,
 		1.0,
 		2.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0,
 	},
 	{
 		"flip-32bpp-yftileccs-to-64bpp-yftile-downscaling",
@@ -284,6 +332,8 @@ const struct {
 		I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_XRGB16161616F,
 		1.0,
 		2.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0,
 	},
 	{
 		"flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling",
@@ -292,6 +342,8 @@ const struct {
 		I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS, DRM_FORMAT_XRGB8888,
 		1.0,
 		2.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0,
 	},
 	{
 		"flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling",
@@ -300,6 +352,8 @@ const struct {
 		I915_FORMAT_MOD_4_TILED_DG2_RC_CCS, DRM_FORMAT_XRGB8888,
 		1.0,
 		2.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0,
 	},
 	{
 		"flip-32bpp-ytile-to-32bpp-ytileccs-downscaling",
@@ -308,6 +362,8 @@ const struct {
 		I915_FORMAT_MOD_Y_TILED_CCS, DRM_FORMAT_XRGB8888,
 		1.0,
 		2.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0,
 	},
 	{
 		"flip-32bpp-yftile-to-32bpp-yftileccs-downscaling",
@@ -316,6 +372,8 @@ const struct {
 		I915_FORMAT_MOD_Yf_TILED_CCS, DRM_FORMAT_XRGB8888,
 		1.0,
 		2.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0,
 	},
 	{
 		"flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling",
@@ -324,6 +382,8 @@ const struct {
 		I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS, DRM_FORMAT_XRGB8888,
 		1.0,
 		2.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0,
 	},
 	{
 		"flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling",
@@ -332,6 +392,8 @@ const struct {
 		I915_FORMAT_MOD_4_TILED_DG2_RC_CCS, DRM_FORMAT_XRGB8888,
 		1.0,
 		2.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0,
 	},
 	{
 		"flip-32bpp-ytile-to-64bpp-ytile-upscaling",
@@ -340,6 +402,8 @@ const struct {
 		I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB16161616F,
 		0.5,
 		1.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0,
 	},
 	{
 		"flip-32bpp-yftile-to-64bpp-yftile-upscaling",
@@ -348,6 +412,8 @@ const struct {
 		I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_XRGB16161616F,
 		0.5,
 		1.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0,
 	},
 	{
 		"flip-32bpp-xtile-to-64bpp-xtile-upscaling",
@@ -356,6 +422,8 @@ const struct {
 		I915_FORMAT_MOD_X_TILED, DRM_FORMAT_XRGB16161616F,
 		0.5,
 		1.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0,
 	},
 	{
 		"flip-32bpp-4tile-to-64bpp-4tile-upscaling",
@@ -364,6 +432,8 @@ const struct {
 		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB16161616F,
 		0.5,
 		1.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0,
 	},
 	{
 		"flip-32bpp-linear-to-64bpp-linear-upscaling",
@@ -372,6 +442,8 @@ const struct {
 		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_XRGB16161616F,
 		0.5,
 		1.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0,
 	},
 	{
 		"flip-64bpp-ytile-to-32bpp-ytile-upscaling",
@@ -380,6 +452,8 @@ const struct {
 		I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB8888,
 		0.5,
 		1.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0,
 	},
 	{
 		"flip-64bpp-yftile-to-32bpp-yftile-upscaling",
@@ -388,6 +462,8 @@ const struct {
 		I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_XRGB8888,
 		0.5,
 		1.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0,
 	},
 	{
 		"flip-64bpp-xtile-to-32bpp-xtile-upscaling",
@@ -396,6 +472,8 @@ const struct {
 		I915_FORMAT_MOD_X_TILED, DRM_FORMAT_XRGB8888,
 		0.5,
 		1.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0,
 	},
 	{
 		"flip-64bpp-4tile-to-32bpp-4tile-upscaling",
@@ -404,6 +482,8 @@ const struct {
 		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB8888,
 		0.5,
 		1.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0,
 	},
 	{
 		"flip-64bpp-linear-to-32bpp-linear-upscaling",
@@ -412,6 +492,8 @@ const struct {
 		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_XRGB8888,
 		0.5,
 		1.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0,
 	},
 	{
 		"flip-64bpp-ytile-to-16bpp-ytile-upscaling",
@@ -420,6 +502,8 @@ const struct {
 		I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_RGB565,
 		0.5,
 		1.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0,
 	},
 	{
 		"flip-64bpp-yftile-to-16bpp-yftile-upscaling",
@@ -428,6 +512,8 @@ const struct {
 		I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_RGB565,
 		0.5,
 		1.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0,
 	},
 	{
 		"flip-64bpp-xtile-to-16bpp-xtile-upscaling",
@@ -436,6 +522,8 @@ const struct {
 		I915_FORMAT_MOD_X_TILED, DRM_FORMAT_RGB565,
 		0.5,
 		1.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0,
 	},
 	{
 		"flip-64bpp-4tile-to-16bpp-4tile-upscaling",
@@ -444,6 +532,8 @@ const struct {
 		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_RGB565,
 		0.5,
 		1.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0,
 	},
 	{
 		"flip-64bpp-linear-to-16bpp-linear-upscaling",
@@ -452,6 +542,8 @@ const struct {
 		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_RGB565,
 		0.5,
 		1.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0,
 	},
 	{
 		"flip-32bpp-ytileccs-to-64bpp-ytile-upscaling",
@@ -460,6 +552,8 @@ const struct {
 		I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB16161616F,
 		0.5,
 		1.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0,
 	},
 	{
 		"flip-32bpp-yftileccs-to-64bpp-yftile-upscaling",
@@ -468,6 +562,8 @@ const struct {
 		I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_XRGB16161616F,
 		0.5,
 		1.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0,
 	},
 	{
 		"flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling",
@@ -476,6 +572,8 @@ const struct {
 		I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS, DRM_FORMAT_XRGB8888,
 		0.5,
 		1.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0,
 	},
 	{
 		"flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling",
@@ -484,6 +582,8 @@ const struct {
 		I915_FORMAT_MOD_4_TILED_DG2_RC_CCS, DRM_FORMAT_XRGB8888,
 		0.5,
 		1.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0,
 	},
 	{
 		"flip-32bpp-ytile-to-32bpp-ytileccs-upscaling",
@@ -492,6 +592,8 @@ const struct {
 		I915_FORMAT_MOD_Y_TILED_CCS, DRM_FORMAT_XRGB8888,
 		0.5,
 		1.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0,
 	},
 	{
 		"flip-32bpp-yftile-to-32bpp-yftileccs-upscaling",
@@ -500,6 +602,8 @@ const struct {
 		I915_FORMAT_MOD_Yf_TILED_CCS, DRM_FORMAT_XRGB8888,
 		0.5,
 		1.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0,
 	},
 	{
 		"flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling",
@@ -508,6 +612,8 @@ const struct {
 		I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS, DRM_FORMAT_XRGB8888,
 		0.5,
 		1.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0,
 	},
 	{
 		"flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling",
@@ -516,6 +622,48 @@ const struct {
 		I915_FORMAT_MOD_4_TILED_DG2_RC_CCS, DRM_FORMAT_XRGB8888,
 		0.5,
 		1.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0,
+	},
+	{
+		"flip-32bpp-linear-to-32bpp-linear-reflect-x",
+		"Flip from 32bpp non scaled fb to 32bpp non scaled x mirrored fb",
+		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_XRGB8888,
+		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_XRGB8888,
+		1.0,
+		1.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0 | IGT_REFLECT_X,
+	},
+	{
+		"flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x",
+		"Flip from 32bpp xyuv non scaled fb to 32bpp xyuv non scaled x mirrored fb",
+		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_XYUV8888,
+		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_XYUV8888,
+		1.0,
+		1.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0 | IGT_REFLECT_X,
+	},
+	{
+		"flip-NV12-linear-to-NV12-linear-reflect-x",
+		"Flip from NV12 non scaled fb to NV12 non scaled x mirrored fb",
+		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_NV12,
+		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_NV12,
+		1.0,
+		1.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0 | IGT_REFLECT_X,
+	},
+	{
+		"flip-P016-linear-to-P016-linear-reflect-x",
+		"Flip from P016 non scaled fb to P016 non scaled x mirrored fb",
+		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_P016,
+		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_P016,
+		1.0,
+		1.0,
+		IGT_ROTATION_0,
+		IGT_ROTATION_0 | IGT_REFLECT_X,
 	},
 };
 
@@ -642,11 +790,16 @@ static void test_flip_to_scaled(data_t *data, uint32_t index,
 	igt_plane_set_fb(primary, &data->small_fb);
 	igt_plane_set_size(primary, data->attemptmodewidth,
 			   data->attemptmodeheight);
+	igt_plane_set_rotation(primary,
+			       flip_scenario_test[index].firstrotation);
 	ret = igt_display_try_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
 	igt_skip_on_f(ret == -ERANGE, "Platform scaling limits exceeded, skipping.\n");
 	igt_skip_on_f((ret == -EINVAL) && (!modetoset || modetoset->vrefresh > 90),
 		      "Valid/default mode too big, cdclk limits exceeded. Check next connector\n");
+	igt_skip_on_f((ret == -EINVAL) &&
+		      (flip_scenario_test[index].firstrotation != IGT_ROTATION_0),
+		      "Unsupported rotation\n");
 	igt_assert_eq(ret, 0);
 
 	igt_pipe_crc_start(data->pipe_crc);
@@ -655,6 +808,8 @@ static void test_flip_to_scaled(data_t *data, uint32_t index,
 	igt_plane_set_fb(primary, &data->big_fb);
 	igt_plane_set_size(primary, data->attemptmodewidth,
 			   data->attemptmodeheight);
+	igt_plane_set_rotation(primary,
+			       flip_scenario_test[index].secondrotation);
 	ret = igt_display_try_commit_atomic(&data->display,
 					    DRM_MODE_ATOMIC_ALLOW_MODESET  |
 					    DRM_MODE_PAGE_FLIP_EVENT, NULL);
@@ -662,6 +817,9 @@ static void test_flip_to_scaled(data_t *data, uint32_t index,
 	igt_skip_on_f(ret == -ERANGE, "Platform scaling limits exceeded, skipping.\n");
 	igt_skip_on_f((ret == -EINVAL) && (!modetoset || modetoset->vrefresh > 90),
 		      "Valid/default mode too big, cdclk limits exceeded. Check next connector\n");
+	igt_skip_on_f((ret == -EINVAL) &&
+		      (flip_scenario_test[index].secondrotation != IGT_ROTATION_0),
+		      "Unsupported rotation\n");
 	igt_assert_eq(ret, 0);
 
 	igt_assert(read(data->drm_fd, &ev, sizeof(ev)) == sizeof(ev));
-- 
2.25.1

