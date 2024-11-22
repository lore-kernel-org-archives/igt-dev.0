Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0747E65D34
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 08:48:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6BE710EB02;
	Fri, 22 Nov 2024 08:48:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ksNs4Xxv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E00D10EB02
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 08:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732265296; x=1763801296;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sjFzW/5HP12SXaiidPqCqD+WjIfljgIZ92kfRm0TXIM=;
 b=ksNs4XxvJlPqKUflf3NzermsxMU86C+tklcoAQk/rNKbFw0bdOFWENad
 1FzEEegjU/W8pcVI3ATgR47A6QupV4YPIk95m0ukaHcrI96I6T4VgaS7W
 HxvRy8E4gpdovVA91drSmqYoh/9wv0hwq40CyvnTxWSxn/1mrEOqpe4Z4
 f0jehn2P9mLNBXiHY2v1MwIYR3HxANGgY+SF/Dg7UuL0ZNlkpTUUvBovW
 pktJOHQH8sm9FPpPjxiy6iCETeIFXTUBbUUQYBxqj8yppjpjfw7MZ7y+c
 s5tE+AclIrPpBtZxHeba/L6g+aaG5UBPwuAoimLzyuG53wRogQGaq6VRt Q==;
X-CSE-ConnectionGUID: iKMoWxGqS5exV2uQloilGw==
X-CSE-MsgGUID: wuWdafEgSkKKT33VpEMOtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="20004061"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="20004061"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 00:48:16 -0800
X-CSE-ConnectionGUID: 1Bax6CleSCm1wNAXZp8d7A==
X-CSE-MsgGUID: hHsQe9RTSpaaNMfB279RRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="90679438"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 22 Nov 2024 00:48:14 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 22 Nov 2024 10:48:13 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v2 3/4] tests/kms_draw_crc: Test 64bpp
Date: Fri, 22 Nov 2024 10:48:03 +0200
Message-ID: <20241122084804.29669-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241122084804.29669-1-ville.syrjala@linux.intel.com>
References: <20241122084804.29669-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Test 64bpp formats to make sure igt_draw is working correctly.

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_draw_crc.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_draw_crc.c b/tests/intel/kms_draw_crc.c
index e3d1c0ba9bd8..078a6f46d31a 100644
--- a/tests/intel/kms_draw_crc.c
+++ b/tests/intel/kms_draw_crc.c
@@ -34,6 +34,7 @@
 
 #include "i915/gem.h"
 #include "igt.h"
+#include "igt_halffloat.h"
 
 /**
  * SUBTEST: fill-fb
@@ -76,6 +77,7 @@ static const uint32_t formats[] = {
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_RGB565,
 	DRM_FORMAT_XRGB2101010,
+	DRM_FORMAT_XBGR16161616F,
 };
 
 static const uint64_t modifiers[] = {
@@ -109,9 +111,11 @@ static void find_modeset_params(void)
 	}
 }
 
-static uint32_t get_color(uint32_t drm_format, bool r, bool g, bool b)
+static uint64_t get_color(uint32_t drm_format, bool r, bool g, bool b)
 {
-	uint32_t color = 0;
+	uint64_t color = 0;
+	uint16_t h[3];
+	float f[3];
 
 	switch (drm_format) {
 	case DRM_FORMAT_RGB565:
@@ -129,6 +133,15 @@ static uint32_t get_color(uint32_t drm_format, bool r, bool g, bool b)
 		color |= g ? 0x3FF << 10 : 0;
 		color |= b ? 0x3FF : 0;
 		break;
+	case DRM_FORMAT_XBGR16161616F:
+		f[0] = r ? 1.0f : 0.0f;
+		f[1] = g ? 1.0f : 0.0f;
+		f[2] = b ? 1.0f : 0.0f;
+		igt_float_to_half(f, h, 3);
+		color |= (uint64_t)h[2] << 32 |
+			(uint64_t)h[1] << 16 |
+			(uint64_t)h[0] << 0;
+		break;
 	default:
 		igt_assert(false);
 	}
@@ -290,6 +303,8 @@ static const char *format_str(int format_index)
 		return "xrgb8888";
 	case DRM_FORMAT_XRGB2101010:
 		return "xrgb2101010";
+	case DRM_FORMAT_XBGR16161616F:
+		return "xbgr16161616f";
 	default:
 		igt_assert(false);
 	}
-- 
2.45.2

