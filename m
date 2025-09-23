Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82233CAC5AC
	for <igt-dev@archiver.kernel.org>; Tue, 23 Sep 2025 16:49:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3913E10E1FF;
	Tue, 23 Sep 2025 16:49:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GF7xMrox";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDB0910E1FF
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Sep 2025 16:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758646171; x=1790182171;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:reply-to:mime-version: content-transfer-encoding;
 bh=itGRAM0ycD/mW4p6vEd2yPjrf35wZ43+8lET90cWP0o=;
 b=GF7xMrox4wBonOG//UIDqLBhXJnVI/Ob7BS00Upa1vAo76Qhc+KmURFL
 GJymxPRTf0LMTBz6YZy+xlI9yS/3DkMwHomqMxga/j4st7ToM9XLaZkYr
 NgGHKEkEhDTtBDJG3jjgmWI7/gyjOmESsj2jx3wUkbno3dar7K0jOroDJ
 Ksqktpunj2iyT1vj+XhiPtNbfXtwEEGWcdyUM4YZVulNLUOPPG1RDx8EQ
 usgC3alxZwP+NLyDTRodJywBkHIvfvcuYz+8R0NtEttBPqwLclXt+NzlE
 /kOHYRVgN7mA99X/KHQDqBsZaXr4340tn1YIPVB8plMCmpqdPOFvPqApz g==;
X-CSE-ConnectionGUID: 5HTYQibrSc+cZ++U0Q3uIw==
X-CSE-MsgGUID: 03GWijvOQFCg9B4lK3hUtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60149113"
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; d="scan'208";a="60149113"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 09:49:31 -0700
X-CSE-ConnectionGUID: Rr/oU+M0SD+hHs/kkZ8Otw==
X-CSE-MsgGUID: 8oD960N5SWC0imUaFfWiwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; d="scan'208";a="200510936"
Received: from bfilipch-desk.jf.intel.com ([10.88.27.152])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 09:49:30 -0700
From: Julia Filipchuk <julia.filipchuk@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [i-g-t,1/2] lib/xe/xe_query: move PXP query functions to common file
Date: Tue, 23 Sep 2025 09:48:58 -0700
Message-ID: <20250819005622.2970399-3-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923164912.763020-2-julia.filipchuk@intel.com>
References: <20250923164912.763020-2-julia.filipchuk@intel.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
X-Patchwork-Id: 669221
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
Reply-To: 20250819005622.2970399-3-daniele.ceraolospurio@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <20250923164858.ERZKHK8MaOOxyLG_OvW4iYvFzWKcZmL-2HlAIzNTey0@z>

From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

We already have a few tests using the PXP query functions and a new one
will be added in the next patch, so move the code to the common query
file to reduce duplication.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
Sending patches again to retrigger CI.
Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>

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

