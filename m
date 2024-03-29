Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C9FC6FD1F
	for <igt-dev@archiver.kernel.org>; Fri, 29 Mar 2024 05:29:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 497F010E701;
	Fri, 29 Mar 2024 05:29:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hSdRhTXa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88CB610E8C4
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Mar 2024 05:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711690154; x=1743226154;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XFw+Skxg0etAhMCllPz/Q72hp7NtxYwql0N2lk2DQP4=;
 b=hSdRhTXacbJTRK9aWGPSJyDdsTkd9fKhNJT842RFVM7w/Nlm3jA/czGe
 1P3l+SLXgdl5ahUsSKLCzFlaiRxxwdBf9FxasO51nhhVQyxKfgArpNVhX
 B5gTZczWTejL0ChPqH6ZbtOjNb5o1IdDKwdPXU0hCxaQ0dEJL1dNzGj7w
 IzA+CFCQ6Vb+SYsbQHWFNSnuIR9mk7Um0mt+RSbz4dAWP2neQpJx0iPpa
 dWI/LaS0UTuqwvlgj18E1OUEBmqHItpr85TY2DfMKkyQT4egvKghScwo0
 BuhDwDHlrQrAR9ZOW8KMUIX9Y+nMy1x79xvlNPew4+6rRzmE6/Vuhm0ms g==;
X-CSE-ConnectionGUID: Pp3I6NlwS5SXij/VXIRecw==
X-CSE-MsgGUID: Scs9YzOsTdWc9XjjpYRKLw==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="6731324"
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; 
   d="scan'208";a="6731324"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 22:28:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; d="scan'208";a="16757697"
Received: from saurabhg-nuc10i5fnh.jf.intel.com ([10.165.21.145])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 22:28:53 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 matthew.auld@intel.com, Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH i-g-t v3 1/2] lib/intel_blt: Add helper function to ensure
 platform has flat-ccs enabled
Date: Fri, 29 Mar 2024 10:27:00 -0700
Message-Id: <57d5987823217cc0032820e5455fef519ed530eb.1711733054.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1711733054.git.akshata.jahagirdar@intel.com>
References: <cover.1711733054.git.akshata.jahagirdar@intel.com>
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
index fe0a45cb8..a5ee302c4 100644
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

