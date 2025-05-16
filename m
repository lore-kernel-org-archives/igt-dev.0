Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9404DC3ABC9
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 13:40:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42BB610EABF;
	Fri, 16 May 2025 13:40:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lA7V/oDT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD8210EAC0
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 13:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747402831; x=1778938831;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4XHNEAylDNR5ZIeA7ydhyk5wNu9DG+abyDzL+zCZTrA=;
 b=lA7V/oDTRLdUrjLBUZWmbP6oHhXNzaWQg8jbZMzJrTKulZqEr6Jqm5YS
 JtedGrsLsLYvRlMzEsqr5KS/9NcYjpa9UPOCpUjpCx9o50ZxE4/Ycv9S+
 h8U2/1qr7RGmz9BBiwqni4pBFCNTd6sJ8QrJ+FVpltJ0gha1NBDiiMFV2
 DOsQvbqux5WziCl6aUOtkIyCIeL6SdyUiTo7OWf+odY1JkAGwi2dcGYXq
 h5/yZwLhSDs+Sr3J+Vc6jU3W6UhqXctke11oMDwajYi4+aKPbLk88gGR0
 z/K5IT4QwqBcxwuA9RiEmZ01X5FPgwYQc/KFD+l8sFBQjhmGrU8riGBQ9 g==;
X-CSE-ConnectionGUID: DWsCsZwpSGOJe1+tLWvYvA==
X-CSE-MsgGUID: 73es1GWYS8yJJbsyL5qk1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="53190689"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="53190689"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 06:40:31 -0700
X-CSE-ConnectionGUID: PwqLqm/dRk23ZtXfzmFP7Q==
X-CSE-MsgGUID: iFZAknUfTQm2cwnXzenhPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="175825568"
Received: from unknown (HELO naveena-Super-Server.iind.intel.com)
 ([10.190.238.67])
 by orviesa001.jf.intel.com with ESMTP; 16 May 2025 06:40:29 -0700
From: Kolanupaka Naveena <kolanupaka.naveena@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel/xe_mmap: Acquire rpm reference for
 pci-membarrier tests
Date: Fri, 16 May 2025 19:28:18 +0530
Message-Id: <20250516135819.2784676-2-kolanupaka.naveena@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250516135819.2784676-1-kolanupaka.naveena@intel.com>
References: <20250516135819.2784676-1-kolanupaka.naveena@intel.com>
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

Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Kolanupaka Naveena <kolanupaka.naveena@intel.com>
---
 tests/intel/xe_mmap.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
index 5fd641075..061b3de0a 100644
--- a/tests/intel/xe_mmap.c
+++ b/tests/intel/xe_mmap.c
@@ -11,6 +11,8 @@
  * Functionality: mmap
  */
 
+#include <fcntl.h>
+
 #include "igt.h"
 
 #include "xe_drm.h"
@@ -404,6 +406,7 @@ static bool is_pci_membarrier_supported(int fd)
 igt_main
 {
 	int fd;
+	int fw_handle = -1;
 
 	igt_fixture
 		fd = drm_open_driver(DRIVER_XE);
@@ -421,7 +424,10 @@ igt_main
 
 	igt_subtest("pci-membarrier") {
 		igt_require(is_pci_membarrier_supported(fd));
+		fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
+		igt_assert_lte(0, fw_handle);
 		test_pci_membarrier(fd);
+		close(fw_handle);
 	}
 
 	igt_subtest("pci-membarrier-parallel") {
@@ -433,17 +439,23 @@ igt_main
 		xe = drm_open_driver(DRIVER_XE);
 		srand(time(0));
 		i = rand() % (PAGE_SIZE / sizeof(*ptr));
+		fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
+		igt_assert_lte(0, fw_handle);
 		igt_fork(child, 1)
 			test_pci_membarrier_parallel(xe, child, i);
 		test_pci_membarrier_parallel(fd, -1, i);
 		igt_waitchildren();
 
+		close(fw_handle);
 		close(xe);
 	}
 
 	igt_subtest("pci-membarrier-bad-pagesize") {
 		igt_require(is_pci_membarrier_supported(fd));
+		fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
+		igt_assert_lte(0, fw_handle);
 		test_bad_pagesize_for_pcimem(fd);
+		close(fw_handle);
 	}
 
 	igt_subtest("bad-flags")
@@ -457,7 +469,10 @@ igt_main
 
 	igt_subtest("pci-membarrier-bad-object") {
 		igt_require(is_pci_membarrier_supported(fd));
+		fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
+		igt_assert_lte(0, fw_handle);
 		test_bad_object_for_pcimem(fd);
+		close(fw_handle);
 	}
 
 	igt_subtest("small-bar") {
-- 
2.34.1

