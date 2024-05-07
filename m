Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256B6C10F1A
	for <igt-dev@archiver.kernel.org>; Tue,  7 May 2024 07:59:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8BE4112476;
	Tue,  7 May 2024 07:59:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BJrVDmn6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D40112420
 for <igt-dev@lists.freedesktop.org>; Tue,  7 May 2024 07:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715068758; x=1746604758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cEegG2LIOe2tLOWDU5UIew1LDU77j32CEteQ+sGiIXo=;
 b=BJrVDmn676w4FQllD9rcFKzBNxVTzweIgdOqWKf1K0ajhdhXwwFFn6Qb
 W20KZ+8+/rA7YRY7/dfS7WW+aaNhvZV5L6anhv601JVoA3zsaZbkkvO3S
 eczP64CwvdlmBInjztIPzJcnn0UCztJPWDwlT9zHDViSR+V+bRuUs0UYU
 cVAXY8yvFSEYJUS/Xhm9v+IFfVBvt/0p82s+mRFbmw1YfJd9WGiGbJ0GZ
 OZSj1manOyqss+OL1i0Ban65J67VEXmhfUhvSd/Fi7cp30XCQbaSptODW
 lOck3RLnKTOpS9r9d0Mg6f00rubdOwY4Gxr1fgaRvkai2AO75Ol7WdhpY A==;
X-CSE-ConnectionGUID: 2kopPUV1RXWnQo3DBKNlUA==
X-CSE-MsgGUID: tbgXtJcrSNatfOyf21kiug==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="14662883"
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; d="scan'208";a="14662883"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 00:59:18 -0700
X-CSE-ConnectionGUID: rkpBUzwTQWKtJ6ndlFUtqw==
X-CSE-MsgGUID: ECcdDhfNTBC7331VLUoCQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; d="scan'208";a="32999863"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.12])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 00:59:16 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v3 07/11] lib/intel_cmds_info: Define tiling macros
Date: Tue,  7 May 2024 09:58:32 +0200
Message-Id: <20240507075836.259581-8-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240507075836.259581-1-zbigniew.kempczynski@intel.com>
References: <20240507075836.259581-1-zbigniew.kempczynski@intel.com>
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

Blitter tilings don't always matches supported render tilings so
it is necessary to add separate fields for this purpose. To avoid
multiple lines where supported tiling is glued with BIT(tiling)
it is worth to predefine them, especially they will be used in next
patch related to supported render copy tilings.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

---
v3: Predefine single tiling first, then complex (Karolina)
---
 lib/intel_cmds_info.c | 110 +++++++++++++++++-------------------------
 1 file changed, 45 insertions(+), 65 deletions(-)

diff --git a/lib/intel_cmds_info.c b/lib/intel_cmds_info.c
index 669d3e5006..e7aabf6bfb 100644
--- a/lib/intel_cmds_info.c
+++ b/lib/intel_cmds_info.c
@@ -20,75 +20,59 @@
 		.flags = _flags, \
 	}
 
-static const struct blt_cmd_info src_copy = BLT_INFO(SRC_COPY, BIT(T_LINEAR));
-static const struct blt_cmd_info
-		pre_gen6_xy_src_copy = BLT_INFO(XY_SRC_COPY,
-						BIT(T_LINEAR) |
-						BIT(T_XMAJOR));
-static const struct blt_cmd_info
-		gen6_xy_src_copy = BLT_INFO(XY_SRC_COPY,
-					    BIT(T_LINEAR) |
-					    BIT(T_XMAJOR) |
-					    BIT(T_YMAJOR));
-static const struct blt_cmd_info
-		gen11_xy_fast_copy = BLT_INFO(XY_FAST_COPY,
-					      BIT(T_LINEAR)  |
-					      BIT(T_YMAJOR)  |
-					      BIT(T_YFMAJOR) |
-					      BIT(T_TILE64));
-static const struct blt_cmd_info
-		gen12_xy_fast_copy = BLT_INFO(XY_FAST_COPY,
-					      BIT(T_LINEAR) |
-					      BIT(T_YMAJOR) |
-					      BIT(T_TILE4)  |
-					      BIT(T_TILE64));
-static const struct blt_cmd_info
-		dg2_xy_fast_copy = BLT_INFO(XY_FAST_COPY,
-					    BIT(T_LINEAR) |
-					    BIT(T_XMAJOR) |
-					    BIT(T_TILE4)  |
-					    BIT(T_TILE64));
-static const struct blt_cmd_info
-		pvc_xy_fast_copy = BLT_INFO(XY_FAST_COPY,
-					    BIT(T_LINEAR) |
-					    BIT(T_TILE4)  |
-					    BIT(T_TILE64));
-
-static const struct blt_cmd_info
-		gen12_xy_block_copy = BLT_INFO(XY_BLOCK_COPY,
-					       BIT(T_LINEAR) |
-					       BIT(T_YMAJOR));
-static const struct blt_cmd_info
-		dg2_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY,
-						 BIT(T_LINEAR) |
-						 BIT(T_XMAJOR) |
-						 BIT(T_TILE4)  |
-						 BIT(T_TILE64),
+#define TILE_4		BIT(T_TILE4)
+#define TILE_64		BIT(T_TILE64)
+#define TILE_L		BIT(T_LINEAR)
+#define TILE_X		BIT(T_XMAJOR)
+#define TILE_Y		BIT(T_YMAJOR)
+#define TILE_Yf		BIT(T_YFMAJOR)
+
+#define TILE_L_4_64	(TILE_L | TILE_4 | TILE_64)
+#define TILE_L_X	(TILE_L | TILE_X)
+#define TILE_L_X_Y	(TILE_L | TILE_X | TILE_Y)
+#define TILE_L_X_4_64	(TILE_L | TILE_X | TILE_4 | TILE_64)
+#define TILE_L_Y	(TILE_L | TILE_Y)
+#define TILE_L_Y_4_64	(TILE_L | TILE_Y | TILE_4 | TILE_64)
+#define TILE_L_Y_Yf_64	(TILE_L | TILE_Y | TILE_Yf | TILE_64)
+
+static const struct blt_cmd_info src_copy = BLT_INFO(SRC_COPY, TILE_L);
+static const struct blt_cmd_info
+		pre_gen6_xy_src_copy = BLT_INFO(XY_SRC_COPY, TILE_L_X);
+
+static const struct blt_cmd_info
+		gen6_xy_src_copy = BLT_INFO(XY_SRC_COPY, TILE_L_X_Y);
+
+static const struct blt_cmd_info
+		gen11_xy_fast_copy = BLT_INFO(XY_FAST_COPY, TILE_L_Y_Yf_64);
+
+static const struct blt_cmd_info
+		gen12_xy_fast_copy = BLT_INFO(XY_FAST_COPY, TILE_L_Y_4_64);
+
+static const struct blt_cmd_info
+		dg2_xy_fast_copy = BLT_INFO(XY_FAST_COPY, TILE_L_X_4_64);
+
+static const struct blt_cmd_info
+		pvc_xy_fast_copy = BLT_INFO(XY_FAST_COPY, TILE_L_4_64);
+
+static const struct blt_cmd_info
+		gen12_xy_block_copy = BLT_INFO(XY_BLOCK_COPY, TILE_L_Y);
+
+static const struct blt_cmd_info
+		dg2_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY, TILE_L_X_4_64,
 						 BLT_CMD_EXTENDED |
 						 BLT_CMD_SUPPORTS_COMPRESSION);
 
 static const struct blt_cmd_info
-		xe2_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY,
-						 BIT(T_LINEAR) |
-						 BIT(T_XMAJOR) |
-						 BIT(T_TILE4)  |
-						 BIT(T_TILE64),
+		xe2_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY, TILE_L_X_4_64,
 						 BLT_CMD_EXTENDED |
 						 BLT_CMD_SUPPORTS_COMPRESSION);
 
 static const struct blt_cmd_info
-		mtl_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY,
-						 BIT(T_LINEAR) |
-						 BIT(T_XMAJOR) |
-						 BIT(T_TILE4)  |
-						 BIT(T_TILE64),
+		mtl_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY, TILE_L_X_4_64,
 						 BLT_CMD_EXTENDED);
 
 static const struct blt_cmd_info
-		pvc_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY,
-						 BIT(T_LINEAR) |
-						 BIT(T_TILE4)  |
-						 BIT(T_TILE64),
+		pvc_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY, TILE_L_4_64,
 						 BLT_CMD_EXTENDED);
 
 static const struct blt_cmd_info
@@ -102,17 +86,13 @@ static const struct blt_cmd_info
 				       BIT(M_MATRIX));
 
 static const struct blt_cmd_info
-		pre_gen6_xy_color_blt = BLT_INFO(XY_COLOR_BLT,
-						 BIT(T_LINEAR) |
-						 BIT(T_XMAJOR));
+		pre_gen6_xy_color_blt = BLT_INFO(XY_COLOR_BLT, TILE_L_X);
 
 static const struct blt_cmd_info
-		gen6_xy_color_blt = BLT_INFO_EXT(XY_COLOR_BLT,
-						 BIT(T_LINEAR) |
-						 BIT(T_YMAJOR) |
-						 BIT(T_XMAJOR),
+		gen6_xy_color_blt = BLT_INFO_EXT(XY_COLOR_BLT, TILE_L_X_Y,
 						 BLT_CMD_EXTENDED);
 
+
 const struct intel_cmds_info pre_gen6_cmds_info = {
 	.blt_cmds = {
 		[SRC_COPY] = &src_copy,
-- 
2.34.1

