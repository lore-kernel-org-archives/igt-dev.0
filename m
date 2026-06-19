Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1915CD4F26
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jun 2026 11:44:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A52DC10F543;
	Fri, 19 Jun 2026 11:44:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WUn+/gpM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58EFC10F543
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jun 2026 11:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781869458; x=1813405458;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZnhwNpRsV5LPQDBxM1JWVfqMTue5C/oy8Tz1sI1X6Z4=;
 b=WUn+/gpM4Q1o8Te29hgBgtsrVw2LE0IyDS9QynbXWGkTGtHARaFkFS84
 EIHkgoaRFS1w2z8r+KLJGH3r/APb3rt1eU7RCwkeVK2QMxJH2uYJr/46q
 5DiUOPmQKuDgIpmtBkb3cGx9GhZxuVnbvUiBYMC+3Rc4I7WhcXn4wEiZm
 yrKd5iF5rsL7ca96TYJ52+D/A8E/MsZS6jTk/tF+Ya0N0bXr6PDuR2EzY
 96XigAZZUM3hFcazbLEHvlQMAzFma8NWcOkH01O+uBi+27CHCvRxaH+cH
 c0WVhOG50VsJe48xRCyKU5CS1TCXuzPs41Kw4al6aNn4Oyr1GpB8fwI6w Q==;
X-CSE-ConnectionGUID: CspbXaR0T0qgJR8HJrxZUg==
X-CSE-MsgGUID: x14pXh0jSim7MD7QzmvCpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="70229539"
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="70229539"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 04:44:18 -0700
X-CSE-ConnectionGUID: Y8/xbKkkQ2i0a9bsjyv7XA==
X-CSE-MsgGUID: /BN5LN7BSzya4JEOeBUZEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="253600032"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 04:44:15 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v2] tests/xe_pmu: Fix gt-frequency failure with raised min freq
Date: Fri, 19 Jun 2026 17:08:09 +0530
Message-ID: <20260619113808.2442376-2-sk.anirban@intel.com>
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

The gt-frequency subtest can fail when the min frequency has
already been raised above RPn before the test begins. Using that
value as the original minimum prevents the later min_freq write
from enabling the GuC ignore_efficient_freq parameter, so min_freq
can keep moving toward RPe.

Since RPe varies dynamically with thermal conditions, use RPn as the
fixed minimum baseline instead. This ensures that writing to min_freq
enables the ignore_efficient_freq GuC parameter.

v2: Fix commit message (Vinay)

Closes:https://gitlab.freedesktop.org/drm/xe/kernel/issues/8344
Signed-off-by: Sk Anirban <sk.anirban@intel.com>
Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 tests/intel/xe_pmu.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index fb4b871e7..4bbc801a1 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -903,10 +903,8 @@ static void test_gt_frequency(int fd, struct drm_xe_engine_class_instance *eci)
 	unsigned long config_rq_freq, config_act_freq;
 	double min[2], max[2];
 	uint32_t gt = eci->gt_id;
-	uint32_t orig_min = xe_gt_get_freq(fd, eci->gt_id, "min");
+	uint32_t orig_min = xe_gt_get_freq(fd, eci->gt_id, "rpn");
 	uint32_t orig_max = xe_gt_get_freq(fd, eci->gt_id, "max");
-	uint32_t current_min;
-	uint32_t orig_rpe;
 	uint32_t vm;
 	int pmu_fd[2];
 
@@ -956,9 +954,7 @@ static void test_gt_frequency(int fd, struct drm_xe_engine_class_instance *eci)
 	 * Restore min/max.
 	 */
 	igt_assert(xe_gt_set_freq(fd, gt, "min", orig_min) > 0);
-	orig_rpe = xe_gt_get_freq(fd, gt, "rpe");
-	current_min = xe_gt_get_freq(fd, gt, "min");
-	igt_assert(current_min == orig_min || current_min == orig_rpe);
+	igt_assert(xe_gt_get_freq(fd, gt, "min") == orig_min);
 
 	igt_info("Minimum frequency: requested %.1f, actual %.1f\n",
 		 min[0], min[1]);
-- 
2.43.0

