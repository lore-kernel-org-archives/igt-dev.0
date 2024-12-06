Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B394E77173
	for <igt-dev@archiver.kernel.org>; Fri,  6 Dec 2024 05:06:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E429F10E5F4;
	Fri,  6 Dec 2024 05:06:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aDLDJWqr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA3310E3CD
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Dec 2024 05:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733461584; x=1764997584;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fXHyOFMmalZmcgGRWuVffBaTl1BPYBvbdGTCqjnF4Q8=;
 b=aDLDJWqrnUAAmcl07JQM1yUVzjIsFGpI+loPq8EulA376AJ00WA9wojv
 gDAmmXx7zw6m8CZnX/efhdU0ve+KClE20Kkgpl2YW+7roVP6NLhtXmSZp
 OCgdDAigEugDRHCIYjFRcqEx/6V/smQc4ZaYJw6Tg4GUJQ1MWr7BxwURl
 oCoT3aXq7J632JIPgntgxUrATxZeZtB4HaRLqBx31fOxtQ6Q8DpofYOPU
 N3xeo/+HpdYL56jg4rkumgFIX6KK2cDgpti6/c3gDR/1JYx9R85QwWk0t
 i9gXVhQj4NtaSt/YUcQ4n8qYiqzF6uy2pox58DTXl1gXU1l3VruaC8SO3 A==;
X-CSE-ConnectionGUID: EmfsyPQNRLOe3HBQm5cVMg==
X-CSE-MsgGUID: dPBfZUu2QN2FIdRpgObIlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="33929718"
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; d="scan'208";a="33929718"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 21:06:24 -0800
X-CSE-ConnectionGUID: CbG2If7MR02RXqIJzVfKnA==
X-CSE-MsgGUID: er3PRDUlS6utRE4CV+ezaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; d="scan'208";a="99126363"
Received: from pgurram-desk.iind.intel.com ([10.145.169.87])
 by fmviesa004.fm.intel.com with ESMTP; 05 Dec 2024 21:06:22 -0800
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com,
 Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH i-g-t v3] tests/intel/perf_pmu: Skip frequency test on older
 platforms
Date: Fri,  6 Dec 2024 10:34:03 +0530
Message-Id: <20241206050403.541668-1-pravalika.gurram@intel.com>
X-Mailer: git-send-email 2.34.1
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

On a few old platforms like BLB, ELK, ILK or PNV the following
sysfs node "rps_min_freq_mhz" is not present which cause
frequency test to abort. Make it skip those cases

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12728

Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/perf_pmu.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
index bfa2d501a..5d0467c02 100644
--- a/tests/intel/perf_pmu.c
+++ b/tests/intel/perf_pmu.c
@@ -1786,7 +1786,7 @@ test_frequency_idle(int gem_fd, unsigned int gt)
 	sysfs = igt_sysfs_gt_open(gem_fd, gt);
 	igt_require(sysfs >= 0);
 
-	min_freq = igt_sysfs_get_u32(sysfs, "rps_RPn_freq_mhz");
+	igt_require(__igt_sysfs_get_u32(sysfs, "rps_RPn_freq_mhz", &min_freq));
 	close(sysfs);
 
 	/* While parked, our convention is to report the GPU at 0Hz */
@@ -2403,23 +2403,23 @@ static void save_sysfs_freq(int i915)
 
 	num_gts = igt_sysfs_get_num_gt(i915);
 
-	stash_min = (uint32_t *)malloc(sizeof(uint32_t) * num_gts);
-	stash_max = (uint32_t *)malloc(sizeof(uint32_t) * num_gts);
-	stash_boost = (uint32_t *)malloc(sizeof(uint32_t) * num_gts);
+	stash_min = (uint32_t *)calloc(num_gts, sizeof(uint32_t) * num_gts);
+	stash_max = (uint32_t *)calloc(num_gts, sizeof(uint32_t) * num_gts);
+	stash_boost = (uint32_t *)calloc(num_gts, sizeof(uint32_t) * num_gts);
 
 	/* Save boost, min and max across GTs */
 	i915_for_each_gt(i915, tmp, gt) {
 		sysfs = igt_sysfs_gt_open(i915, gt);
 		igt_require(sysfs >= 0);
 
-		stash_min[gt] = igt_sysfs_get_u32(sysfs, "rps_min_freq_mhz");
-		stash_max[gt] = igt_sysfs_get_u32(sysfs, "rps_max_freq_mhz");
-		stash_boost[gt] = igt_sysfs_get_u32(sysfs, "rps_boost_freq_mhz");
+		__igt_sysfs_get_u32(sysfs, "rps_min_freq_mhz", &stash_min[gt]);
+		__igt_sysfs_get_u32(sysfs, "rps_max_freq_mhz", &stash_max[gt]);
+		__igt_sysfs_get_u32(sysfs, "rps_boost_freq_mhz", &stash_boost[gt]);
 		igt_debug("GT: %d, min: %d, max: %d, boost:%d\n",
 			  gt, stash_min[gt], stash_max[gt], stash_boost[gt]);
 
-		rpn_freq = igt_sysfs_get_u32(sysfs, "rps_RPn_freq_mhz");
-		rp0_freq = igt_sysfs_get_u32(sysfs, "rps_RP0_freq_mhz");
+		__igt_sysfs_get_u32(sysfs, "rps_RPn_freq_mhz", &rpn_freq);
+		__igt_sysfs_get_u32(sysfs, "rps_RP0_freq_mhz", &rp0_freq);
 
 		/* Set pre-conditions, in case frequencies are in non-default state */
 		igt_require(__igt_sysfs_set_u32(sysfs, "rps_max_freq_mhz", rp0_freq));
-- 
2.34.1

