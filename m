Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58ACC47DDF
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 09:22:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D6B410EAC1;
	Thu,  1 Feb 2024 09:22:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF1F010EAC1
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 09:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706779360; x=1738315360;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OUsXrUTONaOLTVaz+0CTuYwO3a1MG/Vorn0d38iG1vg=;
 b=XfzRm8jDPeZ5+g7wsIJUFKL0+r0FVw9jj2QZrzrsDgCJuNeJsGmQqOOZ
 DdHSMpX+vJHiHwsQKycfauRypGpWYG/BDKzwbiDrxZJZJn/zbIldzuQeU
 i2aVpTCXLglvQptTpuqSGzdhoRQ+heZASQ8tRF+HxXTJKk5Ch2QzTMZcn
 gGIuS5UFrg5cg/HwIXyu9rWqIOpU0sQJJw7x/yVmwDtdU2wIE+Ct1IuVy
 QaLKAbKwSS4rbJSPhcCyqe3p5nary63aLVAJMgEjOCJdVULIqB2Hz6k2+
 WaEcx/NcbyM+o2kzRa+MO8d31TvOA7QwwwVz8wa1pxuCJgszWmZ1k614k g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="2787599"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="2787599"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 01:22:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="4324664"
Received: from kniesyn-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.112.105])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 01:22:38 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v3 1/4] lib/intel_blt: Add helpers for calculating
 stride and aligned height
Date: Thu,  1 Feb 2024 10:22:24 +0100
Message-Id: <20240201092227.252502-2-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240201092227.252502-1-zbigniew.kempczynski@intel.com>
References: <20240201092227.252502-1-zbigniew.kempczynski@intel.com>
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
Cc: Karolina Drobnik <karolina.drobnik@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Tiled surfaces have stride / aligned height constraints. Currently
blt library has limitation and doesn't work properly when surface
stride is not valid for specific tiling.

As an example lets say we want to copy from linear to xmajor
33 x 33 x 32bpp surface. Xmajor surface expects stride aligned to
512 bytes and height to 8 rows so this surface will occupy 512B x 40
(128 x 40 x 32 bpp).

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Karolina Drobnik <karolina.drobnik@intel.com>
---
v2: Fix stride/aligned height calculation for Tile64
v3: Fix stride calculation for xmajor
    Make helpers public (fixes compilation warning due to lack
    or static function users)
---
 lib/intel_blt.c | 64 +++++++++++++++++++++++++++++++++++++++++++++++++
 lib/intel_blt.h |  4 ++++
 2 files changed, 68 insertions(+)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 25d251c4f8..13b1dbba4f 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -521,6 +521,70 @@ static int __block_tiling(enum blt_tiling_type tiling)
 	return 0;
 }
 
+/**
+ * blt_get_min_stride
+ * @width: width in pixels
+ * @bpp: bits per pixel
+ * @tiling: tiling
+ *
+ * Function returns minimum posibble stride in bytes for width, bpp and tiling.
+ *
+ * Returns:
+ * minimum possible stride in bytes.
+ */
+uint32_t blt_get_min_stride(uint32_t width, uint32_t bpp,
+			    enum blt_tiling_type tiling)
+{
+	switch (tiling) {
+	case T_LINEAR:
+		return width * bpp / 8;
+	case T_XMAJOR:
+		return ALIGN(width * bpp / 8, 512);
+	case T_TILE64:
+		if (bpp == 8)
+			return ALIGN(width, 256);
+		else if (bpp == 16 || bpp == 32)
+			return ALIGN(width * bpp / 8, 512);
+		return ALIGN(width * bpp / 8, 1024);
+
+	default:
+		return ALIGN(width * bpp / 8, 128);
+	}
+}
+
+/**
+ * blt_get_aligned_height
+ * @height: height in pixels
+ * @bpp: bits per pixel (used for Tile64 due to different tile organization
+ * in pixels)
+ * @tiling: tiling
+ *
+ * Function returns aligned height for specific tiling. Height returned is
+ * important from memory allocation perspective, because each tiling has
+ * specific memory constraints.
+ *
+ * Returns:
+ * height (rows) expected for specific tiling
+ */
+uint32_t blt_get_aligned_height(uint32_t height, uint32_t bpp,
+				enum blt_tiling_type tiling)
+{
+	switch (tiling) {
+	case T_LINEAR:
+		return height;
+	case T_XMAJOR:
+		return ALIGN(height, 8);
+	case T_TILE64:
+		if (bpp == 8)
+			return ALIGN(height, 256);
+		else if (bpp == 16 || bpp == 32)
+			return ALIGN(height, 128);
+		return ALIGN(height, 64);
+	default:
+		return ALIGN(height, 32);
+	}
+}
+
 static int __special_mode(const struct blt_copy_data *blt)
 {
 	if (blt->src.handle == blt->dst.handle &&
diff --git a/lib/intel_blt.h b/lib/intel_blt.h
index d9be22fdf4..e3084dc0cd 100644
--- a/lib/intel_blt.h
+++ b/lib/intel_blt.h
@@ -212,6 +212,10 @@ bool blt_block_copy_supports_compression(int fd);
 bool blt_uses_extended_block_copy(int fd);
 
 const char *blt_tiling_name(enum blt_tiling_type tiling);
+uint32_t blt_get_min_stride(uint32_t width, uint32_t bpp,
+			    enum blt_tiling_type tiling);
+uint32_t blt_get_aligned_height(uint32_t height, uint32_t bpp,
+				enum blt_tiling_type tiling);
 
 void blt_copy_init(int fd, struct blt_copy_data *blt);
 
-- 
2.34.1

