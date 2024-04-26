Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83490C25B10
	for <igt-dev@archiver.kernel.org>; Fri, 26 Apr 2024 09:02:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E48FD10F06D;
	Fri, 26 Apr 2024 09:02:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E8Ank8+v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4315910F06D
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2024 09:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714122118; x=1745658118;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=erBgQx5yQye+T0FU+C8SSqANieD1EMh9/QbaOqwzfz0=;
 b=E8Ank8+vrEHLhe6FA7XHJMiO/p5lOW+89OCem+lBPzW19EtibDu/3jib
 /khfOQd0Jqr/FU+bzjju4V5xBIrr8CMhrUEPG1LxKCSRLrcCNm1F/rH/K
 z2cSeuc+OeA8ugYYBSyImdWWsT6bygJwtSY0vIjoWqZYbORmsn5O/eZix
 8h32b8iYM8fkMQnE/ojlZmA8b1qIisKF1jX2PCaAby04NNFvEZXLwj/+S
 t01KDJosJXwtRkwuEfvrhylAMBreKwTqmm1btgYlV5WDeYlEIKtXBbXci
 zIJea1qIMYXNlXoCkDzWVG93GEo3IYZ2Cj2C0tmD6+imFX9Gbt3vWPus6 g==;
X-CSE-ConnectionGUID: ibuT0iU5SbOi7imOc5EgTQ==
X-CSE-MsgGUID: 3+nK0ZzvRgqIOKKPnP0BOw==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9717825"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="9717825"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 02:01:58 -0700
X-CSE-ConnectionGUID: m0Ahwb+bTQ2C5lbnzKmsOg==
X-CSE-MsgGUID: 8fmQkXtySq+FK4sCPHxEUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="25402895"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.61])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 02:01:56 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v2 09/10] lib/intel_blt: Add render tilings and
 compression support helper
Date: Fri, 26 Apr 2024 11:01:16 +0200
Message-Id: <20240426090117.78060-10-zbigniew.kempczynski@intel.com>
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

Add function which is similar to already existing blt supports_tiling()
but returns tiling/compression capabilities of render engine.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_blt.c | 29 +++++++++++++++++++++++++++++
 lib/intel_blt.h |  1 +
 2 files changed, 30 insertions(+)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 946adc538b..a8433387d2 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -495,6 +495,35 @@ bool blt_uses_extended_block_copy(int fd)
 	return blt_cmd_has_property(cmds_info, XY_BLOCK_COPY, BLT_CMD_EXTENDED);
 }
 
+/**
+ * render_supports_tiling
+ * @fd: drm fd
+ * @tiling: tiling format
+ * @compression: check tiling which will be compressed
+ *
+ * Check if render provided by @fd device supports @tiling format wrt
+ * @compression
+ *
+ * Returns:
+ * true if it does, false otherwise.
+ */
+bool render_supports_tiling(int fd, enum blt_tiling_type tiling, bool compression)
+{
+	const struct intel_cmds_info *cmds_info = GET_CMDS_INFO(fd);
+
+	igt_assert(cmds_info);
+
+	if (!cmds_info->render_tilings) {
+		igt_warn("Render tilings are not defined\n");
+		return false;
+	}
+
+	if (!compression)
+		return cmds_info->render_tilings->supported_tiling & BIT(tiling);
+
+	return cmds_info->render_tilings->supported_compressed_tiling & BIT(tiling);
+}
+
 /**
  * blt_tiling_name:
  * @tiling: tiling id
diff --git a/lib/intel_blt.h b/lib/intel_blt.h
index 6daf46aea4..edf75c0887 100644
--- a/lib/intel_blt.h
+++ b/lib/intel_blt.h
@@ -211,6 +211,7 @@ bool blt_xy_src_copy_supports_tiling(int fd, enum blt_tiling_type tiling);
 bool blt_block_copy_supports_compression(int fd);
 bool blt_platform_has_flat_ccs_enabled(int fd);
 bool blt_uses_extended_block_copy(int fd);
+bool render_supports_tiling(int fd, enum blt_tiling_type tiling, bool compression);
 
 const char *blt_tiling_name(enum blt_tiling_type tiling);
 int blt_tile_to_i915_tile(enum blt_tiling_type tiling);
-- 
2.34.1

