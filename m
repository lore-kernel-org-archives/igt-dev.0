Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F46C04FFE
	for <igt-dev@archiver.kernel.org>; Fri, 26 Apr 2024 09:02:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26AD210F0AD;
	Fri, 26 Apr 2024 09:02:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FkjTy2fW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 498CB10F013
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2024 09:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714122118; x=1745658118;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4F/9of33bXJr1vohjdMXJm2KsPXFYZlzcJZXE6aeZ/8=;
 b=FkjTy2fW7q3RhFyxsV9xONjOPou2/DnSNij2/WvpJQa0lKA6fw8mxu9C
 q380S8ZecT/gStvhOwvmtJ0faqzX0yimBdz9vSPQ857R3+FfDnlX8DeTQ
 H7Kl21MJuNxtiNerbWiFsKzI83nTh1PzDnuKdPj5Yh1w9rQme22jR0WGo
 d37p2KcRvszAnRY7iWn9/nYeGIrcbBf+bghx0l36HNpOpTr0QqOSF/fJq
 MQiL5EGljHKcFf01QGOdSdoJ0qhJcHomU+B+swTwgWgKh85bFgP5SzKBG
 fbb1jXpYLXIb9I3oIDRM0SC9G8WGRoBDRQlx4Q1V1yladkyN/+wwJNfUP g==;
X-CSE-ConnectionGUID: U3aDgbXnQKmQmy8PzfXLPA==
X-CSE-MsgGUID: FA5ylcMRR+GGD7uMRy0YBg==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9717811"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="9717811"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 02:01:54 -0700
X-CSE-ConnectionGUID: +w9oXg1MRpa+h5ua+hFnWw==
X-CSE-MsgGUID: xxJ2q9HXTG6g385P9NDe4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="25402882"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.61])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 02:01:53 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v2 08/10] lib/intel_cmds_info: Introduce render tilings
Date: Fri, 26 Apr 2024 11:01:15 +0200
Message-Id: <20240426090117.78060-9-zbigniew.kempczynski@intel.com>
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

Due to hardware differences between blitter and render regarding
supported tilings and compression add new fields in cmds-info
to identify available tilings via render engine.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_cmds_info.c | 29 +++++++++++++++++++++++++----
 lib/intel_cmds_info.h |  6 ++++++
 2 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/lib/intel_cmds_info.c b/lib/intel_cmds_info.c
index 2baac54c28..0e95cc226d 100644
--- a/lib/intel_cmds_info.c
+++ b/lib/intel_cmds_info.c
@@ -90,6 +90,23 @@ static const struct blt_cmd_info
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
@@ -127,7 +144,8 @@ const struct intel_cmds_info gen12_cmds_info = {
 		[XY_FAST_COPY] = &gen12_xy_fast_copy,
 		[XY_BLOCK_COPY] = &gen12_xy_block_copy,
 		[XY_COLOR_BLT] = &gen6_xy_color_blt,
-	}
+	},
+	.render_tilings = &render_tiling_gen12,
 };
 
 const struct intel_cmds_info gen12_dg2_cmds_info = {
@@ -136,14 +154,16 @@ const struct intel_cmds_info gen12_dg2_cmds_info = {
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
@@ -161,7 +181,8 @@ const struct intel_cmds_info xe2_cmds_info  = {
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

