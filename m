Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E554CFA765
	for <igt-dev@archiver.kernel.org>; Fri,  4 Oct 2024 10:41:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3970F10E9D1;
	Fri,  4 Oct 2024 10:41:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A13CTqa7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB3310E9D1
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Oct 2024 10:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728038517; x=1759574517;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=bFlcPF5Ul7mbFVm6C/nK32tejtcVsZT7AXitWKPp9dA=;
 b=A13CTqa7b33FcY8Q6sIpMZsBHJl7asUY8LNAMF2GZB1vQjV4HJkZU2F6
 fqg5tPZA8uilR5MunS/oIg2F5OwfkmVrKOzIqREfwnE+M3zNWzHHDW6AQ
 YdG31EIKS5rlp4NwN538vtgqWGZN1NPuAd7AxRGR6UPihn7okWcTEUnKf
 FqLCDovoJAhJNFMjCFTk3wNSqH3aVuqikZl8YqKedJy6OcjNHMbDp8Kfn
 nKmEXXTnLPzcq8VCKKKcZSb+ipPDKHQDou1/m/9ihxERzvREfKzcD3NaN
 QmEqa9W0e3em643q9RKUE9ECOrEF2i/io8cz9g1j+bwUwlc0suVTRxQCJ w==;
X-CSE-ConnectionGUID: mtw7I2/jQpuOWngWyLDxLA==
X-CSE-MsgGUID: vGVUSXZeQxSP04lLUzBDhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="31140564"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="31140564"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 03:41:57 -0700
X-CSE-ConnectionGUID: pte7JHxgS6ecjT/ZrJzqCA==
X-CSE-MsgGUID: 7TMH1SMaSWeU7ws1sCuKUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="74778424"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 04 Oct 2024 03:41:55 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 04 Oct 2024 13:41:54 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 12/14] tests/kms_draw_crc: Test 64bpp
Date: Fri,  4 Oct 2024 13:41:19 +0300
Message-ID: <20241004104121.32750-13-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241004104121.32750-1-ville.syrjala@linux.intel.com>
References: <20241004104121.32750-1-ville.syrjala@linux.intel.com>
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

