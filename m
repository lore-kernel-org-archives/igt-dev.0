Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D939C83F1B
	for <igt-dev@archiver.kernel.org>; Wed, 16 Jul 2025 06:26:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B43B510E247;
	Wed, 16 Jul 2025 06:26:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VMxk53Cp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0A4310E247
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jul 2025 06:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752647167; x=1784183167;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Pk8gAWL3GiD/BXjwIujHdLYHbxLTuySc5I0mDqywubk=;
 b=VMxk53CpKVtB5LX8NyXktbsPrCRAkiGfn6WOmNsoS70mjEsEKfuk9h2z
 f4OCkgO4SdKhtaBDm/LFY0new/7cYN7nGP3iRHBgRgsjfiJxjRhtXQMXt
 jhzAV0C25ub/j8wMEG9z2O4msMVVUhVmorHh63a0QCGumk2LEuwPCwhf6
 5PqMFGzSof8HTPSk2YU+c5uACupt6AhgfvSBP6jWd+Pkh+CfUazdrZYNh
 zrpQHIdciN/XN6QzZDG/iG2QzkT8fiLuKHxqIRy9c1TEeRDbkW/U/WNvm
 NortD/Z/QzBvoM1DVeqa1cqXFpXFc+mgYJOwzYh9yI2D80trfYn0yxSvQ A==;
X-CSE-ConnectionGUID: 6Rt1dXMpQ5G+muAoiLJrxA==
X-CSE-MsgGUID: /JrfJDawTTWjNX5Bg5XlIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54818876"
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; d="scan'208";a="54818876"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 23:26:06 -0700
X-CSE-ConnectionGUID: cVWPKXE4QU6vQhya8qgMIg==
X-CSE-MsgGUID: n7EbGqo/T8yHojIDcRiBNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; d="scan'208";a="161728264"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 23:26:05 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Harish Chegondi <harish.chegondi@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t 1/1] lib/xe/xe_query: Add EU stall info to xe_device
Date: Tue, 15 Jul 2025 23:25:58 -0700
Message-ID: <6d41938517a3ab1b79e105c89af1ed74b1beeceb.1752647058.git.harish.chegondi@intel.com>
X-Mailer: git-send-email 2.48.1
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

Add EU stall data information obtained through the EU stall
query IOCTL to xe_device.

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
---
 lib/xe/xe_query.c         | 28 ++++++++++++++++++++++++++++
 lib/xe/xe_query.h         |  3 +++
 tests/intel/xe_eu_stall.c | 26 ++++++--------------------
 3 files changed, 37 insertions(+), 20 deletions(-)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index c0dba0182..3b8a682f8 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -160,6 +160,32 @@ static struct drm_xe_query_mem_regions *xe_query_mem_regions_new(int fd)
 	return mem_regions;
 }
 
+static struct drm_xe_query_eu_stall *xe_query_eu_stall_new(int fd)
+{
+	struct drm_xe_query_eu_stall *query_eu_stall;
+	struct drm_xe_device_query query = {
+		.extensions = 0,
+		.query = DRM_XE_DEVICE_QUERY_EU_STALL,
+		.size = 0,
+		.data = 0,
+	};
+
+	/* Support older kernels where this uapi is not yet available */
+	if (igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query))
+		return NULL;
+	igt_assert_neq(query.size, 0);
+
+	query_eu_stall = malloc(query.size);
+	igt_assert(query_eu_stall);
+
+	query.data = to_user_pointer(query_eu_stall);
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
+
+	VG(VALGRIND_MAKE_MEM_DEFINED(query_eu_stall, query.size));
+
+	return query_eu_stall;
+}
+
 static struct drm_xe_query_oa_units *xe_query_oa_units_new(int fd)
 {
 	struct drm_xe_query_oa_units *oa_units;
@@ -317,6 +343,7 @@ static void xe_device_free(struct xe_device *xe_dev)
 	free(xe_dev->engines);
 	free(xe_dev->mem_regions);
 	free(xe_dev->vram_size);
+	free(xe_dev->eu_stall);
 	free(xe_dev);
 }
 
@@ -355,6 +382,7 @@ struct xe_device *xe_device_get(int fd)
 	xe_dev->memory_regions = __memory_regions(xe_dev->gt_list);
 	xe_dev->engines = xe_query_engines(fd);
 	xe_dev->mem_regions = xe_query_mem_regions_new(fd);
+	xe_dev->eu_stall = xe_query_eu_stall_new(fd);
 	xe_dev->oa_units = xe_query_oa_units_new(fd);
 
 	/*
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index ca0b3235e..cc54ec956 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -45,6 +45,9 @@ struct xe_device {
 	/** @engines: hardware engines */
 	struct drm_xe_query_engines *engines;
 
+	/** @eu_stall: information about EU stall data */
+	struct drm_xe_query_eu_stall *eu_stall;
+
 	/** @mem_regions: regions memory information and usage */
 	struct drm_xe_query_mem_regions *mem_regions;
 
diff --git a/tests/intel/xe_eu_stall.c b/tests/intel/xe_eu_stall.c
index 88202488c..f09e525eb 100644
--- a/tests/intel/xe_eu_stall.c
+++ b/tests/intel/xe_eu_stall.c
@@ -46,6 +46,7 @@
 #include "igt_core.h"
 #include "xe_drm.h"
 #include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
 
 #define OBSERVATION_PARANOID	"/proc/sys/dev/xe/observation_paranoid"
 
@@ -646,15 +647,10 @@ static struct option long_options[] = {
 igt_main_args("e:g:o:r:u:w:", long_options, help_str, opt_handler, NULL)
 {
 	bool blocking_read = true;
-	int drm_fd, ret, idx;
+	struct xe_device *xe_dev;
+	int drm_fd, idx;
 	uint32_t devid;
 	struct stat sb;
-	struct drm_xe_device_query query = {
-		.extensions = 0,
-		.query = DRM_XE_DEVICE_QUERY_EU_STALL,
-		.size = 0,
-		.data = 0,
-	};
 
 	igt_fixture {
 		drm_fd = drm_open_driver(DRIVER_XE);
@@ -663,20 +659,10 @@ igt_main_args("e:g:o:r:u:w:", long_options, help_str, opt_handler, NULL)
 
 		igt_require_f(igt_get_gpgpu_fillfunc(devid), "no gpgpu-fill function\n");
 		igt_require_f(!stat(OBSERVATION_PARANOID, &sb), "no observation_paranoid file\n");
+		xe_dev = xe_device_get(drm_fd);
+		igt_require_f(xe_dev->eu_stall, "EU stall monitoring is not available/supported\n");
 
-		ret = igt_ioctl(drm_fd, DRM_IOCTL_XE_DEVICE_QUERY, &query);
-		igt_skip_on_f(ret == -1 && errno == ENODEV,
-			      "EU stall monitoring is not available on this platform\n");
-		igt_skip_on_f(ret == -1 && errno == EINVAL,
-			      "EU stall monitoring is not supported in the driver\n");
-		igt_assert_neq(query.size, 0);
-
-		query_eu_stall_data = malloc(query.size);
-		igt_assert(query_eu_stall_data);
-
-		query.data = to_user_pointer(query_eu_stall_data);
-		igt_assert_eq(igt_ioctl(drm_fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
-
+		query_eu_stall_data = xe_dev->eu_stall;
 		igt_assert(query_eu_stall_data->num_sampling_rates > 0);
 		/* If the user doesn't pass a sampling rate, use a mid sampling rate */
 		if (p_rate == 0) {
-- 
2.48.1

