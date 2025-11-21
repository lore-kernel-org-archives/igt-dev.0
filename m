Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 118C8CFC268
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 11:55:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C1F710E04C;
	Fri, 21 Nov 2025 11:55:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FpGASlcl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A34210E04C
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 11:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763726148; x=1795262148;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QHqA9lDM3MlrsaN7mZ8nhPKOR1Ws2VwjAU/A24NJF0A=;
 b=FpGASlclVWG3+moS3H7PLZag3Bnd1FiuUbPPiMy96BdNiBDBRDtAv8UN
 rR1aFevEZ8Pz9yGpmTb5skx0FVOpavFL9aGAZySTPBr8yqMTyZIrrlRV6
 UEveHFE0zW6TtOdvnN6KJRTTHD8b9f2ex/k5HWaolGmc4gONj1hQie9P0
 da89cjg5bOJ+MPikiA25FOkRXIQYARFkz59+RJQFeO0LA16GRwfVAwKns
 fjwitH7/53cTc74B8CW0eY6sw2pJ73Bb448Q7Qi/AtImwGuNJtNdRQQII
 2fTySW9rJwzXYKFsZDWnLgDqVj8i22cpS2lLoljHZ1dZCj4SLimO/I3UQ Q==;
X-CSE-ConnectionGUID: xuj2EZbpSgSZ99lHo18vYg==
X-CSE-MsgGUID: eHzvnB+6SL2DeZ8MLkwgiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="76428228"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="76428228"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 03:55:47 -0800
X-CSE-ConnectionGUID: dhc9IR6ATMOewnVA4blaPw==
X-CSE-MsgGUID: dkw/al0JS12GsHDl//4FwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="191925234"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 03:55:44 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, rodrigo.vivi@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH] tests/intel/xe_gt_freq: Modify test to support new throttle
 reasons sysfs
Date: Fri, 21 Nov 2025 17:19:48 +0530
Message-ID: <20251121114947.3946699-2-sk.anirban@intel.com>
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

Change throttle_basic_api to read the new atomic reasons attribute
instead of checking status and individual reason files separately.
This validates the kernel's TOCTOU-free throttling interface.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/xe_gt_freq.c | 45 ++++++++++++----------------------------
 1 file changed, 13 insertions(+), 32 deletions(-)

diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
index d0f35b10a..30e359a47 100644
--- a/tests/intel/xe_gt_freq.c
+++ b/tests/intel/xe_gt_freq.c
@@ -47,48 +47,29 @@ static bool within_expected_range(uint32_t freq, uint32_t val)
 		(freq >= val - FREQ_UNIT_MHZ);
 }
 
-static uint32_t get_throttle(int fd, int gt_id, const char *throttle_file)
+/**
+ * SUBTEST: throttle_basic_api
+ * Description: Test basic throttle API
+ */
+
+static void test_throttle_basic_api(int fd, int gt_id)
 {
-	uint32_t val;
+	char reasons[1024];
 	char throttle_attr[40];
 	int gt_fd;
 
-	snprintf(throttle_attr, sizeof(throttle_attr),
-		 "freq0/throttle/%s", throttle_file);
+	snprintf(throttle_attr, sizeof(throttle_attr), "freq0/throttle/reasons");
 	gt_fd = xe_sysfs_gt_open(fd, gt_id);
 	igt_assert_lte(0, gt_fd);
 
-	igt_sysfs_scanf(gt_fd, throttle_attr, "%u", &val);
+	igt_assert(igt_sysfs_scanf(gt_fd, throttle_attr, "%1023s", reasons) == 1);
 
-	igt_debug("gt%d/freq0/throttle/%s: %u\n", gt_id, throttle_file, val);
+	igt_debug("gt%d/freq0/throttle/reasons: %s\n", gt_id, reasons);
 
-	close(gt_fd);
-	return val;
-}
+	if (strcmp(reasons, "none") != 0)
+		igt_info("GT %d is being throttled due to: %s\n", gt_id, reasons);
 
-/**
- * SUBTEST: throttle_basic_api
- * Description: Test basic throttle API
- */
-
-static void test_throttle_basic_api(int fd, int gt_id)
-{
-	uint32_t status, reasons;
-
-	status = get_throttle(fd, gt_id, "status");
-	reasons = get_throttle(fd, gt_id, "reason_pl1");
-	reasons |= get_throttle(fd, gt_id, "reason_pl2");
-	reasons |= get_throttle(fd, gt_id, "reason_pl4");
-	reasons |= get_throttle(fd, gt_id, "reason_prochot");
-	reasons |= get_throttle(fd, gt_id, "reason_ratl");
-	reasons |= get_throttle(fd, gt_id, "reason_thermal");
-	reasons |= get_throttle(fd, gt_id, "reason_vr_tdc");
-	reasons |= get_throttle(fd, gt_id, "reason_vr_thermalert");
-
-	if (status)
-		igt_assert(reasons);
-	else
-		igt_assert(!reasons);
+	close(gt_fd);
 }
 
 /**
-- 
2.43.0

