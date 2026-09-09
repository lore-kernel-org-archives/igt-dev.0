Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C24C79FB7
	for <igt-dev@archiver.kernel.org>; Wed,  9 Sep 2026 16:04:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36EB310F1F8;
	Wed,  9 Sep 2026 16:04:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nd6P3ovv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 563FA10EECB
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Sep 2026 05:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788933162; x=1820469162;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qIwPcXRYg4eEWCOUcFX6kz+fLUbCEK6b7GtzRifGf6Y=;
 b=Nd6P3ovvlEc7n11pqwyjpTsjVMYaCjLOm+IYbgSLx7eWoTBcOMliJLtW
 Z5JbgcMwvZIaoaI5bv4SxCT0BWhL5d4W+nn85jG8xqOEOdqYTXaSrK/Zv
 lvQzoR3o3fJfYnI/GGNZMmuW149NQU6RpFk4VYQ3BVH2d1NCB7+VsehhT
 n7rJ1/AnmrF/em4RSOaelaEwgLzbmIB+wZUajyV3/rTZ7dFM1KYn4vng3
 aDEOWLh9fINRZMYHC04gJA01hFu6LrkxL+xOotzl/G57vpxntPHCzcYz8
 KXXBy3DJ/7NvYus1jwWSbaaUhDK8MwyO6A/MHm/oMEc1gquUynkbZXiyt g==;
X-CSE-ConnectionGUID: Jhi9ppIeShCiKO9req5Qfw==
X-CSE-MsgGUID: LXcRUKeYSdKQnaKwrekIDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89552734"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="89552734"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 22:52:41 -0700
X-CSE-ConnectionGUID: kwpy6B6zRuKA74bzx4Z0HA==
X-CSE-MsgGUID: xr73GEK5TaiZrkJCNWRUiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="301094190"
Received: from unknown (HELO localhost.iind.intel.com) ([10.49.15.168])
 by orviesa002.jf.intel.com with ESMTP; 08 Sep 2026 22:52:39 -0700
From: krishnaveni.palanisamy@intel.com
To: igt-dev@lists.freedesktop.org
Cc: sk.anirban@intel.com, kamil.konieczny@intel.com, riana.tauro@intel.com,
 anshuman.gupta@intel.com,
 Krishnaveni Palanisamy <krishnaveni.palanisamy@intel.com>
Subject: [PATCH] tests/intel/perf_pmu: Fix double free of drpc in test_rc6
Date: Wed,  9 Sep 2026 11:22:36 +0530
Message-ID: <20260909055236.52492-1-krishnaveni.palanisamy@intel.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 09 Sep 2026 16:03:42 +0000
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

From: Krishnaveni Palanisamy <krishnaveni.palanisamy@intel.com>

test_rc6() frees the 'drpc' buffer returned by igt_sysfs_get() at the
end of each phase (initial wakeup, post-S3, post-idle) but leaves the
pointer dangling. If a subsequent phase is skipped or returns early,
the same pointer could be freed again, resulting in a
"double free detected in tcache" abort from glibc when the test exits.

Set drpc to NULL after each free() so the pointer cannot be reused
accidentally.

Signed-off-by: Krishnaveni Palanisamy <krishnaveni.palanisamy@intel.com>
---
 tests/intel/perf_pmu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
index 1e389958f..f48e1af57 100644
--- a/tests/intel/perf_pmu.c
+++ b/tests/intel/perf_pmu.c
@@ -1766,6 +1766,7 @@ test_rc6(int gem_fd, unsigned int gt, unsigned int num_gt, unsigned int flags)
 					    ts[1] - ts[0],
 					    tolerance, drpc);
 		free(drpc);
+		drpc=NULL;
 	}
 
 	if (flags & TEST_S3) {
@@ -1806,6 +1807,7 @@ test_rc6(int gem_fd, unsigned int gt, unsigned int num_gt, unsigned int flags)
 					    ts[1] - ts[0],
 					    tolerance, drpc);
 		free(drpc);
+		drpc=NULL;
 	}
 
 	/* Wake up device and check no RC6. */
@@ -1847,6 +1849,7 @@ test_rc6(int gem_fd, unsigned int gt, unsigned int num_gt, unsigned int flags)
 						    ts[1] - ts[0],
 						    tolerance, drpc);
 		free(drpc);
+		drpc=NULL;
 	}
 }
 
-- 
2.53.0

