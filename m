Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CBAC2BA18
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 12:37:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88E2E10E162;
	Thu, 20 Jun 2024 12:37:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kDmvbeVJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9FDF10E95E
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 12:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718887051; x=1750423051;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OSBbo3dJnobga/PoIPvCGpncp5kOQ0PpORwm1YqD/og=;
 b=kDmvbeVJeGMGI+jYMz7vwaWl+l4IxaFhwO61FGXNVqkODZX9kCR70g+A
 zqw7adFOpb+g59boXvFQOXTT+RxV8dAIXHclWKl3OnSNtU1iy4BI3uG/4
 0Py4usQFZSE7QF8bvMpIGx8UNS789uMWHnYIMeMIQTzTRBXbTxdymkzC2
 zDDT8Vzqa6wmt5lwvU/u0unRT2dmanjT7Nbp9GXRYFWMMO6xSlfBKD+8w
 JBjDpWUFOWdNZ3U6kxA8rrf+pbgL6IaQAshJWycb+1dkvOACR+t9fc+Rl
 t6NUMWAMDKcTv6vBYZaOKThn6Hh85ZIEPlU/jsIgSyd8DRrSKpOPJ3KsG w==;
X-CSE-ConnectionGUID: 3n1coT4KToihroUpqfqSdw==
X-CSE-MsgGUID: SPWN++RDT2uU4t7BUZ5bEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15978388"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="15978388"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 05:37:30 -0700
X-CSE-ConnectionGUID: TRXx5aUORu+5oECZ1KC5sw==
X-CSE-MsgGUID: hWFq0td0RFyC/rUVRSGI9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="65480696"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.59])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 05:37:28 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinay.belgaumkar@intel.com, kamil.konieczny@linux.intel.com,
 riana.tauro@intel.com
Subject: [PATCH i-g-t] test/intel/xe_gt_freq: Remove act freq check from
 freq_low_max test
Date: Thu, 20 Jun 2024 18:24:37 +0530
Message-Id: <20240620125437.181215-1-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

First we check gt idle status and then check act freq. However, it’s
important to note that there may be a race condition where the gt
transitions to c6 before we complete the act freq check.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1045
Fixes: 1a1e668e774e ("tests/intel/xe_gt_freq: Fix freq_low_max test")
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 tests/intel/xe_gt_freq.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
index d2e4d1a09..b3562181d 100644
--- a/tests/intel/xe_gt_freq.c
+++ b/tests/intel/xe_gt_freq.c
@@ -277,9 +277,6 @@ static void test_freq_low_max(int fd, int gt_id)
 	rpe = get_freq(fd, gt_id, "rpe");
 
 	igt_assert(get_freq(fd, gt_id, "cur") == rpe);
-
-	if (!xe_is_gt_in_c6(fd, gt_id))
-		igt_assert(get_freq(fd, gt_id, "act") == rpe);
 }
 
 /**
-- 
2.34.1

