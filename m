Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D988AEDB7F6
	for <igt-dev@archiver.kernel.org>; Tue,  7 Apr 2026 10:53:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75BFC10E2A9;
	Tue,  7 Apr 2026 10:53:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kqUHx0AX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B0210E3E5
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Apr 2026 10:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775559183; x=1807095183;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ql7jr8dheNCGqhz3Q/mR8kmTcYMc67qCHiWatsNGQdY=;
 b=kqUHx0AXGh9hWZZUC9pQNjIU/iNYD5ou9vk8i3hxmY9bvaIyXe0P0atM
 lRPep1tz8uBMc/uqQbzeDbRaTt5HnZwmJ73t/C21D6F6yVsl8WfeodXHU
 0tfy1eDt2a6WikF8175RR4VAjJJSbymXlFulc0VudjQJ5RtcoHRfSmGgW
 0esmjjqCKGmg/gCYkR8gWluXWCe627wXIN/9PSbCWH0GdWZVYQQ8UHPGQ
 YOsCTT9oIZhrWM9uG8erLsUyy3vWe4muRg2UByCt3QEYIOhjRVE5M2/Y2
 3w1OaiNSD1UjlPxq+rkIZGupn0ZViGUBkzXUPy3PuUBp+rujCd5OJC3Jz A==;
X-CSE-ConnectionGUID: UOx9sbKTQaSBF0UKR/7QdQ==
X-CSE-MsgGUID: 3a8CuoP+SLabHHWnIjhPxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="75559815"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="75559815"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 03:53:03 -0700
X-CSE-ConnectionGUID: 8PxFjzgASwul1EoX5jCyrw==
X-CSE-MsgGUID: Mv2YtyIdSgCuTsi/fuO1lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="223349045"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.1])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 03:53:01 -0700
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t v2] tests/intel/gem_exec_endless: Use the per-gt
 interface to set frequencies
Date: Tue,  7 Apr 2026 12:52:13 +0200
Message-ID: <20260407105212.43821-2-krzysztof.niemiec@intel.com>
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
its duration. Using the legacy interface however makes it impossible for
the pre-test state to be restored due to its limitations in multi-gt
systems. Use the per-gt interface instead to properly clean up.

Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---

v2:
  - Remove the redundant fd open from the i915_for_each_gt loop, as one
    is already created as part of the loop (Sebastian)
  - Remove extra newline (Krzysztof K)

 tests/intel/gem_exec_endless.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/tests/intel/gem_exec_endless.c b/tests/intel/gem_exec_endless.c
index 7f35e985c..f3ed8556c 100644
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
+		int sysfs_gt, gt;
 
 		igt_fixture() {
 			igt_require(gem_scheduler_enabled(i915));
@@ -365,16 +365,17 @@ int igt_main()
 						   igt_device_get_pci_device(i915),
 						   false);
 
-			sysfs = igt_sysfs_open(i915);
-			pin_rps(sysfs);
+			i915_for_each_gt(i915, sysfs_gt, gt)
+				pin_rps(sysfs_gt);
 		}
 
 		test_each_engine("dispatch", i915, e)
 				endless_dispatch(i915, e);
 
 		igt_fixture() {
-			unpin_rps(sysfs);
-			close(sysfs);
+			i915_for_each_gt(i915, sysfs_gt, gt)
+				unpin_rps(sysfs_gt);
+
 			intel_register_access_fini(&mmio);
 		}
 	}
-- 
2.45.2

