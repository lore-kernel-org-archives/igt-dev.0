Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60110E9DE6F
	for <igt-dev@archiver.kernel.org>; Thu,  9 Apr 2026 09:39:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15E6810E6F0;
	Thu,  9 Apr 2026 09:39:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ocz4g/mi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67DCC10E6E9
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2026 09:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775727528; x=1807263528;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wH1l/XBFnrxsnW41bP52CA77dVDfSAcIoIFXXHPhkj8=;
 b=Ocz4g/misTlfzD95aRf+F1pzQgMQdeV57UmO/K3bzBfZ0vlmwBds9G2E
 QUU2jpohY4p+DH/hHvXLirEn83k41Jda1Bizo6mPMVaQhYKr/aOQcgvzD
 ZKeTs+KpyEt2lxTjxbWymFIu7FMbPtuvPC+SFMoLeNeNsJIILqjVm9z9L
 pVBRNPQlm2w9P1xk9AQDOC8ip/vtaULYzZxwTK1/W+vlnjWn51jsSCKuo
 7W+Qssg4n4OvrBSHP0wZYQ6oGP6quRTDeQnI0jsTAzj58pek22ONGZOz6
 sYncw8JAuJ7rlCVFAEgHcyTlHXmMhOvkrpIGT7AW0UNBwDjcvd317Rvsd w==;
X-CSE-ConnectionGUID: Q+stAvk9RNKINLQ9qGN3eg==
X-CSE-MsgGUID: fXc4mGLfTuGxLJS+z7r2yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="76798826"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="76798826"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 02:38:48 -0700
X-CSE-ConnectionGUID: b8/xa7cNSVOYpzAD9xFtfA==
X-CSE-MsgGUID: ZvL8M/8PThSiG6mWGwpNBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208";a="230391545"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 02:38:47 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: arun.r.murthy@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 3/3] RFC: tests/kms_atomic_error_code: Add tests for
 atomic failure reporting
Date: Thu,  9 Apr 2026 15:06:39 +0530
Message-ID: <20260409093639.27449-4-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409093639.27449-1-jeevan.b@intel.com>
References: <20260409093639.27449-1-jeevan.b@intel.com>
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

This test validates that, when supported by the kernel, atomic commit
failures that occur during state validation return meaningful failure
codes instead of only -EINVAL. The test checks common failure classes
such as invalid API usage, async property changes, full modeset
requirements, and bandwidth-related limitations.

The test requires DRM_CAP_ATOMIC_ERROR_REPORTING and is skipped entirely
when the capability is not exposed by the driver. Subtests that depend
on optional or hardware-specific behavior skip gracefully when the
kernel does not reach the relevant validation stage.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_atomic_error.c | 156 +++++++++++++++++++++++++++++++++++++++
 tests/meson.build        |   1 +
 2 files changed, 157 insertions(+)
 create mode 100644 tests/kms_atomic_error.c

diff --git a/tests/kms_atomic_error.c b/tests/kms_atomic_error.c
new file mode 100644
index 000000000..fe62d2ce0
--- /dev/null
+++ b/tests/kms_atomic_error.c
@@ -0,0 +1,156 @@
+/**
+ * TEST: kms_atomic_error_code
+ * Category: KMS
+ * Functionality: Atomic
+ * Mega-feature: Atomic error reporting
+ *
+ * SUBTEST: invalid-api-usage
+ * Description: Verify that invalid atomic API usage is reported with
+ * 		DRM_MODE_ATOMIC_INVALID_API_USAGE.
+ *
+ * SUBTEST: need-full-modeset
+ * Description: Verify that atomic commits which require a full modeset
+ * 		are reported with DRM_MODE_ATOMIC_NEED_FULL_MODESET.
+ *
+ * SUBTEST: async-prop-changed
+ * Description: Verify that modifying non async-safe properties in an
+ * 		async atomic commit is reported with
+ * 		DRM_MODE_ATOMIC_ASYNC_PROP_CHANGED.
+ *
+ * SUBTEST: bandwidth-errors
+ * Description: Verify that atomic commit failures caused by bandwidth or
+ * 		resource limitations are reported using one of the
+ * 		bandwidth-related atomic failure codes.
+ */
+
+#include <errno.h>
+#include <string.h>
+#include <unistd.h>
+
+#include "igt.h"
+#include "drm.h"
+#include "drmtest.h"
+#include "ioctl_wrappers.h"
+
+IGT_TEST_DESCRIPTION("Validate DRM atomic failure error codes");
+
+typedef struct {
+	int drm_fd;
+} data_t;
+
+static void init_atomic_ioc(struct drm_mode_atomic *ioc,
+			    struct drm_mode_atomic_err_code *err)
+{
+	memset(ioc, 0, sizeof(*ioc));
+	memset(err, 0, sizeof(*err));
+
+	ioc->reserved = to_user_pointer(err);
+}
+
+static void test_invalid_api_usage(data_t *data)
+{
+	struct drm_mode_atomic ioc;
+	struct drm_mode_atomic_err_code err;
+
+	init_atomic_ioc(&ioc, &err);
+
+	ioc.flags = 0xdeadbeef;
+
+	do_ioctl_err(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EINVAL);
+
+	igt_assert_eq(err.failure_code,
+		      DRM_MODE_ATOMIC_INVALID_API_USAGE);
+}
+
+static void test_need_full_modeset(data_t *data)
+{
+	struct drm_mode_atomic ioc;
+	struct drm_mode_atomic_err_code err;
+	int ret;
+
+	init_atomic_ioc(&ioc, &err);
+
+	ret = drmIoctl(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
+
+	if (ret == 0)
+		igt_skip("Atomic commit succeeded; full modeset not required\n");
+
+	igt_assert_eq(err.failure_code,
+		      DRM_MODE_ATOMIC_NEED_FULL_MODESET);
+}
+
+static void test_async_prop_changed(data_t *data)
+{
+	struct drm_mode_atomic ioc;
+	struct drm_mode_atomic_err_code err;
+
+	igt_require(igt_has_drm_cap(data->drm_fd,
+		    DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP));
+
+	init_atomic_ioc(&ioc, &err);
+
+	ioc.flags = DRM_MODE_ATOMIC_NONBLOCK;
+
+	do_ioctl_err(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, EINVAL);
+
+	igt_assert_eq(err.failure_code,
+		      DRM_MODE_ATOMIC_ASYNC_PROP_CHANGED);
+}
+
+static void test_bandwidth_errors(data_t *data)
+{
+	struct drm_mode_atomic ioc;
+	struct drm_mode_atomic_err_code err;
+	int ret;
+
+	init_atomic_ioc(&ioc, &err);
+
+	ret = drmIoctl(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
+
+	if (ret == 0)
+		igt_skip("Platform satisfies bandwidth constraints\n");
+
+	switch (err.failure_code) {
+		case DRM_MODE_ATOMIC_SCANOUT_BW:
+		case DRM_MODE_ATTOMIC_CONNECTOR_BW:
+		case DRM_MODE_ATTOMIC_PIPE_BW:
+		case DRM_MODE_ATOMIC_MEMORY_DOMAIN:
+			break;
+		default:
+			igt_assert_f(false,
+				     "Unexpected atomic failure code: %llu\n",
+				     err.failure_code);
+	}
+}
+
+int igt_main()
+{
+	data_t data = {};
+
+	igt_fixture() {
+		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
+
+		igt_require_f(
+				igt_has_drm_cap(data.drm_fd,
+						DRM_CAP_ATOMIC_ERROR_REPORTING),
+						"DRM atomic error code reporting not supported\n");
+	}
+
+	igt_subtest("invalid-api-usage")
+		test_invalid_api_usage(&data);
+
+	igt_subtest("need-full-modeset")
+		test_need_full_modeset(&data);
+
+	igt_subtest("async-prop-changed")
+		test_async_prop_changed(&data);
+
+	igt_subtest("bandwidth-errors")
+		test_bandwidth_errors(&data);
+
+	igt_fixture() {
+		close(data.drm_fd);
+	}
+
+	igt_exit();
+}
diff --git a/tests/meson.build b/tests/meson.build
index 26d9345ec..1bb50ef96 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -21,6 +21,7 @@ test_progs = [
 	'kms_addfb_basic',
 	'kms_async_flips',
 	'kms_atomic',
+        'kms_atomic_error',
 	'kms_atomic_interruptible',
 	'kms_atomic_transition',
 	'kms_bw',
-- 
2.43.0

