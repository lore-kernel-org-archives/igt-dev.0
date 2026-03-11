Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE05FD064C
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 07:34:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EBE710E35D;
	Wed, 11 Mar 2026 07:34:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YF0m9qCl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E0DE10E25D
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2026 07:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773214474; x=1804750474;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=f0a7MQVWvCsddqDqSStGt/Mief/BUwcGhfMI/s7NjEY=;
 b=YF0m9qClAH5bmqEgKHhpzOaxsOEXfpkE2Aobc3Q8odbWn/3daLygxTr6
 JivKPTY9H8XP3Xzw9gJKx3bxIUHXOYyuo6fmnmMbvM5lNXQWVsTBrGShF
 JTPP7qnTESXMCsOVHrCawPxbv1iA1aLsKTSZEF0KK0URMiGmAuz15gxta
 SJ7xhQlC4Zz2UdUrtY1oNxaGmym/76KYr8HfWStp8kEwTGJFnYr7w7MCs
 1GnBntg/J1mlfatPUf1kAfUPFJsyZ5QpqSZostxnRKy2VxjK8fzHTCCWo
 OgX5QMpixQKbDq1u0ZdxRJG2kaM+kDzTg3zVpwDmsUmw7QeSYjNMCZ4ni A==;
X-CSE-ConnectionGUID: iFaaRGOJRTGkmcI1KtJADQ==
X-CSE-MsgGUID: WuqpjeoKQPSCs0zNACIuUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="85362025"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="85362025"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 00:34:34 -0700
X-CSE-ConnectionGUID: uDzxoBfrSgmPOECi78+KdA==
X-CSE-MsgGUID: IgZJ+OBPSIWiPWMkkq2XWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="224547830"
Received: from himanshu-h97m-d3h.iind.intel.com ([10.223.55.10])
 by orviesa003.jf.intel.com with ESMTP; 11 Mar 2026 00:34:34 -0700
From: himanshu.girotra@intel.com
To: kamil.konieczny@intel.com, shekhar.chauhan@intel.com,
 igt-dev@lists.freedesktop.org
Subject: [PATCH v2 i-g-t 1/3] lib/pciids: sync with kernel commit be07d8f707e4
Date: Wed, 11 Mar 2026 13:04:28 +0530
Message-ID: <20260311073430.17421-2-himanshu.girotra@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260311073430.17421-1-himanshu.girotra@intel.com>
References: <20260311073430.17421-1-himanshu.girotra@intel.com>
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

