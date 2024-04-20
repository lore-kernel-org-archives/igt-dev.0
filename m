Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF1C9C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 15:38:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5760C10E114;
	Fri, 19 Apr 2024 15:38:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ieMzRxJO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E3AA10EE75
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Apr 2024 15:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713541109; x=1745077109;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lsIV+SE1khyiKSFQqhRgo4SlSTSwB6P1cJg5vPvUlO0=;
 b=ieMzRxJOEZmxfxGMProINcYPtpY7PgERu+HkFbmTBWclBOCW/3KUZBHj
 bLnPA9cqfp7aDFhacep93/aRjB1pSZgjzEBPv0TkeAavq3u5ZLc/a23Ab
 nScxL4xA+gypWx2YmphZeAj6cPOpRgNnvGIstNh/6iFU9+72wjtgKYkZI
 IZdr+u5vEsYwoI/nHBHCYViTHm67IlIPG1irbZp8UOOJ8f8zpCo3T0XDJ
 0gHKuLbwjG2WdKvpFG10UudgnFWGZH+0bZkrLMmN+DLdu01Q0QDUX+1LC
 lg1NYTMh3bBdOtaIFQ+lcxL1oFNhm9g0iCGaiQx08LvOSnzSKX1aZRCP6 Q==;
X-CSE-ConnectionGUID: Kso3zBXoQKKlrYkLXE7bIg==
X-CSE-MsgGUID: EygBQRsDStK1wnntVpXsLw==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="9009102"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; 
   d="scan'208";a="9009102"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 08:38:28 -0700
X-CSE-ConnectionGUID: FcF1efbsTViapYaYI7t8JA==
X-CSE-MsgGUID: 2z+qteQEQGuJVN0yWMNGzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="28017185"
Received: from saurabhg-nuc10i5fnh.jf.intel.com ([10.165.21.145])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 08:38:28 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH i-g-t v6 1/2] lib/intel_blt: Add helper function to ensure
 platform has flat-ccs enabled
Date: Fri, 19 Apr 2024 20:36:16 -0700
Message-Id: <b867cc0ffad688ec182cbfe8adfccbd8f8fc25b0.1713584014.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713584014.git.akshata.jahagirdar@intel.com>
References: <cover.1713584014.git.akshata.jahagirdar@intel.com>
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

