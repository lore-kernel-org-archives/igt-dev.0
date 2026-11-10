Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFE0606A336
	for <igt-dev@archiver.kernel.org>; Tue, 10 Nov 2026 15:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=v0d1fNbQ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C1010E14A;
	Tue, 10 Nov 2026 15:33:58 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013003.outbound.protection.outlook.com
 [40.93.201.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F55510E14A
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Nov 2026 15:32:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XXIHXjvs1vCJV6nTQ5NAVJvUM9Fq6VqB49duiOzej0l6uyd8cuySR9oms+mL8qXWy8x5skPHb2gaXaQB+ZucyDXM/nEFWCTvyV2bwfS6TCSj3fY8STxB4Dr0rD+jjbKDlli6DpU0YEjQmpaARn2tiQ2NW5ll6w+MjhFHCCO7HKwYU0CGow1+bTu9B1k2xSEDC0O7JElZW/DSmZU8Q1zsOACuTvz33sWCQKaLZ5t/PcuEYXBeIt1Fmsee1NLB158LN7H1HmFOjujuZpUOr1ls1vIfq9Ezdhcu+b3P80NunBj3FASGsKCowjF7MxU/k9p0R+lzqiS3Z2ggfJU89fd10g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pHKaBRA2xpcvQCLA5Uh1NaSLKS6LaoUrIRc68t01ZQk=;
 b=hNH7cIZZjECI8125cQYn42PyeH/iGfvqBD6moKWmx+DbwMZYvY1PogFjfj/C2KG3rzk2TWWfGsrBJoJj7M9LEH6ZLnWppqrf7VXRmQeojk9bL4nnjPI3wxs+Jw5MT/POiy43iJh8CvqpSpHKXDBxFBfZNVNBb6U53tOWH7svu9wozGLmnegCkKQCm02IDPjzrK7kQ8P7GcM79769TU6Hr56va89Y8HV1Pb2UVI5Z14cAZefZEZ7HYkYBOWUauC/ejVpvWzZOBgGcOxQcWgqWJ720Dz0tOstVTJjr46+5M09Gv2FQ4IcWaCWEGtaxN/x+ooQXqMAabIywYOGz8VZiuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pHKaBRA2xpcvQCLA5Uh1NaSLKS6LaoUrIRc68t01ZQk=;
 b=v0d1fNbQVaGaUqAlDM63/UnL3ETymNtlzU6Iv0XleR9UEGMvUh/ZKHRfzgt6npsYSr8WzLF1BDpZHD+NC77t7CW+sW93c5Ly4C2a1NC+UB0zkXvXnXY6VEEKNUG1UXEjYgtbEuSjcSml30Ds2D2rjDmooCpsEiAQ/7R3CM+vC4M=
Received: from SJ0PR13CA0218.namprd13.prod.outlook.com (2603:10b6:a03:2c1::13)
 by BL3PR12MB6426.namprd12.prod.outlook.com (2603:10b6:208:3b5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 15:32:51 +0000
Received: from SJ1PEPF000037A5.namprd04.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::68) by SJ0PR13CA0218.outlook.office365.com
 (2603:10b6:a03:2c1::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 15:32:50 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037A5.mail.protection.outlook.com (10.167.244.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 15:32:50 +0000
Received: from fdavid-dev.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 10 Nov
 2026 09:32:49 -0600
From: David Francis <David.Francis@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Christian Konig <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 David Francis <David.Francis@amd.com>
Subject: [PATCH v4] tests/intel: Add edge case and race condition tests for
 GEM_CHANGE_HANDLE
Date: Tue, 10 Nov 2026 10:32:30 -0500
Message-ID: <20261110153230.583745-1-David.Francis@amd.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A5:EE_|BL3PR12MB6426:EE_
X-MS-Office365-Filtering-Correlation-Id: 5500c317-6e01-4c47-9c99-08df3f3fe14b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|82310400026|36860700016|261026121527099003|261028144727099003|56012099006|11063799006|261021121427099003|261022075727099003|261022105027099003|261022113327099003|261009221227099003|261009223027099003|261026140227099003|261102130727099003|261102123227099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: oiBCRE7bB8yDwmxomCDOfZe4gpzdOilJdZWALHtf7K30fcLYI+b2JA/80Y4ggI0vc6wYbfTJzINzTraND4DZopJVsEy/7dl9wryq8/Z83ilNPyMXI5UUIcVOLvmGVKlOP3bCkYGSZTMK83u5HlzLwNlU4eY4PPmrIdb+vj9hbhcypA3rI7ryPnloa7F+QCNXjJzv+i2R2U3sA48D0g2efuI9MDgsdAsq60b7sr0Cy59Ja2azWPsyOHVLBBaKnKbw0dQbSGJVoMWl4fBskU3CdQUC380oD/FomjZ3ETei8ofpoJV6ITg5tzu4pPM3eicdUlRXIcyFe6LBBK0QhkAQDZuPlMuDK+Sd9cUAzaeuoM9PUNFv21i62JcLnEv281rQDdVPLikMaIF3E74a1aTfdIp45N9D87y7Wf3ZXHAa7LvVH8L4k01oqERq6BsxOBK1IalSTBVnEFmQ2MR0Ox3TRyrC5qsqxR6HETKS/C2qNRiOWAElEUhRdemS7SZBGfKTsEycEq7NhcPRTgpTS4mX29bqdliB1QciyjuoLorEgOeqlR7+YVEU2OYNdnG4lsACqJ/rsAcGvrVwpZaDlIPHp8/uju6Z6mWrNkJBDcHdZUmzeNThzpgu22/8pn7r2VxYPeJK2k8WXSlllh3aBbhoEht0uNSp1M61YpjtdAcpLipgfxhkRm5uAYuu80oous9OPnXcITRMW+SZI8AuKFlhnw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(261026121527099003)(261028144727099003)(56012099006)(11063799006)(261021121427099003)(261022075727099003)(261022105027099003)(261022113327099003)(261009221227099003)(261009223027099003)(261026140227099003)(261102130727099003)(261102123227099003)(10067099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: qmq7FIfCPYgzYlplbCYoOgHzNBnVD9tn9ntX5Aj7Y888BYQBXnnX+tDH7P8N0n/XGw5Xm+n2TkW2/Lww9cOmxxbJVHnpnYisOjsZAebxB0Z5zdd65rUerFoQnj+mVCITf63yWL8Ea88E/NNxhl319891m45QInOCoTJi9Q4dxybQOIUrm8xFq8k1s6cBz0Hr/dYroYSBUZ8wE9aeKo3yk06IM9QD3Wk8VEK/J1RENUPPlMmAoz1iKCJWxmtxs6WH0QWIeTnKr4Z20R8mvof9TbAneLv+rDOlYXilU63R9du35kUSvcPZ5bC+jtd58kO2YbJzqo2dBuhSYf142+7CaPY426MBB1sVO8uRbTxYWySYZEs4UkecKkI0FAEnW4zbeZFQwYNsrMmIp3utuMrOt2IIvMJ6bW9r4bPOBKAHYMx8Ma7oD+BOYYi9+TFhCL4b
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 15:32:50.3930 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5500c317-6e01-4c47-9c99-08df3f3fe14b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000037A5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6426
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Add a GPU-agnostic GEM_CHANGE_HANDLE tests. These test for basic
functionality, edge cases, and race conditions of this ioctl against
itself, gem close, gem create, and prime import and export.

GEM_CHANGE_HANDLE is currently wired to drm_invalid_op in DRM core. This IGT
coverage is a prerequisite for validating the eventual kernel-side ioctl
implementation and makes fixing its security bugs safer.

v2: Small cleanups, including cutting some includes and no assert in threads
v3: Skip if ioctl disabled
v4: hop around randomly on race tests

Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: Christian Konig <christian.koenig@amd.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Signed-off-by: David Francis <David.Francis@amd.com>
---
 include/drm-uapi/drm.h          |  23 +
 tests/intel/gem_change_handle.c | 728 ++++++++++++++++++++++++++++++++
 tests/meson.build               |   1 +
 3 files changed, 752 insertions(+)
 create mode 100644 tests/intel/gem_change_handle.c

diff --git a/include/drm-uapi/drm.h b/include/drm-uapi/drm.h
index baa620e3f..cf131da24 100644
--- a/include/drm-uapi/drm.h
+++ b/include/drm-uapi/drm.h
@@ -619,6 +619,21 @@ struct drm_gem_open {
 	__u64 size;
 };
 
+/**
+ * struct drm_gem_change_handle - Argument for &DRM_IOCTL_GEM_CHANGE_HANDLE ioctl.
+ * @handle: The handle of a gem object.
+ * @new_handle: An available gem handle.
+ *
+ * This ioctl changes the handle of a GEM object to the specified one.
+ * The new handle must be unused. On success the old handle is closed
+ * and all further IOCTL should refer to the new handle only.
+ * Calls to DRM_IOCTL_PRIME_FD_TO_HANDLE will return the new handle.
+ */
+struct drm_gem_change_handle {
+	__u32 handle;
+	__u32 new_handle;
+};
+
 /**
  * DRM_CAP_DUMB_BUFFER
  *
@@ -1296,6 +1311,14 @@ extern "C" {
  */
 #define DRM_IOCTL_MODE_CLOSEFB		DRM_IOWR(0xD0, struct drm_mode_closefb)
 
+/**
+ * DRM_IOCTL_GEM_CHANGE_HANDLE - Move an object to a different handle
+ *
+ * Some applications (notably CRIU) need objects to have specific gem handles.
+ * This ioctl changes the object at one gem handle to use a new gem handle.
+ */
+#define DRM_IOCTL_GEM_CHANGE_HANDLE    DRM_IOWR(0xD2, struct drm_gem_change_handle)
+
 /*
  * Device specific ioctls should only be in their respective headers
  * The device specific ioctl range is from 0x40 to 0x9f.
diff --git a/tests/intel/gem_change_handle.c b/tests/intel/gem_change_handle.c
new file mode 100644
index 000000000..1aef48d0a
--- /dev/null
+++ b/tests/intel/gem_change_handle.c
@@ -0,0 +1,728 @@
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
+#include "lib/amdgpu/amd_memory.h"
+#include "igt_amd.h"
+
+#define BO_SIZE (16 * 1024)
+#define RACE_DURATION_SEC 1
+
+//#define VERBOSE_LOGGING 0
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
+static uint32_t gpu_create_bo(struct gpu_ctx *ctx, uint64_t size)
+{
+	uint32_t handle = 0;
+
+	switch (ctx->driver) {
+	case DRIVER_TYPE_I915: {
+		handle = gem_create(ctx->fd, size);
+		break;
+	}
+	case DRIVER_TYPE_AMDGPU:
+		handle = igt_amd_create_bo(ctx->fd, size);
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
+static bool is_ioctl_disabled(struct gpu_ctx *ctx)
+{
+	uint32_t handle, new_h;
+	int ret;
+	bool result;
+
+	handle = gpu_create_bo(ctx, 4096);
+	new_h = handle + 1000;
+
+	ret = gem_change_handle(ctx, handle, new_h);
+	result = (ret != 0 && errno == EINVAL);
+
+	gem_close_bo(ctx, handle);
+	gem_close_bo(ctx, new_h);
+
+	return result;
+}
+
+#ifdef VERBOSE_LOGGING
+#define verbose_log(...) igt_info(__VA_ARGS__)
+#else
+#define verbose_log(...)
+#endif
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
+	handle = gpu_create_bo(ctx, 4096);
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
+	handle1 = gpu_create_bo(ctx, 4096);
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
+	handle = gpu_create_bo(ctx, 4096);
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
+	handle = gpu_create_bo(ctx, 4096);
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
+	handle = gpu_create_bo(ctx, 4096);
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
+	handle = gpu_create_bo(ctx, 4096);
+	handle_2 = gpu_create_bo(ctx, 4096);
+
+	/* new_handle is taken must fail with -EBUSY */
+	ret = gem_change_handle(ctx, handle, handle_2);
+	igt_assert(ret < 0);
+	igt_assert_eq(errno, EBUSY);
+
+	/* And the other way */
+	ret = gem_change_handle(ctx, handle_2, handle);
+	igt_assert(ret < 0);
+	igt_assert_eq(errno, EBUSY);
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
+	data->handles[0] = gpu_create_bo(ctx, BO_SIZE);
+	igt_assert(data->handles[0] != 0);
+	data->handles[1] = gpu_create_bo(ctx, BO_SIZE);
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
+	int ret, old, new;
+
+	pthread_barrier_wait(&data->barrier);
+
+	while (__atomic_load_n(&data->running, __ATOMIC_ACQUIRE)) {
+		old = h[rand() % 4];
+		new = h[rand() % 4];
+		ret = gem_change_handle(data->ctx, old, new);
+		/*
+		 * Expected errors:
+		 * - ENOENT: old handle invalid
+		 * - EBUSY: target handle occupied (collision detected during idr_alloc)
+		 * - EINVAL: old and new handle are the same
+		 */
+		if (ret != 0 && errno != ENOENT && errno != EBUSY && old != new)
+			data->unexpected_errno = errno;
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
+	int handle, ret, i = 0;
+
+	pthread_barrier_wait(&data->barrier);
+
+	while (__atomic_load_n(&data->running, __ATOMIC_ACQUIRE)) {
+		/* Close a handle; keep trying until success */
+		while (true) {
+			ret = gem_close_bo(data->ctx, h[i]);
+			if (ret == 0) {
+				verbose_log("[CLOSE-TID:%lu] Closed handle %u\n",
+					    (unsigned long)pthread_self(), h[i]);
+				break;
+			}
+
+			i  = (i + 1) % 4;
+
+			if (!__atomic_load_n(&data->running, __ATOMIC_ACQUIRE))
+				return NULL;
+		}
+
+		/* Open a handle */
+		handle = gpu_create_bo(data->ctx, BO_SIZE);
+		verbose_log("[CLOSE-TID:%lu] Created new BO with handle %u\n",
+			    (unsigned long)tid, handle);
+
+		/* If the opened handle isn't one of the four ones being
+		 * shuffled, change_handle it in. Keep trying until success.
+		 */
+		if (handle != h[0] && handle != h[1] && handle != h[2] && handle != h[3]) {
+			while (true) {
+				ret = gem_change_handle(data->ctx, handle, h[i]);
+				if (ret == 0) {
+					verbose_log("[CLOSE-TID:%lu] Change handle %u to %u\n",
+						    (unsigned long)pthread_self(), handle, h[i]);
+					break;
+				}
+
+				if (ret != 0 && errno != ENOENT && errno != EBUSY)
+					data->unexpected_errno = errno;
+
+				i  = (i + 1) % 4;
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
+				verbose_log("[PRIME-TID:%lu] Exported handle %u\n",
+					    (unsigned long)pthread_self, h[i]);
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
+		verbose_log("[PRIME-TID:%lu] Imported; got handle %u\n",
+			    (unsigned long)tid, handle);
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
+
+		igt_require_f(!is_ioctl_disabled(&ctx),
+			      "GEM_CHANGE_HANDLE ioctl appears to be disabled.\n");
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
index 519a9e727..567878df6 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -105,6 +105,7 @@ intel_i915_progs = [
 	'gem_blits',
 	'gem_busy',
 	'gem_caching',
+	'gem_change_handle',
 	'gem_create',
 	'gem_ccs',
 	'gem_close',
-- 
2.34.1

