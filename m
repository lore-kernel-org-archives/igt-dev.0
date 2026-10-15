Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B9CCCC6B34
	for <igt-dev@archiver.kernel.org>; Thu, 15 Oct 2026 14:56:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDE2410E273;
	Thu, 15 Oct 2026 14:56:08 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012039.outbound.protection.outlook.com
 [40.107.200.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B022B11238D
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2026 14:54:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=drLaiPD8QjClKNjvrs2ZRWcU26PJrehl1UgKtwqXZqAexzQXZ6cQ2RSWTRM/K7LIYOUuBK5eUy3WTfSVeTQ15gHvei9t7ubw8A7AYRnIBn3K7Cj5hUUxMLc2wYazGRDer9sRS92Cq4B/vNYjEviATzWaCWKY8FHhBz/aznwlpdnlBjG77+JSoucp6CoEXCtwMm/PY6bwOogCwDUOGyDCeoVyZzQZA6BuSxJek0IFfd8ZU/IP9wAZHv3reYQoyMBRP3c5gBIaHcutZeFMem4fMHDCVx8RBPTNrlac8G2o9EQRUDzHNrT8U9QkIlKB1Qx7m3EQdJe4v5vyyaQYfvHWbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tbEMr9GoXVip1ySnZvAA6iMl4blBkUHY9EMwc1ICeLo=;
 b=Fq/E4JZqZTLA2gUpiBRIvs5jk/PRAu1MCGQ3Rd6WImeuOLsTqZ4rnFwyZsuBWKY9ppSVovYgv+Hy2ZWR/ohahEyrqkMsKKe88E1oJM4UD7ma71cwK3MkwyIrzQJaCjybyet0ZCU+xDVkKgTwXfIHOO5UjBIwnWsnAAF7udSX02VDfQ190UQeyIVPVznrDccCUFPi3gwFqWNxV1D+ht5IMZqWKqHe7k1cUYus7a+2GVowglwuPcSoy2RYfFaSqjUCLs6ifysVCC1sy6Wq9Nkh3wDb4Y/b2kJUHBcdtZQBxNo1vkrTpbTd2PfFIcZ/lSbu8HXRKeRjWsvjAMTgkq0qXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tbEMr9GoXVip1ySnZvAA6iMl4blBkUHY9EMwc1ICeLo=;
 b=jNdnEo7hgYejlhHH0092Ib7PpU6VUA3KYLjsTMLHgpGRQDdoiI8GJywtQpun4lyo3yia9TB3An2CzSlNN5fdIDMWapNsA8DwR/mjKujnWQbGHYS7kIVX1HG6MtVDBd2F2C94jiMFU5Z6uFwOTa93udNRHVvSa3BrJDeogimMI+4=
Received: from MW4PR03CA0151.namprd03.prod.outlook.com (2603:10b6:303:8d::6)
 by DM6PR12MB4236.namprd12.prod.outlook.com (2603:10b6:5:212::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Thu, 15 Oct
 2026 14:54:19 +0000
Received: from MWH0EPF000A672E.namprd04.prod.outlook.com
 (2603:10b6:303:8d:cafe::4e) by MW4PR03CA0151.outlook.office365.com
 (2603:10b6:303:8d::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Thu, 15
 Oct 2026 14:54:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A672E.mail.protection.outlook.com (10.167.249.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Thu, 15 Oct 2026 14:54:18 +0000
Received: from fdavid-dev.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 15 Oct
 2026 09:54:11 -0500
From: David Francis <David.Francis@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Christian Konig <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 David Francis <David.Francis@amd.com>
Subject: [PATCH v2] tests/intel: Add edge case and race condition tests for
 GEM_CHANGE_HANDLE
Date: Thu, 15 Oct 2026 10:53:55 -0400
Message-ID: <20261015145355.3972674-2-David.Francis@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261015145355.3972674-1-David.Francis@amd.com>
References: <20261015145355.3972674-1-David.Francis@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672E:EE_|DM6PR12MB4236:EE_
X-MS-Office365-Filtering-Correlation-Id: 65b97753-6d8c-4db7-497d-08df2acc3086
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|36860700016|82310400026|56012099006|11063799006|261009221227099003|261009223027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: /UjsFBocrkzPkAIJZ+vNBrrDOXmVbCSW1SruQusm2tKLb8gWrYgC7lY9buCBC6TSv+MBMDuB0WRV0RrjDQnAVvPycNDpH8CFAN1kO/xGR4hj8s6hP2XNrAdYddI2qH3DXPnK1uIEl7uO+K5UNivJS+IstMvK63VzA8KDKASJVcJQtqm+NKfE1K6rSBdF90YmPs4g9ImS3dK14lvU8nkiD0GKdnRUUzb3XEv3NG4zdlW/faKmJL17213zMUwVlPQ9gFSBcoAwzVzTucJLP1PeaSBE7C9itIQ/IUcnyoySnFTlaeMTvNAvmovZOOZxsvLCQ+VBMDHhBkQelu1PFz+5zOS2zL3NcLjBqvTm32cU76FXRqb3F5qXTOIqjTYGLawbHEK7omiSGRkabkYnYFyDQuV/oSOUg7JZQVPDWiu0IZDVNX7IF07sSCsj9YEC0M5GTajLYlBUL9WjCCG+kMfCQ3/Cch0Grvgn3HlZEsw0bEf6TzemmYlLBRb0Uy2Z3aBECqyCDXJR9mv5kHo+A6YKBgYHSOKKCfEluGaRuzpTX4Jgj3pPw2M1hToRED44oRSe7/SnWGAEGSL3UZ6Sfc3F7RsWM7W25gZOseYV7ARxeNnZR4SAgqnH0AfM1LGe/7bViyy5NMt1VRktT4zLGDfXpDFKhdwQbD0/aavhEKwtgAtK5mppXD+AwvC6rlRSLsFuEFwTQF1v76IwP43FlTtdmA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(36860700016)(82310400026)(56012099006)(11063799006)(261009221227099003)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: p2QYvQ9sQsTcCKGJctb6/y21ONWTkBlRXaYGIG8OjsLwTJiasL7WcTU18JifiEEVf8VozW7a+JZVioRtW2qbhn8JEb7rSJMe41TaTBUael1/xA3E+K5TMXOSXg3EMvybHbIqXvz47NcK6Hw/+Zq2YkpyT+BqinjNRzgiUdW4i99n5QlzudaD+vzmPF8twTzKnq+zC/lQMo6WW1ZvKHu0JnU/tJvxzTVaCGjqhfswmV3xiUeLwa5mAPg67Wdxrx+8kaBuCqr18F6BGRvT/BWUNpREh2BLJsOuN8NKr3TUKDl35U96ke27mARD/YKzRgWk832Rrdi6AjTR6qKQM0gxCkZqPU4lkbydpsKUn+JXZy+gOSWyciX/oc03GSg+TLOF3L8sbIMuGQR8pegnVZ4ayiSY07WeUCNm2ppLtSpunLzJukD5Jv7vVkaLkQl0lbom
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 14:54:18.4334 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65b97753-6d8c-4db7-497d-08df2acc3086
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A672E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4236
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

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Add a GPU-agnostic GEM_CHANGE_HANDLE tests. These test for basic
functionality, edge cases, and race conditions of this ioctl against
itself, gem close, gem create, and prime import and export.

GEM_CHANGE_HANDLE is currently wired to drm_invalid_op in DRM core. This IGT
coverage is a prerequisite for validating the eventual kernel-side ioctl
implementation and makes fixing its security bugs safer.

v2: Small cleanups, including cutting some includes and no assert in threads

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: Christian Konig <christian.koenig@amd.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Signed-off-by: David Francis <David.Francis@amd.com>
---
 tests/intel/gem_change_handle.c | 743 ++++++++++++++++++++++++++++++++
 tests/meson.build               |   1 +
 2 files changed, 744 insertions(+)
 create mode 100644 tests/intel/gem_change_handle.c

diff --git a/tests/intel/gem_change_handle.c b/tests/intel/gem_change_handle.c
new file mode 100644
index 000000000..21ce855c4
--- /dev/null
+++ b/tests/intel/gem_change_handle.c
@@ -0,0 +1,743 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2026 Advanced Micro Devices, Inc.
+ * Copyright 2026 Intel Corporation
+ *
+ * GPU-agnostic race condition tests for GEM_CHANGE_HANDLE ioctl
+ *
+ * NOTE: This test is located in tests/intel/ directory because:
+ * 1. All gem_* tests are traditionally placed in tests/intel/ regardless
+ *    of GPU vendor, following IGT convention for GEM-related tests
+ * 2. The test uses i915/gem.h and i915/gem_create.h for GEM object creation
+ *    on Intel platforms, though it works vendor-agnostically via DRM core
+ * 3. Some subtest designs (noop-same-handle, invalid-*, edge-*, functional-*)
+ *    were proposed by Simona Vetter (Intel), hence Intel copyright header
+ *
+ */
+
+#include <errno.h>
+#include <limits.h>
+#include <pthread.h>
+#include <sched.h>
+#include <string.h>
+
+#include "igt.h"
+#include "igt_device.h"
+#include "i915/gem.h"
+#include "i915/gem_create.h"
+
+/* AMDGPU includes (if available) */
+#if __has_include("igt_amd.h")
+#include "lib/amdgpu/amd_memory.h"
+#include "igt_amd.h"
+#define HAS_AMDGPU 1
+#else
+#define HAS_AMDGPU 0
+#endif
+
+#define BO_SIZE (16 * 1024)
+#define RACE_DURATION_SEC 1
+
+static bool verbose_logging;
+
+/**
+ * TEST: gem change handle
+ * Description: tests for drm ioctl GEM_CHANGE_HANDLE
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: GEM handles
+ * Functionality: gem change handle
+ * Feature: gem
+ * Run type: FULL
+ *
+ * SUBTEST: sanity
+ * Description: Changing a handle to a new value works as intended
+ *
+ * SUBTEST: change_prime
+ * Description: Changing a handle affects the result of prime import
+ *
+ * SUBTEST: new_handle_zero
+ * Description: Changing a handle to 0 should fail
+ *
+ * SUBTEST: new_handle_exceeds_int_max
+ * Description: Changing a handle to > INT_MAX should fail
+ *
+ * SUBTEST: new_handle_equals_old_handle
+ * Description: Changing a handle to itself should fail
+ *
+ * SUBTEST: new_handle_taken
+ * Description: Changing a handle to a value already in use should fail
+ *
+ * SUBTEST: invalid_handle
+ * Description: Changing a non-existent handle should fail
+ *
+ * SUBTEST: race_change_change
+ * Description: Test for race conditions between two GEM_CHANGE_HANDLE
+ *
+ * SUBTEST: race_change_create_close
+ * Description: Test for race conditions between GEM_CHANGE_HANDLE, GEM_CREATE, and GEM_CLOSE
+ *
+ * SUBTEST: race_change_export_import
+ * Description: Test for race conditions between GEM_CHANGE_HANDLE, prime export, and prime import
+ */
+
+IGT_TEST_DESCRIPTION("Edge case and race condition tests for GEM_CHANGE_HANDLE");
+
+/* Structs */
+
+/* Define DRM_IOCTL_GEM_CHANGE_HANDLE if not available in kernel headers */
+#ifndef DRM_IOCTL_GEM_CHANGE_HANDLE
+struct drm_gem_change_handle {
+	__u32 handle;
+	__u32 new_handle;
+};
+
+#define DRM_IOCTL_GEM_CHANGE_HANDLE    DRM_IOWR(0xD2, struct drm_gem_change_handle)
+#endif
+
+/* Driver type detection */
+enum gpu_driver {
+	DRIVER_TYPE_UNKNOWN = 0,
+	DRIVER_TYPE_I915,
+	DRIVER_TYPE_AMDGPU,
+};
+
+/* GPU context structure */
+struct gpu_ctx {
+	int fd;
+	enum gpu_driver driver;
+};
+
+/* Helpers */
+
+static uint32_t gem_create_bo(struct gpu_ctx *ctx, uint64_t size)
+{
+	uint32_t handle = 0;
+
+	switch (ctx->driver) {
+	case DRIVER_TYPE_I915: {
+		struct drm_i915_gem_create create = { .size = size };
+
+		do_ioctl(ctx->fd, DRM_IOCTL_I915_GEM_CREATE, &create);
+		handle = create.handle;
+		break;
+	}
+	case DRIVER_TYPE_AMDGPU:
+#if HAS_AMDGPU
+		handle = igt_amd_create_bo(ctx->fd, size);
+#else
+		igt_require_f(0, "AMDGPU header not found for AMDGPU driver\n");
+#endif
+		break;
+	default:
+		igt_assert_f(0, "Unsupported driver\n");
+	}
+
+	igt_assert(handle != 0);
+	return handle;
+}
+
+static int gem_close_bo(struct gpu_ctx *ctx, uint32_t handle)
+{
+	struct drm_gem_close close_args = { .handle = handle };
+
+	return igt_ioctl(ctx->fd, DRM_IOCTL_GEM_CLOSE, &close_args);
+}
+
+static int gem_change_handle(struct gpu_ctx *ctx, uint32_t old_handle, uint32_t new_handle)
+{
+	struct drm_gem_change_handle args = {
+		.handle = old_handle,
+		.new_handle = new_handle,
+	};
+	return igt_ioctl(ctx->fd, DRM_IOCTL_GEM_CHANGE_HANDLE, &args);
+}
+
+static enum gpu_driver detect_driver(int fd)
+{
+	/* Check AMDGPU first (primary target) */
+	if (is_amdgpu_device(fd))
+		return DRIVER_TYPE_AMDGPU;
+	if (is_i915_device(fd))
+		return DRIVER_TYPE_I915;
+	return DRIVER_TYPE_UNKNOWN;
+}
+
+/* Sanity and Functionality tests */
+
+/**
+ * test_sanity - verify rename actually works
+ *
+ * After a successful rename:
+ * - GEM_CLOSE(old_handle) must FAIL (handle no longer exists)
+ * - GEM_CLOSE(new_handle) must SUCCEED (object is there)
+ */
+static void test_sanity(struct gpu_ctx *ctx)
+{
+	uint32_t handle, new_h;
+	int ret;
+
+	handle = gem_create_bo(ctx, 4096);
+	new_h = handle + 1000;
+
+	/* Perform the rename */
+	ret = gem_change_handle(ctx, handle, new_h);
+	igt_assert_f(ret == 0,
+		     "gem_change_handle(%u -> %u) failed: %s\n",
+		     handle, new_h, strerror(errno));
+
+	/* Old handle must be invalid now */
+	ret = gem_close_bo(ctx, handle);
+	igt_assert_f(ret < 0 && errno == EINVAL,
+		     "GEM_CLOSE(old_handle=%u) should fail with EINVAL, "
+		     "got ret=%d errno=%d (%s)\n",
+		     handle, ret, errno, strerror(errno));
+
+	/* New handle must be valid */
+	ret = gem_close_bo(ctx, new_h);
+	igt_assert_f(ret == 0,
+		     "GEM_CLOSE(new_handle=%u) should succeed, "
+		     "got ret=%d errno=%d (%s)\n",
+		     new_h, ret, errno, strerror(errno));
+}
+
+/**
+ * test_change_export - changing a handle affects prime import
+ *
+ * Importing a prime object that has had its handle changed since it was
+ * exported should get the new handle
+ */
+static void test_change_export(struct gpu_ctx *ctx)
+{
+	int ret, handle1, handle2, dmabuf_fd, imported_handle;
+
+	/* Create a handle and export it */
+	handle1 = gem_create_bo(ctx, 4096);
+	handle2 = handle1 + 1;
+	dmabuf_fd = prime_handle_to_fd(ctx->fd, handle1);
+
+	/* When you import, you get the same handle back */
+	imported_handle = prime_fd_to_handle(ctx->fd, dmabuf_fd);
+	igt_assert_eq(imported_handle, handle1);
+
+	/* Change the handle (should succeed) */
+	ret = gem_change_handle(ctx, handle1, handle2);
+	igt_assert_eq(ret, 0);
+
+	/* Import, should get the new handle */
+	imported_handle = prime_fd_to_handle(ctx->fd, dmabuf_fd);
+	igt_assert_eq(imported_handle, handle2);
+
+	/* Confirm gem object is at the new handle */
+	igt_assert_eq(gem_close_bo(ctx, handle2), 0);
+
+	ret = gem_close_bo(ctx, handle1);
+	igt_assert(ret < 0);
+	igt_assert_eq(errno, EINVAL);
+
+	close(dmabuf_fd);
+}
+
+/* Edge case and fail case tests */
+
+/**
+ * test_new_handle_zero - new_handle = 0 should fail
+ *
+ * 0 is not a valid gem handle.
+ */
+static void test_new_handle_zero(struct gpu_ctx *ctx)
+{
+	uint32_t handle;
+	int ret;
+
+	handle = gem_create_bo(ctx, 4096);
+
+	/* new_handle = 0 must fail with -EINVAL */
+	ret = gem_change_handle(ctx, handle, 0);
+	igt_assert(ret < 0);
+	igt_assert_eq(errno, EINVAL);
+
+	/* Original handle should still be valid */
+	igt_assert_eq(gem_close_bo(ctx, handle), 0);
+}
+
+/**
+ * test_new_handle_exceeds_int_max - new_handle > INT_MAX should fail
+ *
+ * The kernel enforces an idr_alloc() limitation: new_handle must be <= INT_MAX.
+ */
+static void test_new_handle_exceeds_int_max(struct gpu_ctx *ctx)
+{
+	uint32_t handle;
+	int ret;
+
+	handle = gem_create_bo(ctx, 4096);
+
+	/* new_handle > INT_MAX must fail with -EINVAL */
+	ret = gem_change_handle(ctx, handle, (uint32_t)INT_MAX + 1);
+	igt_assert(ret < 0);
+	igt_assert_eq(errno, EINVAL);
+
+	/* Also test 0xFFFFFFFF */
+	ret = gem_change_handle(ctx, handle, 0xFFFFFFFF);
+	igt_assert(ret < 0);
+	igt_assert_eq(errno, EINVAL);
+
+	/* Original handle should still be valid */
+	igt_assert_eq(gem_close_bo(ctx, handle), 0);
+}
+
+/**
+ * test_new_handle_equals_old_handle - new_handle = old_handle should fail
+ *
+ * The ioctl treats old_handle = new_handle as invalid input.
+ */
+static void test_new_handle_equals_old_handle(struct gpu_ctx *ctx)
+{
+	uint32_t handle;
+	int ret;
+
+	handle = gem_create_bo(ctx, 4096);
+
+	/* new_handle = old_handle must fail with -EINVAL */
+	ret = gem_change_handle(ctx, handle, handle);
+	igt_assert(ret < 0);
+	igt_assert_eq(errno, EINVAL);
+
+	/* same thing if handle doesn't exist */
+	ret = gem_change_handle(ctx, handle + 1, handle + 1);
+	igt_assert(ret < 0);
+	igt_assert_eq(errno, EINVAL);
+
+	/* Original handle should still be valid */
+	igt_assert_eq(gem_close_bo(ctx, handle), 0);
+}
+
+/**
+ * test_new_handle_taken - new_handle being the handle of another gem object must fail
+ *
+ * Not allowed to change a handle to a handle that's already taken
+ */
+static void test_new_handle_taken(struct gpu_ctx *ctx)
+{
+	uint32_t handle, handle_2;
+	int ret;
+
+	handle = gem_create_bo(ctx, 4096);
+	handle_2 = gem_create_bo(ctx, 4096);
+
+	/* new_handle is taken must fail with -ENOSPC (direct from idr_alloc) */
+	ret = gem_change_handle(ctx, handle, handle_2);
+	igt_assert(ret < 0);
+	igt_assert_eq(errno, ENOSPC);
+
+	/* And the other way */
+	ret = gem_change_handle(ctx, handle_2, handle);
+	igt_assert(ret < 0);
+	igt_assert_eq(errno, ENOSPC);
+
+	/* Original handles should still be valid */
+	igt_assert_eq(gem_close_bo(ctx, handle), 0);
+	igt_assert_eq(gem_close_bo(ctx, handle_2), 0);
+}
+
+/**
+ * test_invalid_handle - non-existent handle should fail
+ *
+ * Using a handle that doesn't exist should return -ENOENT.
+ */
+static void test_invalid_handle(struct gpu_ctx *ctx)
+{
+	int ret;
+
+	/* Use a handle that was never allocated */
+	ret = gem_change_handle(ctx, 0xDEAD, 0xBEEF);
+	igt_assert(ret < 0);
+	igt_assert_eq(errno, ENOENT);
+
+	/* Handle 0 is also invalid */
+	ret = gem_change_handle(ctx, 0, 100);
+	igt_assert(ret < 0);
+	igt_assert_eq(errno, ENOENT);
+}
+
+/* Race condition test structs and helpers */
+
+struct change_handle_thread_data {
+	struct gpu_ctx *ctx;
+	uint32_t handles[4];
+	bool running;
+	int unexpected_errno;
+	pthread_barrier_t barrier;
+};
+
+static void set_up_context(struct change_handle_thread_data *data, struct gpu_ctx *ctx)
+{
+	data->handles[0] = gem_create_bo(ctx, BO_SIZE);
+	igt_assert(data->handles[0] != 0);
+	data->handles[1] = gem_create_bo(ctx, BO_SIZE);
+	igt_assert(data->handles[1] != 0);
+
+	data->ctx = ctx;
+	data->handles[2] = max(data->handles[0], data->handles[1]) + 0x10;
+	data->handles[3] = max(data->handles[0], data->handles[1]) + 0x20;
+	data->unexpected_errno = 0;
+	__atomic_store_n(&data->running, true, __ATOMIC_RELEASE);
+
+	pthread_barrier_init(&data->barrier, NULL, 2);
+}
+
+/* Race condition test threads */
+
+static void *change_handle_thread(void *arg)
+{
+	struct change_handle_thread_data *data = arg;
+	uint32_t *h = data->handles;
+	uint32_t from[] = {h[0], h[2], h[0], h[3], h[3], h[1], h[1], h[3], h[2], h[1], h[0], h[2]};
+	uint32_t to[] =   {h[1], h[3], h[2], h[1], h[0], h[2], h[0], h[2], h[0], h[3], h[3], h[1]};
+	int ret;
+
+	pthread_barrier_wait(&data->barrier);
+
+	while (__atomic_load_n(&data->running, __ATOMIC_ACQUIRE)) {
+		for (int i = 0; i < 12; i++) {
+			ret = gem_change_handle(data->ctx, from[i], to[i]);
+			/*
+			 * Expected errors:
+			 * - ENOENT: old handle invalid
+			 * - ENOSPC: target handle occupied (collision detected during idr_alloc)
+			 */
+			if (ret != 0 && errno != ENOENT && errno != ENOSPC)
+				data->unexpected_errno = errno;
+		}
+
+		sched_yield();
+	}
+
+	return NULL;
+}
+
+static void *close_recreate_thread(void *arg)
+{
+	struct change_handle_thread_data *data = arg;
+	uint32_t *h = data->handles;
+	pthread_t tid = pthread_self();
+	int handle, i, ret;
+
+	pthread_barrier_wait(&data->barrier);
+
+	while (__atomic_load_n(&data->running, __ATOMIC_ACQUIRE)) {
+		/* Close a handle; keep trying until success */
+		i = 0;
+		while (true) {
+			ret = gem_close_bo(data->ctx, h[i]);
+			if (ret == 0) {
+				if (verbose_logging) {
+					igt_info("[CLOSE-TID:%lu] Closed handle %u\n",
+						 (unsigned long)tid, h[i]);
+				}
+				break;
+			}
+
+			i += 1;
+			if (i > 3)
+				i = 0;
+
+			if (!__atomic_load_n(&data->running, __ATOMIC_ACQUIRE))
+				return NULL;
+		}
+
+		/* Open a handle */
+		handle = gem_create_bo(data->ctx, BO_SIZE);
+		if (verbose_logging) {
+			igt_info("[CLOSE-TID:%lu] Created new BO with handle %u\n",
+				 (unsigned long)tid, handle);
+		}
+
+		/* If the opened handle isn't one of the four ones being
+		 * shuffled, change_handle it in. Keep trying until success.
+		 */
+		if (handle != h[0] && handle != h[1] && handle != h[2] && handle != h[3]) {
+			i = 0;
+			while (true) {
+				ret = gem_change_handle(data->ctx, handle, h[i]);
+				if (ret == 0) {
+					if (verbose_logging) {
+						igt_info("[CLOSE-TID:%lu] Change handle %u to %u\n",
+							 (unsigned long)tid, handle, h[i]);
+					}
+					break;
+				}
+
+				if (ret != 0 && errno != ENOENT && errno != ENOSPC)
+					data->unexpected_errno = errno;
+
+				i += 1;
+				if (i > 3)
+					i = 0;
+
+				if (!__atomic_load_n(&data->running, __ATOMIC_ACQUIRE))
+					return NULL;
+			}
+		}
+
+		sched_yield();
+	}
+
+	return NULL;
+}
+
+static void *export_import_thread(void *arg)
+{
+	struct change_handle_thread_data *data = arg;
+	struct drm_prime_handle prime_args;
+	uint32_t *h = data->handles;
+	pthread_t tid = pthread_self();
+	int handle, i, ret, dmabuf_fd;
+
+	pthread_barrier_wait(&data->barrier);
+
+	while (__atomic_load_n(&data->running, __ATOMIC_ACQUIRE)) {
+		/* Export a handle; keep trying until success */
+		i = 0;
+		while (true) {
+			prime_args.handle = h[i];
+			prime_args.flags = DRM_CLOEXEC | DRM_RDWR;
+			ret = igt_ioctl(data->ctx->fd, DRM_IOCTL_PRIME_HANDLE_TO_FD, &prime_args);
+			if (ret == 0) {
+				if (verbose_logging) {
+					igt_info("[PRIME-TID:%lu] Exported handle %u\n",
+						 (unsigned long)tid, h[i]);
+				}
+				break;
+			}
+
+			i += 1;
+			if (i > 3)
+				i = 0;
+
+			if (!__atomic_load_n(&data->running, __ATOMIC_ACQUIRE))
+				return NULL;
+		}
+
+		dmabuf_fd = prime_args.fd;
+
+		/* Import the handle; it should be one of the four handles in the shuffle */
+		prime_args.fd = dmabuf_fd;
+		prime_args.flags = 0;
+		ret = igt_ioctl(data->ctx->fd, DRM_IOCTL_PRIME_FD_TO_HANDLE, &prime_args);
+		if (ret != 0)
+			data->unexpected_errno = errno;
+
+		handle = prime_args.handle;
+		if (verbose_logging) {
+			igt_info("[PRIME-TID:%lu] Imported; got handle %u\n",
+				 (unsigned long)tid, handle);
+		}
+		if(handle != h[0] && handle != h[1] && handle != h[2] && handle != h[3])
+			data->unexpected_errno = ERANGE;
+
+		close(dmabuf_fd);
+
+		sched_yield();
+	}
+
+	return NULL;
+}
+
+/* Race condition tests */
+
+/**
+ * test_race_change_change - Test for race conditions of change_handle against itself
+ *
+ * Start two threads, each of which constantly attempt changes between four different handles
+ * Try to catch race conditions such as changing same handle to two different handles,
+ * Changing two handles to the same handle, changing a handle to a handle itself being changed,
+ * etc.
+ */
+static void test_race_change_change(struct gpu_ctx *ctx)
+{
+	pthread_t thread_change_1, thread_change_2;
+	struct change_handle_thread_data data = {0};
+	int num_handles, ret;
+
+	set_up_context(&data, ctx);
+
+	/* Start both threads simultaneously */
+	igt_assert_eq(pthread_create(&thread_change_1, NULL, change_handle_thread, &data), 0);
+	igt_assert_eq(pthread_create(&thread_change_2, NULL, change_handle_thread, &data), 0);
+
+	/* Let them race */
+	sleep(RACE_DURATION_SEC);
+
+	__atomic_store_n(&data.running, false, __ATOMIC_RELEASE);
+	pthread_join(thread_change_1, NULL);
+	pthread_join(thread_change_2, NULL);
+
+	pthread_barrier_destroy(&data.barrier);
+
+	igt_assert_eq(data.unexpected_errno, 0);
+
+	/* Exactly two gem objects should still exist */
+	num_handles = 0;
+	for (int i = 0; i < 4; i++) {
+		ret = gem_close_bo(ctx, data.handles[i]);
+
+		if (ret == 0) {
+			num_handles += 1;
+		} else {
+			igt_assert_eq(errno, EINVAL);
+		}
+	}
+	igt_assert_eq(num_handles, 2);
+}
+
+/**
+ * test_race_change_create_close - Test for race conditions of change_handle against gem create / close
+ *
+ * Start two threads, one of which attempts to change between four handles while the other alternates
+ * closing a gem handle and creating new ones. Test for race conditions such as change a handle that's
+ * being closed or change a handle to a value that's being created.
+ */
+static void test_race_change_create_close(struct gpu_ctx *ctx)
+{
+	pthread_t thread_change, thread_create_close;
+	struct change_handle_thread_data data = {0};
+	int num_handles, ret;
+
+	set_up_context(&data, ctx);
+
+	/* Start both threads simultaneously */
+	igt_assert_eq(pthread_create(&thread_change, NULL, change_handle_thread, &data), 0);
+	igt_assert_eq(pthread_create(&thread_create_close, NULL, close_recreate_thread, &data), 0);
+
+	/* Let them race */
+	sleep(RACE_DURATION_SEC);
+
+	__atomic_store_n(&data.running, false, __ATOMIC_RELEASE);
+	pthread_join(thread_change, NULL);
+	pthread_join(thread_create_close, NULL);
+
+	pthread_barrier_destroy(&data.barrier);
+
+	igt_assert_eq(data.unexpected_errno, 0);
+
+	/* Depending on where create / close ended up, there can be 1 or 2 handles open */
+	num_handles = 0;
+	for (int i = 0; i < 4; i++) {
+		ret = gem_close_bo(ctx, data.handles[i]);
+
+		if (ret == 0) {
+			num_handles += 1;
+		} else {
+			igt_assert_eq(errno, EINVAL);
+		}
+	}
+	igt_assert(num_handles >= 1 && num_handles <= 2);
+}
+
+/**
+ * test_race_change_export_import - Test for race conditions of change_handle against prime export / import
+ *
+ * Start two threads, one of which attempts to change between four handles while the other exports
+ * handles, then imports them again. Check for race conditions such as changing a handle while exporting
+ * it or important a handle while changing it.
+ */
+static void test_race_change_export_import(struct gpu_ctx *ctx)
+{
+	pthread_t thread_change, thread_export_import;
+	struct change_handle_thread_data data = {0};
+	int num_handles, ret;
+
+	set_up_context(&data, ctx);
+
+	/* Start both threads simultaneously */
+	igt_assert_eq(pthread_create(&thread_change, NULL, change_handle_thread, &data), 0);
+	igt_assert_eq(pthread_create(&thread_export_import, NULL, export_import_thread, &data), 0);
+
+	/* Let them race */
+	sleep(RACE_DURATION_SEC);
+
+	__atomic_store_n(&data.running, false, __ATOMIC_RELEASE);
+	pthread_join(thread_change, NULL);
+	pthread_join(thread_export_import, NULL);
+
+	pthread_barrier_destroy(&data.barrier);
+
+	igt_assert_eq(data.unexpected_errno, 0);
+
+	/* Exporting a handle doesn't close it, so should still be exactly 2 */
+	num_handles = 0;
+	for (int i = 0; i < 4; i++) {
+		ret = gem_close_bo(ctx, data.handles[i]);
+
+		if (ret == 0) {
+			num_handles += 1;
+		} else {
+			igt_assert_eq(errno, EINVAL);
+		}
+	}
+	igt_assert_eq(num_handles, 2);
+}
+
+int igt_main()
+{
+	struct gpu_ctx ctx = { .fd = -1 };
+
+	igt_fixture() {
+		ctx.fd = drm_open_driver_render(DRIVER_ANY);
+		igt_require(ctx.fd >= 0);
+
+		ctx.driver = detect_driver(ctx.fd);
+		igt_require_f(ctx.driver != DRIVER_TYPE_UNKNOWN,
+			      "Unsupported GPU driver\n");
+
+		if (ctx.driver == DRIVER_TYPE_I915)
+			igt_require_gem(ctx.fd);
+	}
+
+	igt_describe("Sanity Test: Change handle actually changes handle");
+	igt_subtest("sanity")
+		test_sanity(&ctx);
+
+	igt_describe("Functionality Test: Change handle affects result of prime import");
+	igt_subtest("change_prime")
+		test_change_export(&ctx);
+
+	igt_describe("Edge Case: New handle = 0 should fail");
+	igt_subtest("new_handle_zero")
+		test_new_handle_zero(&ctx);
+
+	igt_describe("Edge Case: New handle > INT_MAX should fail");
+	igt_subtest("new_handle_exceeds_int_max")
+		test_new_handle_exceeds_int_max(&ctx);
+
+	igt_describe("Edge Case: Changing a handle to itself should fail");
+	igt_subtest("new_handle_equals_old_handle")
+		test_new_handle_equals_old_handle(&ctx);
+
+	igt_describe("Edge Case: Change a handle to a value which is taken should fail");
+	igt_subtest("new_handle_taken")
+		test_new_handle_taken(&ctx);
+
+	igt_describe("Edge Case: Changing a non-existent handle should fail");
+	igt_subtest("invalid_handle")
+		test_invalid_handle(&ctx);
+
+	igt_describe("Race: Changing handle vs. Changing handle");
+	igt_subtest("race_change_change")
+		test_race_change_change(&ctx);
+
+	igt_describe("Race: Changing handle vs. Create / Close");
+	igt_subtest("race_change_create_close")
+		test_race_change_create_close(&ctx);
+
+	igt_describe("Race: Changing handle vs. Export / Import");
+	igt_subtest("race_change_export_import")
+		test_race_change_export_import(&ctx);
+
+	igt_fixture() {
+		drm_close_driver(ctx.fd);
+	}
+
+}
diff --git a/tests/meson.build b/tests/meson.build
index 4f5c9be7b..ab083916d 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -104,6 +104,7 @@ intel_i915_progs = [
 	'gem_blits',
 	'gem_busy',
 	'gem_caching',
+	'gem_change_handle',
 	'gem_create',
 	'gem_ccs',
 	'gem_close',
-- 
2.34.1

