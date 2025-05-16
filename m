Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD85FC3ABD8
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 15:37:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8987810EB00;
	Fri, 16 May 2025 15:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DN/5BN47";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E622210EAFE
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 15:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747409864; x=1778945864;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/6p+slWFLvHIDPJFE6ZIRyeYdzF6u5IwCCLKE+oDVFE=;
 b=DN/5BN47pUWYLPE28D7zho0uYPNCXjrt46VT0YOel3Pjj5glk9d/tPh4
 afkt9o8DLKSqAgESlNajo0OUls7W2EeAfNbbcFK7Asd7OqMDu3TELuvVv
 fLXim08z7TB874NvzXx7rVqPAJ/CwyC/9w4ZeXEH/NE6vXPruBVtbgL0r
 eRRLB/CT6BOp8E4bo9x/bsSOf9oQSbmtZ4PLHulStBfvpGKqc7Hza/CBd
 zOHqq+dEVTy4+DXEfL500BCA28egT48js7gvwX/1Glfu5ilgBgTc+F0zG
 9+xaih++0GWy9KVwoOWxA4QCzXZ3DXBCxJ0ARGa+M7yDPQ+9Rv0yuW8gt g==;
X-CSE-ConnectionGUID: 1a8bPcjaTZSMCdH/EaPnwA==
X-CSE-MsgGUID: S+6V2Z9+TbGAei1Z8s28aA==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49542229"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="49542229"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 08:37:44 -0700
X-CSE-ConnectionGUID: 7+34stPNTZ28Ynu3WU6S5g==
X-CSE-MsgGUID: xYIRxrnBRzmP2h2idZRTqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="142726597"
Received: from unknown (HELO naveena-Super-Server.iind.intel.com)
 ([10.190.238.67])
 by fmviesa003.fm.intel.com with ESMTP; 16 May 2025 08:37:42 -0700
From: Kolanupaka Naveena <kolanupaka.naveena@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel/xe_mmap: Acquire rpm reference for
 pci-membarrier tests
Date: Fri, 16 May 2025 21:25:32 +0530
Message-Id: <20250516155533.2786246-2-kolanupaka.naveena@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250516155533.2786246-1-kolanupaka.naveena@intel.com>
References: <20250516155533.2786246-1-kolanupaka.naveena@intel.com>
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

During the test, the device is entering into runtime suspend, which is
leading the device to d3hot or d3cold mode. Hence the read is giving
a special value 0xffffffff.

To avoid this issue acquired an rpm ref to keep the device awake
during the access.

Also created a sub-group for all the pci-membarrier tests to avoid the
multiple open/close calls to rpm ref.

Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Kolanupaka Naveena <kolanupaka.naveena@intel.com>
---
 tests/intel/xe_mmap.c | 64 +++++++++++++++++++++++++------------------
 1 file changed, 37 insertions(+), 27 deletions(-)

diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
index 5fd641075..9421b8503 100644
--- a/tests/intel/xe_mmap.c
+++ b/tests/intel/xe_mmap.c
@@ -11,6 +11,8 @@
  * Functionality: mmap
  */
 
+#include <fcntl.h>
+
 #include "igt.h"
 
 #include "xe_drm.h"
@@ -419,31 +421,43 @@ igt_main
 		test_mmap(fd, vram_memory(fd, 0) | system_memory(fd),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
-	igt_subtest("pci-membarrier") {
-		igt_require(is_pci_membarrier_supported(fd));
-		test_pci_membarrier(fd);
-	}
+	igt_subtest_group {
+		int fw_handle = -1;
 
-	igt_subtest("pci-membarrier-parallel") {
-		int xe;
-		unsigned int i;
-		uint32_t *ptr;
-
-		igt_require(is_pci_membarrier_supported(fd));
-		xe = drm_open_driver(DRIVER_XE);
-		srand(time(0));
-		i = rand() % (PAGE_SIZE / sizeof(*ptr));
-		igt_fork(child, 1)
-			test_pci_membarrier_parallel(xe, child, i);
-		test_pci_membarrier_parallel(fd, -1, i);
-		igt_waitchildren();
-
-		close(xe);
-	}
+		igt_fixture {
+			igt_require(is_pci_membarrier_supported(fd));
+			fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
+			igt_assert_lte(0, fw_handle);
+		}
+
+		igt_subtest("pci-membarrier")
+			test_pci_membarrier(fd);
+
+		igt_subtest("pci-membarrier-parallel") {
+			int xe;
+			unsigned int i;
+			uint32_t *ptr;
+
+			xe = drm_open_driver(DRIVER_XE);
+			srand(time(0));
+			i = rand() % (PAGE_SIZE / sizeof(*ptr));
+			igt_fork(child, 1)
+				test_pci_membarrier_parallel(xe, child, i);
+			test_pci_membarrier_parallel(fd, -1, i);
+			igt_waitchildren();
 
-	igt_subtest("pci-membarrier-bad-pagesize") {
-		igt_require(is_pci_membarrier_supported(fd));
-		test_bad_pagesize_for_pcimem(fd);
+			close(xe);
+		}
+
+		igt_subtest("pci-membarrier-bad-pagesize")
+			test_bad_pagesize_for_pcimem(fd);
+
+		igt_subtest("pci-membarrier-bad-object")
+			test_bad_object_for_pcimem(fd);
+
+		igt_fixture {
+			close(fw_handle);
+		}
 	}
 
 	igt_subtest("bad-flags")
@@ -455,10 +469,6 @@ igt_main
 	igt_subtest("bad-object")
 		test_bad_object(fd);
 
-	igt_subtest("pci-membarrier-bad-object") {
-		igt_require(is_pci_membarrier_supported(fd));
-		test_bad_object_for_pcimem(fd);
-	}
 
 	igt_subtest("small-bar") {
 		igt_require(xe_visible_vram_size(fd, 0));
-- 
2.34.1

