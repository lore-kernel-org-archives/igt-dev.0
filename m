Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00445CA5FFC
	for <igt-dev@archiver.kernel.org>; Wed,  7 Oct 2026 14:13:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A27BF10E5DB;
	Wed,  7 Oct 2026 14:13:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rXHlvKF/";
	dkim-atps=neutral
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011060.outbound.protection.outlook.com [52.101.62.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E779D10F60D
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Oct 2026 14:12:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Atk6P1/OG/8PjqzsbJbK19Kt2BspJRPtf8vRgnMEGvsBnh5LaHDsolRyhHfsZrJSV7wXpFZb0SU82Q96rSKior5TTBrbYHJye/8leWwH7zqq2d2aab0Cc/KbWjkj+8I2OKg4eJG8NWeuGceW49wOjzAgS5Uayu6GpDm2WgHkEVt98z4x6u4DlQuvutECAC3KRSICNppYNBFFtldZ6W03EVAl+L2LDJFIV6VXFYF9crJLYFVe0TEmIfiicvX0aL0sofX+My5natJoF0AsEwpvsDTV013nxsL/qluudKqtzGOb6bo0/uTcLkeCqgzrEMlHR9odW7ftwCirnEa9E7TX0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DzcAskmfFGXvnpiYCUW+vZOb5ZyLkrns2l//qkSg7go=;
 b=BXi9AES2kgtBw2Yt76u1HA8zrVTU3gfOeSf83QyrxCYHB5EYH3ke5kosGug9p2LLu6WJz65MKnrqYUER4NNn/zvNegeW2OmABQJaRBhNNIV2z5zPt0lCASFwLqpcS5kWZsvkkGDl1a258xuA+ofSoZRf7bkvV/6tScFXyu5Vb/bFn4BHxUCvxHmJ/oUhO97fZgCegRR/xg+nxXCG+6+2jvBgoiAWjJDEnNbZrqgars9v9vuPoZHSBd08rWmw00tah5+awBtHdod8ErZhwDeOgDwCx+A7t4TZ052LTKnYJ0VOIBSVFa310TTi02n6sTB7QlwBcXjGh4g9JfQjDKEqnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DzcAskmfFGXvnpiYCUW+vZOb5ZyLkrns2l//qkSg7go=;
 b=rXHlvKF/xeNwksozM2Aip5ouFb37MyKNJS4O0IBWR6c+nQLG56I6HBizTlBZva2GeJoTWHjWO9F/QfGJqf2jiCU7hwZfdJrBpR0Y0ddKl1f+WfbJXWtqM2EMFgwtMW8pQMKHrLiHiRF+PC9kxnene7cTu0jkAhL2a2V8HEPLU2o=
Received: from PH7P220CA0118.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32d::18)
 by DS0PR12MB6416.namprd12.prod.outlook.com (2603:10b6:8:cb::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.16; Wed, 7 Oct 2026 14:12:27 +0000
Received: from CO1PEPF00018868.namprd03.prod.outlook.com
 (2603:10b6:510:32d:cafe::b) by PH7P220CA0118.outlook.office365.com
 (2603:10b6:510:32d::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed, 7
 Oct 2026 14:12:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00018868.mail.protection.outlook.com (10.167.249.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Wed, 7 Oct 2026 14:12:25 +0000
Received: from fdavid-dev.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 7 Oct
 2026 09:12:24 -0500
From: David Francis <David.Francis@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <tvrtko.ursulin@igalia.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Christian Konig <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 David Francis <David.Francis@amd.com>
Subject: [PATCH] tests/intel: Add edge case and race condition tests for
 GEM_CHANGE_HANDLE
Date: Wed, 7 Oct 2026 10:12:09 -0400
Message-ID: <20261007141209.2928162-1-David.Francis@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00018868:EE_|DS0PR12MB6416:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dcaa836-ff6a-4f00-505e-08df247d039b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|36860700016|1800799024|376014|82310400026|56012099006|11063799006|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 2ZuRTanTSC96C9Y3jE40yUyp8F2p2S8O+J0UUv8cW3wHTeVfMNd2hcXHw3Bd+wo1hGCS8ObYbSjc4ZyTL92bsXBpe7+6+qacmjjQFXc/lL/YPLGkA96DKbduSBNnbQzV5NWxdada9z6c99e5P/QaMgUwFx/MfZp3Q21QeWws/vQS526faX15bAy+Z+XmfpDMCqmB7wV5BvLvcfY5CTIEIKlVKpiamSZSdFOO0HA3nlv3q2bxPbIu3shllZfTeumYcoSfgK+Hkwc5fthGlZIW35CFrNngxyryZQaweEnDNT58+SarQ16Mr57BoXytAT2H7g7UTHgu4vFPXfUTiqLQdU0FVsD2a6Ylhhwy9dV0nqwwzLkyi59rySZJnNd2jiywzzQQkqC3l9YaLbobGIxmX/atUHtPLgDKn4uTplWQviX9fDeTsUKX5rHd9MKOuSzlozJx8m40oAbV4RdI7AOi0P5nkUN5r5E/HS+diY0rk21eoZzAx6EW6mCVnd3hK3abQ6yR7ZcueXYa1+zCCVwd7jKu3zdrFzcp24rpTjmdZkKsnn9WmVdm5gU5Nwg0DHzk/ApEo/foMqG3dS1cZ+6VYXcw/bbo56yqHXy1G/ANfYUSyOFEEj57VHwRiC57lFSn52UeaHOJc1+XW04yBMBwOHFOzNuNGklH0IeG2wiRMzf7Uwl4eD/x5FVT9XOKDhDDt3OtTskmELYVffKZhIB9gQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(36860700016)(1800799024)(376014)(82310400026)(56012099006)(11063799006)(10067099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: cHdtVvxItpAAkzf29PMRV8epfPETjBTa8VWkXEbNZtrQhDLyUpbCVEtobAKjXIVl+qGEnMZBSefufp2mus3LG1vk25wwOnzLt4kUYxg50gQB1HBvijRZmMl/14lEv0R2I41wlUUSb7boPWFgvNC6YR6hEkve68rIDrU3NNnhwvp8Zon3HtEaKykPunoJg1vR41OV4CMUxYWkK3VTGp9Uy4a/L43X0Adr4BaPCtUhTZGveA1UJeQ8QTiE+KjxLZU0FjyfHLcFVZMweqw4WRPiawPU3dCFXM/tDNBGpUi/L8j7a/ThSl3ztaMY8w7qAknxtju4Y0v3W89uG+vUWAe4aD2+e6ih/KUJpb6pfn7kNvgqk0JSlFuZjkEYZ2h/D9MpHmB15/38J4HP1f+vZnmo9e8gFKI1CpfqQdJ+jeFldzPiIyU/gk1pwvBVtkIhY+rO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 14:12:25.8813 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dcaa836-ff6a-4f00-505e-08df247d039b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00018868.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6416
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

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: Christian Konig <christian.koenig@amd.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Signed-off-by: David Francis <David.Francis@amd.com>
---
 tests/intel/gem_change_handle.c | 747 ++++++++++++++++++++++++++++++++
 tests/meson.build               |   1 +
 2 files changed, 748 insertions(+)
 create mode 100644 tests/intel/gem_change_handle.c

diff --git a/tests/intel/gem_change_handle.c b/tests/intel/gem_change_handle.c
new file mode 100644
index 000000000..23f2f8b39
--- /dev/null
+++ b/tests/intel/gem_change_handle.c
@@ -0,0 +1,747 @@
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
+#include <fcntl.h>
+#include <limits.h>
+#include <pthread.h>
+#include <sched.h>
+#include <semaphore.h>
+#include <signal.h>
+#include <string.h>
+#include <sys/stat.h>
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
+	int from[] = {h[0], h[2], h[0], h[3], h[3], h[1], h[1], h[3], h[2], h[1], h[0], h[2]};
+	int to[] =   {h[1], h[3], h[2], h[1], h[0], h[2], h[0], h[2], h[0], h[3], h[3], h[1]};
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
+       return NULL;
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
+
+		igt_assert_eq(ret, 0);
+		handle = prime_args.handle;
+		if (verbose_logging) {
+			igt_info("[PRIME-TID:%lu] Imported; got handle %u\n",
+				 (unsigned long)tid, handle);
+		}
+		igt_assert(handle == h[0] || handle == h[1] || handle == h[2] || handle == h[3]);
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
+	igt_describe("Functinality Test: Change handle affects result of prime import");
+	igt_subtest("change_prime")
+		test_change_export(&ctx);
+
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
\ No newline at end of file
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

