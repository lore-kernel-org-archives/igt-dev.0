Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA7CC3ABD8
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 10:34:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AC3F10EA44;
	Fri, 16 May 2025 10:34:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JN/C9V//";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A862810EA44
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 10:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747391642; x=1778927642;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VO22GqLmDw3Y2uchPFA3sYq15mPC6TydHZe+Ei2uypo=;
 b=JN/C9V//urGPo1a0gJcRAmPJRSzAfbLIz3Cva71Yq/UhV2uyU7Yuuw+P
 WoYOLbSyJDaE/kSdSNIornl963mMokM2yG19iqieq70mAQI/Dhq3V0iMI
 ZZ0arvyUKz0LZu8f9f833j2/H/2g2ZUOASPmWTd0xZEQbID+LCauzVRMG
 n42OVVWuBoOVSrTCSkWUMJWZO7CP2FlVQ0DmP58IrsKPWsL6ErUbClJRy
 O4LZic/3fiU5v4gUImy2WJnhcl3V7/gD670pviYdcUw3kCEnqb/ItVaKz
 ve37bN0RwBoO6kj6fbvBFfYh7d/yJCcpfMf0I4AujQeHG7noXKXQmmMvA w==;
X-CSE-ConnectionGUID: nAf1vQj4RqqKa9TcZ1usVA==
X-CSE-MsgGUID: no5RpRMKTyCwyYXDvsmT5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60697268"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="60697268"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 03:34:02 -0700
X-CSE-ConnectionGUID: 45wVhJumS8CsPHL/QTQBlg==
X-CSE-MsgGUID: 31+4nLtASHeFO8kwuoFcEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="139539076"
Received: from unknown (HELO naveena-Super-Server.iind.intel.com)
 ([10.190.238.67])
 by orviesa008.jf.intel.com with ESMTP; 16 May 2025 03:34:01 -0700
From: Kolanupaka Naveena <kolanupaka.naveena@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel/xe_mmap: Acquire rpm reference for
 pci-membarrier-paraller test
Date: Fri, 16 May 2025 16:21:48 +0530
Message-Id: <20250516105149.2783072-2-kolanupaka.naveena@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250516105149.2783072-1-kolanupaka.naveena@intel.com>
References: <20250516105149.2783072-1-kolanupaka.naveena@intel.com>
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

