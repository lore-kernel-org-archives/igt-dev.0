Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8BDC2D0CD
	for <igt-dev@archiver.kernel.org>; Wed, 21 May 2025 12:06:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5B0B10EA0B;
	Wed, 21 May 2025 12:06:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h2Jdjg2j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE5C210FA6D
 for <igt-dev@lists.freedesktop.org>; Wed, 21 May 2025 12:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747829175; x=1779365175;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=haJ0S8TM+lNuJaTzfYgqySHqKGG+tKvqWSI5CzFRubs=;
 b=h2Jdjg2jFFkEOD1JXnP06dsoN7BofxfQ7NRpapudwgVi9bR+jERNslhs
 b1xmUMaWdY8dLeqMy7O0oCoJkLNfhvxHBqZMUoOp+hwVEhiedRHHb6cQd
 0Kjfu+jyE/0lAdHAg3sYv8HB2PNncO4zf29Tu1N49KRstwvvOsZJengVw
 daCALIkdg6FR/x9AxU5nKNEBbsW9Frw29fpHFfZGGVU0AhtmcRL4djzsA
 SVrSXJ3v91Zcj8hrTKyCRnDry6rUXkXyi5m+TKDrVhVABfGJSAgt0VDcd
 ZTDwygXQuEMGRC5oP0uBiZmTuXZklT55qLhnjnzF1bRPQr9s5DYvCUCFS Q==;
X-CSE-ConnectionGUID: ZW1fIMnoTRuhnj3zoUCdeQ==
X-CSE-MsgGUID: 6rIaBP5TRrWiqBs0aeFC1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49678046"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="49678046"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 05:06:15 -0700
X-CSE-ConnectionGUID: X98k7K9aR1Coon2yxz8vEw==
X-CSE-MsgGUID: i2Zq4s8LQtqykjyyCAQs3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="140553266"
Received: from unknown (HELO naveena-Super-Server.iind.intel.com)
 ([10.190.238.67])
 by orviesa007.jf.intel.com with ESMTP; 21 May 2025 05:06:14 -0700
From: Kolanupaka Naveena <kolanupaka.naveena@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel/xe_mmap: Fix open/close calls
Date: Wed, 21 May 2025 17:54:06 +0530
Message-Id: <20250521122407.2855326-2-kolanupaka.naveena@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250521122407.2855326-1-kolanupaka.naveena@intel.com>
References: <20250521122407.2855326-1-kolanupaka.naveena@intel.com>
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

