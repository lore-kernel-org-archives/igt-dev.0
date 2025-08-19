Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59000CA0EF5
	for <igt-dev@archiver.kernel.org>; Tue, 19 Aug 2025 00:56:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C505C10E09B;
	Tue, 19 Aug 2025 00:56:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cG7jnElL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 939B510E09B
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Aug 2025 00:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755564993; x=1787100993;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=J7r4Q8bqz+RLcYfc/niN3u0nKer8eTFyAoRWu3EiqUg=;
 b=cG7jnElLz2DCYG/TuSQukEJtDw1novxI6HQN/ts2tPQfB2/w3sOiX80T
 JNvM+hKskQQSKEJbNj3FpDMEGpUv4TmgTZggDRQjG9m2H9p+ft84AGwmI
 xwt9RZtXWmnLh+AUsGtLcdbQU5fheSFbOFDL7e9IxFXVQzV3HPtAFKPfj
 eIGughBBW6IGSzpMKNWRyviK54MQWouRR2p7oYSXY+Knv3l7zfuQTDcO3
 HN1n4w8q7zj0t+4k80K0hEBg8AsJhJvkpLSmlCwfO8e4zTV2QTijJX/3V
 6S592MqwSPXNfQvCxWU0KZqFPwLhh6/0Aw9/3/NAryxjgSDfDYb3/P9BD g==;
X-CSE-ConnectionGUID: Csys+mQQTVCi0PYsshdaUg==
X-CSE-MsgGUID: AzmX4+oRTFCgB1xS+Hh9Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="75251641"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="75251641"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 17:56:33 -0700
X-CSE-ConnectionGUID: ULhG8o88S0+ZDBE2oSmOcw==
X-CSE-MsgGUID: fqd46S9WQSCIquE9HmPPUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="173058568"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 17:56:32 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH i-g-t 1/2] lib/xe/xe_query: move PXP query functions to common
 file
Date: Mon, 18 Aug 2025 17:56:23 -0700
Message-ID: <20250819005622.2970399-3-daniele.ceraolospurio@intel.com>
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

We already have a few tests using the PXP query functions and a new one
will be added in the next patch, so move the code to the common query
file to reduce duplication.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 lib/xe/xe_query.c    | 81 ++++++++++++++++++++++++++++++++++++++++++++
 lib/xe/xe_query.h    |  2 ++
 tests/intel/xe_pxp.c | 61 +++------------------------------
 tests/intel/xe_vm.c  | 13 +------
 4 files changed, 88 insertions(+), 69 deletions(-)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index 3b8a682f8..920c20b06 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -996,6 +996,87 @@ uint32_t *xe_hwconfig_lookup_value(int fd, enum intel_hwconfig attribute, uint32
 	return NULL;
 }
 
+/**
+ * xe_query_pxp_status:
+ * @fd: xe device fd
+ *
+ * Returns the PXP status value if PXP is supported, a negative errno otherwise.
+ * See DRM_XE_DEVICE_QUERY_PXP_STATUS documentation for the possible errno
+ * values and their meaning.
+ */
+int xe_query_pxp_status(int fd)
+{
+	struct drm_xe_query_pxp_status *pxp_query;
+	struct drm_xe_device_query query = {
+		.extensions = 0,
+		.query = DRM_XE_DEVICE_QUERY_PXP_STATUS,
+		.size = 0,
+		.data = 0,
+	};
+	int ret;
+
+	if (igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query))
+		return -errno;
+
+	pxp_query = malloc(query.size);
+	igt_assert(pxp_query);
+	memset(pxp_query, 0, query.size);
+
+	query.data = to_user_pointer(pxp_query);
+
+	if (igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query))
+		ret = -errno;
+	else
+		ret = pxp_query->status;
+
+	free(pxp_query);
+
+	return ret;
+}
+
+/**
+ * xe_wait_for_pxp_init:
+ * @fd: xe device fd
+ *
+ * Returns 0 once PXP is initialized and ready, -EINVAL if PXP is not supported
+ * in the kernel, -ENODEV if PXP is not supported in HW. This function asserts
+ * if something went wrong during PXP initialization.
+ */
+int xe_wait_for_pxp_init(int fd)
+{
+	int pxp_status;
+	int i = 0;
+
+	/* PXP init completes after driver init, so we might have to wait for it */
+	while (i++ < 50) {
+		pxp_status = xe_query_pxp_status(fd);
+
+		/*
+		 * -EINVAL and -ENODEV are both valid return values and they
+		 * respectively indicate that the the PXP interface is not
+		 * available (i.e., kernel too old) and that PXP is not
+		 * supported or disabled in HW.
+		 */
+		if (pxp_status == -EINVAL || pxp_status == -ENODEV)
+			return pxp_status;
+
+		/* status 1 means pxp is ready */
+		if (pxp_status == 1)
+			return 0;
+
+		/*
+		 * 0 means init still in progress, any other remaining state
+		 * is an unexpected error
+		 */
+		igt_assert_eq(pxp_status, 0);
+
+		usleep(50*1000);
+	}
+
+	igt_assert_f(0, "PXP failed to initialize within the timeout\n");
+	return -ETIMEDOUT;
+}
+
 igt_constructor
 {
 	xe_device_cache_init();
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index cc54ec956..32917991d 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -130,6 +130,8 @@ bool xe_has_media_gt(int fd);
 bool xe_is_media_gt(int fd, int gt);
 uint16_t xe_gt_get_tile_id(int fd, int gt);
 uint32_t *xe_hwconfig_lookup_value(int fd, enum intel_hwconfig attribute, uint32_t *len);
+int xe_query_pxp_status(int fd);
+int xe_wait_for_pxp_init(int fd);
 
 struct xe_device *xe_device_get(int fd);
 void xe_device_put(int fd);
diff --git a/tests/intel/xe_pxp.c b/tests/intel/xe_pxp.c
index 9eddc03fc..98f06ae13 100644
--- a/tests/intel/xe_pxp.c
+++ b/tests/intel/xe_pxp.c
@@ -105,67 +105,14 @@ static uint32_t create_regular_rcs_queue(int fd, uint32_t vm)
 	return xe_exec_queue_create(fd, vm, &inst, 0);
 }
 
-static int query_pxp_status(int fd)
-{
-	struct drm_xe_query_pxp_status *pxp_query;
-	struct drm_xe_device_query query = {
-		.extensions = 0,
-		.query = DRM_XE_DEVICE_QUERY_PXP_STATUS,
-		.size = 0,
-		.data = 0,
-	};
-	int ret;
-
-	if (igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query))
-		return -errno;
-
-	pxp_query = malloc(query.size);
-	igt_assert(pxp_query);
-	memset(pxp_query, 0, query.size);
-
-	query.data = to_user_pointer(pxp_query);
-
-	if (igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query))
-		ret = -errno;
-	else
-		ret = pxp_query->status;
-
-	free(pxp_query);
-
-	return ret;
-}
-
 static bool is_pxp_hw_supported(int fd)
 {
-	int pxp_status;
-	int i = 0;
-
-	/* PXP init completes after driver init, so we might have to wait for it */
-	while (i++ < 50) {
-		pxp_status = query_pxp_status(fd);
-
-		/* -EINVAL means the PXP interface is not available */
-		igt_require(pxp_status != -EINVAL);
-
-		/* -ENODEV means PXP not supported or disabled */
-		if (pxp_status == -ENODEV)
-			return false;
+	int ret = xe_wait_for_pxp_init(fd);
 
-		/* status 1 means pxp is ready */
-		if (pxp_status == 1)
-			return true;
-
-		/*
-		 * 0 means init still in progress, any other remaining state
-		 * is an error
-		 */
-		igt_assert_eq(pxp_status, 0);
-
-		usleep(50*1000);
-	}
+	/* -EINVAL means the PXP interface is not available */
+	igt_require(ret != -EINVAL);
 
-	igt_assert_f(0, "PXP failed to initialize within the timeout\n");
-	return false;
+	return ret == 0;
 }
 
 /**
diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 3ce54053c..90bd2722b 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -2177,18 +2177,7 @@ test_mmap_style_bind(int fd, struct drm_xe_engine_class_instance *eci,
 
 static bool pxp_interface_supported(int fd)
 {
-	struct drm_xe_device_query query = {
-		.extensions = 0,
-		.query = DRM_XE_DEVICE_QUERY_PXP_STATUS,
-		.size = 0,
-		.data = 0,
-	};
-	int ret = 0;
-
-	if (igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query))
-		ret = -errno;
-
-	return ret != -EINVAL;
+	return xe_query_pxp_status(fd) != -EINVAL;
 }
 
 /**
-- 
2.43.0

