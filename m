Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A60FD3B9A9
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 05:26:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB2510E218;
	Wed, 10 Dec 2025 05:26:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nwDOJIiB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C55B10E218
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Dec 2025 05:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765344406; x=1796880406;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BBCQzQkU9ZhE2wRLBq27TVXlwkTMDYZ38+ebzbDyvoM=;
 b=nwDOJIiBhgOC8LGlTflOuFTGYe5j1ez527aaucC+FnzuSjkVmcl+20d3
 00MmnsLZ74IdF7TAzEV7q+grt67bD2DX9FMm/UHoW6kVCYJyZiP2fvW3w
 PHnPKySw+EM4sdn8AOhAtkoRlX/7BOq3ZC6YFsNhWhczDjEbk662asvEL
 l0LkuiWqic0rkB4+OhcX+K5w7fMm1xwSVQjDoF4j7sJ43z+crAlGUDOkr
 BMo/zVLTdZ7xjZx75DfhPgpv/lTjGH+XAGlzOcxKjxuI2HYsKmO5ot0d0
 /t5uJyouYEouKvPuby7ujoEy1KyfqIrU7JT5QLr/dfJJmcoLsyam3brSz w==;
X-CSE-ConnectionGUID: SJ7wBMCxT/CyLCs/6d19ig==
X-CSE-MsgGUID: gDsdZCTTSqyrnIe/QTjWGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="92785550"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="92785550"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 21:26:46 -0800
X-CSE-ConnectionGUID: yQPBeKkzRm2eXhKgDG1Sug==
X-CSE-MsgGUID: tBUvDLT9QSesYRrRZQh//g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="201348329"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 21:26:43 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v3 1/2] tests/intel/xe_gt_freq: Modify test to support new
 throttle reasons sysfs
Date: Wed, 10 Dec 2025 10:49:24 +0530
Message-ID: <20251210051922.1186869-5-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210051922.1186869-4-sk.anirban@intel.com>
References: <20251210051922.1186869-4-sk.anirban@intel.com>
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

v2: Update buffer size (Raag)
    Cosmetic changes (Raag)
v3: Update fd name (Raag)
    Modify output (Raag)

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/xe_gt_freq.c | 44 ++++++++++------------------------------
 1 file changed, 11 insertions(+), 33 deletions(-)

diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
index c02d6189a..e8586aaf9 100644
--- a/tests/intel/xe_gt_freq.c
+++ b/tests/intel/xe_gt_freq.c
@@ -47,48 +47,26 @@ static bool within_expected_range(uint32_t freq, uint32_t val)
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
-	char throttle_attr[40];
+	char *throttle_reasons;
 	int gt_fd;
 
-	snprintf(throttle_attr, sizeof(throttle_attr),
-		 "freq0/throttle/%s", throttle_file);
 	gt_fd = xe_sysfs_gt_open(fd, gt_id);
 	igt_assert_lte(0, gt_fd);
 
-	igt_sysfs_scanf(gt_fd, throttle_attr, "%u", &val);
+	throttle_reasons = igt_sysfs_get(gt_fd, "freq0/throttle/reasons");
+	igt_assert(throttle_reasons);
 
-	igt_debug("gt%d/freq0/throttle/%s: %u\n", gt_id, throttle_file, val);
+	igt_info("GT %d throttle reason(s): %s\n", gt_id, throttle_reasons);
 
+	free(throttle_reasons);
 	close(gt_fd);
-	return val;
-}
-
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
 }
 
 /**
-- 
2.43.0

