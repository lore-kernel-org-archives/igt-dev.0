Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95089C5B555
	for <igt-dev@archiver.kernel.org>; Thu,  5 Jun 2025 20:20:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 125A610E316;
	Thu,  5 Jun 2025 20:20:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jsHwIK5o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 136F410E316
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Jun 2025 20:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749154821; x=1780690821;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V7Tekk2Kc3xEQLHWu0KYQBPyXZ5kj3rKeAF81NrtS0I=;
 b=jsHwIK5oTw9XGNGgyObp2FNH2EGmKBhilNxfRa6Gz5Y7XQqJpwByrlDD
 J/St1ArbFqxpmRmsTu6yHAeIsKu5fSaNJiXFIFJv+1sedFLeqsJOgbyUa
 7egDf0IfAH8GSsnDPrOXbwC8Utgj9IVAG916ob+ZDNtTqPMcQaYBeZv/x
 YgQjLegIMkiyd9xHmAUoRNTVff4Wtqq4tqETEtfo+hO8QBZt97hPNVdfq
 ANqOwShAs5R6Q5G9lgHNdcjI24U5CYsHmKlJ98sf2g0xhqxfjoFatOvQS
 1+NqmQIaR6thMCpg/hzhnn/Eqjaga5A5l45TZoHl4kyQdMnM/8+oINu57 Q==;
X-CSE-ConnectionGUID: 8MRMkjQ8TKecUW0WY2Brkg==
X-CSE-MsgGUID: 1Wr0sUbjRvy+FK8xHbgyQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="51388633"
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; d="scan'208";a="51388633"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 13:20:19 -0700
X-CSE-ConnectionGUID: 5zmQ206vSsuFSOYbo15ESQ==
X-CSE-MsgGUID: TCTqwbS4SpmiYXHuauhtSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; d="scan'208";a="150490616"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 13:20:18 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com,
	Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t, v9,
 1/3] tests/intel/pm_rc6_residency: Ensure that SLPC is enabled for
 test rc6-idle
Date: Fri,  6 Jun 2025 01:50:26 +0530
Message-ID: <20250605202024.709332-6-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605202024.709332-5-sk.anirban@intel.com>
References: <20250605202024.709332-5-sk.anirban@intel.com>
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

The test currently utilizes sysfs to adjust the RPS minimum frequency
to RP0 in order to reach peak frequency. Therefore, skip the test on
older platforms where SLPC is not enabled.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/i915_pm_rc6_residency.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel/i915_pm_rc6_residency.c b/tests/intel/i915_pm_rc6_residency.c
index d3fa95423..337f63e34 100644
--- a/tests/intel/i915_pm_rc6_residency.c
+++ b/tests/intel/i915_pm_rc6_residency.c
@@ -617,6 +617,9 @@ igt_main
 
 		igt_require_gem(i915);
 		gem_quiescent_gpu(i915);
+		igt_require_f(gem_using_guc_submission(i915) &&
+			      i915_is_slpc_enabled(i915),
+			      "This test can only be conducted if SLPC is enabled\n");
 
 		s_dirfd = igt_sysfs_gt_open(i915, 0);
 		stash_min = get_freq(s_dirfd, RPS_MIN_FREQ_MHZ);
-- 
2.43.0

