Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92584C04FF6
	for <igt-dev@archiver.kernel.org>; Tue, 16 Apr 2024 16:27:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8109112D63;
	Tue, 16 Apr 2024 16:27:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aQ9XHSDu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7E8B112D6D
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Apr 2024 16:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713284862; x=1744820862;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lsIV+SE1khyiKSFQqhRgo4SlSTSwB6P1cJg5vPvUlO0=;
 b=aQ9XHSDuiQpvxz2cRppCU4NKJMcSbhFpv1gMY49R183QwzQZkI9whOqC
 ya46fysyKpDncY0r1pMElGvGfVE8sxH2rDwaIWH0NTLuOQO4SBNGM8yfL
 r6oVt8nFBocrRQiIanl9kXPokPV8ydw+0tenKtd+cGtAcfCaG/RA8gwOb
 5/feYFYSwPDghBGTzZZ2MQ0HmzNeJpR/C47rGYNYsyDt27rf2asSkqjee
 CmG0kehvR4Z7f5OeczDA0xv8B+eBdtJKDBtGHilVegtQnrOieNbdMoema
 EMVk7hRhlkDsHYKnAHbBBFiAvdug/o5watqim2C9g1qrDIJbUCnwjex6Q A==;
X-CSE-ConnectionGUID: g6cacFw+Q3WSqv8BIIL/0A==
X-CSE-MsgGUID: 59FRPXh2RsyxMyAKpJRH7Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="31218246"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="31218246"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 09:27:42 -0700
X-CSE-ConnectionGUID: SJ3WwhVTRXGGIib/WkcOyQ==
X-CSE-MsgGUID: w/cFzZ1nQGu4cFcA/Zhy2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="26885965"
Received: from saurabhg-nuc10i5fnh.jf.intel.com ([10.165.21.145])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 09:27:41 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH i-g-t v5 1/2] lib/intel_blt: Add helper function to ensure
 platform has flat-ccs enabled
Date: Tue, 16 Apr 2024 21:25:32 -0700
Message-Id: <b867cc0ffad688ec182cbfe8adfccbd8f8fc25b0.1713327400.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713327400.git.akshata.jahagirdar@intel.com>
References: <cover.1713327400.git.akshata.jahagirdar@intel.com>
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

Add helper function to check if platform has flat-ccs enabled  by
reading from debugfs entry.

Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Acked-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 lib/intel_blt.c | 14 ++++++++++++++
 lib/intel_blt.h |  1 +
 2 files changed, 15 insertions(+)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index dc6669889..4da5cc855 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -464,6 +464,20 @@ bool blt_block_copy_supports_compression(int fd)
 				    BLT_CMD_SUPPORTS_COMPRESSION);
 }
 
+/**
+ * blt_platform_has_flat_ccs_enabled
+ * @fd: drm fd
+ *
+ * Check if platform provided by @fd device has flat-ccs enabled.
+ *
+ * Returns:
+ * true if it does, false otherwise.
+ */
+bool blt_platform_has_flat_ccs_enabled(int fd)
+{
+	return igt_debugfs_search(fd, "info", "has_flat_ccs yes");
+}
+
 /**
  * blt_uses_extended_block_copy
  * @fd: drm fd
diff --git a/lib/intel_blt.h b/lib/intel_blt.h
index d9c4d107f..cc5966686 100644
--- a/lib/intel_blt.h
+++ b/lib/intel_blt.h
@@ -209,6 +209,7 @@ bool blt_fast_copy_supports_tiling(int fd, enum blt_tiling_type tiling);
 bool blt_block_copy_supports_tiling(int fd, enum blt_tiling_type tiling);
 bool blt_xy_src_copy_supports_tiling(int fd, enum blt_tiling_type tiling);
 bool blt_block_copy_supports_compression(int fd);
+bool blt_platform_has_flat_ccs_enabled(int fd);
 bool blt_uses_extended_block_copy(int fd);
 
 const char *blt_tiling_name(enum blt_tiling_type tiling);
-- 
2.34.1

