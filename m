Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD8AE7716C
	for <igt-dev@archiver.kernel.org>; Thu,  5 Dec 2024 07:48:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7D8110EDC3;
	Thu,  5 Dec 2024 07:48:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nu5qqRaB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A83B510EDC3
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Dec 2024 07:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733384907; x=1764920907;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8uruzm2lfJL4tE8HGscszmypDbLSVt94XQ2xhcC0bBg=;
 b=Nu5qqRaB4GXLRKz6XhciYJv/JF8QF3caW16jRekl9cLA4aCuefQUQiFF
 zI2JQ2ySjn9CGIKqNm+oGrzU8hA58ay9RXiDqBdtQGl6cG0A7RGDWUann
 1FTUvEs8YWlH3duGmmY5REAbrOrjhEGw9zX4DXsGJfKlwxaTugti6aN9V
 u7qYBhjduJ1HVCEPDnNVghhDBB/eMKON5+KN0F4nZKcGjIBZ4br3fQFBH
 2I3vP/TiVX+scnjy/Mx2XweP/a2w5W4U8vqIs6fMrzyGxqd5vzagRY74D
 eMDH19N8FlP/oh6VkpE7B0qyo/CB5itw6wjZW4RD9G80r7n8kJq1T5sHr A==;
X-CSE-ConnectionGUID: VG44WjlhS/Og8J9P88/KsQ==
X-CSE-MsgGUID: XcpLp+18QEOYTo5Bk0aIAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33564549"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; d="scan'208";a="33564549"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 23:48:27 -0800
X-CSE-ConnectionGUID: 7TGrIHCwRaShLIyJHkufPQ==
X-CSE-MsgGUID: vENjFpVMReuojccN1RNxCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="99052157"
Received: from pgurram-desk.iind.intel.com ([10.145.169.87])
 by orviesa003.jf.intel.com with ESMTP; 04 Dec 2024 23:48:25 -0800
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com,
 Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH i-g-t v2] tests/intel: Don't abort the test on the
 unavailability of sysnode
Date: Thu,  5 Dec 2024 13:16:09 +0530
Message-Id: <20241205074609.538879-1-pravalika.gurram@intel.com>
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

Use calloc to have zeros for sysnodes not present.
it will restore the zeros instead of garbage.
test should not be abort on the unavailability of sysnode.

Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
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

