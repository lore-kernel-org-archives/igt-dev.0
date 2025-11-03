Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E1FDCCF9F8
	for <igt-dev@archiver.kernel.org>; Mon,  3 Nov 2025 14:36:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F014010E40D;
	Mon,  3 Nov 2025 14:36:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gS/wMktK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F168F10E40D
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Nov 2025 14:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762180572; x=1793716572;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Q+9QpvEVMiHTWLItvuvk2XVJuPQPb6MlvWi/dN6Y1Qo=;
 b=gS/wMktKSmGBOGRB2n8Xz+xsBkHdFc7vR20XV45lrMckHgXPsYmvNbmr
 xEtHxZEfUQbMi04i/n88ClAPrSUNCFQ9Ebl9DsAmOPWLmY3BiaPypz8Aq
 qy306JvYK4hBCWE9KXybf3NsWx4t9KdZM2wxFHsLLVqjHe69HgZoQggm7
 ls6qnN2cCqmas03JNgBFFpn5UOVaoRgxFTUGjcDYokFZG3yVdIUidq+du
 kfXYJDcsogBxTudlOgFu56sohEV8ZS7l4QFX4CxUo5f7wXb4fF7lUKqQO
 8QXNeH0+MKmqkcjEzX/JyMQaYqBxwtlYNQsgc/8cOSURspe/D81HSlo+X w==;
X-CSE-ConnectionGUID: YIYgXs9pQOWgwgDMt6AqkA==
X-CSE-MsgGUID: aOjx1rTMRfqiBfrPIeIr5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="63952647"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="63952647"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 06:36:12 -0800
X-CSE-ConnectionGUID: BXGTvZE2TrKORlK6CZbctg==
X-CSE-MsgGUID: bNIxExnJTY2qFaESyFo37g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="187195633"
Received: from sanjay-z690i-a-ultra-plus.iind.intel.com ([10.190.216.90])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 06:36:10 -0800
From: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.auld@intel.com
Subject: [PATCH] tests/intel/xe_pat: Add subtest to validate NO_COMPRESSION
 flag
Date: Mon,  3 Nov 2025 20:00:28 +0530
Message-ID: <20251103143027.2882191-2-sanjay.kumar.yadav@intel.com>
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

Add bo-comp-disable-bind subtest to verify that a BO created with
DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION cannot be bind with a compressed
PAT index on Xe2+ (bind should fail with -EINVAL).

This ensures the flag works as intended to skip CCS operations and
related state management for such BOs.

Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
---
 .../drm-uapi-experimental/intel_drm_local.h   |  2 +
 tests/intel/xe_pat.c                          | 53 +++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/include/drm-uapi-experimental/intel_drm_local.h b/include/drm-uapi-experimental/intel_drm_local.h
index b48c9e219..fc2aaa462 100644
--- a/include/drm-uapi-experimental/intel_drm_local.h
+++ b/include/drm-uapi-experimental/intel_drm_local.h
@@ -20,6 +20,8 @@ extern "C" {
  * clean these up when kernel uapi headers are sync'd.
  */
 
+#define DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION (1 << 3)
+
 #if defined(__cplusplus)
 }
 #endif
diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 169405799..5179c63fd 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -785,6 +785,56 @@ static void prime_external_import_coh(void)
 	drm_close_driver(fd2);
 }
 
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
+	uint32_t devid = intel_get_drm_devid(fd);
+	uint8_t comp_pat_index, uncomp_pat_index;
+	uint32_t vm, bo;
+	int ret;
+
+	ret = __xe_bo_create_caching(fd, 0, size, vram_if_possible(fd, 0),
+				     DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION,
+				     DRM_XE_GEM_CPU_CACHING_WC, &bo);
+
+	if (ret) {
+		igt_assert(intel_graphics_ver(devid) < IP_VER(20, 0));
+		igt_assert_eq(ret, -EOPNOTSUPP);
+		return;
+	}
+
+	igt_assert(intel_graphics_ver(devid) >= IP_VER(20, 0));
+	vm = xe_vm_create(fd, 0, 0);
+
+	comp_pat_index = intel_get_pat_idx_uc_comp(fd);
+	uncomp_pat_index = intel_get_pat_idx_uc(fd);
+
+	/* Expect failure when binding with compressed PAT index */
+	igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x100000,
+				   size, 0, 0, NULL, 0,
+				   0, comp_pat_index, 0),
+		      -EINVAL);
+
+	/* Expect success when binding with uncompressed PAT index */
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
@@ -1451,6 +1501,9 @@ igt_main_args("V", NULL, help_str, opt_handler, NULL)
 	igt_subtest("prime-external-import-coh")
 		prime_external_import_coh();
 
+	igt_subtest("bo-comp-disable-bind")
+		bo_comp_disable_bind(fd);
+
 	igt_subtest_with_dynamic("pat-index-xelp") {
 		igt_require(intel_graphics_ver(dev_id) <= IP_VER(12, 55));
 		subtest_pat_index_modes_with_regions(fd, xelp_pat_index_modes,
-- 
2.43.0

