Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F7A7C47258
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jan 2024 13:26:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F229A10FA1C;
	Wed, 31 Jan 2024 13:26:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3776510F9C7
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jan 2024 13:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706707567; x=1738243567;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jqbKSNgY7HdHsXhGPH8mdRqVEJ2F/6xjK1/coXtPCRc=;
 b=CnQmVlrLgBcCO5PBQ5dSe7/eZEec7epRU7yZNpY/CoDzwkLgOX4AWJfG
 YLhh1VZmdPsGhOB+zTOZ7l52hepQ29x+2Tq8S9xNLr8p361iFBdErL0EK
 Qj9Haiy6o9nHOSx1/ja8XtsPDotU2KVmny8psrpIKrJAHbKmpfMlUfz+I
 IrJPcVPCSW1/ArLhryXnAAyYHwR1aKlIUVRS7wAYtzhuAube6k/uXhrH4
 vjhPvMQGzZhCe7I9P+Gcm1iV3DDK802YFf4euTtqkiqLDZxU9UcRi/FKz
 +dKq+fUABwfoPVNXmfyq6AwMJ7BPt0Ka9Aatpp463vWc2w2NSffStPrvE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="25075081"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="25075081"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 05:26:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="4093582"
Received: from mmackowi-mobl.ger.corp.intel.com (HELO localhost)
 ([10.246.18.126])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 05:26:05 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 1/4] lib/intel_blt: Add helpers for calculating
 stride and aligned height
Date: Wed, 31 Jan 2024 14:25:55 +0100
Message-Id: <20240131132558.208971-2-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240131132558.208971-1-zbigniew.kempczynski@intel.com>
References: <20240131132558.208971-1-zbigniew.kempczynski@intel.com>
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
---
 lib/intel_blt.c | 63 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 25d251c4f8..6d1aa0608f 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -521,6 +521,69 @@ static int __block_tiling(enum blt_tiling_type tiling)
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
+static uint32_t blt_get_min_stride(uint32_t width, uint32_t bpp,
+				   enum blt_tiling_type tiling)
+{
+	switch (tiling) {
+	case T_LINEAR:
+		return width * bpp / 8;
+	case T_XMAJOR:
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
+static uint32_t blt_get_aligned_height(uint32_t height, uint32_t bpp,
+				       enum blt_tiling_type tiling)
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
-- 
2.34.1

