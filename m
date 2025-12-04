Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D047ED1D86A
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 06:31:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89D3B10E850;
	Thu,  4 Dec 2025 06:31:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pjov1vP5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D6AA10E850
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 06:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764829887; x=1796365887;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DI/1dOZR8ScKfX5M+tJtSYnNlI0dTVkoyIQb/w4qRUY=;
 b=Pjov1vP5aHhb4E9rQFfSOMD4DMXaly8nE3HfHJzRF3rrFvrvvnfCBMeL
 w6xLJGsryNHI1D2D2TsnRxBe+3tPWs8pRofQjlrGsxIFHLNv5Exak00YV
 ATl4Em7FI5BicDOJHjC51gFzCcc83dosv+p6PgLsQEJZOnuYoJgS3xoSf
 IaFpwthu2D22sRQQoR7F2OpwT8nbpgHfiGXQ2uFB9Rom8EGswXGVmBtEA
 grmwBU5lx1ZsC0vlWUcQ34Bw6XyoEo1ZZ5w/xTMYhEp0tqYFjxGeFta6V
 2V8vi5K/WwaFfUgBUQrEgo9t3DPTanYWfPKKTzxk1U83kIGFyQYXpIMHy g==;
X-CSE-ConnectionGUID: pt3YEyiYQIG5myNFZ3V2NQ==
X-CSE-MsgGUID: QhHBG995TW26Da627kBglA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="70691574"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="70691574"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 22:31:27 -0800
X-CSE-ConnectionGUID: DuGvMATDTEODkNsDycfo3w==
X-CSE-MsgGUID: RhHMZaQmSfajfJknZ9SMVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="200033539"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 22:31:24 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v2 1/2] tests/intel/xe_gt_freq: Modify test to support new
 throttle reasons sysfs
Date: Thu,  4 Dec 2025 11:54:30 +0530
Message-ID: <20251204062428.401397-5-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251204062428.401397-4-sk.anirban@intel.com>
References: <20251204062428.401397-4-sk.anirban@intel.com>
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

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/xe_gt_freq.c | 51 +++++++++++++---------------------------
 1 file changed, 16 insertions(+), 35 deletions(-)

diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
index d0f35b10a..8999cd532 100644
--- a/tests/intel/xe_gt_freq.c
+++ b/tests/intel/xe_gt_freq.c
@@ -47,25 +47,6 @@ static bool within_expected_range(uint32_t freq, uint32_t val)
 		(freq >= val - FREQ_UNIT_MHZ);
 }
 
-static uint32_t get_throttle(int fd, int gt_id, const char *throttle_file)
-{
-	uint32_t val;
-	char throttle_attr[40];
-	int gt_fd;
-
-	snprintf(throttle_attr, sizeof(throttle_attr),
-		 "freq0/throttle/%s", throttle_file);
-	gt_fd = xe_sysfs_gt_open(fd, gt_id);
-	igt_assert_lte(0, gt_fd);
-
-	igt_sysfs_scanf(gt_fd, throttle_attr, "%u", &val);
-
-	igt_debug("gt%d/freq0/throttle/%s: %u\n", gt_id, throttle_file, val);
-
-	close(gt_fd);
-	return val;
-}
-
 /**
  * SUBTEST: throttle_basic_api
  * Description: Test basic throttle API
@@ -73,22 +54,22 @@ static uint32_t get_throttle(int fd, int gt_id, const char *throttle_file)
 
 static void test_throttle_basic_api(int fd, int gt_id)
 {
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
+	char *throttle_reasons;
+	int sysfs_fd;
+
+	sysfs_fd = xe_sysfs_gt_open(fd, gt_id);
+	igt_assert_lte(0, sysfs_fd);
+
+	throttle_reasons = igt_sysfs_get(sysfs_fd, "freq0/throttle/reasons");
+	igt_assert(throttle_reasons);
+
+	igt_debug("gt%d/freq0/throttle/reasons: %s\n", gt_id, throttle_reasons);
+
+	if (strcmp(throttle_reasons, "none"))
+		igt_info("GT %d is being throttled due to reasons: %s\n", gt_id, throttle_reasons);
+
+	free(throttle_reasons);
+	close(sysfs_fd);
 }
 
 /**
-- 
2.43.0

