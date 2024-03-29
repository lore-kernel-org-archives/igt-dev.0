Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B92FC6FD1F
	for <igt-dev@archiver.kernel.org>; Fri, 29 Mar 2024 04:32:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D8BD10EADE;
	Fri, 29 Mar 2024 04:32:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ET2Mi+mr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B906410E89B
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Mar 2024 04:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711686728; x=1743222728;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LED3g6x6KZMzxVNS8hG/TrsDRzsDUjdCTjAiB0FhzR0=;
 b=ET2Mi+mr6humot4s03mpUxp3t8je6sYREFTw9TFwKKIVP9HwJ4k92X7V
 KdAyzMxPF8y7FVSXoU3Ajg7WNO2OOx4gJ3FNfk/Wkt+QUNIA2iF2fmv23
 /UwdpkGY57Vj1IJclFwxCKszwmMiaDO72jeHfHxp5NgK2C4t2bT5SJsNK
 6IoJX9c/niowMG5FloTalSFkkuda8e+iVnT0O3CEegNk6mqhNraWW8z74
 l/x/ZfhcYRkynAjgMWycSS3Qj8tz3fYxXNugd9u/QGR7R7CwNZhFH4sPm
 FL3Xz9h4C89JUfLcyvGDRlK8Cuh/Dcb9Ze0T4sZ47wO76Izifw+4lbzdK w==;
X-CSE-ConnectionGUID: oS2THCGlQX+RyBUsMwEq4A==
X-CSE-MsgGUID: kqnDotUsRJahwuhy3EobAA==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="17501426"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="17501426"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 21:32:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="16829102"
Received: from saurabhg-nuc10i5fnh.jf.intel.com ([10.165.21.145])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 21:32:05 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 matthew.auld@intel.com, Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH i-g-t v2 1/2] lib/intel_blt: Add helper function to ensure
 platform supports compression
Date: Fri, 29 Mar 2024 09:30:12 -0700
Message-Id: <6e857ec4a881f64a2cce7b3ec84cd4e1d74a55f3.1711729400.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1711729399.git.akshata.jahagirdar@intel.com>
References: <cover.1711729399.git.akshata.jahagirdar@intel.com>
MIME-Version: 1.0
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
---
 lib/intel_blt.c | 14 ++++++++++++++
 lib/intel_blt.h |  1 +
 2 files changed, 15 insertions(+)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index fe0a45cb8..0e569c5a2 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -464,6 +464,20 @@ bool blt_block_copy_supports_compression(int fd)
 				    BLT_CMD_SUPPORTS_COMPRESSION);
 }
 
+/**
+ * blt_platform_supports_compression
+ * @fd: drm fd
+ *
+ * Check if platform provided by @fd device supports compression.
+ *
+ * Returns:
+ * true if it does, false otherwise.
+ */
+bool blt_platform_supports_compression(int fd)
+{
+	return igt_debugfs_search(fd, "info", "has_flat_ccs yes");
+}
+
 /**
  * blt_uses_extended_block_copy
  * @fd: drm fd
diff --git a/lib/intel_blt.h b/lib/intel_blt.h
index 1f6c71359..a2c4a4adb 100644
--- a/lib/intel_blt.h
+++ b/lib/intel_blt.h
@@ -209,6 +209,7 @@ bool blt_fast_copy_supports_tiling(int fd, enum blt_tiling_type tiling);
 bool blt_block_copy_supports_tiling(int fd, enum blt_tiling_type tiling);
 bool blt_xy_src_copy_supports_tiling(int fd, enum blt_tiling_type tiling);
 bool blt_block_copy_supports_compression(int fd);
+bool blt_platform_supports_compression(int fd);
 bool blt_uses_extended_block_copy(int fd);
 
 const char *blt_tiling_name(enum blt_tiling_type tiling);
-- 
2.34.1

