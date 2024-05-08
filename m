Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C6DC04FFE
	for <igt-dev@archiver.kernel.org>; Wed,  8 May 2024 12:55:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B14A1128C3;
	Wed,  8 May 2024 12:55:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b890CgYg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 458EF1128C3
 for <igt-dev@lists.freedesktop.org>; Wed,  8 May 2024 12:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715172924; x=1746708924;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J6OdQPSkAiFX1rKVz3whQNWuQP4zV9evANu0Mmo/znA=;
 b=b890CgYg7wn7GEzbsecHZNrwdbJMsZYueA59mN7vAgVKjanco8wnrz8Z
 yA66DYbvkssgZaYq7wlokVkZDThjQ9SWcd6iS3uXVUKXqJ3P+jO3LfSRO
 lh1Bk0XLYasVxln6u2xhbisUxudTfbmonJHZ5J73Yx5uJAORvQPlNrwpg
 r1qobIT8BBARUJ/L+njIcQVDFkzWyktA0XJi2bhT3zcWOfmvUfyUVV+tu
 CMEOIVnwkQLhsZcDWOKWsxoxcIIqoYabMZupQKx9PxgmewwQESCAyklGU
 NdBUq9R0VEUz1obU2Tbq2jtxWOQ0zdMWUHpHJmIGFEWktDOIY0FvaECpF Q==;
X-CSE-ConnectionGUID: 3GwxtaeASG6/sdpzh9ncoA==
X-CSE-MsgGUID: h7NHJYR6SsKGX86N4efsrA==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="22421365"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="22421365"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 05:55:23 -0700
X-CSE-ConnectionGUID: N2UcfjL2REKQjpPMa9586w==
X-CSE-MsgGUID: rTerxSP1TLyJixpK7RHU8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="28968132"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.90])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 05:55:22 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v4 07/11] lib/intel_cmds_info: Define tiling macros
Date: Wed,  8 May 2024 14:54:39 +0200
Message-Id: <20240508125443.404402-8-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240508125443.404402-1-zbigniew.kempczynski@intel.com>
References: <20240508125443.404402-1-zbigniew.kempczynski@intel.com>
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
Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
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

