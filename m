Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C1DCC27C5F
	for <igt-dev@archiver.kernel.org>; Thu,  6 Jun 2024 12:02:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C7B910E91B;
	Thu,  6 Jun 2024 12:02:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G3v5KfJY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B55A10E91B
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Jun 2024 12:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717675379; x=1749211379;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=D7h5+xY1L23L+mJM8MiyadVEkSvQw7a+e2lqIrT3MNg=;
 b=G3v5KfJYXhIBOK6JwwY5/WFCYIPS8+6o7ATfokJ3gRkT79bgjrr0Kjjz
 u7eraMMjtSY/VrRxqmWa0/2HoJ55VXCokAJxF0q5+Y+5CVUwOgKsvPy2e
 tUgOC+nmMUHZxtVCDk9g153/CV3L5+5+8EM/xUV95HXS4/6iFDoemogAj
 whSxCofWrFhYFj6Tmjtcb61Zle51iS1hofyRWav9E6VWnLkCjkhpfsRjG
 XXxHSk9NjKo0nnuFt0qxCmcSsEJXZlrr3xdneZ7kf52i1vFSbX5IAnCn8
 sETNMoM1UcokdUt0EFpt87deGfd23jFNLa9RDkRdmUv7t3IYa1EE9LUVX w==;
X-CSE-ConnectionGUID: puewhEi6RMeii8Gc0KD7wQ==
X-CSE-MsgGUID: aGYe3cxUTCaiFQfXxUTMkQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14175789"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="14175789"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 05:02:58 -0700
X-CSE-ConnectionGUID: /jYBFKZPTKKvexTudPlIGA==
X-CSE-MsgGUID: 3Hf+WpPYSiOhYq+DcE8i9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="42872580"
Received: from basicluh01.gar.corp.intel.com (HELO localhost.localdomain)
 ([10.223.131.46])
 by orviesa005.jf.intel.com with ESMTP; 06 Jun 2024 05:02:56 -0700
From: Melanie Lobo <melanie.lobo@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vidya.srinivas@intel.com, Melanie Lobo <melanie.lobo@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH 2/2] tests/intel/kms_flip_scaled_crc: Add support for
 RGB16161616_64B compressed formats
Date: Thu,  6 Jun 2024 17:45:23 +0530
Message-Id: <20240606121523.5347-3-melanie.lobo@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240606121523.5347-1-melanie.lobo@intel.com>
References: <20240606121523.5347-1-melanie.lobo@intel.com>
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
https://lore.kernel.org/all/20240605055819.9510-1-melanie.lobo@intel.com/

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

