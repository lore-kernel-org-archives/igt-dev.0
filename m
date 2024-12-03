Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E95D2E64AB2
	for <igt-dev@archiver.kernel.org>; Tue,  3 Dec 2024 14:08:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A643A10EA17;
	Tue,  3 Dec 2024 14:08:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hkvjcNWN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 180CE10EA09
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Dec 2024 14:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733234921; x=1764770921;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=390Lyl0zyg0JvsYG1gNcf1LPUZ5tPqcnXIJV3+a+I8M=;
 b=hkvjcNWNkOZh96qw5SsZZE+u5mmTwBtLe4RUOPVwIl2qPJjt3ZugGKCl
 +Qig+2nZjHdKldh3Jmx6uvKlGAy5q2vFQZEpHenKoCOkQC6c28z0mTcC9
 3Y7ON8H8Igi/QO5JulnnxmBphfTO3tt3zQ0Hqdpt1fzlYXdlsVVpic8gm
 rKoD27p/hxoebNN2zEhUvDyrF1jPnp/TozA7XbhapiWvY8FKVcwTt+Aeu
 jgTGbhDot0d/1UMCn9792C50vEG+gNz83Xp2rGistlOPsR3jPrEdVmJkI
 34nC9hQXkNcOKCUelfaonT4dW3MOfod2suozVQw7i6uvzpmAdVHODr/i1 g==;
X-CSE-ConnectionGUID: cEvPsadjSLmvg8uVcnGxKA==
X-CSE-MsgGUID: JQfjciy8QiyLTud9WfHD/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="44839388"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="44839388"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 06:08:40 -0800
X-CSE-ConnectionGUID: r7chUY45RGWG23Z0PsbmDA==
X-CSE-MsgGUID: WEf0S3COSNCsO1gx3nF3DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="98464616"
Received: from pgurram-desk.iind.intel.com ([10.145.169.87])
 by orviesa003.jf.intel.com with ESMTP; 03 Dec 2024 06:08:40 -0800
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH i-g-t] tests/intel: Don't abort the test on the unavailability
 of sysnode
Date: Tue,  3 Dec 2024 19:36:26 +0530
Message-Id: <20241203140626.514454-1-pravalika.gurram@intel.com>
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

use calloc to assign NULL value in false case, because in restore case
it will restore the NULL value instead of garbage.
test should not be abort/skip on the unavailability of sysnode

Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
---
 tests/intel/perf_pmu.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
index bfa2d501a..87ddfe1a9 100644
--- a/tests/intel/perf_pmu.c
+++ b/tests/intel/perf_pmu.c
@@ -1786,7 +1786,7 @@ test_frequency_idle(int gem_fd, unsigned int gt)
 	sysfs = igt_sysfs_gt_open(gem_fd, gt);
 	igt_require(sysfs >= 0);
 
-	min_freq = igt_sysfs_get_u32(sysfs, "rps_RPn_freq_mhz");
+	__igt_sysfs_get_u32(sysfs, "rps_RPn_freq_mhz", &min_freq);
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

