Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E877FCAC59A
	for <igt-dev@archiver.kernel.org>; Mon, 15 Sep 2025 10:40:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE7910E443;
	Mon, 15 Sep 2025 10:40:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JqQReOLe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3346B10E443
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Sep 2025 10:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757932812; x=1789468812;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3dEN6bAbrzoo2nJdPrYYCjF5pExIY549yPSHFVtjBsU=;
 b=JqQReOLefeYzS257wClhXW2sNW/+mEjaFZ4h8YrU/bOb14KdiSQWu0K7
 ckR9SUi4CUDhQqWFSA2gf9ocDNSsHa5RP++9x+RBAMaT2PXbyL0RBbQFU
 qWeOBDJgq7HAnqEKvjBft2efzt0zL7+38E97v5WiOiAhlFTOPzXIEzV3q
 tftstNyc99BKHYNILT2qrB3MXzvycQXpTgTZDeplu8T/eCJnrhfyiD09T
 3mpvLQkXQAYKXy5miqYJzj1r+tptbYl13qkBY3jEMoUCZ6ZWd0m5m6CRh
 ORb0WzDUifa5qwPuqsY20mkcbEt+8yW9hdHWoinLJwhrP+sAgWJDZJ+kB A==;
X-CSE-ConnectionGUID: 5Br90oM7TXK83StDjbr+hg==
X-CSE-MsgGUID: bDQ5BzTBRMGxr7tUMPjNsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="60051216"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="60051216"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 03:40:11 -0700
X-CSE-ConnectionGUID: 1peBjZ9KRdGM4CFB73eADg==
X-CSE-MsgGUID: KaRFHOcjRrmaUgDSaE+KLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208";a="173881609"
Received: from pgurram-desk.iind.intel.com ([10.190.238.70])
 by orviesa010.jf.intel.com with ESMTP; 15 Sep 2025 03:40:10 -0700
From: pravalika.gurram@intel.com
To: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 himal.prasad.ghimiray@intel.com
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH v6 2/2] intel-ci: Blocklist compression PAT index for LNL
Date: Mon, 15 Sep 2025 16:20:57 +0530
Message-Id: <20250915105057.1468276-3-pravalika.gurram@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250915105057.1468276-1-pravalika.gurram@intel.com>
References: <20250915105057.1468276-1-pravalika.gurram@intel.com>
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

From: Pravalika Gurram <pravalika.gurram@intel.com>

Madvise does not support compression on LNL.
Therefore, compression-related PAT index
test cases have been blocklisted for this platform.

Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
---
 tests/intel-ci/xe.lnl.core.blocklist.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/intel-ci/xe.lnl.core.blocklist.txt b/tests/intel-ci/xe.lnl.core.blocklist.txt
index 1e69170d8..3a21d7263 100644
--- a/tests/intel-ci/xe.lnl.core.blocklist.txt
+++ b/tests/intel-ci/xe.lnl.core.blocklist.txt
@@ -83,3 +83,9 @@ igt@xe_live_ktest@xe_eudebug
 igt@xe_oa@oa-tlb-invalidate
 igt@xe_oa@unprivileged-single-ctx-counters
 ##################################################################
+# Expected fail as per the current behaviour compression
+# for madvise needs to skipped on LNL
+##################################################################
+igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-.*
+igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-.*
+##################################################################
-- 
2.34.1

