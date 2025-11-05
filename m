Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892F6CCFA0D
	for <igt-dev@archiver.kernel.org>; Wed,  5 Nov 2025 18:50:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27A1810E098;
	Wed,  5 Nov 2025 18:50:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W3pqyJkB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C3610E098
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Nov 2025 18:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762368631; x=1793904631;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hs6rN1/EaYLN5004zKOcPd8G61vdWGy3z7BLnqMjHLQ=;
 b=W3pqyJkBGhejK5F0OIsPxSTF/nW+GIAAkHgO6mf1yM3QVPtBg5rRPWY6
 3WgqmuCXp4uxJNCWuaUBkIwZVpcxql9PCsoGVTc7b8vMX0+bQP9ZRNsb8
 q+9ni8+iEPhdVEthyRXSpXGeFiRWQXpAFr3TwMxexO8XD1sTRabLqDxC8
 hsZOo81/uHx4mRn6A9IMcvJmDAQIBZ5t9wpaX7P3HHg+qhoKYbN6UzSXA
 H/0fj/PoQaeK+rWT8f1lMOF1XQf+tvgg/POBWh+4CfA5fBB+76Z3Y9NG5
 GUiWZzyXKew4K7Izsl3eW1ittMbM/O6yI+evRubCIdz/fwOyzyPCkg/p+ g==;
X-CSE-ConnectionGUID: ei633uYcSjyVO9GnAM6UTg==
X-CSE-MsgGUID: 1Yk0hjiiRZieeGTNUOX5hQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="75175142"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="75175142"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 10:50:30 -0800
X-CSE-ConnectionGUID: aPSiEB8YR92079uxq/GokQ==
X-CSE-MsgGUID: SO2FgeLhTamZWEnmvHjUBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="187482351"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.41])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 10:50:28 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t] lib/pciids: sync with kernel commit 5e0de2dfbc1b
Date: Wed,  5 Nov 2025 19:50:20 +0100
Message-ID: <20251105185020.261265-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.51.2
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

Synchronize PCI IDs with drm-next kernel commit
5e0de2dfbc1b ("drm/xe/cri: Add CRI platform definition")

This adds CRI (Crescent Island) to known PCI IDs.

Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Cc: Shekhar Chauhan <shekhar.chauhan@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/pciids.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/pciids.h b/lib/pciids.h
index 9f095a99d..6e53fb4cd 100644
--- a/lib/pciids.h
+++ b/lib/pciids.h
@@ -893,4 +893,8 @@
 	MACRO__(0xD744, ## __VA_ARGS__), \
 	MACRO__(0xD745, ## __VA_ARGS__)
 
+/* CRI */
+#define INTEL_CRI_IDS(MACRO__, ...) \
+	MACRO__(0x674C, ## __VA_ARGS__)
+
 #endif /* __PCIIDS_H__ */
-- 
2.51.2

