Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD47C5AE59
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 23:57:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB7C010E24D;
	Tue,  3 Jun 2025 23:57:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GiNEW/gQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFDAE10E24D
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 23:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748995062; x=1780531062;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lmEvbji35IJ9m7lsG1OK/sxdY7OqxMT42QrJ5qqXyYc=;
 b=GiNEW/gQ3cW2+v/Gl/g5c3qBsyvn1vo8W6PaNiIKWbozK5degPBOVEMj
 ZheshoGSGvbyloflArAXjz2t/6Za9q0u/DcUhSZSrAQRfkzqM4Zt/EQQC
 zJp1GNNEHkuRizjNAFEWpJ4gJJmUynPSj7B1b1GKqSIsEwmTZAtxAA3UE
 sauHGO48JzVFGoQ53bXyq1eIE9HcTQljHR4YbDm3WL1qSZ0GoK3on4lMs
 rjIivXxwmuda3pVg25vzBo39Ofve4Zf0yBY2ctGqfKqJTfmkEFLFaT5Q9
 HedEytsz67Z0MPjTcMRIO0O+iY63G530ZQ5YU4rjjjz9H2mGdLophANAO Q==;
X-CSE-ConnectionGUID: d54GbNnbSS2P9Y5G7rAaDw==
X-CSE-MsgGUID: MuQB1/CuT12S5aT1/TFCrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="68491404"
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="68491404"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 16:57:41 -0700
X-CSE-ConnectionGUID: 0Q+pxSVwRWWBWEQnG1xCUQ==
X-CSE-MsgGUID: ctyrZvyUSB2CwLSaQYlpkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="145028903"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 16:57:41 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Harish Chegondi <harish.chegondi@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 3/3] tests/intel/xe_eu_stall: Use query IOCTL to check
 for EU stall support
Date: Tue,  3 Jun 2025 16:57:36 -0700
Message-ID: <0e894b0ab963e0e5b03b200f919e9318fe02de20.1748994982.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <b5b8323fe6840bff949b8607480d57104b908a1f.1748994982.git.harish.chegondi@intel.com>
References: <b5b8323fe6840bff949b8607480d57104b908a1f.1748994982.git.harish.chegondi@intel.com>
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

Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
Resolves: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5131
---
 tests/intel/xe_eu_stall.c | 55 +++++++++++++++++++++------------------
 1 file changed, 30 insertions(+), 25 deletions(-)

diff --git a/tests/intel/xe_eu_stall.c b/tests/intel/xe_eu_stall.c
index b3a0ee742..4e76018b6 100644
--- a/tests/intel/xe_eu_stall.c
+++ b/tests/intel/xe_eu_stall.c
@@ -74,6 +74,8 @@ static int stream_fd = -1;
 
 static volatile bool child_is_running = true;
 
+static struct drm_xe_query_eu_stall *query_eu_stall_data;
+
 /*
  * EU stall data format for PVC
  */
@@ -506,33 +508,12 @@ static void test_eustall(int drm_fd, uint32_t devid, bool blocking_read, int ite
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
-
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
-	igt_info("Sampling Rate: %lu\n", properties[3]);
+	igt_info("Sampling Rate: %lu\n", p_rate);
 
 	stream_fd = eu_stall_open(drm_fd, &props);
 
@@ -660,18 +641,42 @@ static struct option long_options[] = {
 
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
+		igt_skip_on_f((ret == -1 && errno == ENODEV),
+			      "EU stall monitoring is not available on this platform\n");
+		igt_skip_on_f((ret == -1 && errno == EINVAL),
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

