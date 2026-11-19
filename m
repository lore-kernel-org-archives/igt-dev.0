Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C221F606A325
	for <igt-dev@archiver.kernel.org>; Thu, 19 Nov 2026 09:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B/RWDRbq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A41112228;
	Thu, 19 Nov 2026 09:56:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF077112235
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Nov 2026 09:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795082018; x=1826618018;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=IsqbVCF8S3XaEUdaqjufKHiIvx0gJggHpGqbkmOqnFE=;
 b=B/RWDRbq9/by9k0kkNLX08J1jc7JDHo+GXJp5svwBF6qz6joukeFHt2/
 vZ3csG3zFzaBIVZ2NP9jaY9J1JevVs0WaiuD7IWCwmzeKBD3CwVDd7LI5
 vOMXiVEhVysPrifB7ZdSZUUaZAmTPDTDRayjSXkIOwRMbN61gYe5v/V31
 sQU/64zBSCqAwqJ6uQwjA8smQR88NAEaVuusLiITpfptuYG88SRUDhCAr
 0wMyWO549Dna9ZLoHwAvhl26xJ2PuhzBhM+2xrh/BChfP04DDCgTUOKz2
 XqUPxH4pv73WuKJUIUJxvsZSWLOJOBXpfh051e1CK2F7ZFiSsw6YdrpOn Q==;
X-CSE-ConnectionGUID: BcxPwb3bT9KncS8+EeDZFg==
X-CSE-MsgGUID: BYVld8adRH+jbPBUEp9xKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3929153"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3929153"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 01:53:38 -0800
X-CSE-ConnectionGUID: wy4AKnKPTQGgwfhC9O1ZCA==
X-CSE-MsgGUID: rrJErBw6Tfm/bsJK8FLTfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10478300"
Received: from dut2116bmgfrd.iind.intel.com ([10.223.34.13])
 by orviesa001.jf.intel.com with ESMTP; 19 Nov 2026 01:53:37 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@linux.intel.com
Subject: [PATCH v1 2/2] tests/intel/xe_exec_system_allocator: Limit driver
 debug logs in CI
Date: Thu, 19 Nov 2026 09:53:33 +0000
Message-ID: <20261119095333.182110-3-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119095333.182110-1-nishit.sharma@intel.com>
References: <20261119095333.182110-1-nishit.sharma@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Nishit Sharma <nishit.sharma@intel.com>

The eviction and migration subtests can generate a DRM_UT_DRIVER debug
message for each migrated 8 MiB or bigger chunk, exceeding the CI
runner's log-size limit on large-VRAM devices.

Call xe_drop_driver_debug_if_ci() from the test fixture so that, under
CI, DRM_UT_DRIVER is cleared from the DRM debug mask for the duration of
the test. The other debug categories are preserved and the original mask
is restored on exit.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index e3e8339c4..da939c37d 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -26,6 +26,7 @@
 #include "xe/xe_gt.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
+#include "xe/xe_util.h"
 #include <string.h>
 
 #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
@@ -2689,6 +2690,8 @@ int igt_main()
 				  num_pat_entries);
 			num_pat_entries = 0;
 		}
+
+		xe_drop_driver_debug_if_ci();
 	}
 
 	for (const struct section *s = sections; s->name; s++) {
-- 
2.43.0

