Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72314C83F17
	for <igt-dev@archiver.kernel.org>; Thu, 10 Jul 2025 19:00:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E609B10E949;
	Thu, 10 Jul 2025 19:00:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W0pp03zY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 369AE10E949
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Jul 2025 19:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752174032; x=1783710032;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oUrbHBCS5D6kDxxxYNtrHYnTpb4sHWC8nWJuzV7AStk=;
 b=W0pp03zYp35eNhja/bW15JKkY46ILmn5LQkxr8byQ1LT+BvwojmLZcYT
 8PLX33wchTrLXjrMBC/KVEjm5zfUcfCRYsVk2NxBZDnTZ5TkIftf4kZ68
 8BUkAPvXSGhOzcazWBncVyeMMhoFGQX1bW3snPV5b8NYzLPvwYeuUtbTR
 1o+gmMPjq3TsV7Ga68YhrbPY2UOTF7z5keyiOrljoHs7WBUXdyz4Vk8UV
 1oqB1I/EHE3bKy0LqdRdt2oK7BgKf3ljTzJdBPew0/9tTpfs2es//E1da
 EEJPc0RvYlpCjZR3NVoR2wVDPO65xae7B59WWgAMpSEQplzaXyOdpDS3v A==;
X-CSE-ConnectionGUID: wqSYn+h9RjmLeZK68eQh+A==
X-CSE-MsgGUID: P4aOb8u6QiyyjGVT3I41AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="53685846"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="53685846"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 12:00:30 -0700
X-CSE-ConnectionGUID: OLGC7upMTUSJk9pC3UFdkA==
X-CSE-MsgGUID: RUWh7O+TSFK93AX2XznDVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="179864968"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.100])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 12:00:29 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zlice555@gmail.com,
	Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 1/3] lib/igt_vc4: Fix musl libc compilation
Date: Thu, 10 Jul 2025 21:00:10 +0200
Message-ID: <20250710190017.167735-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.50.1
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

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_vc4.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/lib/igt_vc4.h b/lib/igt_vc4.h
index fe7173c50..165872ba2 100644
--- a/lib/igt_vc4.h
+++ b/lib/igt_vc4.h
@@ -31,7 +31,13 @@
 #include "igt_fb.h"
 #include "vc4_drm.h"
 
-#define PAGE_SIZE 4096
+#ifndef PAGE_SIZE
+# define PAGE_SIZE 4096
+#else
+# if PAGE_SIZE != 4096
+#  error "Unexpected PAGE_SIZE"
+# endif
+#endif
 
 uint32_t igt_vc4_get_cleared_bo(int fd, size_t size, uint32_t clearval);
 int igt_vc4_create_bo(int fd, size_t size);
-- 
2.50.1

