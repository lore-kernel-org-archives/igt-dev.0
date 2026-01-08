Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F34FD1D483
	for <igt-dev@archiver.kernel.org>; Thu,  8 Jan 2026 19:48:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C840510E378;
	Thu,  8 Jan 2026 19:48:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hn/y59bQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A2A210E378
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jan 2026 19:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767901692; x=1799437692;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yXNeBh7ke9EtSomSh34g9U3exc3ga/Te/PibQXjX2Go=;
 b=hn/y59bQeMhqGutx3XNQMI4gPg0fATycxl6MGH21yAttMA64xv/SIhgK
 IXTCh3CqBzUkFcmuodP90iME4dbhlU507V7CaNzU1jfwdDZuNRt76+141
 stBukkM2aX/g6SarFAlQMo73J6O2cXS6vQ3/VYbp53CgPApoU/61TpdO6
 SMP3DgdRsYUcLgXEkUUS3QXxdqFHluCypQh+7vulYWSH4JX75MTiyChf9
 URkbfpgE9iVF88HVJpLVEHd5OcgDGr83shfdnOzGl3FmGjHNqzE67Hpf5
 7AZ63gZGmi6ONKMy6jFwMCES7XPq//baypQvdnRTP8pTu5wUb0ONtXaOG g==;
X-CSE-ConnectionGUID: rF9Pnp4CRqeE0LQcqMiLIg==
X-CSE-MsgGUID: 0m3qwDkVQD2CnBXSnEzKfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="73136096"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="73136096"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 11:48:12 -0800
X-CSE-ConnectionGUID: KCJRJFHERIywUsg1hbzq2Q==
X-CSE-MsgGUID: wIHk+7VWTzKc9JHPxhD7lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="202496599"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 11:48:08 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v5 1/2] tests/intel/xe_gt_freq: Modify test to support new
 throttle reasons sysfs
Date: Fri,  9 Jan 2026 01:19:00 +0530
Message-ID: <20260108194858.2124790-5-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260108194858.2124790-4-sk.anirban@intel.com>
References: <20260108194858.2124790-4-sk.anirban@intel.com>
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
v4: Check for C6 (Raag)
    Assert if throttle reasons are present (Raag)
v5: Update test description (Riana)

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
Reviewed-by: Raag Jadav <raag.jadav@intel.com>
---
 tests/intel/xe_gt_freq.c | 48 +++++++++++++---------------------------
 1 file changed, 15 insertions(+), 33 deletions(-)

diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
index c02d6189a..19306dc41 100644
--- a/tests/intel/xe_gt_freq.c
+++ b/tests/intel/xe_gt_freq.c
@@ -47,48 +47,30 @@ static bool within_expected_range(uint32_t freq, uint32_t val)
 		(freq >= val - FREQ_UNIT_MHZ);
 }
 
-static uint32_t get_throttle(int fd, int gt_id, const char *throttle_file)
+/**
+ * SUBTEST: throttle_basic_api
+ * Description: Validate throttle reasons reporting during C6 idle state
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
+	igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt_id), 1000, 10),
+		     "GT %d should be in C6\n", gt_id);
+
 	gt_fd = xe_sysfs_gt_open(fd, gt_id);
 	igt_assert_lte(0, gt_fd);
 
-	igt_sysfs_scanf(gt_fd, throttle_attr, "%u", &val);
+	throttle_reasons = igt_sysfs_get(gt_fd, "freq0/throttle/reasons");
+	igt_assert(throttle_reasons);
 
-	igt_debug("gt%d/freq0/throttle/%s: %u\n", gt_id, throttle_file, val);
+	igt_assert_f(!strcmp(throttle_reasons, "none"),
+		     "GT %d is throttled due to: %s\n", gt_id, throttle_reasons);
 
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

