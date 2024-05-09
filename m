Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F58C10F1A
	for <igt-dev@archiver.kernel.org>; Thu,  9 May 2024 05:34:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A57010E1B6;
	Thu,  9 May 2024 05:34:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z8tT7sC5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C92D810E1B6
 for <igt-dev@lists.freedesktop.org>; Thu,  9 May 2024 05:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715232878; x=1746768878;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J6OdQPSkAiFX1rKVz3whQNWuQP4zV9evANu0Mmo/znA=;
 b=Z8tT7sC5UNizZloi/jjQaC4lGoQpVeLLvah4qIAk7U3MI8ks5aJ9Vg0B
 VfT1x7kw1X1eRtBKPue8YuzRwKDEQyPxyLBmQC+ATls66siB7uPAxzyIE
 nRxuK6pBinZeH7aERCjQW8dkCKbxUChou/VLiOAU+c+WVQbWEk8VpicYM
 T5qhIti+zjujfV+YXnCZwTArkn+C5bYa+qAPViTP0jYuqlEhkb26Ct7yX
 lnjkRWDY4RM6UU5+RvjG51/kGP7rVrstZf742GbS/XC/MbxRPTXvj08cR
 2ktkqK2OHnPQ368SPdIsfUZudqvSweHrgLk0iHDd390HAuEsXiliUkG7G Q==;
X-CSE-ConnectionGUID: 8kGsqjVsT9WtlMf/3piQ+Q==
X-CSE-MsgGUID: ZQne01PFQDWlK6ju6QJrKw==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11000887"
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="11000887"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 22:34:37 -0700
X-CSE-ConnectionGUID: nSNwPIrMSP2nHwvHPwFyGA==
X-CSE-MsgGUID: PR/ng+u+TBWCwY7x2Vumsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="29654562"
Received: from unknown (HELO localhost) ([10.245.246.122])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 22:34:36 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v5 07/11] lib/intel_cmds_info: Define tiling macros
Date: Thu,  9 May 2024 07:33:55 +0200
Message-Id: <20240509053359.449885-8-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240509053359.449885-1-zbigniew.kempczynski@intel.com>
References: <20240509053359.449885-1-zbigniew.kempczynski@intel.com>
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

