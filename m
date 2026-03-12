Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B65B1067058
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 16:03:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDC6D10EA5D;
	Thu, 12 Mar 2026 16:03:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZiQGe8Q8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28BEC10EA5B
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 16:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773331414; x=1804867414;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=f0a7MQVWvCsddqDqSStGt/Mief/BUwcGhfMI/s7NjEY=;
 b=ZiQGe8Q8qB9qPdldX2AzuMfNxOSj9T8mkDVXZqRJpWLppkCVjJOlh561
 3S/iEwRH5K+lTzS3JuBhshgEVNLUlE4YkF8fbgwzPqL+rIQ56444Oqyil
 78VgRiovJgNjWNvMEA1Lb4hBDDv5rp3YbdIm1/mD4mHA9K0rTeJjpi5L5
 1jwrmJeyEuWj714ANzLKHnYdEwIwH5vr/so5vvpidf6ESmyvMnuuVKL+Z
 Pg5202ni4Q2mtL/4Ezsc5l2tZZFdQmqryg181Msg+OsikILJl9LROGG8A
 rXrWPUKQn/ZvdTNx+qaMKmWME56liJKxJe+5VL3R2apcAXFW1jshJNfGQ Q==;
X-CSE-ConnectionGUID: BCcB2NtaSyC1TcJFCRZqJA==
X-CSE-MsgGUID: QgfvVUS2TfaQelBBrYNIkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="77037685"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="77037685"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 09:03:34 -0700
X-CSE-ConnectionGUID: QnTs2YtaS9+W4uB9fghX3Q==
X-CSE-MsgGUID: GVKAgaYETLOR59dydkpiew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="225839033"
Received: from himanshu-h97m-d3h.iind.intel.com ([10.223.55.10])
 by orviesa005.jf.intel.com with ESMTP; 12 Mar 2026 09:03:32 -0700
From: himanshu.girotra@intel.com
To: ramadevi.gandi@intel.com, nishit.sharma@intel.com,
 aditya.chauhan@intel.com, kamil.konieczny@intel.com,
 shekhar.chauhan@intel.com, zbigniew.kempczynski@intel.com,
 igt-dev@lists.freedesktop.org
Subject: [PATCH v3 i-g-t 1/4] lib/pciids: sync with kernel commit be07d8f707e4
Date: Thu, 12 Mar 2026 21:33:25 +0530
Message-ID: <20260312160328.9462-2-himanshu.girotra@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260312160328.9462-1-himanshu.girotra@intel.com>
References: <20260312160328.9462-1-himanshu.girotra@intel.com>
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

From: Himanshu Girotra <himanshu.girotra@intel.com>

Synchronize PCI IDs with drm-next kernel up to be07d8f707e4,
which includes the following changes:

commit be07d8f707e4 ("drm/xe/nvlp: Add NVL-P platform definition")
commit 32620e176443 ("drm/pcids: Split PTL pciids group to make wcl subplatform")
commit aaecfadc22cc ("drm/intel/bmg: Allow device ID usage with single-argument macros")

Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/pciids.h | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/lib/pciids.h b/lib/pciids.h
index 6e53fb4cd..33b91cb2e 100644
--- a/lib/pciids.h
+++ b/lib/pciids.h
@@ -861,7 +861,7 @@
 	MACRO__(0xE216, ## __VA_ARGS__)
 
 #define INTEL_BMG_IDS(MACRO__, ...) \
-	INTEL_BMG_G21_IDS(MACRO__, __VA_ARGS__), \
+	INTEL_BMG_G21_IDS(MACRO__, ## __VA_ARGS__), \
 	MACRO__(0xE220, ## __VA_ARGS__), \
 	MACRO__(0xE221, ## __VA_ARGS__), \
 	MACRO__(0xE222, ## __VA_ARGS__), \
@@ -880,7 +880,10 @@
 	MACRO__(0xB08F, ## __VA_ARGS__), \
 	MACRO__(0xB090, ## __VA_ARGS__), \
 	MACRO__(0xB0A0, ## __VA_ARGS__), \
-	MACRO__(0xB0B0, ## __VA_ARGS__), \
+	MACRO__(0xB0B0, ## __VA_ARGS__)
+
+/* WCL */
+#define INTEL_WCL_IDS(MACRO__, ...) \
 	MACRO__(0xFD80, ## __VA_ARGS__), \
 	MACRO__(0xFD81, ## __VA_ARGS__)
 
@@ -897,4 +900,16 @@
 #define INTEL_CRI_IDS(MACRO__, ...) \
 	MACRO__(0x674C, ## __VA_ARGS__)
 
+/* NVL-P */
+#define INTEL_NVLP_IDS(MACRO__, ...) \
+	MACRO__(0xD750, ## __VA_ARGS__), \
+	MACRO__(0xD751, ## __VA_ARGS__), \
+	MACRO__(0xD752, ## __VA_ARGS__), \
+	MACRO__(0xD753, ## __VA_ARGS__), \
+	MACRO__(0XD754, ## __VA_ARGS__), \
+	MACRO__(0XD755, ## __VA_ARGS__), \
+	MACRO__(0XD756, ## __VA_ARGS__), \
+	MACRO__(0XD757, ## __VA_ARGS__), \
+	MACRO__(0xD75F, ## __VA_ARGS__)
+
 #endif /* __PCIIDS_H__ */
-- 
2.50.1

