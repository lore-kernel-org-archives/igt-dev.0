Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB03D3940D
	for <igt-dev@archiver.kernel.org>; Thu,  2 Apr 2026 11:04:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACCF110E3D1;
	Thu,  2 Apr 2026 11:04:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GM1KEC7+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8154610E3D1
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Apr 2026 11:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775127882; x=1806663882;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZKpqACJM5vZh1NzeWCmgA5vBv8WAaZ0hS8GHUd2Lh3g=;
 b=GM1KEC7+MlOfLgj0Ps8ZeP1F8ovBJdmdwG7RovPQlzlB3WisBw1H5NLO
 d1zq6EXC5g6AnnfuDnruQGDLYNRu37X5w1R1duJgNCjPHFcBRYOVu2QkB
 xjFxX1d6/y2XiQ1PyPb1qg+PuCTqqr4KDK3ZATxLSnZ0KRJ1ib2ypM7+Z
 f4fiRl/cNi1GUeaWdjrsemN7bf/mfS/UMe680Woxqp20BWfxccGbWmHLw
 a5sI+tx89Yf4u5E4p6oP+qfswmfrENPjWaYePMalMcHjy/6kpqYspMIB9
 Y05Kb/dtjOwQOPvSXOUPNyZvfY0d/+1TzslqY5gWuzgoQivt45TNfDIGB A==;
X-CSE-ConnectionGUID: EwDBLsXzTiCR8GCxf6/NQw==
X-CSE-MsgGUID: PS/DMeC7RWa1CEPU6VnPPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="86884847"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="86884847"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 04:04:42 -0700
X-CSE-ConnectionGUID: Hz0cGcXVRheERWn265ENIw==
X-CSE-MsgGUID: sw0/q5SZRDOlK4dhuzTitw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; d="scan'208";a="264884573"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.200])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 04:04:40 -0700
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t] tests/intel/gem_exec_endless: Use the per-gt interface
 to set frequencies
Date: Thu,  2 Apr 2026 13:04:12 +0200
Message-ID: <20260402110411.6367-2-krzysztof.niemiec@intel.com>
X-Mailer: git-send-email 2.45.2
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

The test alters the environment, specifically the gt frequencies, for
its duration. Using the legacy interface, however, makes it impossible for
the pre-test state to be restored due to its limitations in multi-gt
systems. Use the per-gt interface instead to properly set the values and
clean up.

Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 tests/intel/gem_exec_endless.c | 38 ++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/tests/intel/gem_exec_endless.c b/tests/intel/gem_exec_endless.c
index 7f35e985c..9f41d812e 100644
--- a/tests/intel/gem_exec_endless.c
+++ b/tests/intel/gem_exec_endless.c
@@ -316,28 +316,28 @@ static void endless_dispatch(int i915, const struct intel_execution_engine2 *e)
 		for_each_if(gem_class_can_store_dword(i915, (e)->class)) \
 			igt_dynamic_f("%s", (e)->name)
 
-static void pin_rps(int sysfs)
+static void pin_rps(int sysfs_gt)
 {
 	unsigned int max;
 
-	if (igt_sysfs_scanf(sysfs, "gt_RP0_freq_mhz", "%u", &max) != 1)
+	if (igt_sysfs_scanf(sysfs_gt, "rps_RP0_freq_mhz", "%u", &max) != 1)
 		return;
 
-	igt_sysfs_printf(sysfs, "gt_min_freq_mhz", "%u", max);
-	igt_sysfs_printf(sysfs, "gt_max_freq_mhz", "%u", max);
-	igt_sysfs_printf(sysfs, "gt_boost_freq_mhz", "%u", max);
+	igt_sysfs_printf(sysfs_gt, "rps_min_freq_mhz", "%u", max);
+	igt_sysfs_printf(sysfs_gt, "rps_max_freq_mhz", "%u", max);
+	igt_sysfs_printf(sysfs_gt, "rps_boost_freq_mhz", "%u", max);
 }
 
-static void unpin_rps(int sysfs)
+static void unpin_rps(int sysfs_gt)
 {
 	unsigned int v;
 
-	if (igt_sysfs_scanf(sysfs, "gt_RPn_freq_mhz", "%u", &v) == 1)
-		igt_sysfs_printf(sysfs, "gt_min_freq_mhz", "%u", v);
+	if (igt_sysfs_scanf(sysfs_gt, "rps_RPn_freq_mhz", "%u", &v) == 1)
+		igt_sysfs_printf(sysfs_gt, "rps_min_freq_mhz", "%u", v);
 
-	if (igt_sysfs_scanf(sysfs, "gt_RP0_freq_mhz", "%u", &v) == 1) {
-		igt_sysfs_printf(sysfs, "gt_max_freq_mhz", "%u", v);
-		igt_sysfs_printf(sysfs, "gt_boost_freq_mhz", "%u", v);
+	if (igt_sysfs_scanf(sysfs_gt, "rps_RP0_freq_mhz", "%u", &v) == 1) {
+		igt_sysfs_printf(sysfs_gt, "rps_max_freq_mhz", "%u", v);
+		igt_sysfs_printf(sysfs_gt, "rps_boost_freq_mhz", "%u", v);
 	}
 }
 
@@ -355,7 +355,7 @@ int igt_main()
 
 	igt_subtest_group() {
 		struct intel_mmio_data mmio;
-		int sysfs;
+		int sysfs_gt, tmp, gt;
 
 		igt_fixture() {
 			igt_require(gem_scheduler_enabled(i915));
@@ -365,16 +365,22 @@ int igt_main()
 						   igt_device_get_pci_device(i915),
 						   false);
 
-			sysfs = igt_sysfs_open(i915);
-			pin_rps(sysfs);
+			i915_for_each_gt(i915, tmp, gt) {
+				sysfs_gt = igt_sysfs_gt_open(i915, gt);
+				pin_rps(sysfs_gt);
+			}
+
 		}
 
 		test_each_engine("dispatch", i915, e)
 				endless_dispatch(i915, e);
 
 		igt_fixture() {
-			unpin_rps(sysfs);
-			close(sysfs);
+			i915_for_each_gt(i915, tmp, gt) {
+				sysfs_gt = igt_sysfs_gt_open(i915, gt);
+				unpin_rps(sysfs_gt);
+				close(sysfs_gt);
+			}
 			intel_register_access_fini(&mmio);
 		}
 	}
-- 
2.45.2

