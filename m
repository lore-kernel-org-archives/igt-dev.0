Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B846EC3DA4A
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 05:06:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53E9010E99B;
	Fri, 16 May 2025 05:06:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PzInW+/B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DF3110E99B
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 05:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747372007; x=1778908007;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VO22GqLmDw3Y2uchPFA3sYq15mPC6TydHZe+Ei2uypo=;
 b=PzInW+/BuWRxAuhPdSB6m7PId+3jcxeprq/1QDdtn8G83Xe4AD2HGARr
 vjv8V8aapKrINPK0VmX0VeWiG2vXq/KGJLhpXp8kOcPdBhE7lTPtbXaeo
 4EUHnwB5DtpYdOl3kaa6x2AtVMiQIuaRbktGQiZmKKRS04GmZtNmghvKE
 cCLeMK28SkvWexlubxzvmCBd/pDy4PRGvmElF9gnBjHAvmPpFPi50DuXf
 MtiUYo0hI3H8ojuhv/VVF4kLngXqIaFMuY+XqRpTHpo78CCEAb+QncAKp
 rnZVLd7UkPXM7gLLTVC2YRm/j2dEpPXDQZTIzjFlcguortI8si6fh+IHl g==;
X-CSE-ConnectionGUID: XaDZof7LSGqxaAWe8TXblQ==
X-CSE-MsgGUID: PNDp0xRoTfeOdeFLJYDTvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49318368"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="49318368"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 22:06:39 -0700
X-CSE-ConnectionGUID: CA8n+MvFThOS9JvCeh5SPw==
X-CSE-MsgGUID: mOGByE2kTG2jYF6sVh95uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="143536459"
Received: from unknown (HELO naveena-Super-Server.iind.intel.com)
 ([10.190.238.67])
 by orviesa004.jf.intel.com with ESMTP; 15 May 2025 22:06:38 -0700
From: Kolanupaka Naveena <kolanupaka.naveena@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_mmap: Acquire rpm reference for
 pci-membarrier-paraller test
Date: Fri, 16 May 2025 10:54:29 +0530
Message-Id: <20250516052429.2780531-1-kolanupaka.naveena@intel.com>
X-Mailer: git-send-email 2.34.1
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
 tests/intel/xe_mmap.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
index 5fd641075..51c27586f 100644
--- a/tests/intel/xe_mmap.c
+++ b/tests/intel/xe_mmap.c
@@ -11,6 +11,8 @@
  * Functionality: mmap
  */
 
+#include <fcntl.h>
+
 #include "igt.h"
 
 #include "xe_drm.h"
@@ -428,16 +430,20 @@ igt_main
 		int xe;
 		unsigned int i;
 		uint32_t *ptr;
+		int fw_handle = -1;
 
 		igt_require(is_pci_membarrier_supported(fd));
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
 
-- 
2.34.1

