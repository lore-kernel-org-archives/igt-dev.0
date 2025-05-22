Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C842C54E65
	for <igt-dev@archiver.kernel.org>; Thu, 22 May 2025 08:32:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0096F10ED99;
	Thu, 22 May 2025 08:32:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QuDzxGvp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E8610ED64
 for <igt-dev@lists.freedesktop.org>; Thu, 22 May 2025 08:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747902723; x=1779438723;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+Uee82hZkh43wwpvNv+56ojdM2GIIxv84KrKKXWGJ+E=;
 b=QuDzxGvpiwAXG83Gs/XTfiv70qpPtEx/7GNng4K5HdAY8ph/GujMcHTc
 OWCDfU1R2FSQB1DOj6yqHWXNSZ6gCYKZeDhsHRMLH6XUgg74y8pfapJoA
 OfOGXnw23HntiJ5hLozDgQEK3r2YVe6Z7sbU20By/jn4+Up7cZLM+sH6h
 IgXs/Kl/5/Vpmx7T8rZ7Ax/Vj2fTT4KBk+2xHzlt1HxiqAUd3w4BwTabp
 2KmghPyMEwvT9CmwFOZoMP4xcCgkQ4Hw0Y4fcLNew7Z8OzfjvjFQdynh7
 W9LG/PrPxu3gaXZ2RAa9ZgArLTGo8sYO5ixMe4WM+iJN8LmQTFIIa199H Q==;
X-CSE-ConnectionGUID: FmYzIUksRyOx6vebFXte/Q==
X-CSE-MsgGUID: TRyVxUqLSOWId08WTIRwxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="50054312"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="50054312"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 01:32:03 -0700
X-CSE-ConnectionGUID: RE+EgMtZQqOPV78i41HyAQ==
X-CSE-MsgGUID: RjtLkl4CQn6+rxQOmsMBvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="141017855"
Received: from unknown (HELO naveena-Super-Server.iind.intel.com)
 ([10.190.238.67])
 by orviesa007.jf.intel.com with ESMTP; 22 May 2025 01:32:01 -0700
From: Kolanupaka Naveena <kolanupaka.naveena@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/xe_mmap: Acquire rpm reference for
 pci-membarrier tests
Date: Thu, 22 May 2025 14:19:54 +0530
Message-Id: <20250522084954.2861807-3-kolanupaka.naveena@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250522084954.2861807-1-kolanupaka.naveena@intel.com>
References: <20250522084954.2861807-1-kolanupaka.naveena@intel.com>
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

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4784
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Kolanupaka Naveena <kolanupaka.naveena@intel.com>
---
 tests/intel/xe_mmap.c | 68 ++++++++++++++++++++++++++++---------------
 1 file changed, 44 insertions(+), 24 deletions(-)

diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
index 47e31d5a1..117a3ab85 100644
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
@@ -419,30 +431,42 @@ igt_main
 		test_mmap(fd, vram_memory(fd, 0) | system_memory(fd),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
-	igt_subtest("pci-membarrier") {
-		igt_require(is_pci_membarrier_supported(fd));
-		test_pci_membarrier(fd);
-	}
+	igt_subtest_group {
+		int fw_handle = -1;
+
+		igt_subtest("pci-membarrier") {
+			prepare_pci_membarrier_test(fd, &fw_handle);
+			test_pci_membarrier(fd);
+		}
 
-	igt_subtest("pci-membarrier-parallel") {
-		int xe;
-		unsigned int i;
-		uint32_t *ptr;
+		igt_subtest("pci-membarrier-parallel") {
+			int xe;
+			unsigned int i;
+			uint32_t *ptr;
 
-		igt_require(is_pci_membarrier_supported(fd));
-		xe = drm_reopen_driver(fd);
-		i = rand() % (PAGE_SIZE / sizeof(*ptr));
-		igt_fork(child, 1)
-			test_pci_membarrier_parallel(xe, child, i);
-		test_pci_membarrier_parallel(fd, -1, i);
-		igt_waitchildren();
+			xe = drm_reopen_driver(fd);
+			i = rand() % (PAGE_SIZE / sizeof(*ptr));
+			prepare_pci_membarrier_test(fd, &fw_handle);
+			igt_fork(child, 1)
+				test_pci_membarrier_parallel(xe, child, i);
+			test_pci_membarrier_parallel(fd, -1, i);
+			igt_waitchildren();
 
-		drm_close_driver(xe);
-	}
+			drm_close_driver(xe);
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
@@ -454,10 +478,6 @@ igt_main
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

