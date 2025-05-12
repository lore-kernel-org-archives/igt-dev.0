Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158BEC3ABBC
	for <igt-dev@archiver.kernel.org>; Mon, 12 May 2025 07:18:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AACC610E0C8;
	Mon, 12 May 2025 07:18:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="flcBwA5j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1CC410E15D
 for <igt-dev@lists.freedesktop.org>; Mon, 12 May 2025 07:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747034322; x=1778570322;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xQ5/8CVTVMrBo1JaiChFTZGQGVSPrAkRdwCTjN0/2B8=;
 b=flcBwA5jxFmVeCdUFSOYDM+ljvRzOCIZwHO7LsbH3kcMvjuWEZlP2gaw
 ZKJ5PvRxPNER0zM6OSLqEwa4n/NlAoMpd3nTUG8NYzaLSfrna8B/ZmBwt
 CBAd3EpMM6EuwOdT23Tlh/2CjxJfHfnljpDK/omDsFBGIoOZ8LpJOMVWL
 yCsBxhPeO+RDy9s3d+/BfVa0G5IgVuKmofUw06xeQHTyF+C0AtKRiSbbG
 aAsKWxF1QpF3eHe5JO61EZuYl0X8lKMYNJloneg4imDQZ4iMHkn5PeIBI
 oqF+0xBtW3IViM9gOg5XaJPhkHdbAsrdZXvS5rwXI+SowkHv4LB9u3zpp g==;
X-CSE-ConnectionGUID: Dyr2yfXfRqWiMlkv6WQ+YQ==
X-CSE-MsgGUID: dC/FAgpAQxOhEcVllz2sfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="74211907"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; d="scan'208";a="74211907"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 00:18:39 -0700
X-CSE-ConnectionGUID: SqUoTBVfQJiyyR2WcrvyFw==
X-CSE-MsgGUID: 4Niv2TYxRz6D8fdVSC0BmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; d="scan'208";a="137682726"
Received: from unknown (HELO naveena-Super-Server.iind.intel.com)
 ([10.190.238.67])
 by fmviesa008.fm.intel.com with ESMTP; 12 May 2025 00:18:38 -0700
From: Kolanupaka Naveena <kolanupaka.naveena@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kolanupaka Naveena <kolanupaka.naveena@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_mmap: Skip pci-membarrier-parallel test
 on PVC
Date: Mon, 12 May 2025 13:06:25 +0530
Message-Id: <20250512073625.2648634-1-kolanupaka.naveena@intel.com>
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

On xe, PVC RC6WAs are not there, hence the device is going to bad/sleep
state. We are not going bring those WAs on xe as they are PVC specific.

So, decided to skip this test for PVC platform to avoid the error during
the read.

Signed-off-by: Kolanupaka Naveena <kolanupaka.naveena@intel.com>
---
 tests/intel/xe_mmap.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
index 5fd641075..a4915b37d 100644
--- a/tests/intel/xe_mmap.c
+++ b/tests/intel/xe_mmap.c
@@ -429,6 +429,9 @@ igt_main
 		unsigned int i;
 		uint32_t *ptr;
 
+		if (IS_PONTEVECCHIO(intel_get_drm_devid(fd)))
+			igt_skip("Test is not supported on this platform.\n");
+
 		igt_require(is_pci_membarrier_supported(fd));
 		xe = drm_open_driver(DRIVER_XE);
 		srand(time(0));
-- 
2.34.1

