Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50031C54E65
	for <igt-dev@archiver.kernel.org>; Wed, 21 May 2025 10:23:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 034F010E870;
	Wed, 21 May 2025 10:23:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U1aOmJxh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F4610E86D
 for <igt-dev@lists.freedesktop.org>; Wed, 21 May 2025 10:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747823011; x=1779359011;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n+Ypqw2ky5SMto/bo5F1FlZ0/4ON5xuhuGmgewPmYpY=;
 b=U1aOmJxh1Iw2/BSapt+IBVdm5TYrsvr0KnqMmlcgu8q8J/VhrejcdhiD
 7SeZtpy+DXGEn3jNyaKI/kX2tK5xCb5prjkokiA1tRA/jw76WP+w7U4pE
 oU+lJscbkn9fXvVuWqaerqgo2gfLoorB/fZl1Dfdk1wakmnIxSzVQdHkO
 LLHvARnATGF/ZVdRnm7J1UAp11EDnrs9Laa+IE0gPk5DCpY9MIKNoWWeW
 YfWAEsuDkbvkOtgwQM6B8hg2EqZv4NUgI37G2SVLVJYFdOIVPqYkO9gwm
 7rJ1JH5afGCZW5zze6ErIsxvhCJoktduWrajqTrWWBrJ3ARt9UeOvn9Pt w==;
X-CSE-ConnectionGUID: b2BxAw4uRbatYDMT32mpRw==
X-CSE-MsgGUID: rjLA5tqHRfGX515EWq9sGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="60837660"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="60837660"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 03:23:31 -0700
X-CSE-ConnectionGUID: LVsGUxEvTp+w63G3M1iOnQ==
X-CSE-MsgGUID: BKkydzYmSHGliqxapSPWqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="139868133"
Received: from unknown (HELO naveena-Super-Server.iind.intel.com)
 ([10.190.238.67])
 by orviesa006.jf.intel.com with ESMTP; 21 May 2025 03:23:29 -0700
From: Kolanupaka Naveena <kolanupaka.naveena@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel/xe_mmap: Acquire rpm reference for
 pci-membarrier tests
Date: Wed, 21 May 2025 16:11:21 +0530
Message-Id: <20250521104122.2853986-2-kolanupaka.naveena@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250521104122.2853986-1-kolanupaka.naveena@intel.com>
References: <20250521104122.2853986-1-kolanupaka.naveena@intel.com>
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

Also created a sub-group for all the pci-membarrier tests.

Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Kolanupaka Naveena <kolanupaka.naveena@intel.com>
---
 tests/intel/xe_mmap.c | 74 +++++++++++++++++++++++++++----------------
 1 file changed, 47 insertions(+), 27 deletions(-)

diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
index 5fd641075..aa76df507 100644
--- a/tests/intel/xe_mmap.c
+++ b/tests/intel/xe_mmap.c
@@ -11,6 +11,8 @@
  * Functionality: mmap
  */
 
+#include <fcntl.h>
+
 #include "igt.h"
 
 #include "xe_drm.h"
@@ -401,6 +403,16 @@ static bool is_pci_membarrier_supported(int fd)
 	return (igt_ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo) == 0);
 }
 
+static void prepare_pci_membarrier_test(int fd, int *fw_ptr)
+{
+	if (*fw_ptr > 0)
+		return;
+
+	igt_require(is_pci_membarrier_supported(fd));
+	*fw_ptr = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
+	igt_assert_lte(0, *fw_ptr);
+}
+
 igt_main
 {
 	int fd;
@@ -419,31 +431,43 @@ igt_main
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
+		igt_subtest("pci-membarrier") {
+			prepare_pci_membarrier_test(fd, &fw_handle);
+			test_pci_membarrier(fd);
+		}
+
+		igt_subtest("pci-membarrier-parallel") {
+			int xe;
+			unsigned int i;
+			uint32_t *ptr;
+
+			xe = drm_open_driver(DRIVER_XE);
+			srand(time(0));
+			i = rand() % (PAGE_SIZE / sizeof(*ptr));
+			prepare_pci_membarrier_test(fd, &fw_handle);
+			igt_fork(child, 1)
+				test_pci_membarrier_parallel(xe, child, i);
+			test_pci_membarrier_parallel(fd, -1, i);
+			igt_waitchildren();
+
+			close(xe);
+		}
+
+		igt_subtest("pci-membarrier-bad-pagesize") {
+			prepare_pci_membarrier_test(fd, &fw_handle);
+			test_bad_pagesize_for_pcimem(fd);
+		}
+
+		igt_subtest("pci-membarrier-bad-object") {
+			prepare_pci_membarrier_test(fd, &fw_handle);
+			test_bad_object_for_pcimem(fd);
+		}
 
-	igt_subtest("pci-membarrier-bad-pagesize") {
-		igt_require(is_pci_membarrier_supported(fd));
-		test_bad_pagesize_for_pcimem(fd);
+		igt_fixture
+			close(fw_handle);
 	}
 
 	igt_subtest("bad-flags")
@@ -455,10 +479,6 @@ igt_main
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

