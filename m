Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 491CCC4345F
	for <igt-dev@archiver.kernel.org>; Fri, 26 Apr 2024 09:02:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D02E310F013;
	Fri, 26 Apr 2024 09:02:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BhyQpv0i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1403110F06D
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2024 09:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714122117; x=1745658117;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hOceyPaSMUUJcpPGuLwixKJro4dzfU2pouf/cJHTatg=;
 b=BhyQpv0iapVK/EXsTFlGCEHhQDmuqDoxCjJKcIS3Ic59rbNz/KfoXDfR
 cIPllsHS3xF3u48KkPs1SsHJeyyFblAXxAmjlhpS1DlBOaHo2EqDlOZbS
 enojB7uC29WawO9XQ3ENQmPC2iP5kikpxrdPLnCB0qG+rAZ9bN58kcaTs
 0djeyGiExGgt762lyUHSLk+mXnwKjIitKRugglzrwhwjSzkSKg8TLq36Z
 Kta0wOLdaMRZgA9BwPcW5QNJuXQJjXU8BQvLtIpmXkX0MPif7gT6nLJt+
 t5H86jgEIfOO4mrz6E4z10tl0WR0rFtp21lchBF7QzFU2UW6qMN+a01JP Q==;
X-CSE-ConnectionGUID: 4R+1gSuuSF2+tuBRo2mUgA==
X-CSE-MsgGUID: UK6SmSUdRzyve9372UxNGQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9717808"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="9717808"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 02:01:50 -0700
X-CSE-ConnectionGUID: ugpYjEGmSNu3TAnpTNrRdw==
X-CSE-MsgGUID: +EEsV6quSsC14ltoixGeAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="25402876"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.61])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 02:01:49 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v2 07/10] lib/intel_cmds_info: Define tiling macros
Date: Fri, 26 Apr 2024 11:01:14 +0200
Message-Id: <20240426090117.78060-8-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240426090117.78060-1-zbigniew.kempczynski@intel.com>
References: <20240426090117.78060-1-zbigniew.kempczynski@intel.com>
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
 lib/intel_cmds_info.c | 107 +++++++++++++++++-------------------------
 1 file changed, 42 insertions(+), 65 deletions(-)

diff --git a/lib/intel_cmds_info.c b/lib/intel_cmds_info.c
index 669d3e5006..2baac54c28 100644
--- a/lib/intel_cmds_info.c
+++ b/lib/intel_cmds_info.c
@@ -20,75 +20,56 @@
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
+#define TILE_4		(BIT(T_TILE4))
+#define TILE_4_64	(BIT(T_TILE4) | BIT(T_TILE64))
+#define TILE_L		(BIT(T_LINEAR))
+#define TILE_L_4_64	(BIT(T_LINEAR) | BIT(T_TILE4) | BIT(T_TILE64))
+#define TILE_L_X	(BIT(T_LINEAR) | BIT(T_XMAJOR))
+#define TILE_L_X_4	(BIT(T_LINEAR) | BIT(T_XMAJOR) | BIT(T_TILE4))
+#define TILE_L_Y	(BIT(T_LINEAR) | BIT(T_YMAJOR))
+#define TILE_L_X_Y	(BIT(T_LINEAR) | BIT(T_XMAJOR) | BIT(T_YMAJOR))
+#define TILE_L_X_4_64	(BIT(T_LINEAR) | BIT(T_XMAJOR) | BIT(T_TILE4) | BIT(T_TILE64))
+#define TILE_L_Y_4_64	(BIT(T_LINEAR) | BIT(T_YMAJOR) | BIT(T_TILE4) | BIT(T_TILE64))
+#define TILE_L_Y_Yf_64	(BIT(T_LINEAR) | BIT(T_YMAJOR) | BIT(T_YFMAJOR) | BIT(T_TILE64))
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
@@ -102,17 +83,13 @@ static const struct blt_cmd_info
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

