Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94514C83F1A
	for <igt-dev@archiver.kernel.org>; Mon, 21 Jul 2025 15:59:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F5A610E2BF;
	Mon, 21 Jul 2025 15:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EZHJKCPY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83FA210E2BC
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Jul 2025 15:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753113547; x=1784649547;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oTFVfrWlCu/bKLEvXytjLeCcuee/ec6AjyTEuHV06GQ=;
 b=EZHJKCPYlEMjPIByVDK7yOhxSkOIbvSE3Ah997D40U8ZW9XZIJQ67JcS
 pp3vsUXrAd7or0Aw2zKKrEK3XqOC888Gme8p+6GMJJAN0ZxB1ttWIeJNA
 DhA+z/5hti/Qyy8ZVhBvelQr9x4vDz4ze/zEYDUsE5RdqBwu9xvktg414
 sn9+S0TYgDgYcsUr0vptJZY46gTT35FRWe6d+1OhkvB63tTr6h66aiGY/
 2y0kQgkVc3r6sdMWiLV4W/ylVYzv3cISK1nCWeTKS8atf5d+7FSsHQtl3
 8M1uW/aPaPW/4fIhn8hbM73fwk48JK6tQsPQq6S5FZ4QWkEVijX3D6foR w==;
X-CSE-ConnectionGUID: n/JiLxpJS12OuP/8i5lQew==
X-CSE-MsgGUID: LxrwCbt9R6iswj3uIaIH4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="65597020"
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; d="scan'208";a="65597020"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 08:59:05 -0700
X-CSE-ConnectionGUID: 7CPs4wwpQsK1hbGCneTyfg==
X-CSE-MsgGUID: eS0fW6vSRY6cN032Aj8IjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; d="scan'208";a="162924362"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.55])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 08:58:45 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Zack Rusin <zack.rusin@broadcom.com>,
 Maaz Mombasawala <maaz.mombasawala@broadcom.com>,
 Martin Krastev <martin.krastev@broadcom.com>, zlice <zlice555@gmail.com>
Subject: [PATCH i-g-t v2 1/2] lib/svga/vm_basic_types: fix musl libs
 compilation on Void Linux
Date: Mon, 21 Jul 2025 17:58:23 +0200
Message-ID: <20250721155824.112474-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250721155824.112474-1-kamil.konieczny@linux.intel.com>
References: <20250721155824.112474-1-kamil.konieczny@linux.intel.com>
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

Fix gcc compilation on Void Linux with musl C libs, where
PAGE_SIZE is already defined.

v2: added more devs to Cc, updated subject (Kamil)

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Zack Rusin <zack.rusin@broadcom.com>
Cc: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Cc: Martin Krastev <martin.krastev@broadcom.com>
Reported-by: zlice <zlice555@gmail.com>
Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/179
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/svga/vm_basic_types.h | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/lib/svga/vm_basic_types.h b/lib/svga/vm_basic_types.h
index 8fec5b665..ea10a683c 100644
--- a/lib/svga/vm_basic_types.h
+++ b/lib/svga/vm_basic_types.h
@@ -27,7 +27,15 @@
 #define VM_BASIC_TYPES_H
 
 #define PAGE_SHIFT 12
-#define PAGE_SIZE (1 << PAGE_SHIFT)
+
+#ifndef PAGE_SIZE
+# define PAGE_SIZE (1 << PAGE_SHIFT)
+#else
+# if PAGE_SIZE != 4096
+#  error "Unexpected PAGE_SIZE"
+# endif
+#endif
+
 #define PAGE_MASK (~(PAGE_SIZE - 1))
 #define PAGE_ALIGN(addr) (((addr) + PAGE_SIZE - 1) & PAGE_MASK)
 
-- 
2.50.1

