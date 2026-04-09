Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FBE2E9DE6F
	for <igt-dev@archiver.kernel.org>; Thu,  9 Apr 2026 09:09:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BE9D10E778;
	Thu,  9 Apr 2026 09:09:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DEl7xGNJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A09F010E778
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2026 09:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775725737; x=1807261737;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=q1JnYrRcH3n+B2HQJCbj/rigen9HQKfrOMs2ZRG3ofA=;
 b=DEl7xGNJ4DfvQiH6i8JFjYSv9YzFmAuunV+uhuNaUCj6fNa6Fn1TTndG
 cowW3UXfaawIk1EMVWrFwU0mM+uUZmyz/IbDdjSxUHudT6XGxpaCFTbGT
 K4gQ8+lNUNKtab2XF7q0Ocq/oGUHcHEEibt/oeJ5tgKDpHJx4jNCsns1g
 IzD4Qz/XQ7p6BgG7EJz1QEsSdPf7kjvFuoWXAfdCzs3DCXzBr1mOTNqMa
 aig9/Kmc+WpFAJTgovZ4fVRIcrWTr89GEvV9BzrvqB45OsghrlXh5S426
 fvf43rZcRtDwHjTe66i57vYNcDbosWt7m7oCD8AeMkBKRfWlJHunUCFu8 w==;
X-CSE-ConnectionGUID: y36MhFInSQKzNrUdcPiQHA==
X-CSE-MsgGUID: /TOqv8f/SwOJWfqS+owrsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="79314481"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="79314481"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 02:08:57 -0700
X-CSE-ConnectionGUID: cx5RLc8WSYy5kpnSJZ/amg==
X-CSE-MsgGUID: SDE3AvUhSSy76PxzN9IPFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="233693178"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 02:08:54 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH] tests/intel/perf_pmu: Ignore SLPC efficient freq during test
Date: Thu,  9 Apr 2026 14:37:51 +0530
Message-ID: <20260409090750.546999-2-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
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

Disable SLPC efficient frequency before pinning the GPU to min/max
frequency ranges. This ensures the driver-requested frequency stays
within the desired range during measurement.
Without this, SLPC may override the pinned frequency, causing the
test to report values outside the expected min/max bounds.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12549
Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/perf_pmu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
index 661ead32d..1e389958f 100644
--- a/tests/intel/perf_pmu.c
+++ b/tests/intel/perf_pmu.c
@@ -1521,6 +1521,8 @@ test_frequency(int gem_fd, unsigned int gt)
 	fd[0] = open_group(gem_fd, __I915_PMU_REQUESTED_FREQUENCY(gt), -1);
 	fd[1] = open_group(gem_fd, __I915_PMU_ACTUAL_FREQUENCY(gt), fd[0]);
 
+	igt_pm_ignore_slpc_efficient_freq(gem_fd, sysfs, true);
+
 	/*
 	 * Set GPU to min frequency and read PMU counters.
 	 */
@@ -1586,8 +1588,11 @@ test_frequency(int gem_fd, unsigned int gt)
 	igt_warn_on_f(read_value != min_freq,
 		      "Unable to restore min frequency to saved value [%u MHz], now %u MHz\n",
 		      min_freq, read_value);
+	igt_pm_ignore_slpc_efficient_freq(gem_fd, sysfs, false);
+
 	close(fd[0]);
 	close(fd[1]);
+	close(sysfs);
 	put_ahnd(ahnd);
 
 	igt_info("Min frequency: requested %.1f, actual %.1f\n",
-- 
2.43.0

