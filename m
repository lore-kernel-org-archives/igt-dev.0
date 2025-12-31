Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A150CEEB575
	for <igt-dev@archiver.kernel.org>; Wed, 31 Dec 2025 23:22:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0C2310E9D0;
	Wed, 31 Dec 2025 23:22:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qn77TXi5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2398B10E2F3
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Dec 2025 23:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767223316; x=1798759316;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FW2PnzhoXqlW3L/6qawKcgTaKC7OiFvXfyAyXkU+sJU=;
 b=Qn77TXi5VpuA07hVfwUueOoAnwuiLKPK2CgyYff35GwED9Z900kIjQtE
 mgq/tRlf+6VkrGJueFLdjmXK0SauUsHPBFtK7wJbbXJDjwNDOtJYKIz4A
 gTrk+hwzyjXLntNXTyqq7vt2BD7b8/46wDgoEYw+OZ3r5soDhzJ0IzpsV
 cV+WFYpzFR0H7Txc/hRB1aMWJRRw4Or2kgXSj1Sx8Lw++h3opM/pCeO/X
 msCs4FI6x2MR6899MyLxY5W64VBNUJKBT8O7FfQijCSoBSFqdOTxgBMBC
 I3rNOVe9s8xoJOYklYVLBCgzIgR6WGFU4PAp7kdeMzSpxTmqyXxce/frT w==;
X-CSE-ConnectionGUID: 5Au4Bi1KQyCu81x5IXlghQ==
X-CSE-MsgGUID: 2LtG8dMuSAO0/H2o+SanaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="67792696"
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; d="scan'208";a="67792696"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2025 15:21:55 -0800
X-CSE-ConnectionGUID: 5P4kH4RWSdCHZiCUQEa4MQ==
X-CSE-MsgGUID: Idf7AHBDS1mkI5MqR97uGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; d="scan'208";a="206572333"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by orviesa005.jf.intel.com with ESMTP; 31 Dec 2025 15:21:55 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>,
	Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v11 2/5] include/linux_scaffold: add FIELD_GET() bitfield
 helper
Date: Wed, 31 Dec 2025 23:21:49 +0000
Message-ID: <20251231232152.127555-3-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251231232152.127555-1-x.wang@intel.com>
References: <20251231232152.127555-1-x.wang@intel.com>
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

Add __bf_shf() and FIELD_GET() so code can extract bitfields from
registers using a mask, matching the common Linux FIELD_GET()
semantics without pulling in kernel headers.

V2: (Matt Roper)
 - use the libc ffsll() helper instead of __builtin_ffsll()

CC: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 include/linux_scaffold.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux_scaffold.h b/include/linux_scaffold.h
index f6620ad0a..281aa5e73 100644
--- a/include/linux_scaffold.h
+++ b/include/linux_scaffold.h
@@ -4,6 +4,7 @@
 #define _INTEL_GPU_COMMANDS_SCAFFOLD_H_
 
 #include <stdint.h>
+#include <strings.h>
 
 typedef uint8_t  u8;
 typedef uint16_t u16;
@@ -51,4 +52,9 @@ static inline s64 sign_extend64(u64 value, int index)
 #define BITS_PER_LONG BITS_PER_TYPE(long)
 #define BITS_PER_LONG_LONG BITS_PER_TYPE(long long)
 
+#define __bf_shf(x) (ffsll(x) - 1)
+
+#define FIELD_GET(mask, reg) \
+	(typeof(mask))(((reg) & (mask)) >> __bf_shf(mask))
+
 #endif /* _INTEL_GPU_COMMANDS_SCAFFOLD_H_ */
-- 
2.43.0

