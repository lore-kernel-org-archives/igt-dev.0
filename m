Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8DC9C54756
	for <igt-dev@archiver.kernel.org>; Thu, 22 May 2025 08:32:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8753B10ED64;
	Thu, 22 May 2025 08:32:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bkrG7x1Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD8710ED99
 for <igt-dev@lists.freedesktop.org>; Thu, 22 May 2025 08:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747902722; x=1779438722;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=haJ0S8TM+lNuJaTzfYgqySHqKGG+tKvqWSI5CzFRubs=;
 b=bkrG7x1YAlVo4QWkWsGiG6uqN38e6c65TpyMqKjs5KhF1JxLUQP5w6ne
 i0+EZN02YDCucS1K0mtVUSh9GhXJlm1TAMyPR4Nw80JFsUxwE2r3wrTAj
 Vr7yHi8l33apDDtNdemlZ/hh/cundnug2GS0x4XQ1cxIUbaf0NaQeFgaa
 DJ3tXymNMECo3IrbRVS+OB4jZm1gmTkOj2fzpFyEr5N6ePjK9nkqu1sp2
 QB4ZCWse8Q12BjqSHewPuCpxgPJaKQNg4vXU0dS0MyEInHpoQT6Hp3wH7
 bmiMBcVA0HWQ4FZzdJeUnfNblS93SwXm2OjG4h/E2prPkS0wQ40ZYyXE0 w==;
X-CSE-ConnectionGUID: fOcCXnSIQv2StuhQQUMZ3g==
X-CSE-MsgGUID: 7oHe2h5yR3qnrbJjdVE7Fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="50054310"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="50054310"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 01:32:01 -0700
X-CSE-ConnectionGUID: Hh7CP4ZQT3SAg+BI780hzA==
X-CSE-MsgGUID: rFT0h3GBQpqVryLinXTWjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="141017845"
Received: from unknown (HELO naveena-Super-Server.iind.intel.com)
 ([10.190.238.67])
 by orviesa007.jf.intel.com with ESMTP; 22 May 2025 01:32:00 -0700
From: Kolanupaka Naveena <kolanupaka.naveena@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel/xe_mmap: Fix open/close calls
Date: Thu, 22 May 2025 14:19:53 +0530
Message-Id: <20250522084954.2861807-2-kolanupaka.naveena@intel.com>
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

Code used open()/close() APIs from standard C library to open and close
the driver respectively while it should be drm_open_driver() and
drm_close_driver(). As we already have fd opened, use more suitable
function which is drm_reopen_driver().

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

