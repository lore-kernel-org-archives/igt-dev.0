Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74BEEC71136
	for <igt-dev@archiver.kernel.org>; Mon, 16 Jun 2025 23:57:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86E0210E473;
	Mon, 16 Jun 2025 23:57:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cwvRfvbS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC45010E465
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Jun 2025 23:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750118238; x=1781654238;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AsMFcdMSMZ0+k6bdY46B/TBa5P3PxA8YDjOXjDz5VQQ=;
 b=cwvRfvbS2ch4Z3Vq6oWGeuf7JD+Z51NzSawTqFSBHNfNDBMYEFIZt9qz
 sfb1gjugyg7Q5ckwu+u1Z12MfVzRej8AJ9sEbZnMo4Pg8v2u2OnbOK6My
 o04zyiMTfX6opJhHv09jO0+MVVTevy9i5VvCm/dzcy1EqTZCzEsvLVEB5
 kG+umW5DouY0mYhqHBHncYJNoU0k02jgJ7OOuHN0GkoiilLxruWcRIVZ+
 0vtDLpMskNpmQBcJ3Aw2NKHFDaM8BtWBWdhwb7/lG+xDT1rg+rHOcxvW1
 Q1dilJl3tfBNAjqXjwCE9Pv50iBAQi4SY+qxBgbBWE7u+kBrjYd5lDDpp g==;
X-CSE-ConnectionGUID: 1jJxEa/tQfCVLUuqgCMDhw==
X-CSE-MsgGUID: BWgeR3KxQKOQc2ZqPLoo/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="69719234"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="69719234"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 16:57:14 -0700
X-CSE-ConnectionGUID: ViNdM604Q4C6eFlHUtuhvA==
X-CSE-MsgGUID: 6I/LPuxrSm+NJo4vr1JgNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="148502636"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 16:57:13 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Harish Chegondi <harish.chegondi@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 3/3] tests/intel/xe_eu_stall: Use query IOCTL to
 check for EU stall support
Date: Mon, 16 Jun 2025 16:57:09 -0700
Message-ID: <d2bbfcc1855bd6dca1af6d22484bd17df26b8025.1750117903.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <3cb3df73daf1b29c309f9fe4331af27b49e0d9c2.1750117903.git.harish.chegondi@intel.com>
References: <3cb3df73daf1b29c309f9fe4331af27b49e0d9c2.1750117903.git.harish.chegondi@intel.com>
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

Use EU stall query IOCTL to check if EU stall monitoring feature is
available on the platform and if it is supported in the driver.
This would replace the checks in the test with those in the driver.

v2: Rebase and resolve merge conflicts
    Remove unnecessary brackets

Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
Resolves: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5131
---
 tests/intel/xe_eu_stall.c | 54 ++++++++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 24 deletions(-)

diff --git a/tests/intel/xe_eu_stall.c b/tests/intel/xe_eu_stall.c
index 36a4471e5..c496e654b 100644
--- a/tests/intel/xe_eu_stall.c
+++ b/tests/intel/xe_eu_stall.c
@@ -74,6 +74,8 @@ static int stream_fd = -1;
 
 static volatile bool child_is_running = true;
 
+static struct drm_xe_query_eu_stall *query_eu_stall_data;
+
 /*
  * EU stall data format for PVC
  */
@@ -510,33 +512,13 @@ static void test_eustall(int drm_fd, uint32_t devid, bool blocking_read, int ite
 		.properties_ptr = to_user_pointer(properties),
 	};
 
-	struct drm_xe_query_eu_stall *query_eu_stall_data;
-	struct drm_xe_device_query query = {
-		.extensions = 0,
-		.query = DRM_XE_DEVICE_QUERY_EU_STALL,
-		.size = 0,
-		.data = 0,
-	};
-
 	igt_info("User buffer size: %u\n", p_user);
 	if (p_args[0])
 		igt_info("Workload: %s\n", p_args[0]);
 	else
 		igt_info("Workload: GPGPU fill\n");
 
-	igt_assert_eq(igt_ioctl(drm_fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
-	igt_assert_neq(query.size, 0);
-
-	query_eu_stall_data = malloc(query.size);
-	igt_assert(query_eu_stall_data);
-
-	query.data = to_user_pointer(query_eu_stall_data);
-	igt_assert_eq(igt_ioctl(drm_fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
-
-	igt_assert(query_eu_stall_data->num_sampling_rates > 0);
-	if (p_rate == 0)
-		properties[3] = query_eu_stall_data->sampling_rates[0];
-	igt_info("Sampling Rate: %" PRIu64 "\n", properties[3]);
+	igt_info("Sampling Rate: %u\n", p_rate);
 
 	stream_fd = eu_stall_open(drm_fd, &props);
 
@@ -664,18 +646,42 @@ static struct option long_options[] = {
 
 igt_main_args("e:g:o:r:u:w:", long_options, help_str, opt_handler, NULL)
 {
-	int drm_fd;
+	bool blocking_read = true;
+	int drm_fd, ret;
 	uint32_t devid;
 	struct stat sb;
-	bool blocking_read = true;
+	struct drm_xe_device_query query = {
+		.extensions = 0,
+		.query = DRM_XE_DEVICE_QUERY_EU_STALL,
+		.size = 0,
+		.data = 0,
+	};
 
 	igt_fixture {
 		drm_fd = drm_open_driver(DRIVER_XE);
 		igt_require_fd(drm_fd);
 		devid = intel_get_drm_devid(drm_fd);
-		igt_require(IS_PONTEVECCHIO(devid) || intel_graphics_ver(devid) >= IP_VER(20, 0));
+
 		igt_require_f(igt_get_gpgpu_fillfunc(devid), "no gpgpu-fill function\n");
 		igt_require_f(!stat(OBSERVATION_PARANOID, &sb), "no observation_paranoid file\n");
+
+		ret = igt_ioctl(drm_fd, DRM_IOCTL_XE_DEVICE_QUERY, &query);
+		igt_skip_on_f(ret == -1 && errno == ENODEV,
+			      "EU stall monitoring is not available on this platform\n");
+		igt_skip_on_f(ret == -1 && errno == EINVAL,
+			      "EU stall monitoring is not supported in the driver\n");
+		igt_assert_neq(query.size, 0);
+
+		query_eu_stall_data = malloc(query.size);
+		igt_assert(query_eu_stall_data);
+
+		query.data = to_user_pointer(query_eu_stall_data);
+		igt_assert_eq(igt_ioctl(drm_fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+
+		igt_assert(query_eu_stall_data->num_sampling_rates > 0);
+		if (p_rate == 0)
+			p_rate = query_eu_stall_data->sampling_rates[0];
+
 		if (output_file) {
 			output = fopen(output_file, "w");
 			igt_require(output);
-- 
2.48.1

