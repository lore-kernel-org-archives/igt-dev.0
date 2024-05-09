Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD33C10F1A
	for <igt-dev@archiver.kernel.org>; Thu,  9 May 2024 05:34:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 124CF10E1C1;
	Thu,  9 May 2024 05:34:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WMy4fJkn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32F7710E1EA
 for <igt-dev@lists.freedesktop.org>; Thu,  9 May 2024 05:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715232881; x=1746768881;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7ejgCIRfj4cQoHbX3Ov5kmIQ8G6jaJiv2ulDWT9RFtM=;
 b=WMy4fJknU8p8AQxQH8wtUGA6Cmo3YkXcxn2ODoVwff3woLPHJmLQiEiH
 LHC5A0PGjcRPnblcOt4XOdj9UJJWOd8wIngT0Vorp2qK0HdWPD0jBPvns
 okOUbUNg2mxxfd6tNrn4YowPFqmbxWnlK+L+sxTQWqlFSyTkFlJGL2Pqw
 MgUSs+iFehkTdTCttQgG5QgpjTzUDAEPnz3WVBdrHxVc4bSCwKxVjUoTe
 p6Vb6qvkBgK3y9zP6FRNu8wj3TUPkMjhWnnveQ5xhb6ftR0CPglkF3uZP
 635wge6y3uah7wHXgbM0SYrHNPLBB8xPCUvVbNQWF9lmGggUY2vG4R1+2 Q==;
X-CSE-ConnectionGUID: iEUoxX48QnabIR5BIq/tLA==
X-CSE-MsgGUID: ep/k0Jn7R6q8QgTm0ljfmA==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="21802982"
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="21802982"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 22:34:41 -0700
X-CSE-ConnectionGUID: veH1PWkIS+KMBP9c9XdRaQ==
X-CSE-MsgGUID: PlziTk62Q26gqzVErF+log==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; d="scan'208";a="29187273"
Received: from unknown (HELO localhost) ([10.245.246.122])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 22:34:40 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v5 08/11] lib/intel_cmds_info: Introduce render tilings
Date: Thu,  9 May 2024 07:33:56 +0200
Message-Id: <20240509053359.449885-9-zbigniew.kempczynski@intel.com>
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

Due to hardware differences between blitter and render regarding
supported tilings and compression add new fields in cmds-info
to identify available tilings via render engine.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_cmds_info.c | 31 +++++++++++++++++++++++++++----
 lib/intel_cmds_info.h |  6 ++++++
 2 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/lib/intel_cmds_info.c b/lib/intel_cmds_info.c
index e7aabf6bfb..3f04f24f3c 100644
--- a/lib/intel_cmds_info.c
+++ b/lib/intel_cmds_info.c
@@ -27,8 +27,10 @@
 #define TILE_Y		BIT(T_YMAJOR)
 #define TILE_Yf		BIT(T_YFMAJOR)
 
+#define TILE_4_64	(TILE_4 | TILE_64)
 #define TILE_L_4_64	(TILE_L | TILE_4 | TILE_64)
 #define TILE_L_X	(TILE_L | TILE_X)
+#define TILE_L_X_4	(TILE_L | TILE_X | TILE_4)
 #define TILE_L_X_Y	(TILE_L | TILE_X | TILE_Y)
 #define TILE_L_X_4_64	(TILE_L | TILE_X | TILE_4 | TILE_64)
 #define TILE_L_Y	(TILE_L | TILE_Y)
@@ -93,6 +95,23 @@ static const struct blt_cmd_info
 						 BLT_CMD_EXTENDED);
 
 
+#define RENDER_TILING(_tiling, _compress_tiling)  { \
+		.supported_tiling = _tiling, \
+		.supported_compressed_tiling = _compress_tiling, \
+	}
+
+static const struct render_tiling_info
+		render_tiling_gen12 = RENDER_TILING(TILE_L_X_4, TILE_4);
+
+static const struct render_tiling_info
+		render_tiling_mtl = RENDER_TILING(TILE_L_X_4_64, TILE_4);
+
+static const struct render_tiling_info
+		render_tiling_dg2 = RENDER_TILING(TILE_L_X_4_64, TILE_4_64);
+
+static const struct render_tiling_info
+		render_tiling_xe2 = RENDER_TILING(TILE_L_X_4_64, TILE_L_X_4_64);
+
 const struct intel_cmds_info pre_gen6_cmds_info = {
 	.blt_cmds = {
 		[SRC_COPY] = &src_copy,
@@ -130,7 +149,8 @@ const struct intel_cmds_info gen12_cmds_info = {
 		[XY_FAST_COPY] = &gen12_xy_fast_copy,
 		[XY_BLOCK_COPY] = &gen12_xy_block_copy,
 		[XY_COLOR_BLT] = &gen6_xy_color_blt,
-	}
+	},
+	.render_tilings = &render_tiling_gen12,
 };
 
 const struct intel_cmds_info gen12_dg2_cmds_info = {
@@ -139,14 +159,16 @@ const struct intel_cmds_info gen12_dg2_cmds_info = {
 		[XY_FAST_COPY] = &dg2_xy_fast_copy,
 		[XY_BLOCK_COPY] = &dg2_xy_block_copy,
 		[XY_COLOR_BLT] = &gen6_xy_color_blt,
-	}
+	},
+	.render_tilings = &render_tiling_dg2,
 };
 
 const struct intel_cmds_info gen12_mtl_cmds_info = {
 	.blt_cmds = {
 		[XY_FAST_COPY] = &dg2_xy_fast_copy,
 		[XY_BLOCK_COPY] = &mtl_xy_block_copy,
-	}
+	},
+	.render_tilings = &render_tiling_mtl,
 };
 
 const struct intel_cmds_info gen12_pvc_cmds_info = {
@@ -164,7 +186,8 @@ const struct intel_cmds_info xe2_cmds_info  = {
 		[XY_BLOCK_COPY] = &xe2_xy_block_copy,
 		[MEM_COPY] = &pvc_mem_copy,
 		[MEM_SET] = &pvc_mem_set,
-	}
+	},
+	.render_tilings = &render_tiling_xe2,
 };
 
 const struct blt_cmd_info *blt_get_cmd_info(const struct intel_cmds_info *cmds_info,
diff --git a/lib/intel_cmds_info.h b/lib/intel_cmds_info.h
index 0a83b6a446..6f7d655083 100644
--- a/lib/intel_cmds_info.h
+++ b/lib/intel_cmds_info.h
@@ -43,8 +43,14 @@ struct blt_cmd_info {
 #define BLT_CMD_SUPPORTS_COMPRESSION   (1 << 1)
 };
 
+struct render_tiling_info {
+	uint32_t supported_tiling;
+	uint32_t supported_compressed_tiling;
+};
+
 struct intel_cmds_info {
 	struct blt_cmd_info const *blt_cmds[__BLT_MAX_CMD];
+	struct render_tiling_info const *render_tilings;
 };
 
 extern const struct intel_cmds_info pre_gen6_cmds_info;
-- 
2.34.1

