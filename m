Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF28C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 12 Apr 2024 01:39:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9925B10ECB6;
	Fri, 12 Apr 2024 01:39:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="coclC11t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71F3C10ECF8
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Apr 2024 01:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712885976; x=1744421976;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lsIV+SE1khyiKSFQqhRgo4SlSTSwB6P1cJg5vPvUlO0=;
 b=coclC11tteRqPfYe8QeDc7s+usY6VphX7EMNNCZBhQpNWmbRzm/KPbin
 BdV9gmevJpwHUNBEaXwoU4V51NpJvIADsHgyXUfnmeO5O0Ze0/JECNcHg
 qLvvc4dfp7pnF/J8L86/ogzPVkOvGgskyh10b/hnq1ttzICZMMP+oXe6N
 s67HSVFA+559FmXAzaB7P8N0MyeaW0VBKsKfQDdEKcNnfifCkffiWjsez
 JSF+117VJwh6m7jtXhw9eC7SH1FTpvMoQvKwfCSwywjpS556gLLfJKgM+
 fFcU+CpBkAtspxgZMH35ye4ZmrmRn84kWojetP7ysKPPreQGrCKVEDXPI Q==;
X-CSE-ConnectionGUID: 8sF1yM5BRtyoiBlrebiEcg==
X-CSE-MsgGUID: 19F2vQ8zS0iAcPAjbvEQEA==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19722803"
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; d="scan'208";a="19722803"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 18:39:34 -0700
X-CSE-ConnectionGUID: LPdP/d1JT7yOKR0qeSsADg==
X-CSE-MsgGUID: LP+q4sdaSpWtJkpwuSj1lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; d="scan'208";a="21171263"
Received: from saurabhg-nuc10i5fnh.jf.intel.com ([10.165.21.145])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 18:39:33 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 jonathan.cavitt@intel.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH i-g-t v4 1/2] lib/intel_blt: Add helper function to ensure
 platform has flat-ccs enabled
Date: Fri, 12 Apr 2024 06:37:29 -0700
Message-Id: <cb46ed9b1a504d182215be1045a0b5380a7c234f.1712928787.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1712928787.git.akshata.jahagirdar@intel.com>
References: <cover.1712928787.git.akshata.jahagirdar@intel.com>
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

