Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C13C021BE
	for <igt-dev@archiver.kernel.org>; Thu, 27 Feb 2025 12:14:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 387B910EAC3;
	Thu, 27 Feb 2025 12:14:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mohvk6E0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E097A10EAC3
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Feb 2025 12:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740658468; x=1772194468;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CMf+D/l/eChHpu1qV9H7TNLaZG+mMD3C4hVIlP3KC0o=;
 b=Mohvk6E0TVUsVpHqIwB+FyrtjGzpnZv7I5lxS+3ODmvz4GEElRhU+Sjc
 6YAWzFCU8TWnX3H3XGdkpbcL+u+sJ3tMP+8v2YfsfPfdva4Q+hD//dt1t
 YHNzGt6TJqfbeaYAvMteflVVRqYr23wKjsmeDPppnxR6HNkNcreQOeAL7
 3bmNSNkfXVnpfA6ypPp1F1opgBvbOSZowmtLcfXhLM7n7ToSiQaiBnJ1O
 ezbqw8M2jn+5YgriNj4YE9AvBxpohLu1BiyLeFyNyPrPQckv+yW/wrnwy
 9LZzzQaOJusqoPKiVBXaywFVn2VB8pIC9/VOEdbKxKdWQHHDloC3TnYgK g==;
X-CSE-ConnectionGUID: uqnWjQj4Tz6hvSdn5jIEGA==
X-CSE-MsgGUID: 2Yov0DrvSpmLc7xWFBgXtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="58961729"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="58961729"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 04:14:28 -0800
X-CSE-ConnectionGUID: 47Y/6mUKQ0iu0kuqn7QJdA==
X-CSE-MsgGUID: r7C762rRQVaHog0dZRXP1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="122021599"
Received: from unknown (HELO tejas-super-server..) ([10.190.239.37])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 04:14:27 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.auld@intel.com,
	Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_create: Add test for low latency hint
 support
Date: Thu, 27 Feb 2025 17:51:17 +0530
Message-Id: <20250227122117.711646-1-tejas.upadhyay@intel.com>
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

KMD introduced low latency hint support for GT frequency
to guc. Lets add test to validate the feature support.

KMD patch:https://patchwork.freedesktop.org/patch/639677/

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 .../drm-uapi-experimental/intel_drm_local.h   |  3 ++
 tests/intel/xe_create.c                       | 32 +++++++++++++++++++
 tests/intel/xe_query.c                        |  3 ++
 3 files changed, 38 insertions(+)

diff --git a/include/drm-uapi-experimental/intel_drm_local.h b/include/drm-uapi-experimental/intel_drm_local.h
index 40e8dcc43..3aaf1eeb9 100644
--- a/include/drm-uapi-experimental/intel_drm_local.h
+++ b/include/drm-uapi-experimental/intel_drm_local.h
@@ -22,6 +22,9 @@ extern "C" {
 
 #define DRM_XE_MMAP_OFFSET_FLAG_PCI_BARRIER	(1 << 0)
 
+#define DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT      (1 << 0)
+#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY        (1 << 1)
+
 #if defined(__cplusplus)
 }
 #endif
diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index e3ebb9fd4..b22084c84 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -59,6 +59,35 @@ static int __create_bo(int fd, uint32_t vm, uint64_t size, uint32_t placement,
 	return ret;
 }
 
+/**
+ * SUBTEST: valid-flag
+ * Functionality: ioctl_input_validation
+ * Description: Check ioctl with valid flag returns expected pass if supported
+ */
+static void valid_flag(int fd)
+{
+	uint32_t vm;
+	struct drm_xe_query_config *config = xe_config(fd);
+	struct drm_xe_exec_queue_create create = {
+		.flags = DRM_XE_EXEC_QUEUE_LOW_LATENCY_HINT,
+		.extensions = 0,
+		.vm_id = 0,
+		.width = 1,
+		.num_placements = 1,
+		.instances = to_user_pointer(&xe_engine(fd, 0)->instance),
+	};
+
+	igt_assert_neq(config->info[DRM_XE_QUERY_CONFIG_FLAGS] &
+			DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY, 0);
+
+	vm = xe_vm_create(fd, 0, 0);
+	create.vm_id = vm;
+
+	do_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create);
+	xe_exec_queue_destroy(fd, create.exec_queue_id);
+	xe_vm_destroy(fd, vm);
+}
+
 /**
  * SUBTEST: invalid-flag
  * Functionality: ioctl_input_validation
@@ -503,6 +532,9 @@ igt_main_args("Q:p:", NULL, help_str, opt_handler, NULL)
 	igt_fixture
 		xe = drm_open_driver(DRIVER_XE);
 
+	igt_subtest("valid-flag")
+		valid_flag(xe);
+
 	igt_subtest("invalid-flag")
 		invalid_flag(xe);
 
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 1566680e7..e93988c49 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -533,6 +533,9 @@ test_query_config(int fd)
 	igt_info("  DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM\t%s\n",
 		config->info[DRM_XE_QUERY_CONFIG_FLAGS] &
 		DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM ? "ON":"OFF");
+	igt_info("  DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY\t%s\n",
+		 config->info[DRM_XE_QUERY_CONFIG_FLAGS] &
+		 DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY ? "ON":"OFF");
 	igt_info("DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT\t\t%#llx\n",
 		config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT]);
 	igt_info("DRM_XE_QUERY_CONFIG_VA_BITS\t\t\t%llu\n",
-- 
2.34.1

