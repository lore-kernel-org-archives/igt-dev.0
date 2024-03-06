Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D578EC54E41
	for <igt-dev@archiver.kernel.org>; Wed,  6 Mar 2024 15:02:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E8C113263;
	Wed,  6 Mar 2024 15:02:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Okg5cfRH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE63113263
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Mar 2024 15:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709737349; x=1741273349;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7vbS49ZToUS9Z4TsgmcbbZSt7i3pcgJLdaVy5qxWf5w=;
 b=Okg5cfRHRJymy6adNydhg5tIfTeuKFcz/Em9lmYvtIVK35XYaGfw02lW
 dGGoeNlh+voHGBW4wEdSG3yXcXX+Tq9YpsE5hzbnNIn4xmNf4e1Ku/aJ7
 VgKoynFLV4mU3quNFOEqedNpVledl+6h1XkI9QQKlFUuVHF55mCHEeuCL
 cW+5Re9SoJIkiOZ9C5VyQ5Ue9ZtugRAgcXjdfPH6Ej20vtyJOYbcdAIn1
 AMZKVoqh3KK9dDQqHt8UeTC5vLtoc2u/NEOjTKJ2GAYEk28r24gQspUv2
 gAsMZIxX+9n6Ath8T/bkXFO1NxfmPgGL0YO+mQvjedg8dPWUJKoHECygW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4284111"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="4284111"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 07:02:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; d="scan'208";a="32929494"
Received: from unknown (HELO localhost) ([10.245.244.139])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 07:02:28 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH i-g-t v2 1/4] lib/intel_blt: Add blitter tile to legacy tile
 id helper
Date: Wed,  6 Mar 2024 16:02:16 +0100
Message-Id: <20240306150219.301977-2-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240306150219.301977-1-zbigniew.kempczynski@intel.com>
References: <20240306150219.301977-1-zbigniew.kempczynski@intel.com>
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

Due to differences between supported tilings on newer hardware (xe)
we use for_each_tiling() macro in blitter tests. Assuming these
tilings are also valid for render pipeline we need to convert
them to legacy tilings (I915_TILING_*). Add helper which does
this job allowing to iterate on supported tilings using blitter macros.

Cc: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Link: https://lore.kernel.org/r/20240305054056.139691-2-zbigniew.kempczynski@intel.com
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_blt.c | 25 +++++++++++++++++++++++++
 lib/intel_blt.h |  2 ++
 2 files changed, 27 insertions(+)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 3c26faba2d..fe0a45cb8e 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -521,6 +521,31 @@ static int __block_tiling(enum blt_tiling_type tiling)
 	return 0;
 }
 
+/**
+ * blt_tile_to_fb_tile:
+ * @tiling: tiling id
+ *
+ * Returns:
+ * id of tiling introduced in i915 like I915_TILING_* used for example
+ * in render-copy code.
+ */
+int blt_tile_to_fb_tile(enum blt_tiling_type tiling)
+{
+	switch (tiling) {
+	case T_LINEAR: return I915_TILING_NONE;
+	case T_XMAJOR: return I915_TILING_X;
+	case T_YMAJOR: return I915_TILING_Y;
+	case T_TILE4:  return I915_TILING_4;
+	case T_TILE64: return I915_TILING_64;
+	case T_YFMAJOR: return I915_TILING_Yf;
+	default:
+		break;
+	}
+
+	igt_warn("invalid tiling passed: %d\n", tiling);
+	return 0;
+}
+
 /**
  * blt_get_min_stride
  * @width: width in pixels
diff --git a/lib/intel_blt.h b/lib/intel_blt.h
index 077283a088..1f6c713596 100644
--- a/lib/intel_blt.h
+++ b/lib/intel_blt.h
@@ -212,6 +212,8 @@ bool blt_block_copy_supports_compression(int fd);
 bool blt_uses_extended_block_copy(int fd);
 
 const char *blt_tiling_name(enum blt_tiling_type tiling);
+int blt_tile_to_fb_tile(enum blt_tiling_type tiling);
+
 uint32_t blt_get_min_stride(uint32_t width, uint32_t bpp,
 			    enum blt_tiling_type tiling);
 uint32_t blt_get_aligned_height(uint32_t height, uint32_t bpp,
-- 
2.34.1

