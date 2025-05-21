Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3DE6C54E92
	for <igt-dev@archiver.kernel.org>; Wed, 21 May 2025 11:51:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14E3711B23D;
	Wed, 21 May 2025 11:51:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V6CynQmB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD60C11B214
 for <igt-dev@lists.freedesktop.org>; Wed, 21 May 2025 11:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747828283; x=1779364283;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+IM76O0yZ6IHCuhcfT1Tsr2FXRLZ54jLIua1PfWqYng=;
 b=V6CynQmBt2R99zxDSBFl4ki+C8Id+1padf53kRx417Zm5HL1LLO6kmLB
 0VYf6LRuTV/REXu62aiFOZtJN3+ANIwjT0H7anyCNM7UbLalLGBSagTVF
 f0vyliHYoNBzElVAp25LwewpyEUad5VgHpXzYbxzGEklJMpCOSjRBu+9R
 qBXdUtl/YwRMp97B7tmKZHf0JZEVpX8rWt7RAZvDl1Mbq9mKP9yDKu4xi
 Mxab+EPEjGD4dz5tOA8TQtJS75TwxXl60EUDXhClLV9keeiMWICMoVIXr
 iulZkl3cAvn8yak24J1KWp53/VNJSOodJhhWSmym3MpfB0rSfJfMRQOOP A==;
X-CSE-ConnectionGUID: Dzvq1ES6SIu4sX6GA/CuQQ==
X-CSE-MsgGUID: EFDlbsGYQ8KbiqTRrxultA==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49675944"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="49675944"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 04:51:22 -0700
X-CSE-ConnectionGUID: +cQ77lx7SV2PsrbE98MFjA==
X-CSE-MsgGUID: qjgCqwDeQC+UgYemxVq1pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="140542987"
Received: from unknown (HELO naveena-Super-Server.iind.intel.com)
 ([10.190.238.67])
 by orviesa007.jf.intel.com with ESMTP; 21 May 2025 04:51:21 -0700
From: Kolanupaka Naveena <kolanupaka.naveena@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel/xe_mmap: Fix open/close calls
Date: Wed, 21 May 2025 17:39:14 +0530
Message-Id: <20250521120915.2855068-2-kolanupaka.naveena@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250521120915.2855068-1-kolanupaka.naveena@intel.com>
References: <20250521120915.2855068-1-kolanupaka.naveena@intel.com>
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

Instead of using the standard drm_open and close APIs for driver
open and close operations, use the appropriate drm_reopen and
drm_close APIs to ensure the driver is opened and closed correctly.

Also drop the srand() call as this is already taken care by igt-core.

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Kolanupaka Naveena <kolanupaka.naveena@intel.com>
---
 tests/intel/xe_mmap.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
index 5fd641075..47e31d5a1 100644
--- a/tests/intel/xe_mmap.c
+++ b/tests/intel/xe_mmap.c
@@ -430,15 +430,14 @@ igt_main
 		uint32_t *ptr;
 
 		igt_require(is_pci_membarrier_supported(fd));
-		xe = drm_open_driver(DRIVER_XE);
-		srand(time(0));
+		xe = drm_reopen_driver(fd);
 		i = rand() % (PAGE_SIZE / sizeof(*ptr));
 		igt_fork(child, 1)
 			test_pci_membarrier_parallel(xe, child, i);
 		test_pci_membarrier_parallel(fd, -1, i);
 		igt_waitchildren();
 
-		close(xe);
+		drm_close_driver(xe);
 	}
 
 	igt_subtest("pci-membarrier-bad-pagesize") {
-- 
2.34.1

