Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF9FE77182
	for <igt-dev@archiver.kernel.org>; Thu, 12 Dec 2024 00:18:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D5010EC91;
	Thu, 12 Dec 2024 00:18:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YzBYdFhM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1BAC10EC8B
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Dec 2024 00:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733962723; x=1765498723;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=grn69ZExSN7ly4XJlgA9bowuSTIvJ76DrKQcQJUvc3g=;
 b=YzBYdFhMHiatdn4EDqMNbP3IRpbOf3yNCm/ctC5Fes8cEVxArNRHxy2Z
 mMDt6wjXVSreeCI2BQxdqIQtaAny77cqZuECMyMgQEs8e/pQ3mjRd/IXx
 2/PvlhZwXZfXKToGvhXRsw2p7iQRlyKNiIDI8Kz+cTwyZzEg++dUxj0RN
 UUkBv5XxCOZffBovVNV9llNC1TBN+f/QKxfXgMaXD2HVUGn/JyWW+mOJN
 voxEJedc7S0vhrqiAN82mvTkJky9FqlTECv1OKO7vOqWiWoerip0YETZW
 lB2M+fb3Fx9A+K/x1sUQnqw2LYyYZ8nE1KN88n3FX6KjOQB9gKe2kkQWF A==;
X-CSE-ConnectionGUID: UKphT6oJQwOvH0w402bQzQ==
X-CSE-MsgGUID: 2T4+xGhoQiOTNMHy8Epm1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="45040482"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="45040482"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 16:18:42 -0800
X-CSE-ConnectionGUID: +6h1mm0DSN2Z/Qf13G53og==
X-CSE-MsgGUID: DZa0u2pwQH27aOKvTbIC4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; d="scan'208";a="126840876"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 16:18:42 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH i-g-t 4/7] tests/intel/xe_pxp: Add PXP object and queue
 creation tests
Date: Wed, 11 Dec 2024 16:18:25 -0800
Message-ID: <20241212001829.2082490-5-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241212001829.2082490-1-daniele.ceraolospurio@intel.com>
References: <20241212001829.2082490-1-daniele.ceraolospurio@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

PXP support introduces new SET_PROPERTY extensions to both BOs and
exec_queues to mark them as being used for PXP workloads, so we need to
test both correct and incorrect usage of those new interfaces.

Since this is the first usage of extensions for BO creation, the
common BO code has been update to support the extra parameter.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 lib/xe/xe_ioctl.c     |  14 +--
 lib/xe/xe_ioctl.h     |   2 +-
 tests/intel/xe_mmap.c |   1 +
 tests/intel/xe_pxp.c  | 201 ++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build     |   1 +
 5 files changed, 213 insertions(+), 6 deletions(-)
 create mode 100644 tests/intel/xe_pxp.c

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 6d8388918..01ab7c758 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -264,7 +264,8 @@ static bool vram_selected(int fd, uint32_t selected_regions)
 }
 
 static uint32_t ___xe_bo_create(int fd, uint32_t vm, uint64_t size, uint32_t placement,
-				uint32_t flags, uint16_t cpu_caching, uint32_t *handle)
+				uint32_t flags, uint16_t cpu_caching, void *ext,
+				uint32_t *handle)
 {
 	struct drm_xe_gem_create create = {
 		.vm_id = vm,
@@ -275,6 +276,9 @@ static uint32_t ___xe_bo_create(int fd, uint32_t vm, uint64_t size, uint32_t pla
 	};
 	int err;
 
+	if (ext)
+		create.extensions = to_user_pointer(ext);
+
 	/*
 	 * In case vram_if_possible returned system_memory,
 	 * visible VRAM cannot be requested through flags
@@ -292,11 +296,11 @@ static uint32_t ___xe_bo_create(int fd, uint32_t vm, uint64_t size, uint32_t pla
 }
 
 uint32_t __xe_bo_create(int fd, uint32_t vm, uint64_t size, uint32_t placement,
-			uint32_t flags, uint32_t *handle)
+			uint32_t flags, void *ext, uint32_t *handle)
 {
 	uint16_t cpu_caching = __xe_default_cpu_caching(fd, placement, flags);
 
-	return ___xe_bo_create(fd, vm, size, placement, flags, cpu_caching, handle);
+	return ___xe_bo_create(fd, vm, size, placement, flags, cpu_caching, ext, handle);
 }
 
 uint32_t xe_bo_create(int fd, uint32_t vm, uint64_t size, uint32_t placement,
@@ -304,7 +308,7 @@ uint32_t xe_bo_create(int fd, uint32_t vm, uint64_t size, uint32_t placement,
 {
 	uint32_t handle;
 
-	igt_assert_eq(__xe_bo_create(fd, vm, size, placement, flags, &handle), 0);
+	igt_assert_eq(__xe_bo_create(fd, vm, size, placement, flags, NULL, &handle), 0);
 
 	return handle;
 }
@@ -312,7 +316,7 @@ uint32_t xe_bo_create(int fd, uint32_t vm, uint64_t size, uint32_t placement,
 uint32_t __xe_bo_create_caching(int fd, uint32_t vm, uint64_t size, uint32_t placement,
 				uint32_t flags, uint16_t cpu_caching, uint32_t *handle)
 {
-	return ___xe_bo_create(fd, vm, size, placement, flags, cpu_caching, handle);
+	return ___xe_bo_create(fd, vm, size, placement, flags, cpu_caching, NULL, handle);
 }
 
 uint32_t xe_bo_create_caching(int fd, uint32_t vm, uint64_t size, uint32_t placement,
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index 18cc2b72b..c8a2d81c5 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -67,7 +67,7 @@ void xe_vm_unbind_all_async(int fd, uint32_t vm, uint32_t exec_queue,
 			    uint32_t num_syncs);
 void xe_vm_destroy(int fd, uint32_t vm);
 uint32_t __xe_bo_create(int fd, uint32_t vm, uint64_t size, uint32_t placement,
-			uint32_t flags, uint32_t *handle);
+			uint32_t flags, void *ext, uint32_t *handle);
 uint32_t xe_bo_create(int fd, uint32_t vm, uint64_t size, uint32_t placement,
 		      uint32_t flags);
 uint32_t __xe_bo_create_caching(int fd, uint32_t vm, uint64_t size, uint32_t placement,
diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
index d818cc2f8..9f72cf2da 100644
--- a/tests/intel/xe_mmap.c
+++ b/tests/intel/xe_mmap.c
@@ -168,6 +168,7 @@ static void test_small_bar(int fd)
 	igt_assert_neq(__xe_bo_create(fd, 0, visible_size + page_size,
 				      vram_memory(fd, 0),
 				      DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
+				      NULL,
 				      &bo),
 		       0);
 
diff --git a/tests/intel/xe_pxp.c b/tests/intel/xe_pxp.c
new file mode 100644
index 000000000..cfe118a1a
--- /dev/null
+++ b/tests/intel/xe_pxp.c
@@ -0,0 +1,201 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include "igt.h"
+#include "xe_drm.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+
+IGT_TEST_DESCRIPTION("Test PXP that manages protected content through arbitrated HW-PXP-session");
+/* Note: PXP = "Protected Xe Path" */
+
+/**
+ * TEST: Test PXP functionality
+ * Category: Content protection
+ * Mega feature: PXP
+ * Sub-category: PXP tests
+ * Functionality: Execution of protected content
+ * Test category: functionality test
+ */
+
+static int __pxp_bo_create(int fd, uint32_t vm, uint64_t size,
+			   uint32_t session_type, uint32_t *handle)
+{
+	struct drm_xe_ext_set_property ext = {
+		.base.next_extension = 0,
+		.base.name = DRM_XE_GEM_CREATE_EXTENSION_SET_PROPERTY,
+		.property = DRM_XE_GEM_CREATE_SET_PROPERTY_PXP_TYPE,
+		.value = session_type,
+	};
+	int ret = 0;
+
+	if (__xe_bo_create(fd, vm, size, system_memory(fd), 0, &ext, handle)) {
+		ret = -errno;
+		errno = 0;
+	}
+
+	return ret;
+}
+
+static int __create_pxp_rcs_queue(int fd, uint32_t vm,
+				  uint32_t session_type,
+				  uint32_t *q)
+{
+	struct drm_xe_engine_class_instance inst = {
+		.engine_class = DRM_XE_ENGINE_CLASS_RENDER,
+	};
+	struct drm_xe_ext_set_property ext = { 0 };
+	uint64_t ext_ptr = to_user_pointer(&ext);
+
+	ext.base.next_extension = 0,
+	ext.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
+	ext.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE,
+	ext.value = session_type;
+
+	return __xe_exec_queue_create(fd, vm, 1, 1, &inst, ext_ptr, q);
+}
+
+static int query_pxp_status(int fd)
+{
+	struct drm_xe_query_pxp_status *pxp_query;
+	struct drm_xe_device_query query = {
+		.extensions = 0,
+		.query = DRM_XE_DEVICE_QUERY_PXP_STATUS,
+		.size = 0,
+		.data = 0,
+	};
+	int status;
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
+		return -errno;
+
+	status = pxp_query->status;
+	free(pxp_query);
+
+	return status;
+}
+
+static bool is_pxp_hw_supported(int fd)
+{
+	int pxp_status;
+	int i = 0;
+
+	/* PXP init completes after driver init, so we might have to wait for it */
+	while (i++ < 50) {
+		pxp_status = query_pxp_status(fd);
+
+		/* -EINVAL means the PXP interface is not available */
+		igt_require(pxp_status != -EINVAL);
+
+		/* -ENODEV means PXP not supported or disabled */
+		if (pxp_status == -ENODEV)
+			return false;
+
+		/* status 1 means pxp is ready */
+		if (pxp_status == 1)
+			return true;
+
+		/*
+		 * 0 means init still in progress, any other remaining state
+		 * is an error
+		 */
+		igt_assert_eq(pxp_status, 0);
+
+		usleep(50*1000);
+	}
+
+	igt_assert_f(0, "PXP failed to initialize within the timeout\n");
+	return false;
+}
+
+/**
+ * SUBTEST: pxp-bo-alloc
+ * Description: Verify PXP bo allocation works as expected
+ */
+static void test_pxp_bo_alloc(int fd, bool pxp_supported)
+{
+	uint32_t bo;
+	int ret;
+
+	/* BO creation with DRM_XE_PXP_TYPE_NONE must always succeed */
+	ret = __pxp_bo_create(fd, 0, 4096, DRM_XE_PXP_TYPE_NONE, &bo);
+	igt_assert_eq(ret, 0);
+	gem_close(fd, bo);
+
+	/* BO creation with DRM_XE_PXP_TYPE_HWDRM must only succeed if PXP is supported */
+	ret = __pxp_bo_create(fd, 0, 4096, DRM_XE_PXP_TYPE_HWDRM, &bo);
+	igt_assert_eq(ret, pxp_supported ? 0 : -ENODEV);
+	if (!ret)
+		gem_close(fd, bo);
+
+	/* BO creation with an invalid type must always fail */
+	ret = __pxp_bo_create(fd, 0, 4096, 0xFF, &bo);
+	igt_assert_eq(ret, -EINVAL);
+}
+
+/**
+ * SUBTEST: pxp-queue-alloc
+ * Description: Verify PXP exec queue creation works as expected
+ */
+static void test_pxp_queue_creation(int fd, bool pxp_supported)
+{
+	uint32_t q;
+	uint32_t vm;
+	int ret;
+
+	vm = xe_vm_create(fd, 0, 0);
+
+	/* queue creation with DRM_XE_PXP_TYPE_NONE must always succeed */
+	ret = __create_pxp_rcs_queue(fd, vm, DRM_XE_PXP_TYPE_NONE, &q);
+	igt_assert_eq(ret, 0);
+	xe_exec_queue_destroy(fd, q);
+
+	/* queue creation with DRM_XE_PXP_TYPE_HWDRM must only succeed if PXP is supported */
+	ret = __create_pxp_rcs_queue(fd, vm, DRM_XE_PXP_TYPE_HWDRM, &q);
+	igt_assert_eq(ret, pxp_supported ? 0 : -ENODEV);
+	if (!ret)
+		xe_exec_queue_destroy(fd, q);
+
+	/* queue creation with an invalid type must always fail */
+	ret = __create_pxp_rcs_queue(fd, vm, 0xFF, &q);
+	igt_assert_eq(ret, -EINVAL);
+
+	xe_vm_destroy(fd, vm);
+}
+
+igt_main
+{
+	int xe_fd = -1;
+	bool pxp_supported = true;
+
+	igt_fixture {
+		xe_fd = drm_open_driver(DRIVER_XE);
+		igt_require(xe_fd);
+		igt_require(xe_has_engine_class(xe_fd, DRM_XE_ENGINE_CLASS_RENDER));
+		pxp_supported = is_pxp_hw_supported(xe_fd);
+	}
+
+	igt_subtest_group {
+		igt_describe("Verify PXP allocations work as expected");
+		igt_subtest("pxp-bo-alloc")
+		test_pxp_bo_alloc(xe_fd, pxp_supported);
+
+		igt_subtest("pxp-queue-alloc")
+		test_pxp_queue_creation(xe_fd, pxp_supported);
+	}
+
+	igt_fixture {
+		close(xe_fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 2724c7a9a..5904d9523 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -310,6 +310,7 @@ intel_xe_progs = [
 	'xe_pm',
 	'xe_pm_residency',
 	'xe_prime_self_import',
+	'xe_pxp',
 	'xe_query',
 	'xe_render_copy',
 	'xe_vm',
-- 
2.43.0

