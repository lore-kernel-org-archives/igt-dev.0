Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA4F606A325
	for <igt-dev@archiver.kernel.org>; Thu, 19 Nov 2026 13:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Y1Sg2XGv
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43F3010E882;
	Thu, 19 Nov 2026 13:17:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6302E10E885
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Nov 2026 13:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795094186; x=1826630186;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mnrAIpw2dwAfqDByjdrY0lvVIaB2UdEWwUqYOacNbUo=;
 b=Y1Sg2XGvYenpUtJQ9X29HejLZrmLHNuuw5/OZzlGPzCHfxUovfj3MHCI
 PpwWuU3F5RXNEiNnNxOJvc+/LB2dywXWm9smUlnllImBKGGVLwMzs558B
 7zO9OfySHhqmtD5D8iHfxtS4NDbvXfx0jxjT9wA7+B1OFhFbAAjsI9KCE
 ghJTq7bcj0PziVvu8UER2w20xOq0uBsB9V8tNp24CCit3yZd597l0z14H
 48kHsnRnsI3tci2aJNejv6OY7zqdfR2TWMuE6fc3EJS+8hJi11yeyG5m7
 KUzO++D6Cz2Sz5DRo+j7RxDDTroKDWDq/g2C0D/jg3MNNKHD7CRvWzOJK g==;
X-CSE-ConnectionGUID: qbq+JklmQtiSkZNaj86y6g==
X-CSE-MsgGUID: hIDxVEADR8qaAFvwsDS2yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3989086"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3989086"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 05:15:58 -0800
X-CSE-ConnectionGUID: 2X0rYdKdQJKlj1z2NfO2Bg==
X-CSE-MsgGUID: kg7Oo5gyQOqLYdbQ6zFCyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="10321954"
Received: from dut2116bmgfrd.iind.intel.com ([10.223.34.13])
 by orviesa003.jf.intel.com with ESMTP; 19 Nov 2026 05:15:57 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@linux.intel.com
Subject: [PATCH] tests/intel/xe_exec_system_allocator: Limit driver debug logs
 in CI runs
Date: Thu, 19 Nov 2026 13:15:56 +0000
Message-ID: <20261119131556.199707-1-nishit.sharma@intel.com>
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

Call xe_drop_driver_debug_if_ci() from the test fixture so that, under
CI, DRM_UT_DRIVER is cleared from the DRM debug mask for the duration of
the test. The other debug categories are preserved and the original mask
is restored on exit.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index e3e8339c4..fb0c0af16 100644
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
+			unsigned int mask_to_set = DRM_UT_DRIVER;
+
+			close(dir);
+			if (debug_mask > 0 && (debug_mask & mask_to_set)) {
+				igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
+				update_debug_mask_if_ci(debug_mask & ~mask_to_set);
+			}
+		}
 	}
 
 	for (const struct section *s = sections; s->name; s++) {
-- 
2.43.0

