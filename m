Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90435606A326
	for <igt-dev@archiver.kernel.org>; Thu, 19 Nov 2026 14:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CB68PHr7
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E032E10E8A1;
	Thu, 19 Nov 2026 14:44:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DE5E10F010
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Nov 2026 14:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795099371; x=1826635371;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nRSkvSUs9twEvd+d0/wukEDYRX2lkpfZprN3vi2ENRo=;
 b=CB68PHr70UoyLTM+abE/zsxZxJPVa4Zj4F32qC2zP33/h3nzU20r/7zl
 EdQr4F1DYM9tkKOAJ/LTUIkpfYEW3XiGEeBNzAmPS99pXFKDdVDQ5P02l
 oNkbiviUCjQOwILcgXGAzgJxlqMHCfbz1L8dSsqAMdVrxcwD+ac+eDqr2
 JPqIInKdBOt+bAe9BiMeLNPmkOZ6Gw5Djvp7zae2e4s+6RGAqi+dFim3X
 BFOjg9UvdqfNGgVUpTuaOUgXBlBmjDWc+ZHpN3y6W/fAOBI8pjtNYwg/+
 TxN3aWsEDAzRwivvVMkWx596Ja1qc4l9mDWVGTXangSPAEyKEC4Nr+nLF g==;
X-CSE-ConnectionGUID: 5LtZPuxUTf2/6Ni01hTsgw==
X-CSE-MsgGUID: KU0wH6DXR7+a5xRnwucwkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3976989"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3976989"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 06:42:51 -0800
X-CSE-ConnectionGUID: nWDnytK5SBegXDJMjfKvQA==
X-CSE-MsgGUID: tIdH8JlkShyD2OYpLUSkLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="10580566"
Received: from dut2116bmgfrd.iind.intel.com ([10.223.34.13])
 by fmviesa003.fm.intel.com with ESMTP; 19 Nov 2026 06:42:49 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@linux.intel.com
Subject: [PATCH] tests/intel/xe_exec_system_allocator: Limit driver debug logs
 in CI runs
Date: Thu, 19 Nov 2026 14:42:48 +0000
Message-ID: <20261119144249.200617-1-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
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

The subtests involved migration generates a DRM_UT_DRIVER debug
message for each migrated chunk, exceeding the CI runner's log-size
limit on large-VRAM devices.

Call xe_drop_driver_debug_if_ci() from the test fixture. The other debug
categories are preserved and the original mask is restored on exit.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index e3e8339c4..55e06aa2a 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -17,6 +17,7 @@
 #include <time.h>
 
 #include "igt.h"
+#include "igt_sysfs.h"
 #include "intel_pat.h"
 #include "lib/igt_syncobj.h"
 #include "lib/intel_compute.h"
@@ -2668,6 +2669,7 @@ int igt_main()
 
 	igt_fixture() {
 		struct xe_device *xe;
+		int dir;
 
 		fd = drm_open_driver(DRIVER_XE);
 		igt_require(!xe_supports_faults(fd));
@@ -2689,6 +2691,18 @@ int igt_main()
 				  num_pat_entries);
 			num_pat_entries = 0;
 		}
+
+		dir = igt_sysfs_drm_module_params_open();
+		if (dir >= 0) {
+			int debug_mask = igt_drm_debug_mask_get(dir);
+			unsigned int bit_to_clear = DRM_UT_DRIVER;
+
+			close(dir);
+			if (debug_mask > 0 && (debug_mask & bit_to_clear)) {
+				igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
+				update_debug_mask_if_ci(debug_mask & ~bit_to_clear);
+			}
+		}
 	}
 
 	for (const struct section *s = sections; s->name; s++) {
-- 
2.43.0

