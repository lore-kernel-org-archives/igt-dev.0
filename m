Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2DCBC25B75
	for <igt-dev@archiver.kernel.org>; Wed, 15 May 2024 12:20:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D1DD10E05A;
	Wed, 15 May 2024 12:20:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UKhXmHPk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 321BB10E8E1
 for <igt-dev@lists.freedesktop.org>; Wed, 15 May 2024 12:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715775619; x=1747311619;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M+As4Akd3C0kqjKDVvnm8UcGjpLzvOGWZlEjCtQl5Pk=;
 b=UKhXmHPkODT9auIWpVEboh58NTRIRIHRifOjFifd9x9BWWBe9a2+cJML
 HXbO8DF8YvVmUqNqoEFJd7ISK3aJL/uQ1/kyJFlVnMeusgItZZT1VlhCO
 kU7daHPACLj7GGLgBrq3wTnjEmLjEUVbcww7B4sgjjv5YWPrXfIRhnaDt
 ziRrYsiLCTS+wZaXSIemSvsxBk2Bt/vuPwE9vl5VpNK/eCE23WP5hLK0B
 UsFww+XNE+FPSa6jWAhw2V1glrLsT7I5UMtA0WenaO+1GiN5kOYjZG/kx
 XxEFEMbpyfvKz2EIgsGWOcAR6Tsh7T9KBrTppZl4+LfSTVFhgs7ReEkG1 A==;
X-CSE-ConnectionGUID: dY9n5dqkQwqc3xKvveZuOw==
X-CSE-MsgGUID: FL7KKydqRh20onU62glxcA==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="12036167"
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="12036167"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 05:20:19 -0700
X-CSE-ConnectionGUID: aIUplW9ISzOPC/z0GGMKng==
X-CSE-MsgGUID: oPI0oVkuQxSm64FYVc/rwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="31039746"
Received: from unknown (HELO localhost) ([10.245.246.122])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 05:20:19 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v6 6/9] lib/intel_cmds_info: Introduce render tilings
Date: Wed, 15 May 2024 14:19:46 +0200
Message-Id: <20240515121949.245280-7-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240515121949.245280-1-zbigniew.kempczynski@intel.com>
References: <20240515121949.245280-1-zbigniew.kempczynski@intel.com>
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
v6: Fix tilings for gen12 (JP)
---
 lib/intel_cmds_info.c | 31 +++++++++++++++++++++++++++----
 lib/intel_cmds_info.h |  6 ++++++
 2 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/lib/intel_cmds_info.c b/lib/intel_cmds_info.c
index e7aabf6bfb..1416e02cd4 100644
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
+		render_tiling_gen12 = RENDER_TILING(TILE_L_X_Y, TILE_Y);
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

