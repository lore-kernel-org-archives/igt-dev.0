Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44EA4F31E21
	for <igt-dev@archiver.kernel.org>; Thu,  9 Apr 2026 14:07:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4DB510E3AD;
	Thu,  9 Apr 2026 14:07:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mT1E2N2F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C40510E3AD
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2026 14:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775743617; x=1807279617;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=i40G5sSlUCm1N2Z5M9WzvbCYuTVNZcR5c4MPrj69sEI=;
 b=mT1E2N2FTnQAqnwht/JnKU7expXHy947pi6X+4OE68NDQRfvGmuCR2z/
 peyZdWQxUV5eVAhpqjiqHiKCAZPPxzzKvofILYEt6BpdhmG8WY0SLKQND
 tpKsI+OgQQZASC3Zz4B+Z0DbCRJungVgObE1vaGyL/MJbu8jo0FYxTVz3
 enFUPxWQg+cjL+XfQxcw9aNrBadLZVGdoVQk27iPIic4fO0p9lph/fFqs
 KAiwd90sTFx1lJhNbHdxuwqovn2rEpWqKllZ6ZkF2LgHczlEA+CxywbqZ
 3pyugIFg+yLvmzqn2JKm6qO2c4/U+71o+kE8TnWY2nCVrwhRGW9ooUKbD A==;
X-CSE-ConnectionGUID: 4WlhHC3FTIme+Q4Xdt3SZA==
X-CSE-MsgGUID: 01PBtm43RX2HW1LkETtDwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="80610871"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="80610871"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 07:06:56 -0700
X-CSE-ConnectionGUID: T8UGIYKORS2QFPOG6d0JDg==
X-CSE-MsgGUID: 7VPognWhRpu44iLU7UcfYw==
X-ExtLoop1: 1
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.89])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 07:06:53 -0700
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH i-g-t v3] tests/intel/gem_exec_endless: Use the per-gt
 interface to set frequencies
Date: Thu,  9 Apr 2026 16:06:41 +0200
Message-ID: <20260409140640.48827-2-krzysztof.niemiec@intel.com>
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
systems; by using the legacy interface only a single value can be set,
but each gt might accept values from a different range and default to
a different value that we might want to restore.

Use the per-gt interface instead of the legacy one to properly clean up.

Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---

v3:
  - Expand the commit description for extra clarity (Janusz)

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

