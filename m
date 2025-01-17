Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 054AFC02183
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jan 2025 20:51:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5329810EB78;
	Fri, 17 Jan 2025 20:51:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ATnW/iGW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B98110EB78
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jan 2025 20:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737147109; x=1768683109;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sa2d4KdA1WebI9go7DOUxizlI/qZHel4v/Ly+fbKvQc=;
 b=ATnW/iGWLwAuGLUHrAJY3Ym+XYJwXdYcJ/uwce5ePh7X7ZT2ECPFKvqw
 S1uOj6mu57QZ8nQFtzNcanp3dVwvTaibWOclVC1+ccVtMPh/+wfAnIarz
 FeKzh996elsNIL5ZFTMX9GIqRk9aE0sGC8GVAOzzHu3u2Se9XOyxovqzC
 Fv/jH9mdHKQdpfzFNDjpePrFG5nyPwp7uBF2sSd67Nv2EyJNEag8LZEdP
 AtS8mpUrqnzpYaHJ5mqBrwoo1HftfT1xgU+6kXcUWfWcAhcGccuq8H8nn
 or3Thajah6ibmgBx9+6/Sy2dxorcHcvGg4XAak0J5cE+ss7FNTtO8iuWv Q==;
X-CSE-ConnectionGUID: 5JekC3WnS6myhuY1ngPRNQ==
X-CSE-MsgGUID: 1EDgXt/ZRkWbUcWqdkBU9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="36869559"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; d="scan'208";a="36869559"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 12:51:48 -0800
X-CSE-ConnectionGUID: oEWBZkoVQvGplrjrRLE/hA==
X-CSE-MsgGUID: dyJqZe5xQySf/JpukoFLvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; d="scan'208";a="110902930"
Received: from nakshtra-system-product-name.iind.intel.com ([10.145.169.86])
 by orviesa004.jf.intel.com with ESMTP; 17 Jan 2025 12:51:47 -0800
From: nakshtra.goyal@intel.com
To: igt-dev@lists.freedesktop.org,
	ramadevi.gandi@intel.com
Cc: pravalika.gurram@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_create: Check negative cases for
 exec_queue create/destroy ioctl
Date: Sat, 18 Jan 2025 02:23:19 +0530
Message-Id: <20250117205319.3359797-1-nakshtra.goyal@intel.com>
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

From: Nakshtra Goyal <nakshtra.goyal@intel.com>

Negetive test cases to check expected errors using invalid
flags, width, pad, reserved bits, num_placements, extensions, exec_queue_id

Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
---
 tests/intel/xe_create.c | 141 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 141 insertions(+)

diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index 07e11036d..edc2a6178 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -59,6 +59,123 @@ static int __create_bo(int fd, uint32_t vm, uint64_t size, uint32_t placement,
 	return ret;
 }
 
+/**
+ * TEST: Negative test for exec-queue create/destroy ioctl
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: Synchronization
+ * Functionality: exec-queue create
+ * Test category: negative test
+ */
+
+/**
+ * SUBTEST: invalid-flag
+ * Description: Check ioctl with invalid flag returns expected error code
+ *
+ * SUBTEST: exec-queue-create-invalid-reserved
+ * Description: Send query with invalid reserved value for exec_queue_destroy ioctl
+ *
+ * SUBTEST: invalid-width
+ * Description: Check query with invalid width returns expected error code
+ *
+ * SUBTEST: invalid-num-placements
+ * Description: Check query with invalid num-placements returns expected error code
+ *
+ * SUBTEST: invalid-extensions
+ * Description: Check query with invalid extensions returns expected error code
+ */
+
+static void invalid_flag(int fd)
+{
+	struct drm_xe_exec_queue_create create = {
+		.flags = -1,
+	};
+
+	do_ioctl_err(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create, EINVAL);
+}
+
+static void exec_queue_create_invalid_reserved(int fd)
+{
+	struct drm_xe_exec_queue_create create = {
+		.reserved[0] = 0xffff,
+	};
+
+	do_ioctl_err(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create, EINVAL);
+
+	create.reserved[0] = 0;
+	create.reserved[1] = 0xffff;
+	do_ioctl_err(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create, EINVAL);
+}
+
+static void invalid_width(int fd)
+{
+	struct drm_xe_exec_queue_create create = {
+		.width = 1,
+	};
+
+	do_ioctl_err(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create, EINVAL);
+}
+
+static void invalid_num_placements(int fd)
+{
+	struct drm_xe_exec_queue_create create = {
+		.num_placements = 1,
+	};
+
+	do_ioctl_err(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create, EINVAL);
+}
+
+static void invalid_extensions(int fd)
+{
+	struct drm_xe_exec_queue_create create = {
+		.extensions = -1,
+	};
+
+	do_ioctl_err(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create, EINVAL);
+}
+
+/**
+ * SUBTEST: invalid-pad
+ * Description: Check query with invalid pad returns expected error code
+ *
+ * SUBTEST: exec-queue-destroy-invalid-reserved
+ * Description: Send query with invalid reserved value for exec_queue_destroy ioctl
+ *
+ * SUBTEST: invalid-exec-queue-id
+ * Description: Check query with invalid exec_queue_id returns expected error code
+ */
+
+static void invalid_pad(int fd)
+{
+	struct drm_xe_exec_queue_destroy destroy = {
+		.pad = 1,
+	};
+
+	do_ioctl_err(fd, DRM_IOCTL_XE_EXEC_QUEUE_DESTROY, &destroy, EINVAL);
+}
+
+static void exec_queue_destroy_invalid_reserved(int fd)
+{
+	struct drm_xe_exec_queue_destroy destroy = {
+		.reserved[0] = 0xffff,
+	};
+
+	do_ioctl_err(fd, DRM_IOCTL_XE_EXEC_QUEUE_DESTROY, &destroy, EINVAL);
+
+	destroy.reserved[0] = 0;
+	destroy.reserved[1] = 0xffff;
+	do_ioctl_err(fd, DRM_IOCTL_XE_EXEC_QUEUE_DESTROY, &destroy, EINVAL);
+}
+
+static void invalid_exec_queue_id(int xe)
+{
+	struct drm_xe_exec_queue_destroy args = {
+		.exec_queue_id = 0xffff,
+	};
+
+	do_ioctl_err(xe, DRM_IOCTL_XE_EXEC_QUEUE_DESTROY, &args, ENOENT);
+}
+
 /**
  * SUBTEST: create-invalid-size
  * Functionality: ioctl
@@ -392,6 +509,30 @@ igt_main_args("Q:p:", NULL, help_str, opt_handler, NULL)
 	igt_fixture
 		xe = drm_open_driver(DRIVER_XE);
 
+	igt_subtest("invalid-flag")
+		invalid_flag(xe);
+
+	igt_subtest("exec-queue-create-invalid-reserved")
+		exec_queue_create_invalid_reserved(xe);
+
+	igt_subtest("invalid-width")
+		invalid_width(xe);
+
+	igt_subtest("invalid-num-placements")
+		invalid_num_placements(xe);
+
+	igt_subtest("invalid-extensions")
+		invalid_extensions(xe);
+
+	igt_subtest("invalid-pad")
+		invalid_pad(xe);
+
+	igt_subtest("exec-queue-destroy-invalid-reserved")
+		exec_queue_destroy_invalid_reserved(xe);
+
+	igt_subtest("invalid-exec-queue-id")
+		invalid_exec_queue_id(xe);
+
 	igt_subtest("create-invalid-mbz")
 		create_invalid_mbz(xe);
 
-- 
2.34.1

