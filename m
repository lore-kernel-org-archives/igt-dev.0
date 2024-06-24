Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40880C2BD05
	for <igt-dev@archiver.kernel.org>; Mon, 24 Jun 2024 09:23:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D9810E3D2;
	Mon, 24 Jun 2024 09:23:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H8WoDt0G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1970310E3CF
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jun 2024 09:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719220986; x=1750756986;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6U5y0FTtPq72uE8ryYiArHMrjrec4dF+2C+GV2GIFaI=;
 b=H8WoDt0GdyLY7g06IqcFtUac8ytNflug7WTn+XaDzuDprteUOhT3YapT
 28UXBKZJ46C7JI1H7ckT5z9Rowp9UiiqF63QxsmLy06UsoqHMnuPfGq/0
 r10IEvkmf1NqPNpVD5Y0WT+RvQhRNxOAW6z6o9F1mgvzLDj8A9CAtx5L+
 jZciF+23YOQGIrf5c7BUDm5VDb3ELNLAMXBwn3fPJLsS4a0tu82kePy4X
 dkk9J6ERHHTuTCaAf0/fQVhJSPu48QGTqyEdJZtWgPJv1k7D06LY3mUR9
 ZtVUNj+Wtbk+QUVdc38U3rgp30L6DBpvXmAtNao55LfVPpfGc2A6cM8oG g==;
X-CSE-ConnectionGUID: 2WBYFyrHTNqfIsKLYjPoaA==
X-CSE-MsgGUID: t9QYb0zIQROXq+TsKoJLJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="19954236"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="19954236"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 02:23:06 -0700
X-CSE-ConnectionGUID: FG7e2YKbSCyJy2Cr4ioJaQ==
X-CSE-MsgGUID: YfQnY100R1G+aYRWnM/8qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="43922806"
Received: from melanie-nuc10i7fnh.iind.intel.com ([10.223.167.49])
 by orviesa007.jf.intel.com with ESMTP; 24 Jun 2024 02:23:03 -0700
From: Melanie Lobo <melanie.lobo@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: juha-pekka.heikkila@intel.com, vidya.srinivas@intel.com,
 ville.syrjala@intel.com, Melanie Lobo <melanie.lobo@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH 2/2] tests/intel/kms_flip_scaled_crc: Add support for
 RGB16161616_64B compressed formats
Date: Mon, 24 Jun 2024 20:18:18 +0530
Message-Id: <20240624144818.216349-3-melanie.lobo@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240624144818.216349-1-melanie.lobo@intel.com>
References: <20240624144818.216349-1-melanie.lobo@intel.com>
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

MTL supports RGB FP16 format which is a binary floating-point computer
number format that occupies 16 bits in computer memory. In this test
platform shall render compression in display engine to receive
RGB FP16 compressed formats.

This was tested with kernel patch,
https://patchwork.freedesktop.org/series/124957/
https://lore.kernel.org/all/20231201091133.23508-1-melanie.lobo@intel.com/

cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
cc: Swati Sharma <swati2.sharma@intel.com>
cc: Ville Syrjala <ville.syrjala@intel.com>
Signed-off-by: Melanie Lobo <melanie.lobo@intel.com>
---
 tests/intel/kms_flip_scaled_crc.c | 39 +++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/tests/intel/kms_flip_scaled_crc.c b/tests/intel/kms_flip_scaled_crc.c
index 7dc07bc8330d..2ed966cd4550 100644
--- a/tests/intel/kms_flip_scaled_crc.c
+++ b/tests/intel/kms_flip_scaled_crc.c
@@ -96,6 +96,13 @@
  * Description: Flip from 64bpp non scaled fb to 32bpp %arg[1] fb to stress CD
  *              clock programming
  *
+ * SUBTEST: flip-64bpp-4tile-to-32bpp-4tilemtlrcccsxrgb-%s
+ * Description: Flip from 64bpp non scaled fb to 32bpp %arg[1] fb to stress CD
+ * 		clock programming
+ *
+ * SUBTEST: flip-64bpp-4tile-to-32bpp-4tilemtlrcccsargb-%s
+ * Description: Flip from 64bpp non scaled fb to 32bpp %arg[1] fb to stress CD
+ * 		clock programming
  * arg[1]:
  *
  * @downscaling:        Downscaled
@@ -345,6 +352,22 @@ const struct {
 		1.0,
 		2.0,
 	},
+	{
+		"flip-64bpp-4tile-to-32bpp-4tilemtlrcccsxrgb-downscaling",
+		"Flip from 64bpp non scaled fb to 32bpp downscaled fb to stress CD clock programming",
+		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB16161616F,
+		I915_FORMAT_MOD_4_TILED_MTL_RC_CCS, DRM_FORMAT_XRGB16161616F,
+		1.0,
+		2.0,
+	},
+	{
+		"flip-64bpp-4tile-to-32bpp-4tilemtlrcccsargb-downscaling",
+		"Flip from 64bpp non scaled fb to 32bpp downscaled fb to stress CD clock programming",
+		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_ARGB16161616F,
+		I915_FORMAT_MOD_4_TILED_MTL_RC_CCS, DRM_FORMAT_ARGB16161616F,
+		1.0,
+		2.0,
+	},
 	{
 		"flip-32bpp-ytile-to-64bpp-ytile-upscaling",
 		"Flip from 32bpp non scaled fb to 64bpp upscaled fb to stress CD clock programming",
@@ -529,6 +552,22 @@ const struct {
 		0.5,
 		1.0,
 	},
+	{
+		"flip-64bpp-4tile-to-32bpp-4tilemtlrcccsxrgb-upscaling",
+		"Flip from 64bpp non scaled fb to 32bpp upscaled fb to stress CD clock programming",
+		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB16161616F,
+		I915_FORMAT_MOD_4_TILED_MTL_RC_CCS, DRM_FORMAT_XRGB16161616F,
+		0.5,
+		1.0,
+	},
+	{
+		"flip-64bpp-4tile-to-32bpp-4tilemtlrcccsargb-upscaling",
+		"Flip from 64bpp non scaled fb to 32bpp upscaled fb to stress CD clock programming",
+		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_ARGB16161616F,
+		I915_FORMAT_MOD_4_TILED_MTL_RC_CCS, DRM_FORMAT_ARGB16161616F,
+		0.5,
+		1.0,
+	},
 };
 
 static void setup_fb(data_t *data, struct igt_fb *newfb, uint32_t width,
-- 
2.34.1

