Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC758D10F58
	for <igt-dev@archiver.kernel.org>; Wed, 26 Nov 2025 14:18:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DEFF10E632;
	Wed, 26 Nov 2025 14:18:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FzLQ4JMf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 000B310E632
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Nov 2025 14:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764166725; x=1795702725;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WjC4OOJ9QalFvUPZuOXZmYqLluRxB+lTYXUlXkBE/L0=;
 b=FzLQ4JMfz9rYA6TXvr6+7+0uddRAwtsMVgLLm7MIROvBVw6H4hSQZVNF
 SgBS0BmRDoKCM72Cqwg7r0JzJkQ2ADbAgzN8NjsSP/z9wrUz1tE1UWIFX
 vj8soHyXmDK5iC//iPAKU+3rmI3/e70TDY3Waw8vCIQNyOplcssI0tqcf
 aP+CkdeiCKu1QT8qvtHA5Q/n5bp/Gg5V4/S0YFg5Q+J/BBk/eLb7W0Jts
 bz67DeuXr7Q1o5J7DA4vdQ3OCvwF87U56Q7jkG4KKAR2oA4D1Ckaqx0Jw
 DCCrmbagSB7mhid/Sh8Q+HBMXe39tE/p7jeXK9HJXTeMgfE6ZjyW57mrc w==;
X-CSE-ConnectionGUID: 1KHXWI26TJmmMSHVc4rJpg==
X-CSE-MsgGUID: d04hAeBYSQOlcjWxVpNHIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="53772422"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="53772422"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 06:18:44 -0800
X-CSE-ConnectionGUID: JQBWILEBQuC5dKWhAPWoBA==
X-CSE-MsgGUID: zF7Lb43tTwO4usKqxTWeQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="192743640"
Received: from yadavs-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 06:18:43 -0800
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.auld@intel.com
Subject: [PATCH v2] tests/intel/xe_pat: Add subtest to validate NO_COMPRESSION
 flag
Date: Wed, 26 Nov 2025 19:46:35 +0530
Message-ID: <20251126141634.309190-2-sanjay.kumar.yadav@intel.com>
X-Mailer: git-send-email 2.52.0
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

Add bo-comp-disable-bind subtest to verify that a BO created with
DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION cannot be bind with a compressed
PAT index on Xe2+ (bind should fail with -EINVAL).

This ensures the flag works as intended to skip CCS operations and
related state management for such BOs.

v2: (Matt A)
- Added has_no_compression_hint() helper to query device capability
- Improved skip logic for unsupported platforms

Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
---
 .../drm-uapi-experimental/intel_drm_local.h   |  3 +
 tests/intel/xe_pat.c                          | 59 +++++++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/include/drm-uapi-experimental/intel_drm_local.h b/include/drm-uapi-experimental/intel_drm_local.h
index b48c9e219..9949d5350 100644
--- a/include/drm-uapi-experimental/intel_drm_local.h
+++ b/include/drm-uapi-experimental/intel_drm_local.h
@@ -20,6 +20,9 @@ extern "C" {
  * clean these up when kernel uapi headers are sync'd.
  */
 
+#define DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION (1 << 3)
+#define DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT (1 << 3)
+
 #if defined(__cplusplus)
 }
 #endif
diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 59dfb6b11..fe4238529 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -753,6 +753,62 @@ static void prime_external_import_coh(void)
 	drm_close_driver(fd2);
 }
 
+static bool has_no_compression_hint(int fd)
+{
+	struct drm_xe_query_config *config = xe_config(fd);
+
+	return config->info[DRM_XE_QUERY_CONFIG_FLAGS] &
+		DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT;
+}
+
+/**
+ * SUBTEST: bo-comp-disable-bind
+ * Test category: functionality test
+ * Description: Validates that binding a BO created with
+ * the NO_COMPRESSION flag using a compressed PAT index fails
+ * with -EINVAL on Xe2+ platforms.
+ */
+
+static void bo_comp_disable_bind(int fd)
+{
+	size_t size = xe_get_default_alignment(fd);
+	uint8_t comp_pat_index, uncomp_pat_index;
+	bool supported;
+	uint32_t vm, bo;
+	int ret;
+
+	supported = has_no_compression_hint(fd);
+	ret = __xe_bo_create_caching(fd, 0, size, vram_if_possible(fd, 0),
+				     DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION,
+				     DRM_XE_GEM_CPU_CACHING_WC, &bo);
+
+	if (!supported) {
+		igt_assert_neq(ret, 0);
+		igt_skip("Missing NO_COMPRESSION support, skipping.\n");
+	}
+
+	igt_assert_eq(ret, 0);
+	vm = xe_vm_create(fd, 0, 0);
+
+	comp_pat_index = intel_get_pat_idx_uc_comp(fd);
+	uncomp_pat_index = intel_get_pat_idx_uc(fd);
+
+	igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x100000,
+				   size, 0, 0, NULL, 0,
+				   0, comp_pat_index, 0),
+		      -EINVAL);
+
+	igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x100000,
+				   size, 0, 0, NULL, 0,
+				   0, uncomp_pat_index, 0),
+		      0);
+	xe_vm_unbind_sync(fd, vm, 0, 0x100000, size);
+
+	gem_close(fd, bo);
+
+	xe_vm_destroy(fd, vm);
+}
+
 /**
  * SUBTEST: display-vs-wb-transient
  * Test category: functionality test
@@ -1185,6 +1241,9 @@ igt_main_args("V", NULL, help_str, opt_handler, NULL)
 	igt_subtest("prime-external-import-coh")
 		prime_external_import_coh();
 
+	igt_subtest("bo-comp-disable-bind")
+		bo_comp_disable_bind(fd);
+
 	igt_subtest_with_dynamic("pat-index-xelp") {
 		igt_require(intel_graphics_ver(dev_id) <= IP_VER(12, 55));
 		subtest_pat_index_modes_with_regions(fd, xelp_pat_index_modes,
-- 
2.52.0

