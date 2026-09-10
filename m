Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE3AC79FB9
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 08:24:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4FF810F375;
	Thu, 10 Sep 2026 08:24:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cMu6uPBy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E180110F374
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 08:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789028646; x=1820564646;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N6M7yECzp+jo92FjQKsTb03wYIj3J+ZL3RmAgQVq5rQ=;
 b=cMu6uPByvQK/Z72sErPE7UsAlhq3qy6Gw8dZ6ESg7SnlRB/wQpAzI8yt
 QxjYY/z/mJqcpgVi950rTgxcLCZRSvb7qHOCRP8OcNiJj/bnKsMqHMFmD
 h0+oTa+9pQIVd4r9iiLmCRoExcrnlXJmrmPkp/BM6mvPi7Xjmhum4aCGl
 JyoLrspenI4gnyQm3nT3CAegoYoLUcSNTOau+Y5HX0QPye1ul1b3s1buV
 NHLkx0S2tAqwM0ndtyGBwUaKMNI3AFZWtytGRURlv54SIG+Lik3n3Zs1E
 Wo9qE5/WK41zbWqy0dkY3kce13IudSwgvNB2Oh31H2H0XPW3U2ww09+L1 g==;
X-CSE-ConnectionGUID: 7z/Ek2FCSYS5c/fGzmINFQ==
X-CSE-MsgGUID: /8U3b6QNT0Wic3C0WdPnzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89345034"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89345034"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 01:24:03 -0700
X-CSE-ConnectionGUID: +c1EZt5aSSeq3cglncTiTA==
X-CSE-MsgGUID: /IX/Aw8LR42WXsL6fw46wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="271074225"
Received: from unknown (HELO localhost.iind.intel.com) ([10.49.15.168])
 by orviesa008.jf.intel.com with ESMTP; 10 Sep 2026 01:24:02 -0700
From: krishnaveni.palanisamy@intel.com
To: igt-dev@lists.freedesktop.org
Cc: sk.anirban@intel.com, kamil.konieczny@intel.com, riana.tauro@intel.com,
 anshuman.gupta@intel.com,
 Krishnaveni Palanisamy <krishnaveni.palanisamy@intel.com>
Subject: [PATCH v2] tests/intel/perf_pmu: Fix double free of drpc in test_rc6
Date: Thu, 10 Sep 2026 13:53:57 +0530
Message-ID: <20260910082358.8661-1-krishnaveni.palanisamy@intel.com>
X-Mailer: git-send-email 2.53.0
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

From: Krishnaveni Palanisamy <krishnaveni.palanisamy@intel.com>

test_rc6() frees the 'drpc' buffer returned by igt_sysfs_get() at the
end of each phase (initial wakeup, post-S3, post-idle) but leaves the
pointer dangling. If a subsequent phase is skipped or returns early,
the same pointer could be freed again, resulting in a
"double free detected in tcache" abort from glibc when the test exits.

Set drpc to NULL after each free() so the pointer cannot be reused
accidentally.

v2: fixed the indentation (Anirban)

Signed-off-by: Krishnaveni Palanisamy <krishnaveni.palanisamy@intel.com>
Reviewed-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/perf_pmu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
index 1e389958f..4dc13d6dd 100644
--- a/tests/intel/perf_pmu.c
+++ b/tests/intel/perf_pmu.c
@@ -1766,6 +1766,7 @@ test_rc6(int gem_fd, unsigned int gt, unsigned int num_gt, unsigned int flags)
 					    ts[1] - ts[0],
 					    tolerance, drpc);
 		free(drpc);
+		drpc = NULL;
 	}
 
 	if (flags & TEST_S3) {
@@ -1806,6 +1807,7 @@ test_rc6(int gem_fd, unsigned int gt, unsigned int num_gt, unsigned int flags)
 					    ts[1] - ts[0],
 					    tolerance, drpc);
 		free(drpc);
+		drpc = NULL;
 	}
 
 	/* Wake up device and check no RC6. */
@@ -1847,6 +1849,7 @@ test_rc6(int gem_fd, unsigned int gt, unsigned int num_gt, unsigned int flags)
 						    ts[1] - ts[0],
 						    tolerance, drpc);
 		free(drpc);
+		drpc = NULL;
 	}
 }
 
-- 
2.53.0

