Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C6FC25B75
	for <igt-dev@archiver.kernel.org>; Tue,  7 May 2024 07:59:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D93D0112484;
	Tue,  7 May 2024 07:59:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pae4eZ59";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D9E112484
 for <igt-dev@lists.freedesktop.org>; Tue,  7 May 2024 07:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715068765; x=1746604765;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E+xw9NeppLzpNGVI/Zxg+/eRVgJqyHvvp2yEpOT1SgE=;
 b=Pae4eZ59ldz3cHwGp7CXmelYtjtRor8noInxeI1INPr1KPLczg0syWYk
 kq4mRMiAC+MrYiRTocWnvjDsSOKSBsGxFfZO4w9HTEcc2BHvtcqTTqUJc
 SSo8/StoO569E07phKSCJ6JK3a7F/nNIC0cNOMIXGslzuU24k7OeAHeOQ
 OqoGf1gigRle+5J5ZB7tclEoWc9tjd6AApsN9pxoAK7kgmFhL0QC/9hEd
 wiQxHSQ/sNWj2LRflDTaz+3d1zx6QMdwBB7DJWg/0F/hlf+1Js9Mkhv2T
 zyqUFEatDmUo4MCFhn/WEH+KeJ0p+Hlw9fA31eW4g4bMBBrxCT0q7BjoN A==;
X-CSE-ConnectionGUID: EOE0yeJHTF2Ora9Erlbxxg==
X-CSE-MsgGUID: 2mTbkUY0R72zmeRUAr4zjw==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="22258380"
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; d="scan'208";a="22258380"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 00:59:25 -0700
X-CSE-ConnectionGUID: qXNVvoEzTgeou+sJ3//LQg==
X-CSE-MsgGUID: sjavH5VHRMCo0xmfu7h01g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; d="scan'208";a="33238195"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.12])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 00:59:23 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Karolina Stolarek <karolina.stolarek@intel.com>
Subject: [PATCH i-g-t v3 09/11] lib/intel_blt: Add render tilings and
 compression support helper
Date: Tue,  7 May 2024 09:58:34 +0200
Message-Id: <20240507075836.259581-10-zbigniew.kempczynski@intel.com>
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

Add function which is similar to already existing blt supports_tiling()
but returns tiling/compression capabilities of render engine.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>
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

