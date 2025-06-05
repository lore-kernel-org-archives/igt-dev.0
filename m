Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 348F0C5AE59
	for <igt-dev@archiver.kernel.org>; Thu,  5 Jun 2025 20:11:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D888810EA41;
	Thu,  5 Jun 2025 20:11:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="esaeMqTH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23EBB10EA3F
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Jun 2025 20:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749154265; x=1780690265;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/RoJzoBrD/DGeJoAUSqBn/zzIqzkVJZWCvywtljucNI=;
 b=esaeMqTH6g57ScaDVmtFtA/UwqFtd2M0xqByu5NAYlTnEGOdb9kOgH4/
 70XGiVnqTOZv5Sk0av8+GExe0sFPUNhQsuZPAw2DKspMIhrr7qeOaA6DK
 G5+poNGCVXHdOitT8bxyWk6fp28MwYWsGgFYdOOaf45SwvEG0GxV8nY6w
 i8g9OBJchF5CU921IaGSSTLn9fixvhgXZDijk9KzFr5wYKtJoBiWg9MkI
 ICjQhftHPbSEUBSdINSF4x81P/t1gz3LCx010cQvCMQoe5l/wxhVr208o
 CgQHU0jr0nyzP+NkAb8mnOrIW2/AV71hoNlG2vskO+f1U/VY18bwoWpQW w==;
X-CSE-ConnectionGUID: FYP8PlVKSxGKY1DVbl8ldg==
X-CSE-MsgGUID: 2xiAMujnQAiUT7Ruf+hkAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="51437428"
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; d="scan'208";a="51437428"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 13:11:05 -0700
X-CSE-ConnectionGUID: qt1qrOU1T2+Tbade2KsvWA==
X-CSE-MsgGUID: Qeves5lASZmQsNBH5Or8IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; d="scan'208";a="146582937"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 13:11:03 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com,
	Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t, v9,
 1/3] tests/intel/pm_rc6_residency: Ensure that SLPC is enabled for
 test rc6-idle
Date: Fri,  6 Jun 2025 01:41:23 +0530
Message-ID: <20250605201121.700118-6-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605201121.700118-5-sk.anirban@intel.com>
References: <20250605201121.700118-5-sk.anirban@intel.com>
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
 tests/intel/i915_pm_rc6_residency.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel/i915_pm_rc6_residency.c b/tests/intel/i915_pm_rc6_residency.c
index d3fa95423..be176a593 100644
--- a/tests/intel/i915_pm_rc6_residency.c
+++ b/tests/intel/i915_pm_rc6_residency.c
@@ -617,6 +617,10 @@ igt_main
 
 		igt_require_gem(i915);
 		gem_quiescent_gpu(i915);
+		igt_require_f(gem_using_guc_submission(i915) &&
+			      i915_is_slpc_enabled(i915),
+			      "This test can only be conducted if SLPC is enabled\n");
+		const struct intel_execution_engine2 *e;
 
 		s_dirfd = igt_sysfs_gt_open(i915, 0);
 		stash_min = get_freq(s_dirfd, RPS_MIN_FREQ_MHZ);
-- 
2.43.0

