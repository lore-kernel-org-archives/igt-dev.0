Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25AEC25B76
	for <igt-dev@archiver.kernel.org>; Mon,  3 Jun 2024 07:46:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BB4610E0EB;
	Mon,  3 Jun 2024 07:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FSxtdl5p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB72C10E0EB
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Jun 2024 07:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717400804; x=1748936804;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=jF/L95r0vyI3TuK3jYQCc6aRbGoVBz5b0sRlepv0Xog=;
 b=FSxtdl5pIcSeqrNscAXWRjqoAo7YiLw1ondKvSbbNMrjROMM4lkAkuQM
 ICgkTopSv3W+CHTtg0kU+lR9puoevM8Bxz78aVb0EXXF4wdaDFDhpB4Qz
 ic9i0TnEOBwcm78HNgDu/Ga2nnOxcICanehLgHP20aDOF3VqqzukpgSBX
 TYrzhPuFCp3+XexWOImI494QYlQdNicH4yRkQsi/Tk4F9RyWYJhzl6djO
 7fm3MlUuB6EBtey26KeEYz/MmahiqGb0bSfKosr8o4SMmTrXyJ5XH0GE2
 zV/B+3XZlNfKEoCZPcUMuPdq8XcWDg+9G73FnDjNzv4J/y38e8Q7gksQd Q==;
X-CSE-ConnectionGUID: rUBE2rRjRvOOhq1Hgx4J7w==
X-CSE-MsgGUID: 9cx4+IetS16zJeqHBkQLMA==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="39283442"
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; d="scan'208";a="39283442"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 00:46:44 -0700
X-CSE-ConnectionGUID: mxe8t8N+SzmR2AtoExlj8Q==
X-CSE-MsgGUID: cVob9UjAR86wbCnWGU2NWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="67967757"
Received: from basicluh01.gar.corp.intel.com (HELO localhost.localdomain)
 ([10.223.131.46])
 by fmviesa001.fm.intel.com with ESMTP; 03 Jun 2024 00:46:41 -0700
From: Melanie Lobo <melanie.lobo@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vidya.srinivas@intel.com, Melanie Lobo <melanie.lobo@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH 2/2] tests/intel/kms_flip_scaled_crc: Add support for
 RGB16161616_64B compressed formats
Date: Mon,  3 Jun 2024 13:28:43 +0530
Message-Id: <20240603075843.29904-2-melanie.lobo@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240603075843.29904-1-melanie.lobo@intel.com>
References: <20231010134540.28485-1-melanie.lobo@intel.com>
 <20240603075843.29904-1-melanie.lobo@intel.com>
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
Signed-off-by: Melanie Lobo <melanie.lobo@intel.com>
---
 tests/intel/kms_flip_scaled_crc.c | 42 +++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/tests/intel/kms_flip_scaled_crc.c b/tests/intel/kms_flip_scaled_crc.c
index 7dc07bc8330d..65fd31c5c963 100644
--- a/tests/intel/kms_flip_scaled_crc.c
+++ b/tests/intel/kms_flip_scaled_crc.c
@@ -96,6 +96,16 @@
  * Description: Flip from 64bpp non scaled fb to 32bpp %arg[1] fb to stress CD
  *              clock programming
  *
+ * SUBTEST: flip-64bpp-4tile-to-32bpp-4tilemtlrcccsxrgb-%s
+ * Description: Flip from 64bpp non scaled fb to 32bpp %arg[1] fb to stress CD
+ * 		clock programming
+ * Functionality: ccs, scaling, tiling, vblank
+ *
+ * SUBTEST: flip-64bpp-4tile-to-32bpp-4tilemtlrcccsargb-%s
+ * Description: Flip from 64bpp non scaled fb to 32bpp %arg[1] fb to stress CD
+ * 		clock programming
+ * Functionality: ccs, scaling, tiling, vblank
+ *
  * arg[1]:
  *
  * @downscaling:        Downscaled
@@ -345,6 +355,22 @@ const struct {
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
@@ -529,6 +555,22 @@ const struct {
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
2.17.1

