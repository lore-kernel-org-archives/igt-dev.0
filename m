Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C0EC04FFE
	for <igt-dev@archiver.kernel.org>; Wed, 17 Apr 2024 20:48:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A33A710E5ED;
	Wed, 17 Apr 2024 20:48:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GoUm8HJT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D19710E5ED
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Apr 2024 20:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713386933; x=1744922933;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lsIV+SE1khyiKSFQqhRgo4SlSTSwB6P1cJg5vPvUlO0=;
 b=GoUm8HJTU8ebNIlta9PZlRzqHHOVQocqX5DrLpVwaWSuFD0bAH6HxFPR
 m2SJMLk+EGVB4PYR2VMClZkHmMdqbLkzYoTY8AZwWSE0mSyw8OrdfBXXx
 o9w7tYllpl2/2p2VPIIuXKtMh7+l6U5DDdEihoVJlDiuCuTet2/ScXICw
 O/WQKzw+H8vbrXTbBF6H64K7e4CNPRTmCIE7gxJifFe2MNujjlz3rFD0J
 WzBYF+QzMzPYACAJF5x5bzK7+j/3Wx4QYCaZOnBu994mq+Nj3NlL2FLOS
 eMN3sxrjJqWd/zhzuwtlkSREkhjkHg3iMOiIBxAcXQ7ExiSI/75cC+qn7 w==;
X-CSE-ConnectionGUID: WQulMljTRXeFLevjhBDlpw==
X-CSE-MsgGUID: IMDWOidPTdyhkfJRquzY4A==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9071276"
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; 
   d="scan'208";a="9071276"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 13:48:52 -0700
X-CSE-ConnectionGUID: yhQNrM1pRxmCfUgstQZWUw==
X-CSE-MsgGUID: NXI9RYHaSKCmy4vp/XbhKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; d="scan'208";a="60173269"
Received: from saurabhg-nuc10i5fnh.jf.intel.com ([10.165.21.145])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 13:48:51 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH i-g-t v6 1/2] lib/intel_blt: Add helper function to ensure
 platform has flat-ccs enabled
Date: Thu, 18 Apr 2024 01:46:42 -0700
Message-Id: <b867cc0ffad688ec182cbfe8adfccbd8f8fc25b0.1713429755.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713429755.git.akshata.jahagirdar@intel.com>
References: <cover.1713429755.git.akshata.jahagirdar@intel.com>
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

