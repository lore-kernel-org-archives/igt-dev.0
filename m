Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 101DBC67861
	for <igt-dev@archiver.kernel.org>; Fri,  5 Apr 2024 09:41:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7960710EA34;
	Fri,  5 Apr 2024 09:41:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GkPErHoC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA2E10EA34
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Apr 2024 09:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712310113; x=1743846113;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=TSBd1bAm9rWWc2qMy1lE0aaDLVrACtuo/W3/W5BN8I8=;
 b=GkPErHoCwQLIlCbQva1Hz3Kg4SFbMuDm6qitqD2HjeDwuJJClWiDXJTn
 Uh4e66sz9bAwYJ+snhkcc+uBeYR+cyswTnOClL8hs1nxNQdeuNoRz21BS
 KnGDT6qY5bSzwTZ+Qy9HmrnZ0KkD2LverJkCn5cbR7L/TeT1hSqnk1jhz
 WZRQQOdYJfqMFG56RN5AaEGabeqoGIwfOcmyM7b8mh3pt1tXkyRYfkcCL
 tOXqCWwZFvAyq4lYM3hbl/h1rRV8kjZGDZhmUGIDk9Y+INQwixBHLKxhD
 belBIIpb7YWv++8GUdsRcybsPd5FPYp35daqsfmEwx8vnjwD+UOhlgN12 Q==;
X-CSE-ConnectionGUID: e3uSh8NCT4+EnSc2mRTHCg==
X-CSE-MsgGUID: JLI+C9/zQ7GFmIwZop4ggw==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7491455"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7491455"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 02:41:53 -0700
X-CSE-ConnectionGUID: ynHlZTi4TF6BUm05uRzeeA==
X-CSE-MsgGUID: 40KOSj1CSeyA/oamfsAJkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="19527072"
Received: from basicluh01.gar.corp.intel.com (HELO localhost.localdomain)
 ([10.223.131.46])
 by orviesa007.jf.intel.com with ESMTP; 05 Apr 2024 02:41:51 -0700
From: Melanie Lobo <melanie.lobo@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: juha-pekka.heikkila@intel.com, vidya.srinivas@intel.com,
 swati2.sharma@intel.com, bhanuprakash.modem@intel.com,
 Melanie Lobo <melanie.lobo@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH 2/2] tests/intel/kms_flip_scaled_crc: Add support for FP16
 compressed formats
Date: Fri,  5 Apr 2024 15:22:10 +0530
Message-Id: <20240405095210.9532-2-melanie.lobo@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240405095210.9532-1-melanie.lobo@intel.com>
References: <20231010134540.28485-1-melanie.lobo@intel.com>
 <20240405095210.9532-1-melanie.lobo@intel.com>
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

MTL supports FP16 format which is a binary floating-point computer
number format that occupies 16 bits in computer memory. In this test
platform shall render compression in display engine to receive
FP16 compressed formats.

This IGT test was tested with kernel patch,
https://patchwork.freedesktop.org/patch/563854

Test-with: 20231012062620.23886-1-melanie.lobo@intel.com

cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
cc: Swati Sharma <swati2.sharma@intel.com>

Signed-off-by: Melanie Lobo <melanie.lobo@intel.com>
---
 tests/intel/kms_flip_scaled_crc.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tests/intel/kms_flip_scaled_crc.c b/tests/intel/kms_flip_scaled_crc.c
index 7dc07bc8330d..94a4cacc9813 100644
--- a/tests/intel/kms_flip_scaled_crc.c
+++ b/tests/intel/kms_flip_scaled_crc.c
@@ -96,6 +96,10 @@
  * Description: Flip from 64bpp non scaled fb to 32bpp %arg[1] fb to stress CD
  *              clock programming
  *
+ * SUBTEST: flip-64bpp-4tile-to-32bpp-4tilemtlrcccs-%s
+ * Description: Flip from 64bpp non scaled fb to 32bpp %arg[1] fb to stress CD
+ *              clock programming
+ *
  * arg[1]:
  *
  * @downscaling:        Downscaled
@@ -345,6 +349,14 @@ const struct {
 		1.0,
 		2.0,
 	},
+	{
+		"flip-64bpp-4tile-to-32bpp-4tilemtlrcccs-downscaling",
+		"Flip from 64bpp non scaled fb to 32bpp downscaled fb to stress CD clock programming",
+		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB16161616F,
+		I915_FORMAT_MOD_4_TILED_MTL_RC_CCS, DRM_FORMAT_XRGB16161616F,
+		1.0,
+		2.0,
+	},
 	{
 		"flip-32bpp-ytile-to-64bpp-ytile-upscaling",
 		"Flip from 32bpp non scaled fb to 64bpp upscaled fb to stress CD clock programming",
@@ -529,6 +541,14 @@ const struct {
 		0.5,
 		1.0,
 	},
+	{
+		"flip-64bpp-4tile-to-32bpp-4tilemtlrcccs-upscaling",
+		"Flip from 64bpp non scaled fb to 32bpp upscaled fb to stress CD clock programming",
+		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB16161616F,
+		I915_FORMAT_MOD_4_TILED_MTL_RC_CCS, DRM_FORMAT_XRGB16161616F,
+		0.5,
+		1.0,
+	},
 };
 
 static void setup_fb(data_t *data, struct igt_fb *newfb, uint32_t width,
-- 
2.17.1

