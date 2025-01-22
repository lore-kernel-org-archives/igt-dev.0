Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2465BC02181
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jan 2025 21:04:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3D9D10E232;
	Wed, 22 Jan 2025 21:04:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ChES6DXb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8C2F10E75C
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jan 2025 21:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737579779; x=1769115779;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=M8b65S++YKifaNklKZ7y93iLWCyxueqHcSn221t8RDk=;
 b=ChES6DXb0CzBkho3K1aFev3Z0UtK8EVHFn8If1xDzqy3i5zUihtkMQHO
 SebUSCNWMDRb7AAndu1iPcLIaqMA4QzY/bTdQtvuI5/qnJGu5TBUjR0mb
 q4zkGndMLKETLr3kTXajMDhBI9MgEu4jq4RUf+w2ISXp7xsQa2txJW5me
 I3F4GTNP4Xl3D+kM+17oe7F6tpzKwPLdV3gSfeeoWBxd0KYT1aqj5+kRU
 nRF52aqqNvlSkZtZfp6iN10ZsL1eqf2ycI9o/n1mAXGrobKIxlKHwRY7J
 JombRCcTcF/+oaQ7LwixnUWvlmEtEK5kkd7AeNE2JVvvarra3gwn2xMN/ A==;
X-CSE-ConnectionGUID: /EU+xZr9SUOqxDRm3gAtOw==
X-CSE-MsgGUID: TgkveSH8SNK+/ryS5yB/zQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37943188"
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; d="scan'208";a="37943188"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 13:02:59 -0800
X-CSE-ConnectionGUID: EnM3ulNRTvG+UXfKhr5U4A==
X-CSE-MsgGUID: vslkFM2pRfiC5K4rd4jTVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111898842"
Received: from dut2949atsm.iind.intel.com ([10.49.63.13])
 by fmviesa005.fm.intel.com with ESMTP; 22 Jan 2025 13:02:56 -0800
From: nakshtra.goyal@intel.com
To: igt-dev@lists.freedesktop.org,
	ramadevi.gandi@intel.com
Cc: jonathan.cavitt@intel.com,
	kamil.konieczny@intel.com
Subject: [PATCH v2 i-g-t] tests/intel/xe_create: Check negative cases for
 exec_queue create/destroy ioctl
Date: Wed, 22 Jan 2025 21:02:55 +0000
Message-Id: <20250122210255.795600-1-nakshtra.goyal@intel.com>
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

v1: Combining width and numplacement test for len,
 adding width and numplacement in extension,
 change error type (Jonathan Cavitt)

Adding functionality inside subtest description and
 removing new added TEST section     (Kamil)

Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 tests/intel/xe_create.c | 137 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 137 insertions(+)

diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index 07e11036d..e3be6b774 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -59,6 +59,122 @@ static int __create_bo(int fd, uint32_t vm, uint64_t size, uint32_t placement,
 	return ret;
 }
 
+/**
+ * SUBTEST: invalid-flag
+ * Functionality: ioctl_input_validation
+ * Description: Check ioctl with invalid flag returns expected error code
+ *
+ * SUBTEST: exec-queue-create-invalid-reserved
+ * Functionality: ioctl_input_validation
+ * Description: Send query with invalid reserved value for exec_queue_destroy ioctl
+ *
+ * SUBTEST: invalid-len
+ * Functionality: ioctl_input_validation
+ * Description: Check query with invalid length returns expected error code
+ *
+ * SUBTEST: invalid-extensions
+ * Functionality: ioctl_input_validation
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
+static void invalid_len(int fd)
+{
+	struct drm_xe_exec_queue_create create = {
+		.width = 1,
+		.num_placements = 1,
+	};
+
+	create.width = 0;
+	do_ioctl_err(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create, EINVAL);
+	create.width = 1;
+
+	create.num_placements = 0;
+	do_ioctl_err(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create, EINVAL);
+	create.num_placements = 1;
+
+	create.width = 9;
+	create.num_placements = 9;
+	do_ioctl_err(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create, EINVAL);
+}
+
+static void invalid_extensions(int fd)
+{
+	struct drm_xe_exec_queue_create create = {
+		.width = 1,
+		.num_placements = 1,
+		.extensions = -1,
+	};
+
+	do_ioctl_err(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create, EFAULT);
+}
+
+/**
+ * SUBTEST: invalid-pad
+ * Functionality: ioctl_input_validation
+ * Description: Check query with invalid pad returns expected error code
+ *
+ * SUBTEST: exec-queue-destroy-invalid-reserved
+ * Functionality: ioctl_input_validation
+ * Description: Send query with invalid reserved value for exec_queue_destroy ioctl
+ *
+ * SUBTEST: invalid-exec-queue-id
+ * Functionality: ioctl_input_validation
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
@@ -392,6 +508,27 @@ igt_main_args("Q:p:", NULL, help_str, opt_handler, NULL)
 	igt_fixture
 		xe = drm_open_driver(DRIVER_XE);
 
+	igt_subtest("invalid-flag")
+		invalid_flag(xe);
+
+	igt_subtest("exec-queue-create-invalid-reserved")
+		exec_queue_create_invalid_reserved(xe);
+
+	igt_subtest("invalid-len")
+		invalid_len(xe);
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

