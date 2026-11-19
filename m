Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352BD606A320
	for <igt-dev@archiver.kernel.org>; Thu, 19 Nov 2026 10:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TUw5DR2L
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C16A6112284;
	Thu, 19 Nov 2026 10:49:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54AEF112284
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Nov 2026 10:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795085293; x=1826621293;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6tua4WtqDpGULUuQ6UbVNihOe4XYoJqYOiUR1/O0+DM=;
 b=TUw5DR2LcYkVFVC3E9oFHdkIdjJNLC0qH52TBwHSk19Ln6eR5L5MzCCL
 jPEVKehcTksIGUIhq4NJVHOLodQg5pCZS502wcft3LhMdiJcNamUgpNmh
 m8H8gc2JTmwjnye4IBLQSyj/duLOPFhIKECqGxuuGMG0sOZ7mvFU2bgs9
 PROxzzRJmdPC33GgmK4OW2YJGgzmjsHXK4sTpDQbisjMX9+gRMK0Rltrd
 4LEifx9nFKLX1G2lc6k9CHc6+ow7uurJkLD0NOnT80FfmiNTJ6cso8eU9
 ZdmL52j1E7ljU/u2wrimAETqmh+Oa7CZigkt28xrWcKHXyZAayHISZu0p w==;
X-CSE-ConnectionGUID: 6p14v/+1TNmxXbF1oGm11g==
X-CSE-MsgGUID: RNBRwXJTRQ6Z0pMV+1JwiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3812205"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3812205"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 02:48:13 -0800
X-CSE-ConnectionGUID: KFtIjsclQreP+i9trGLmnQ==
X-CSE-MsgGUID: PTOp1+2iSyCXI2Knuibrzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; d="scan'208";a="10959658"
Received: from dut2116bmgfrd.iind.intel.com ([10.223.34.13])
 by fmviesa010.fm.intel.com with ESMTP; 19 Nov 2026 02:48:12 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@linux.intel.com
Subject: [PATCH] tests/intel/xe_exec_system_allocator: suppress driver debug
 logs in CI
Date: Thu, 19 Nov 2026 10:48:11 +0000
Message-ID: <20261119104811.190039-1-nishit.sharma@intel.com>
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

migration subtests can generate a DRM_UT_DRIVER debug
message for each migrated chunk, exceeding the CI runner's log-size limit
on large-VRAM devices.

Call xe_drop_driver_debug_if_ci() from the test fixture so that, under
CI, DRM_UT_DRIVER is cleared from the DRM debug mask for the duration of
the test. The other debug categories are preserved and the original mask
is restored on exit.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index da939c37d..c927229f7 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -17,6 +17,7 @@
 #include <time.h>
 
 #include "igt.h"
+#include "igt_sysfs.h"
 #include "intel_pat.h"
 #include "lib/igt_syncobj.h"
 #include "lib/intel_compute.h"
@@ -2669,6 +2670,8 @@ int igt_main()
 
 	igt_fixture() {
 		struct xe_device *xe;
+		int dir;
+		unsigned int mask_to_set;
 
 		fd = drm_open_driver(DRIVER_XE);
 		igt_require(!xe_supports_faults(fd));
@@ -2691,7 +2694,17 @@ int igt_main()
 			num_pat_entries = 0;
 		}
 
-		xe_drop_driver_debug_if_ci();
+		dir = igt_sysfs_drm_module_params_open();
+		if (dir >= 0) {
+			int debug_mask = igt_drm_debug_mask_get(dir);
+
+			close(dir);
+			mask_to_set = DRM_UT_DRIVER;
+			if (debug_mask > 0 && (debug_mask & mask_to_set)) {
+				igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
+				update_debug_mask_if_ci(debug_mask & ~mask_to_set);
+			}
+		}
 	}
 
 	for (const struct section *s = sections; s->name; s++) {
-- 
2.43.0

