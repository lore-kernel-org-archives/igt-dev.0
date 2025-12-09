Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B63D2D1CDC6
	for <igt-dev@archiver.kernel.org>; Tue,  9 Dec 2025 11:18:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B0E310E51E;
	Tue,  9 Dec 2025 11:18:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MNO1G+jb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FFBF10E51E
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Dec 2025 11:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765279130; x=1796815130;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jm7nEQyFTL8rcelhHjL/L9xl+MLKtDYYsXLGE8I3F2Q=;
 b=MNO1G+jbc72OEuWxKmARtOZbzDKTg+7Kzws8O93XGXj1aZstlcJX6ir+
 4JkswV5G6m8x/2dBdCKp9AeTiEUUNNyPIZjxaNifAFGNL6uviViK8/Joq
 Ob9E9Kay2GnxhJf8FYEk7fykeCOIb94HdQXcg2xNovY1nHVnL/RD26/Zj
 AYzbJIubjYIiyFqPhGr/OIDxmRigONo4SP3daXETCDTAUUwjyo84mwd8N
 +ZNCdfAaGGi4EYmabzNua6skyIyD99pLlcCk15tdMWYj++DW2uTZW61JH
 O2Sowew7yGe5uKGhDnMpg83RctJebwwi9mYNV9NwNzF14pwVjSbPb0MDG w==;
X-CSE-ConnectionGUID: CwpvYOOUQ26+JnDINCnT/Q==
X-CSE-MsgGUID: oeXMS3AwQ3CfDfP/8ZfQDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="69823746"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="69823746"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 03:18:49 -0800
X-CSE-ConnectionGUID: End488FwR/CtH68kfRXPlA==
X-CSE-MsgGUID: KHBaHiCjRwCPDTAF/Y4e+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="196212361"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 03:18:46 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v3 1/2] tests/intel/xe_gt_freq: Modify test to support new
 throttle reasons sysfs
Date: Tue,  9 Dec 2025 16:41:28 +0530
Message-ID: <20251209111126.1155774-5-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209111126.1155774-4-sk.anirban@intel.com>
References: <20251209111126.1155774-4-sk.anirban@intel.com>
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
index d0f35b10a..cd09d09de 100644
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

