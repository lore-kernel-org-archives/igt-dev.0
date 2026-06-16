Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E02CDCD98E4
	for <igt-dev@archiver.kernel.org>; Tue, 16 Jun 2026 19:43:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 737FA10EB37;
	Tue, 16 Jun 2026 19:43:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tb6RrH76";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDE0D10E665
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jun 2026 19:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781638976; x=1813174976;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KeJR/bu8B7WR+26UG0ctKn6I8atjsiCXoaHmJcZEEZE=;
 b=Tb6RrH76Q+h9lz2oKB+oF3C/RBegxIcY7xlpAZ9GUzRpgStgx5EnZYmQ
 c2jNsYuEOa55TXjamgIdIXw9x1o42YrtUWahzbWWwnnpG35wXl8Bdaej/
 vWlbs+I5Ixj4E6meDYqYOw4c/lRljm+tAj+cFm45ihRJwrU+dLWE2Wg2p
 wOKmvmCx0kCsVhAlVCRkq9R5HpC53kbL8PEe3WMpSY1qc19xrR30gs7J9
 S++Zo06ph2oK/YOL1ZKPgDfBww8fJQZmxVfBmCEtYO1Ybkw1wcrsiuYep
 0rTbOoV6y8WIT1Up/KoPcDZyWwyYwzO79AdbjHOETU0vOc+6+xtb1PVTa A==;
X-CSE-ConnectionGUID: jDirtLuaQUyDWXLEIZAsEQ==
X-CSE-MsgGUID: c5K/7KplR+Sj7CRx45Sqeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="93536950"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="93536950"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 12:42:55 -0700
X-CSE-ConnectionGUID: LqCZ25L0SvOAvHFnG76dug==
X-CSE-MsgGUID: y3SJ5yrPSISm+93A9Pfbcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="243495207"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 12:42:52 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH] tests/xe_pmu: Fix gt-frequency failure with raised min freq
Date: Wed, 17 Jun 2026 01:06:57 +0530
Message-ID: <20260616193656.2131881-2-sk.anirban@intel.com>
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

Save RPn as the minimum baseline instead, ensuring the min_freq
write enables ignore_efficient_freq and the final restore check
returns min_freq to RPn.

Closes:https://gitlab.freedesktop.org/drm/xe/kernel/issues/8344
Signed-off-by: Sk Anirban <sk.anirban@intel.com>
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

