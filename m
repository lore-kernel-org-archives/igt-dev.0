Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 578C8CAC592
	for <igt-dev@archiver.kernel.org>; Mon, 22 Sep 2025 17:56:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0775610E4D1;
	Mon, 22 Sep 2025 17:56:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mMU2j48x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DCA810E4D1
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Sep 2025 17:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758563785; x=1790099785;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x91hQ0e1Ot43AfItX6Jdqg0Ypr+pl0sTaFZ/WBW7E1Y=;
 b=mMU2j48xLy2PmXdErLKeYXwh+1/y5FJb7ea4F2M3RiLnI+c52f8oehkz
 oJqPaLhvJT9n41w9kCfMDC1w2+FjEiJlXfBQHE5xOZ6TfAoWE2LatMNdF
 JAIb+eLOJJ+erm0IBqNG5I0JdrHcxDwu7SDZRQQt7R1Z3ZfL2am4BT75Q
 kdoURPYRWKVxuTUXEUzYL5Bjv4lX7JnXKjh5EAa84ZP/5SDDQxiYHZ65P
 UJOUDHjwr6KBzVu6s6TgP+GGuWgaMvGZ0T0Jt5f/b2MipGoXUgHdSgbmH
 oxvrBa6X+zp3h15WR+388iCRzWtv9DifT7ezuSKjV2tpTVCTtebmBbIBT A==;
X-CSE-ConnectionGUID: 0Kl5rybeQhKaRJp9GJIJUA==
X-CSE-MsgGUID: IfQN/EChQG+BYCbkvQgNGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60773692"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60773692"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 10:56:25 -0700
X-CSE-ConnectionGUID: ldJDRVh+QS6LfDcDfX35Sw==
X-CSE-MsgGUID: gPo7tjFqSW2EodRLvYugpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="180547569"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 10:56:23 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH] tests/intel/xe_pmu: Set min frequency to RPn to stabilize
 frequency
Date: Mon, 22 Sep 2025 23:24:40 +0530
Message-ID: <20250922175439.2027292-2-sk.anirban@intel.com>
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

Set GPU min frequency to RPn to trigger GuC "ignore efficient frequency"
parameter. This prevents GuC from elevating min_freq to RPe level when
min_freq < RPe, eliminating frequency fluctuations during PMU testing
and ensuring stable, accurate frequency measurements.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/xe_pmu.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index 0e5a7360f..1ad58f606 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -734,13 +734,21 @@ static void test_gt_frequency(int fd, struct drm_xe_engine_class_instance *eci)
 	unsigned long config_rq_freq, config_act_freq;
 	double min[2], max[2];
 	uint32_t gt = eci->gt_id;
-	uint32_t orig_min = xe_gt_get_freq(fd, eci->gt_id, "min");
-	uint32_t orig_max = xe_gt_get_freq(fd, eci->gt_id, "max");
+	uint32_t orig_min;
+	uint32_t orig_max;
+	uint32_t orig_rpn = xe_gt_get_freq(fd, eci->gt_id, "rpn");
 	uint32_t current_min;
 	uint32_t orig_rpe;
 	uint32_t vm;
 	int pmu_fd[2];
 
+	/*
+	 * Set GPU min frequency to RPn to invoke ignore efficient frequency GuC param
+	 */
+	igt_assert(xe_gt_set_freq(fd, gt, "min", orig_rpn) > 0);
+	orig_min = xe_gt_get_freq(fd, eci->gt_id, "min");
+	orig_max = xe_gt_get_freq(fd, eci->gt_id, "max");
+
 	config_rq_freq = get_event_config(gt, NULL, "gt-requested-frequency");
 	pmu_fd[0] = open_group(fd, config_rq_freq, -1);
 
-- 
2.43.0

