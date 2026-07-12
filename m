Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F40C44501
	for <igt-dev@archiver.kernel.org>; Sun, 12 Jul 2026 18:26:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F9B10E4C8;
	Sun, 12 Jul 2026 18:26:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bpBRNDwl";
	dkim-atps=neutral
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013057.outbound.protection.outlook.com
 [40.93.196.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95FE610E4C8
 for <igt-dev@lists.freedesktop.org>; Sun, 12 Jul 2026 18:25:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CrTlPqzbTAderfvyIwKV3uHkvH0D6MfIWMTwco/6vMa5goVfIV/MKPcXUWUM5AHABy4eoydUJ700Sr/gn4NkeVXrklZVO7G5ZI7P1oT0I3H/K5mmxjkwxffswILKOdW14tp6skjXTF5yQbNpqfuEv7Rn+IxcGHHd/b5t/eBtLawXje01J83TcTRcZTlIU6cEpemH2WLGHzO20dWFzv12db+a5eVUCdw/gGwNtt1YA41zpZTPtrRmXBz2G83V74T9zlR3Cr99dzqf+zBATQEjbOETntXs9cMBqTkSzngEyqRSGS0dW8L6FbPYF1+g1MpXnNA/qFI/TFJyTj6Yvudvpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3nGvmdl33tLWIyeBacakVY1VgdbSTlvwVqv8KzFeOv8=;
 b=DjwfRGJLqSWoEK1Qn6zEsFs9Zr1C5i1Yxj4JWf3kM5OB+y+REyz8gLz/dtsd4Kh+W09stJEqVOsb4QStrz8R+Qb+iYlGfaQjYzJw4mBOIkmVN97lNuZ9bM5GgWle5aOQ5AYWWKX8KzeGOYHI7b60AKUgalMrGrbB6CkaQwIKtPVDDGUU/AOcqpRK1iR0hwloEbHCJpvDy/CU+EpcAuP0RhBrFimmEdIh6eFx0HqFflaAZrgbHO/ecFmZDag/1GJxoL2yE1KF7fRTUHX5B7ITacMyQOetvV0fHreZhTzdfwvr0EvJagAOfbUlSe6MmoZ3vJKSBMKkmrSuBU6pxyiwfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3nGvmdl33tLWIyeBacakVY1VgdbSTlvwVqv8KzFeOv8=;
 b=bpBRNDwldcSGyAwAl/qCSXSGhUrxqN/X2S89dM8K0UI+YsCgWsupl4a/1BcTL0oHXGO5OKwHcfxyQBzJQ06wrM+62muXN69lUUz+uacHwtwN9aN+vvDMnHor91p1F4Ww3xsOki6aVWXn7G01+Pq1ByVwVgvRIEZ8R33ShBxjpjA=
Received: from DS7PR07CA0014.namprd07.prod.outlook.com (2603:10b6:5:3af::17)
 by DSWPR12MB999153.namprd12.prod.outlook.com (2603:10b6:8:36e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Sun, 12 Jul
 2026 18:25:08 +0000
Received: from DS2PEPF000061C8.namprd02.prod.outlook.com
 (2603:10b6:5:3af:cafe::50) by DS7PR07CA0014.outlook.office365.com
 (2603:10b6:5:3af::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend Transport; Sun,
 12 Jul 2026 18:25:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF000061C8.mail.protection.outlook.com (10.167.23.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Sun, 12 Jul 2026 18:25:07 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sun, 12 Jul
 2026 13:25:07 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Sun, 12 Jul
 2026 11:25:07 -0700
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Sun, 12 Jul 2026 13:25:06 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Simona Vetter <simona@ffwll.ch>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH 1/2] tests/intel: Add gem_change_handle_race test suite
Date: Sun, 12 Jul 2026 14:24:53 -0400
Message-ID: <20260712182457.58392-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C8:EE_|DSWPR12MB999153:EE_
X-MS-Office365-Filtering-Correlation-Id: f216afb2-2a17-423d-351d-08dee042e6ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|23010399003|376014|36860700016|1800799024|3023799007|6133799003|18002099003|11063799006|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info: fyOGO8WbDHrIBufV5zItHo9tm4NTAyitJuRrHCJLvETRHjG+4zRdSeS4FX9R8Bry5+92Wbrn5ESAlkfLg7H44Y0xmnLs6sMicTuz4GcQPBkwku6Rgqj6hapMSc9YwSHmUmrFVaEK5/7b8b2LbgJd352dEz3ofsQEfS1V2rX/KqupMh8Q70NodHHBj2l8i0QjKXVbPrxDCLkn96FW6Ak3djezE67QX3utelPwSSRGdxgcY/NElJNsnkPsEhldyYuDCdD4t0nhjsQqjLhGhv+Dy9ryY4CAF2ftEmKMRVoZweb1ENmcXOfizgL99j4qXFZ906nzVL9Am3/ThSqIfwvkz1J92jX0tvqXGHRl5KVuUgNCTJaU8/dY/E5OJgiG45X4IqltMBMCrVK+LUOKlKk7Nwt0F162kGyhkdEoE9SlI6gbirS+I24V6wTlDnKcD0R52hlX85hGYmkfFrPzZm24ovSeWdwIRwVHtudB/xD/drOpx6/VvxstUfqKVM9KCfuBDh1N4iegjWPq9oLy5YUK+zbNGRJ0fo/rB+ahHdf3VqJn/6nmUDHrwNONu8DIMV9KKozjNTq5t4wNOqVVa74SPP2JyFYyXGtlpmuPpQ+MUk9kizcDDtd/80Ounc3idH5zvZk4N+sQ9zC822YDHj9SqUP62cUrWLyUdJK4noNbi2NhDbhMqksBLcFJbN4gkVvBangDM4Yj8afo686Oc7IAHw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(23010399003)(376014)(36860700016)(1800799024)(3023799007)(6133799003)(18002099003)(11063799006)(5023799004)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: g2g7vOad1oO++DKLXZNhdpRZiITYL8Gp3dxfFVSjscDns3h3WkGQ8QJ3AYQHX4MbS3+BP5pCyW3YOggMsxFrBCg1u5OrElsBjqZi+Czrrp1ZqSlX8Ceb0t5pYA/P/PpwiQIYB3rzlKClZtokXQh5lBIJvVN3YcgtiSd/6UOrAnlHxfXjfGS/GgrB5hF7MzKwYi6eRC5x56bnEgafooj1lUiTXgbUmnHRPpCMWapQrfr+dUU6AGqEWuqb8TDxcCGygQMSBPOve5XSbipOGNYBS9AaC6ajd36jVmirLP/ADmf2xlQXgif/UXVRE09udbZgv4Fz7tqaZqWVPPwQExWtx2EZmamKvVc5lr7i7+tsv8ouPmk9Rwj+6sRy7iY+69Go0Z0UfZcOVRb93ydgOZg+Bc/khuObntrkuraTsPFj+ooQQRha+dz36zFt+PEDfkMx
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2026 18:25:07.7408 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f216afb2-2a17-423d-351d-08dee042e6ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF000061C8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR12MB999153
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

Add comprehensive race condition testing for DRM_IOCTL_GEM_CHANGE_HANDLE
to validate concurrent operation handling in GEM handle management.

This test suite covers various concurrent scenarios between GEM operations,
focusing on proper locking and handle lifecycle management.

Subtests:
- race-change-vs-close: CHANGE_HANDLE races against GEM_CLOSE
- race-change-vs-change: Two CHANGE_HANDLE ops race on same handle
- race-change-vs-prime: CHANGE_HANDLE races against PRIME_HANDLE_TO_FD
- race-aggressive-change-vs-close: High-iteration close vs change
- race-exploit-single-thread: Sequential swap+close pattern
- race-exploit-random-handles: Random handle stress test
- race-close-before-lock: Close-before-lock scenario with CPU pinning

Cc: Simona Vetter <simona@ffwll.ch>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Change-Id: I446321ef6991bfd5330eb3854c6dd99dcde92a8b
---
 tests/intel/gem_change_handle_race.c | 1782 ++++++++++++++++++++++++++
 1 file changed, 1782 insertions(+)
 create mode 100644 tests/intel/gem_change_handle_race.c

diff --git a/tests/intel/gem_change_handle_race.c b/tests/intel/gem_change_handle_race.c
new file mode 100644
index 000000000..0ac8657ac
--- /dev/null
+++ b/tests/intel/gem_change_handle_race.c
@@ -0,0 +1,1782 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2026 Advanced Micro Devices, Inc.
+ * Copyright 2026 Intel Corporation
+ *
+ * GPU-agnostic race condition tests for GEM_CHANGE_HANDLE ioctl
+ * 
+ */
+
+#include <errno.h>
+#include <fcntl.h>
+#include <limits.h>
+#include <pthread.h>
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
+/* Helper to detect if running under gdb */
+static bool running_under_gdb(void)
+{
+	char buf[1024];
+	FILE *fp;
+	bool under_gdb = false;
+
+	/* Check if parent process is gdb */
+	fp = fopen("/proc/self/status", "r");
+	if (!fp)
+		return false;
+
+	while (fgets(buf, sizeof(buf), fp)) {
+		if (strncmp(buf, "TracerPid:", 10) == 0) {
+			int tracer_pid = atoi(buf + 10);
+			if (tracer_pid != 0)
+				under_gdb = true;
+			break;
+		}
+	}
+	fclose(fp);
+
+	return under_gdb;
+}
+
+/* Helper to check for concurrent access traces in kernel log */
+static int check_kernel_traces(void)
+{
+	FILE *fp;
+	char line[1024];
+	int trace_count = 0;
+
+	/*
+	 * concurrent access manifests in kernel logs as:
+	 * - KASAN reports (if CONFIG_KASAN=y)
+	 * - Kernel oops/warnings in drm_gem_object_release_handle
+	 * - Stack traces with drm_gem_object_handle_put_unlocked
+	 *
+	 * We grep for function names that appear in the concurrent access path.
+	 */
+	fp = popen("dmesg | grep -c -E '(KASAN.*(drm_gem|change_handle)|"
+		   "drm_gem_object_release_handle|"
+		   "drm_gem_object_handle_put_unlocked|"
+		   "drm_gem_change_handle.*RIP)' 2>/dev/null", "r");
+	if (fp == NULL)
+		return 0;
+
+	if (fgets(line, sizeof(line), fp) != NULL) {
+		trace_count = atoi(line);
+	}
+	pclose(fp);
+
+	return trace_count;
+}
+
+
+static void pin_to_cpu(int cpu)
+{
+	cpu_set_t cpuset;
+	CPU_ZERO(&cpuset);
+	CPU_SET(cpu, &cpuset);
+	pthread_setaffinity_np(pthread_self(), sizeof(cpu_set_t), &cpuset);
+}
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
+/**
+ * TEST: gem change handle race
+ * Description: Multi-threaded race condition tests for GEM_CHANGE_HANDLE
+ * Category: Core
+ * Feature: gem
+ * Run type: FULL
+ *
+ * SUBTEST: race-change-vs-close
+ * Description: Test CHANGE_HANDLE racing with GEM_CLOSE (concurrent access issues detection)
+ *
+ * SUBTEST: race-change-vs-change
+ * Description: Test concurrent CHANGE_HANDLE operations (handle corruption detection)
+ *
+ * SUBTEST: race-change-vs-prime
+ * Description: Test CHANGE_HANDLE racing with Prime ioctls (stale reference detection)
+ *
+ * SUBTEST: race-close-before-lock
+ * Description: GEM_CLOSE before CHANGE_HANDLE table_lock (concurrent access)
+ *
+ * SUBTEST: race-aggressive-change-vs-close
+ * Description: Aggressive concurrent access race with CPU pinning and KASAN detection
+ *
+ * SUBTEST: race-exploit-single-thread
+ * Description: Single BO swapped H to H+1 with periodic FD close for concurrent access
+ *
+ * SUBTEST: race-exploit-random-handles
+ * Description: Random handle probing to find free slots and trigger concurrent access
+ */
+
+IGT_TEST_DESCRIPTION("Multi-threaded race condition tests for GEM_CHANGE_HANDLE");
+
+#define BO_SIZE (16 * 1024)
+#define RACE_DURATION_SEC 1
+
+/* Verbose logging - set to false to reduce output */
+static bool verbose_logging = false;
+
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
+#if HAS_AMDGPU
+	amdgpu_device_handle amdgpu_device;
+#endif
+};
+
+/* Thread synchronization */
+struct thread_data {
+	struct gpu_ctx *ctx;
+	uint32_t handle;
+	uint32_t alt_handle;
+	uint32_t *race_detected;
+	int *unexpected_errno;  /* Track what errno caused the race */
+	bool running;
+	pthread_barrier_t *barrier;
+};
+
+struct aggressive_data {
+	struct gpu_ctx *ctx;
+	volatile int go;
+	uint32_t handle;
+	uint32_t new_handle;
+};
+
+struct single_thread_data {
+	struct gpu_ctx *ctx;
+	int *main_fd;
+	pthread_mutex_t *fd_lock;
+	volatile bool running;
+	volatile bool hammer_ready;  /* Signal when BO created */
+	volatile uint32_t swap_count;
+	volatile uint32_t close_count;
+	uint32_t *race_hits;
+	pthread_barrier_t *barrier;
+};
+
+struct random_handle_data {
+	struct gpu_ctx *ctx;
+	int *main_fd;
+	pthread_mutex_t *fd_lock;
+	volatile bool running;
+	volatile bool hammer_ready;
+	volatile uint32_t swap_count;
+	volatile uint32_t close_count;
+	volatile uint32_t attempt_count;  /* Track total attempts */
+	uint32_t *race_hits;
+	pthread_barrier_t *barrier;
+};
+
+struct race_shared {
+	int fd;
+	uint32_t old_handle;
+	uint32_t new_handle;
+	struct drm_gem_change_handle ch;
+	struct drm_gem_close cl;
+	sem_t change_sem;
+	sem_t close_sem;
+	int change_success;
+	int close_success;
+};
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
+static const char *gpu_name(enum gpu_driver driver)
+{
+	switch (driver) {
+	case DRIVER_TYPE_I915: return "Intel i915";
+	case DRIVER_TYPE_AMDGPU: return "AMD GPU";
+	default: return "Unknown";
+	}
+}
+
+static uint32_t gem_create_bo(struct gpu_ctx *ctx, uint64_t size)
+{
+	uint32_t handle = 0;
+
+	switch (ctx->driver) {
+	case DRIVER_TYPE_I915: {
+		struct drm_i915_gem_create create = { .size = size };
+		do_ioctl(ctx->fd, DRM_IOCTL_I915_GEM_CREATE, &create);
+		handle = create.handle;
+		break;
+	}
+	case DRIVER_TYPE_AMDGPU:
+#if HAS_AMDGPU
+		handle = igt_amd_create_bo(ctx->fd, size);
+#else
+		igt_require_f(0, "AMDGPU support not compiled in\n");
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
+/*
+ * ═══════════════════════════════════════════════════════════════════════
+ * RACE CONDITION #1: CHANGE_HANDLE vs GEM_CLOSE
+ * ═══════════════════════════════════════════════════════════════════════
+ *
+ *
+ * Thread A (CHANGE_HANDLE)           Thread B (GEM_CLOSE)
+ * ────────────────────────           ────────────────────
+ * 1. Lookup handle 0x100
+ *    → Find GEM object
+ *                                     2. Lookup handle 0x100
+ *                                        → Find GEM object
+ *                                     3. Remove from handle table
+ *                                     4. Free GEM object
+ * 5. Change handle 0x100 → 0x200
+ *    → Operate on freed memory! 💥
+ *
+ * Test validates kernel properly locks to prevent concurrent access issues.
+ */
+
+static void *change_handle_thread(void *arg)
+{
+	struct thread_data *data = arg;
+	uint32_t handle = data->handle;
+	uint32_t new_handle = data->alt_handle;
+	int ret;
+
+	pthread_barrier_wait(data->barrier);
+
+	while (data->running) {
+		ret = gem_change_handle(data->ctx, handle, new_handle);
+		if (ret == 0) {
+			/* Successfully changed - try to change back */
+			ret = gem_change_handle(data->ctx, new_handle, handle);
+			if (ret != 0 && errno != ENOENT && errno != EINVAL && errno != EEXIST && errno != ENOSPC) {
+				/* Unexpected error - potential race */
+				*data->unexpected_errno = errno;
+				__sync_fetch_and_add(data->race_detected, 1);
+			}
+		} else if (errno != ENOENT && errno != EINVAL && errno != EEXIST && errno != ENOSPC) {
+			/*
+			 * Expected errors:
+			 * - ENOENT: handle was closed
+			 * - EINVAL: invalid handle
+			 * - EEXIST: target handle already exists (collision detected early)
+			 * - ENOSPC: target handle occupied (collision detected during idr_alloc)
+			 */
+			*data->unexpected_errno = errno;
+			__sync_fetch_and_add(data->race_detected, 1);
+		}
+		sched_yield();
+	}
+
+	return NULL;
+}
+
+static void *close_recreate_thread(void *arg)
+{
+	struct thread_data *data = arg;
+	uint32_t handle;
+	uint32_t old_handle;
+	pthread_t tid = pthread_self();
+
+	pthread_barrier_wait(data->barrier);
+
+	while (data->running) {
+		/* Close the handle */
+		old_handle = data->handle;
+		if (data->handle) {
+			gem_close_bo(data->ctx, data->handle);
+			if (verbose_logging) {
+				igt_info("[CLOSE-TID:%lu] Closed handle %u\n",
+					 (unsigned long)tid, old_handle);
+			}
+		}
+
+		/* Recreate BO with new handle */
+		handle = gem_create_bo(data->ctx, BO_SIZE);
+		data->handle = handle;
+		if (verbose_logging) {
+			igt_info("[CLOSE-TID:%lu] Created new BO with handle %u\n",
+				 (unsigned long)tid, handle);
+		}
+
+		sched_yield();
+	}
+
+	return NULL;
+}
+
+/**
+ * test_race_change_vs_close - Race CHANGE_HANDLE against GEM_CLOSE
+ *
+ *
+ * Spawns two threads:
+ * - Thread A: Continuously changes handle value
+ * - Thread B: Continuously closes and recreates handle
+ *
+ * Validates kernel prevents concurrent access issues through proper locking.
+ */
+static void test_race_change_vs_close(struct gpu_ctx *ctx)
+{
+	pthread_t thread_change, thread_close;
+	pthread_barrier_t barrier;
+	struct thread_data data = {0};
+	uint32_t race_detected = 0;
+	int unexpected_errno = 0;
+	uint32_t handle;
+
+	igt_info("Testing RACE #1: CHANGE_HANDLE vs CLOSE on %s\n",
+		 gpu_name(ctx->driver));
+	igt_info("  Duration: %d seconds\n", RACE_DURATION_SEC);
+	igt_info("  Goal: Detect concurrent access issues scenarios\n");
+
+	handle = gem_create_bo(ctx, BO_SIZE);
+	igt_assert(handle != 0);
+
+	data.ctx = ctx;
+	data.handle = handle;
+	data.alt_handle = handle + 0x1000;
+	data.race_detected = &race_detected;
+	data.unexpected_errno = &unexpected_errno;
+	data.running = true;
+
+	pthread_barrier_init(&barrier, NULL, 2);
+	data.barrier = &barrier;
+
+	/* Start both threads simultaneously */
+	igt_assert_eq(pthread_create(&thread_change, NULL, change_handle_thread, &data), 0);
+	igt_assert_eq(pthread_create(&thread_close, NULL, close_recreate_thread, &data), 0);
+
+	/* Let them race */
+	sleep(RACE_DURATION_SEC);
+
+	data.running = false;
+	pthread_join(thread_change, NULL);
+	pthread_join(thread_close, NULL);
+
+	pthread_barrier_destroy(&barrier);
+
+	/* Clean up final handle if exists */
+	if (data.handle) {
+		gem_close_bo(ctx, data.handle);
+	}
+
+	igt_info("  Race test completed. Suspicious conditions: %u\n", race_detected);
+	if (race_detected > 0) {
+		igt_info("  ⚠️  RACE DETECTED: Unexpected errno = %d (%s)\n",
+			 unexpected_errno, strerror(unexpected_errno));
+		igt_info("  This indicates the kernel may not be properly handling concurrent\n");
+		igt_info("  CHANGE_HANDLE operations. Kernel should serialize these with\n");
+		igt_info("  proper locking to prevent corruption and concurrent access issues.\n");
+	}
+	igt_assert_f(race_detected == 0,
+		     "Race condition detected! errno=%d (%s). "
+		     "Kernel locking may be insufficient.\n",
+		     unexpected_errno, strerror(unexpected_errno));
+}
+
+/*
+ * ═══════════════════════════════════════════════════════════════════════
+ * RACE CONDITION #2: CHANGE_HANDLE vs CHANGE_HANDLE
+ * ═══════════════════════════════════════════════════════════════════════
+ *
+ *
+ * "I'd just spawn two threads, that constantly try to change the handle
+ *  between just 2 back and forth, to maximize the amount of conflicts"
+ *
+ * Thread A: change_handle(H, H+1)
+ * Thread B: change_handle(H+1, H)
+ * ... continuously swapping ...
+ *
+ * Tests handle table corruption, reference counting, lost handles.
+ */
+
+static void *change_handle_thread_a(void *arg)
+{
+	struct thread_data *data = arg;
+	int ret;
+	pthread_t tid = pthread_self();
+
+	pthread_barrier_wait(data->barrier);
+
+	while (data->running) {
+		ret = gem_change_handle(data->ctx, data->handle, data->alt_handle);
+		if (verbose_logging) {
+			if (ret == 0) {
+				igt_info("[THREAD-A-TID:%lu] %u -> %u: SUCCESS\n",
+					 (unsigned long)tid, data->handle, data->alt_handle);
+			} else {
+				igt_info("[THREAD-A-TID:%lu] %u -> %u: FAILED - %s (errno=%d)\n",
+					 (unsigned long)tid, data->handle, data->alt_handle,
+					 strerror(errno), errno);
+			}
+		}
+
+		if (ret != 0 && errno != ENOENT && errno != EINVAL && errno != EEXIST && errno != ENOSPC) {
+			/* Unexpected error - potential race */
+			igt_info("[THREAD-A-TID:%lu] *** UNEXPECTED ERROR: %s (errno=%d) ***\n",
+				 (unsigned long)tid, strerror(errno), errno);
+			*data->unexpected_errno = errno;
+			__sync_fetch_and_add(data->race_detected, 1);
+		}
+		sched_yield();
+	}
+
+	return NULL;
+}
+
+static void *change_handle_thread_b(void *arg)
+{
+	struct thread_data *data = arg;
+	int ret;
+	pthread_t tid = pthread_self();
+
+	pthread_barrier_wait(data->barrier);
+
+	while (data->running) {
+		ret = gem_change_handle(data->ctx, data->alt_handle, data->handle);
+		if (verbose_logging) {
+			if (ret == 0) {
+				igt_info("[THREAD-B-TID:%lu] %u -> %u: SUCCESS\n",
+					 (unsigned long)tid, data->alt_handle, data->handle);
+			} else {
+				igt_info("[THREAD-B-TID:%lu] %u -> %u: FAILED - %s (errno=%d)\n",
+					 (unsigned long)tid, data->alt_handle, data->handle,
+					 strerror(errno), errno);
+			}
+		}
+
+		if (ret != 0 && errno != ENOENT && errno != EINVAL && errno != EEXIST && errno != ENOSPC) {
+			/* Unexpected error */
+			igt_info("[THREAD-B-TID:%lu] *** UNEXPECTED ERROR: %s (errno=%d) ***\n",
+				 (unsigned long)tid, strerror(errno), errno);
+			*data->unexpected_errno = errno;
+			__sync_fetch_and_add(data->race_detected, 1);
+		}
+		sched_yield();
+	}
+
+	return NULL;
+}
+
+/**
+ * test_race_change_vs_change - Concurrent CHANGE_HANDLE operations
+ *
+ *
+ * Implements email thread test strategy:
+ * "spawn two threads that constantly try to change the handle between
+ *  just 2 back and forth, to maximize the amount of conflicts"
+ *
+ * Thread A: change(H, H+1)
+ * Thread B: change(H+1, H)
+ *
+ * Validates kernel prevents handle table corruption.
+ */
+static void test_race_change_vs_change(struct gpu_ctx *ctx)
+{
+	pthread_t thread_a, thread_b;
+	pthread_barrier_t barrier;
+	struct thread_data data = {0};
+	uint32_t race_detected = 0;
+	int unexpected_errno = 0;
+	uint32_t handle;
+
+	igt_info("Testing RACE #2: CHANGE_HANDLE vs CHANGE_HANDLE on %s\n",
+		 gpu_name(ctx->driver));
+	igt_info("  Duration: %d seconds\n", RACE_DURATION_SEC);
+	igt_info("  Strategy: Two threads swapping handle H <-> H+1\n");
+	igt_info("  Goal: Detect handle corruption and lost handles\n");
+
+	handle = gem_create_bo(ctx, BO_SIZE);
+	igt_assert(handle != 0);
+
+	data.ctx = ctx;
+	data.handle = handle;
+	data.alt_handle = handle + 1;
+	data.race_detected = &race_detected;
+	data.unexpected_errno = &unexpected_errno;
+	data.running = true;
+
+	pthread_barrier_init(&barrier, NULL, 2);
+	data.barrier = &barrier;
+
+	/* Start both threads simultaneously */
+	igt_assert_eq(pthread_create(&thread_a, NULL, change_handle_thread_a, &data), 0);
+	igt_assert_eq(pthread_create(&thread_b, NULL, change_handle_thread_b, &data), 0);
+
+	/* Let them race */
+	sleep(RACE_DURATION_SEC);
+
+	data.running = false;
+	pthread_join(thread_a, NULL);
+	pthread_join(thread_b, NULL);
+
+	pthread_barrier_destroy(&barrier);
+
+	/* Try to close both possible handles */
+	gem_close_bo(ctx, handle);
+	gem_close_bo(ctx, handle + 1);
+
+	igt_info("  Race test completed. Suspicious conditions: %u\n", race_detected);
+	if (race_detected > 0) {
+		igt_info("  ⚠️  RACE DETECTED: Unexpected errno = %d (%s)\n",
+			 unexpected_errno, strerror(unexpected_errno));
+		igt_info("  This indicates the kernel may not be properly handling concurrent\n");
+		igt_info("  CHANGE_HANDLE operations. Kernel should serialize these with\n");
+		igt_info("  proper locking to prevent corruption and concurrent access issues.\n");
+	}
+	igt_assert_f(race_detected == 0,
+		     "Race condition detected! errno=%d (%s). "
+		     "Kernel locking may be insufficient.\n",
+		     unexpected_errno, strerror(unexpected_errno));
+}
+
+/*
+ * ═══════════════════════════════════════════════════════════════════════
+ * RACE CONDITION #3: CHANGE_HANDLE vs Prime Ioctls
+ * ═══════════════════════════════════════════════════════════════════════
+ *
+ *
+ * "maybe: 1. create bo 2. handle2fd, check that fd2handle gives us
+ *  the same handle back 3. change_handle 4. check that fd2handle
+ *  gives us the new handle back"
+ *
+ * Tests stale references, reference count corruption.
+ */
+
+/**
+ * change_handle_prime_thread - Continuously swap handle for prime test
+ *
+ * Like change_handle_thread_a/b but swaps back and forth between
+ * the two handle values to continuously exercise the race.
+ */
+static void *change_handle_prime_thread(void *arg)
+{
+	struct thread_data *data = arg;
+	uint32_t handle_a = data->handle;
+	uint32_t handle_b = data->alt_handle;
+	bool swap_direction = true;
+	int ret;
+	pthread_t tid = pthread_self();
+
+
+	pthread_barrier_wait(data->barrier);
+
+	while (data->running) {
+		if (swap_direction) {
+			/* Try to change from handle_a to handle_b */
+			ret = gem_change_handle(data->ctx, handle_a, handle_b);
+			if (verbose_logging) {
+				if (ret == 0) {
+					igt_info("[PRIME-CHANGE-TID:%lu] %u -> %u: SUCCESS\n",
+						 (unsigned long)tid, handle_a, handle_b);
+				} else {
+					igt_info("[PRIME-CHANGE-TID:%lu] %u -> %u: FAILED - %s (errno=%d)\n",
+						 (unsigned long)tid, handle_a, handle_b, strerror(errno), errno);
+				}
+			}
+		} else {
+			/* Try to change from handle_b to handle_a */
+			ret = gem_change_handle(data->ctx, handle_b, handle_a);
+			if (verbose_logging) {
+				if (ret == 0) {
+					igt_info("[PRIME-CHANGE-TID:%lu] %u -> %u: SUCCESS\n",
+						 (unsigned long)tid, handle_b, handle_a);
+				} else {
+					igt_info("[PRIME-CHANGE-TID:%lu] %u -> %u: FAILED - %s (errno=%d)\n",
+						 (unsigned long)tid, handle_b, handle_a, strerror(errno), errno);
+				}
+			}
+		}
+
+		/* Flip direction for next iteration to keep swapping */
+		if (ret == 0) {
+			swap_direction = !swap_direction;
+		}
+		/* All errors are acceptable during race - kernel will serialize */
+
+		sched_yield();
+	}
+
+	return NULL;
+}
+
+static void *prime_thread(void *arg)
+{
+	struct thread_data *data = arg;
+	struct drm_prime_handle prime_args;
+	uint32_t retrieved_handle;
+	uint32_t handle_a = data->handle;
+	uint32_t handle_b = data->alt_handle;
+	int dmabuf_fd;
+	int ret;
+	pthread_t tid = pthread_self();
+	uint32_t tried_handle;
+
+
+	pthread_barrier_wait(data->barrier);
+
+	while (data->running) {
+		/*
+		 * Try handle_a first. If it fails (handle was changed),
+		 * try handle_b. One of them should work.
+		 */
+		prime_args.handle = handle_a;
+		prime_args.flags = DRM_CLOEXEC | DRM_RDWR;
+		tried_handle = handle_a;
+		ret = igt_ioctl(data->ctx->fd, DRM_IOCTL_PRIME_HANDLE_TO_FD, &prime_args);
+		if (verbose_logging) {
+			if (ret == 0) {
+				igt_info("[PRIME-TID:%lu] HANDLE_TO_FD(handle=%u): SUCCESS (fd=%d)\n",
+					 (unsigned long)tid, tried_handle, prime_args.fd);
+			} else {
+				igt_info("[PRIME-TID:%lu] HANDLE_TO_FD(handle=%u): FAILED - %s (errno=%d)\n",
+					 (unsigned long)tid, tried_handle, strerror(errno), errno);
+			}
+		}
+		if (ret != 0) {
+			/* handle_a failed, try handle_b */
+			prime_args.handle = handle_b;
+			tried_handle = handle_b;
+			ret = igt_ioctl(data->ctx->fd, DRM_IOCTL_PRIME_HANDLE_TO_FD, &prime_args);
+			if (verbose_logging) {
+				if (ret == 0) {
+					igt_info("[PRIME-TID:%lu] HANDLE_TO_FD(handle=%u): SUCCESS (fd=%d)\n",
+						 (unsigned long)tid, tried_handle, prime_args.fd);
+				} else {
+					igt_info("[PRIME-TID:%lu] HANDLE_TO_FD(handle=%u): FAILED - %s (errno=%d)\n",
+						 (unsigned long)tid, tried_handle, strerror(errno), errno);
+				}
+			}
+		}
+
+		if (ret == 0) {
+			dmabuf_fd = prime_args.fd;
+
+			/* Convert back to handle */
+			prime_args.fd = dmabuf_fd;
+			prime_args.flags = 0;
+			ret = igt_ioctl(data->ctx->fd, DRM_IOCTL_PRIME_FD_TO_HANDLE, &prime_args);
+			if (verbose_logging) {
+				if (ret == 0) {
+					igt_info("[PRIME-TID:%lu] FD_TO_HANDLE(fd=%d): SUCCESS (handle=%u)\n",
+						 (unsigned long)tid, dmabuf_fd, prime_args.handle);
+				} else {
+					igt_info("[PRIME-TID:%lu] FD_TO_HANDLE(fd=%d): FAILED - %s (errno=%d)\n",
+						 (unsigned long)tid, dmabuf_fd, strerror(errno), errno);
+				}
+			}
+			if (ret == 0) {
+				retrieved_handle = prime_args.handle;
+
+				/*
+				 * Handle should be one of our two known handles.
+				 * If it's neither, Prime reference table is corrupted.
+				 */
+				if (retrieved_handle != handle_a &&
+				    retrieved_handle != handle_b) {
+					/* Handle corruption detected */
+					__sync_fetch_and_add(data->race_detected, 1);
+				}
+
+				/* Close retrieved handle */
+				gem_close_bo(data->ctx, retrieved_handle);
+			}
+			close(dmabuf_fd);
+		}
+		/* All errors acceptable during race */
+
+		usleep(100); /* Prime operations are slower */
+	}
+
+	return NULL;
+}
+
+/**
+ * test_race_change_vs_prime - Race CHANGE_HANDLE against Prime ioctls
+ *
+ *
+ * Implements email thread test:
+ * "create bo, handle2fd, check fd2handle returns same, change_handle,
+ *  check fd2handle returns new handle"
+ *
+ * Thread A: Continuously changes handle
+ * Thread B: Continuously does fd2handle and validates result
+ *
+ * Validates kernel updates Prime references correctly.
+ */
+static void test_race_change_vs_prime(struct gpu_ctx *ctx)
+{
+	pthread_t thread_change, thread_prime;
+	pthread_barrier_t barrier;
+	struct thread_data data = {0};
+	uint32_t race_detected = 0;
+	int unexpected_errno = 0;
+	uint32_t handle;
+	struct drm_prime_handle prime_args;
+	int dmabuf_fd, ret;
+	uint32_t retrieved_handle;
+
+	igt_info("Testing RACE #3: CHANGE_HANDLE vs Prime on %s\n",
+		 gpu_name(ctx->driver));
+	igt_info("  Duration: %d seconds\n", RACE_DURATION_SEC);
+	igt_info("  Goal: Detect stale references and refcount corruption\n");
+
+	handle = gem_create_bo(ctx, BO_SIZE);
+	igt_assert(handle != 0);
+
+	/* Initial prime export - verify it works */
+	prime_args.handle = handle;
+	prime_args.flags = DRM_CLOEXEC | DRM_RDWR;
+	ret = igt_ioctl(ctx->fd, DRM_IOCTL_PRIME_HANDLE_TO_FD, &prime_args);
+	igt_assert_eq(ret, 0);
+	dmabuf_fd = prime_args.fd;
+
+	prime_args.fd = dmabuf_fd;
+	prime_args.flags = 0;
+	ret = igt_ioctl(ctx->fd, DRM_IOCTL_PRIME_FD_TO_HANDLE, &prime_args);
+	igt_assert_eq(ret, 0);
+	retrieved_handle = prime_args.handle;
+	igt_assert_eq(retrieved_handle, handle);
+
+	gem_close_bo(ctx, retrieved_handle);
+	close(dmabuf_fd);
+
+	/* Now test concurrent change + prime operations */
+	data.ctx = ctx;
+	data.handle = handle;
+	data.alt_handle = handle + 1;
+	data.race_detected = &race_detected;
+	data.unexpected_errno = &unexpected_errno;
+	data.running = true;
+
+	pthread_barrier_init(&barrier, NULL, 2);
+	data.barrier = &barrier;
+
+	igt_assert_eq(pthread_create(&thread_change, NULL, change_handle_prime_thread, &data), 0);
+	igt_assert_eq(pthread_create(&thread_prime, NULL, prime_thread, &data), 0);
+
+	/* Let them race */
+	sleep(RACE_DURATION_SEC);
+
+	data.running = false;
+	pthread_join(thread_change, NULL);
+	pthread_join(thread_prime, NULL);
+
+	pthread_barrier_destroy(&barrier);
+
+	/* Cleanup */
+	gem_close_bo(ctx, handle);
+	gem_close_bo(ctx, handle + 1);
+
+	igt_info("  Race test completed. Handle corruption: %u\n", race_detected);
+	igt_assert_eq(race_detected, 0);
+}
+
+/*
+ * Aggressive race test - follows proven concurrent access reproducer pattern.
+ * Thread A: CHANGE_HANDLE(h->nh), Thread B: CLOSE(h)
+ * CPU pinning for maximum race potential.
+ */
+
+static void *aggressive_change_thread(void *arg)
+{
+	struct aggressive_data *data = arg;
+	pthread_t tid = pthread_self();
+	int ret;
+
+	pin_to_cpu(0);
+
+	while (!data->go)
+		__asm__ volatile("pause" ::: "memory");
+
+	ret = gem_change_handle(data->ctx, data->handle, data->new_handle);
+
+	if (verbose_logging) {
+		if (ret == 0) {
+			igt_info("[AGG-CHANGE-TID:%lu] %u -> %u: SUCCESS\n",
+				 (unsigned long)tid, data->handle, data->new_handle);
+		} else {
+			igt_info("[AGG-CHANGE-TID:%lu] %u -> %u: FAILED - %s (errno=%d)\n",
+				 (unsigned long)tid, data->handle, data->new_handle,
+				 strerror(errno), errno);
+		}
+	}
+
+	return NULL;
+}
+
+static void *aggressive_close_thread(void *arg)
+{
+	struct aggressive_data *data = arg;
+	pthread_t tid = pthread_self();
+
+	pin_to_cpu(1);
+
+	while (!data->go)
+		__asm__ volatile("pause" ::: "memory");
+
+	gem_close_bo(data->ctx, data->handle);
+
+	if (verbose_logging) {
+		igt_info("[AGG-CLOSE-TID:%lu] Closed handle %u\n",
+			 (unsigned long)tid, data->handle);
+	}
+
+	return NULL;
+}
+
+static void test_race_aggressive(struct gpu_ctx *ctx)
+{
+	struct aggressive_data data = {};
+	pthread_t thread_change, thread_close;
+	int iterations = 5000;
+	int race_wins = 0;
+	int kasan_before, kasan_after;
+	int i;
+
+	igt_info("Testing AGGRESSIVE RACE: CHANGE_HANDLE vs CLOSE on %s\n",
+		 gpu_name(ctx->driver));
+	igt_info("  Pattern: concurrent access reproducer from DRM mailing list\n");
+	igt_info("  Iterations: %d\n", iterations);
+	igt_info("  CPU pinning: Change->CPU0, Close->CPU1\n");
+	igt_info("\n");
+	igt_info("  Expected results:\n");
+	igt_info("    Unpatched kernel: Race wins ~50-60%%, KASAN traces in dmesg\n");
+	igt_info("    Patched kernel:   0 race wins (mutex serializes ops)\n");
+	igt_info("\n");
+	igt_info("  Note: KASAN traces appear in kernel log (dmesg), not test output\n");
+	igt_info("        Kernel must have CONFIG_KASAN=y to see detailed concurrent access reports\n");
+	igt_info("\n");
+
+	data.ctx = ctx;
+
+	/* Clear/mark kernel log before test */
+	kasan_before = check_kernel_traces();
+
+	for (i = 0; i < iterations; i++) {
+		uint32_t h = gem_create_bo(ctx, BO_SIZE);
+
+		data.handle = h;
+		data.new_handle = 0x4000 + (i & 0x3FFF);
+		data.go = 0;
+
+		__sync_synchronize();
+
+		pthread_create(&thread_change, NULL, aggressive_change_thread, &data);
+		pthread_create(&thread_close, NULL, aggressive_close_thread, &data);
+
+		__sync_synchronize();
+		data.go = 1;
+
+		pthread_join(thread_change, NULL);
+		pthread_join(thread_close, NULL);
+
+		/*
+		 * concurrent access Detection Strategy:
+		 *
+		 * The concurrent access happens when CHANGE_HANDLE races with CLOSE.
+		 * Handle state checking doesn't work because:
+		 * - With mutex: CHANGE can win cleanly (not a race)
+		 * - Without mutex: concurrent access happens but handles appear normal
+		 *
+		 * ONLY reliable detection: Monitor kernel log for concurrent access traces.
+		 * concurrent access shows up in drm_gem_object_release_handle path.
+		 */
+
+		/* Clean up handles (one or both may fail) */
+		drmIoctl(ctx->fd, DRM_IOCTL_GEM_CLOSE,
+			 &(struct drm_gem_close){ .handle = data.new_handle });
+		drmIoctl(ctx->fd, DRM_IOCTL_GEM_CLOSE,
+			 &(struct drm_gem_close){ .handle = h });
+
+		if ((i + 1) % 1000 == 0) {
+			/* Check for KASAN traces periodically */
+			int kasan_now = check_kernel_traces();
+			int kasan_new = kasan_now - kasan_before;
+
+			igt_info("  Progress: %d/%d, KASAN traces: %d\n",
+				 i + 1, iterations, kasan_new);
+
+			if (kasan_new > 0 && race_wins == 0) {
+				race_wins = kasan_new;
+			}
+		}
+	}
+
+	/* Final KASAN check */
+	kasan_after = check_kernel_traces();
+	race_wins = kasan_after - kasan_before;
+
+	igt_info("\nAggressive race test completed:\n");
+	igt_info("  Iterations: %d\n", iterations);
+	igt_info("  KASAN concurrent access traces detected: %d\n", race_wins);
+
+	if (race_wins > 0) {
+		igt_info("\n*** RACE CONDITION DETECTED (concurrent access) ***\n");
+		igt_info("  Kernel is UNPATCHED (missing handle_map_lock mutex)\n");
+		igt_info("  KASAN detected %d concurrent access issues events\n", race_wins);
+		igt_info("\n");
+		igt_info("  View concurrent access traces:\n");
+		igt_info("    dmesg | grep -A40 -E '(drm_gem_object_release_handle|drm_gem_object_handle_put_unlocked)'\n");
+		igt_info("\n");
+		igt_info("  The concurrent access happens when CHANGE_HANDLE tries to access\n");
+		igt_info("  an object that was freed by concurrent CLOSE.\n");
+		igt_info("\n");
+		igt_info("  Fix: Apply V5 patch (add handle_map_lock mutex)\n");
+
+		/* Fail the test if concurrent access detected */
+		igt_assert_eq(race_wins, 0);
+	} else {
+		igt_info("\n=== NO concurrent access DETECTED ===\n");
+		igt_info("  Kernel appears PATCHED (handle_map_lock prevents race)\n");
+		igt_info("  No KASAN traces found after %d iterations\n", iterations);
+		igt_info("  This is the expected behavior with V5 patch applied\n");
+		igt_info("\n");
+		igt_info("  Note: concurrent access detection via kernel log monitoring\n");
+		igt_info("        Works with KASAN or kernel oops/warnings\n");
+	}
+}
+
+
+/*
+ * ═══════════════════════════════════════════════════════════════════════
+ * SINGLE-THREADED TEST - Focused race exploitation
+ * ═══════════════════════════════════════════════════════════════════════
+ */
+
+/*
+ * ═══════════════════════════════════════════════════════════════════════
+ * SINGLE-THREADED TEST - Fixed timing
+ * ═══════════════════════════════════════════════════════════════════════
+ */
+
+static void *single_thread_hammer(void *arg)
+{
+	struct single_thread_data *data = arg;
+	uint32_t handle, alt_handle;
+	int local_fd;
+	int ret;
+	bool is_base = true;
+	unsigned long swaps = 0;
+	struct gpu_ctx local_ctx;
+
+	pthread_barrier_wait(data->barrier);
+
+	/* Create BO BEFORE closer starts */
+	pthread_mutex_lock(data->fd_lock);
+	local_fd = *data->main_fd;
+	pthread_mutex_unlock(data->fd_lock);
+
+	local_ctx = *data->ctx;
+	local_ctx.fd = local_fd;
+
+	handle = gem_create_bo(&local_ctx, 4096);
+	if (handle == 0) {
+		igt_info("[HAMMER] Failed to create BO\n");
+		data->hammer_ready = true;  /* Signal even on failure */
+		return NULL;
+	}
+
+	alt_handle = handle + 1;
+	igt_info("[HAMMER] Created handle %u, will swap with %u\n", handle, alt_handle);
+
+	/* Signal that BO is ready - closer can start now */
+	data->hammer_ready = true;
+
+	while (data->running) {
+		/* Rapid swap - no FD checks, just swap */
+		ret = gem_change_handle(&local_ctx,
+					is_base ? handle : alt_handle,
+					is_base ? alt_handle : handle);
+		if (ret == 0) {
+			swaps++;
+			__sync_fetch_and_add(&data->swap_count, 1);
+			is_base = !is_base;
+
+			if (swaps % 10000 == 0)
+				igt_info("[HAMMER] %lu swaps\n", swaps);
+		}
+		/* No error handling - just keep hammering */
+	}
+
+	igt_info("[HAMMER] Final: %lu swaps\n", swaps);
+	return NULL;
+}
+
+static void *single_thread_closer(void *arg)
+{
+	struct single_thread_data *data = arg;
+	unsigned long closes = 0;
+	int new_fd;
+
+	pthread_barrier_wait(data->barrier);
+
+	/* Wait for hammer to create BO first */
+	while (!data->hammer_ready)
+		usleep(100);
+
+	igt_info("[CLOSER] Hammer ready, starting closes\n");
+
+	while (data->running) {
+		/* Close FD to trigger idr_for_each() */
+		pthread_mutex_lock(data->fd_lock);
+		if (*data->main_fd >= 0) {
+			close(*data->main_fd);
+			*data->main_fd = -1;
+			closes++;
+			__sync_fetch_and_add(&data->close_count, 1);
+		}
+		pthread_mutex_unlock(data->fd_lock);
+
+		/* Small delay - this is the window for hitting the race */
+		usleep(1000);
+
+		/* Reopen */
+		new_fd = drm_open_driver_render(DRIVER_ANY);
+		if (new_fd >= 0) {
+			pthread_mutex_lock(data->fd_lock);
+			*data->main_fd = new_fd;
+			pthread_mutex_unlock(data->fd_lock);
+		}
+
+		/* Check KASAN */
+		if (closes % 100 == 0) {
+			int kasan_now = check_kernel_traces();
+			if (kasan_now > 0) {
+				__sync_fetch_and_add(data->race_hits, 1);
+				igt_info("[CLOSER] *** KASAN DETECTED: %d traces ***\n", kasan_now);
+			}
+		}
+	}
+
+	igt_info("[CLOSER] %lu closes\n", closes);
+	return NULL;
+}
+
+static void *single_thread_monitor(void *arg)
+{
+	struct single_thread_data *data = arg;
+	int kasan_last = 0;
+
+	pthread_barrier_wait(data->barrier);
+
+	while (data->running) {
+		sleep(5);
+
+		int kasan_now = check_kernel_traces();
+		if (kasan_now > kasan_last) {
+			igt_info("[MONITOR] +%d KASAN traces (total: %d)\n",
+				 kasan_now - kasan_last, kasan_now);
+			kasan_last = kasan_now;
+		}
+
+		igt_info("[STATS] Swaps:%u Closes:%u KASAN:%u\n",
+			 data->swap_count, data->close_count, *data->race_hits);
+	}
+
+	return NULL;
+}
+
+static void test_race_single_thread(struct gpu_ctx *ctx)
+{
+	pthread_t hammer, closer, monitor;
+	pthread_barrier_t barrier;
+	pthread_mutex_t fd_lock = PTHREAD_MUTEX_INITIALIZER;
+	struct single_thread_data data = {0};
+	uint32_t race_hits = 0;
+	int main_fd;
+	int kasan_before, kasan_after;
+
+	igt_info("═══════════════════════════════════════════════════════════\n");
+	igt_info("  SINGLE-THREADED FOCUSED TEST (Fixed Timing)\n");
+	igt_info("═══════════════════════════════════════════════════════════\n");
+	igt_info("  Duration: 3 seconds\n");
+	igt_info("  Threads: 1 hammer + 1 closer + 1 monitor\n");
+	igt_info("  Strategy:\n");
+	igt_info("    1. Hammer creates ONE BO\n");
+	igt_info("    2. Hammer swaps H <-> H+1 rapidly in tight loop\n");
+	igt_info("    3. Closer periodically close(fd) -> idr_for_each()\n");
+	igt_info("  Race window: idr_alloc(new) ... idr_replace(old, NULL)\n");
+	igt_info("    Between these two, BOTH handles point to same object\n");
+	igt_info("    If idr_for_each() runs here -> double release -> concurrent access\n");
+	igt_info("═══════════════════════════════════════════════════════════\n\n");
+
+	kasan_before = check_kernel_traces();
+	igt_info("KASAN traces before test: %d\n\n", kasan_before);
+
+	main_fd = drm_open_driver_render(DRIVER_ANY);
+	igt_require(main_fd >= 0);
+
+	data.ctx = ctx;
+	data.main_fd = &main_fd;
+	data.fd_lock = &fd_lock;
+	data.running = true;
+	data.hammer_ready = false;
+	data.race_hits = &race_hits;
+
+	pthread_barrier_init(&barrier, NULL, 3);
+	data.barrier = &barrier;
+
+	igt_info("Starting threads...\n");
+
+	pthread_create(&hammer, NULL, single_thread_hammer, &data);
+	pthread_create(&closer, NULL, single_thread_closer, &data);
+	pthread_create(&monitor, NULL, single_thread_monitor, &data);
+
+	igt_info("Racing for 3 seconds...\n\n");
+	sleep(3);
+
+	igt_info("\nStopping threads...\n");
+	data.running = false;
+
+	pthread_join(hammer, NULL);
+	pthread_join(closer, NULL);
+	pthread_join(monitor, NULL);
+
+	pthread_barrier_destroy(&barrier);
+	pthread_mutex_destroy(&fd_lock);
+
+	if (main_fd >= 0)
+		close(main_fd);
+
+	kasan_after = check_kernel_traces();
+	int race_detected = kasan_after - kasan_before;
+
+	igt_info("\n═══════════════════════════════════════════════════════════\n");
+	igt_info("  SINGLE-THREADED TEST RESULTS\n");
+	igt_info("═══════════════════════════════════════════════════════════\n");
+	igt_info("  Total swaps: %u\n", data.swap_count);
+	igt_info("  Total closes: %u\n", data.close_count);
+	igt_info("  KASAN concurrent access traces: %d\n", race_detected);
+	igt_info("═══════════════════════════════════════════════════════════\n\n");
+
+	if (race_detected > 0) {
+		igt_info("*** SUCCESS: RACE CONDITION TRIGGERED! ***\n\n");
+		igt_info("concurrent access detected with %d KASAN traces!\n\n", race_detected);
+		igt_info("This confirms the vulnerability in the wrong operation order:\n\n");
+		igt_info("  Race Timeline:\n");
+		igt_info("  --------------\n");
+		igt_info("  T1: Hammer thread calls change_handle(H, H+1)\n");
+		igt_info("      -> enters drm_gem_change_handle_ioctl()\n");
+		igt_info("      -> spin_lock(&table_lock)\n");
+		igt_info("      -> idr_alloc(H+1, obj)\n");
+		igt_info("         [RACE WINDOW OPENS - Both H and H+1 point to obj]\n\n");
+		igt_info("  T2: Closer thread calls close(fd)\n");
+		igt_info("      -> drm_gem_release()\n");
+		igt_info("      -> idr_for_each(&object_idr, release_handle, ...)\n");
+		igt_info("         Iteration 1: handle H -> release(obj)\n");
+		igt_info("         Iteration 2: handle H+1 -> release(obj) AGAIN\n");
+		igt_info("      -> DOUBLE RELEASE -> USE-AFTER-FREE!\n\n");
+		igt_info("  T3: Hammer thread continues (if not crashed):\n");
+		igt_info("      -> idr_replace(H, NULL)\n");
+		igt_info("         [Too late - obj already freed]\n\n");
+		igt_info("View KASAN traces:\n");
+		igt_info("  sudo dmesg | grep -B10 -A40 'concurrent access issues'\n\n");
+		igt_info("The fix (correct order):\n");
+		igt_info("  1. idr_replace(H, NULL)  FIRST  <- Make H invisible\n");
+		igt_info("  2. idr_alloc(H+1, obj)   SECOND <- Create new handle\n");
+		igt_info("  Result: At no point do both handles exist simultaneously\n");
+		igt_info("          idr_for_each() can never see both -> no double release\n\n");
+	} else {
+		igt_info("=== NO concurrent access DETECTED ===\n\n");
+		if (data.swap_count == 0) {
+			igt_info("ERROR: No successful handle swaps!\n");
+			igt_info("The change_handle ioctl may not be working properly.\n\n");
+		} else if (data.swap_count < 100) {
+			igt_info("WARNING: Very few swaps (%u). May not have hit race window.\n\n",
+				 data.swap_count);
+		} else {
+			igt_info("Completed %u swaps and %u closes without detecting concurrent access.\n\n",
+				 data.swap_count, data.close_count);
+			igt_info("Possible reasons:\n");
+			igt_info("  1. Correct patch is applied (NULL old BEFORE alloc new)\n");
+			igt_info("  2. Race window is extremely small (nanoseconds)\n");
+			igt_info("  3. Timing didn't align to hit the exact window\n");
+			igt_info("  4. KASAN may not be sensitive enough to catch it\n");
+			igt_info("  5. Test needs different timing parameters\n\n");
+			igt_info("Note: Absence of concurrent access detection doesn't prove correctness.\n");
+			igt_info("      Code analysis shows the race exists in principle.\n");
+		}
+	}
+}
+
+/*
+ * ═══════════════════════════════════════════════════════════════════════
+ * RANDOM HANDLE TEST - Try random handle numbers to find free slots
+ * ═══════════════════════════════════════════════════════════════════════
+ */
+
+static void *random_handle_hammer(void *arg)
+{
+	struct random_handle_data *data = arg;
+	uint32_t handle;
+	int local_fd;
+	int ret;
+	unsigned long swaps = 0;
+	unsigned long attempts = 0;
+	struct gpu_ctx local_ctx;
+	uint32_t random_handle;
+
+	pthread_barrier_wait(data->barrier);
+
+	/* Create BO BEFORE closer starts */
+	pthread_mutex_lock(data->fd_lock);
+	local_fd = *data->main_fd;
+	pthread_mutex_unlock(data->fd_lock);
+
+	local_ctx = *data->ctx;
+	local_ctx.fd = local_fd;
+
+	handle = gem_create_bo(&local_ctx, 4096);
+	if (handle == 0) {
+		igt_info("[HAMMER] Failed to create BO\n");
+		data->hammer_ready = true;
+		return NULL;
+	}
+
+	igt_info("[HAMMER] Created base handle %u\n", handle);
+	data->hammer_ready = true;
+
+	/* Seed random number generator with thread ID + time */
+	srand(time(NULL) ^ pthread_self());
+
+	while (data->running) {
+		/* Try random handle numbers in different ranges */
+		int range = attempts % 4;
+		switch (range) {
+		case 0:
+			/* Small random offset (1-100) */
+			random_handle = handle + (rand() % 100) + 1;
+			break;
+		case 1:
+			/* Medium random offset (100-10000) */
+			random_handle = handle + (rand() % 9900) + 100;
+			break;
+		case 2:
+			/* Large random offset (1M-2M) */
+			random_handle = handle + 1000000 + (rand() % 1000000);
+			break;
+		case 3:
+			/* Completely random handle */
+			random_handle = rand() % 0xFFFFFF;
+			if (random_handle == handle)
+				random_handle++;
+			break;
+		}
+
+		attempts++;
+		__sync_fetch_and_add(&data->attempt_count, 1);
+
+		/* Try to change to random handle */
+		ret = gem_change_handle(&local_ctx, handle, random_handle);
+		if (ret == 0) {
+			swaps++;
+			__sync_fetch_and_add(&data->swap_count, 1);
+
+			/* Successfully swapped, now swap back */
+			ret = gem_change_handle(&local_ctx, random_handle, handle);
+			if (ret != 0) {
+				/* Failed to swap back, update current handle */
+				handle = random_handle;
+			}
+
+			if (swaps % 100 == 0)
+				igt_info("[HAMMER] %lu successful swaps (%.2f%% success rate)\n",
+					 swaps, 100.0 * swaps / attempts);
+		}
+
+		/* Every 10000 attempts, report stats */
+		if (attempts % 10000 == 0) {
+			igt_info("[HAMMER] %lu attempts, %lu swaps (%.4f%% success)\n",
+				 attempts, swaps, 100.0 * swaps / attempts);
+		}
+	}
+
+	igt_info("[HAMMER] Final: %lu swaps from %lu attempts (%.4f%%)\n",
+		 swaps, attempts, 100.0 * swaps / attempts);
+
+	/* Cleanup current handle */
+	gem_close_bo(&local_ctx, handle);
+
+	return NULL;
+}
+
+static void *random_handle_closer(void *arg)
+{
+	struct random_handle_data *data = arg;
+	unsigned long closes = 0;
+	int new_fd;
+
+	pthread_barrier_wait(data->barrier);
+
+	/* Wait for hammer to create BO first */
+	while (!data->hammer_ready)
+		usleep(100);
+
+	igt_info("[CLOSER] Hammer ready, starting closes\n");
+
+	while (data->running) {
+		/* Close FD to trigger idr_for_each() */
+		pthread_mutex_lock(data->fd_lock);
+		if (*data->main_fd >= 0) {
+			close(*data->main_fd);
+			*data->main_fd = -1;
+			closes++;
+			__sync_fetch_and_add(&data->close_count, 1);
+		}
+		pthread_mutex_unlock(data->fd_lock);
+
+		/* Small delay - race window */
+		usleep(1000);
+
+		/* Reopen */
+		new_fd = drm_open_driver_render(DRIVER_ANY);
+		if (new_fd >= 0) {
+			pthread_mutex_lock(data->fd_lock);
+			*data->main_fd = new_fd;
+			pthread_mutex_unlock(data->fd_lock);
+		}
+
+		/* Check KASAN */
+		if (closes % 100 == 0) {
+			int kasan_now = check_kernel_traces();
+			if (kasan_now > 0) {
+				__sync_fetch_and_add(data->race_hits, 1);
+				igt_info("[CLOSER] *** KASAN DETECTED: %d traces ***\n", kasan_now);
+			}
+		}
+	}
+
+	igt_info("[CLOSER] %lu closes\n", closes);
+	return NULL;
+}
+
+static void *random_handle_monitor(void *arg)
+{
+	struct random_handle_data *data = arg;
+	int kasan_last = 0;
+
+	pthread_barrier_wait(data->barrier);
+
+	while (data->running) {
+		sleep(5);
+
+		int kasan_now = check_kernel_traces();
+		if (kasan_now > kasan_last) {
+			igt_info("[MONITOR] +%d KASAN traces (total: %d)\n",
+				 kasan_now - kasan_last, kasan_now);
+			kasan_last = kasan_now;
+		}
+
+		igt_info("[STATS] Attempts:%u Swaps:%u Closes:%u KASAN:%u (%.4f%% success)\n",
+			 data->attempt_count, data->swap_count, data->close_count,
+			 *data->race_hits,
+			 data->attempt_count > 0 ? 100.0 * data->swap_count / data->attempt_count : 0);
+	}
+
+	return NULL;
+}
+
+static void test_race_random_handles(struct gpu_ctx *ctx)
+{
+	pthread_t hammer, closer, monitor;
+	pthread_barrier_t barrier;
+	pthread_mutex_t fd_lock = PTHREAD_MUTEX_INITIALIZER;
+	struct random_handle_data data = {0};
+	uint32_t race_hits = 0;
+	int main_fd;
+	int kasan_before, kasan_after;
+
+	igt_info("═══════════════════════════════════════════════════════════\n");
+	igt_info("  RANDOM HANDLE TEST\n");
+	igt_info("═══════════════════════════════════════════════════════════\n");
+	igt_info("  Duration: 3 seconds\n");
+	igt_info("  Threads: 1 hammer + 1 closer + 1 monitor\n");
+	igt_info("  Strategy:\n");
+	igt_info("    1. Hammer creates ONE BO\n");
+	igt_info("    2. Hammer tries RANDOM new handle numbers\n");
+	igt_info("    3. Ranges: small (1-100), medium (100-10K),\n");
+	igt_info("       large (1M-2M), completely random\n");
+	igt_info("    4. Swaps back to original handle on success\n");
+	igt_info("    5. Closer periodically close(fd) -> idr_for_each()\n");
+	igt_info("  Goal: Find free handle slots by random probing\n");
+	igt_info("═══════════════════════════════════════════════════════════\n\n");
+
+	kasan_before = check_kernel_traces();
+	igt_info("KASAN traces before test: %d\n\n", kasan_before);
+
+	main_fd = drm_open_driver_render(DRIVER_ANY);
+	igt_require(main_fd >= 0);
+
+	data.ctx = ctx;
+	data.main_fd = &main_fd;
+	data.fd_lock = &fd_lock;
+	data.running = true;
+	data.hammer_ready = false;
+	data.race_hits = &race_hits;
+
+	pthread_barrier_init(&barrier, NULL, 3);
+	data.barrier = &barrier;
+
+	igt_info("Starting threads...\n");
+
+	pthread_create(&hammer, NULL, random_handle_hammer, &data);
+	pthread_create(&closer, NULL, random_handle_closer, &data);
+	pthread_create(&monitor, NULL, random_handle_monitor, &data);
+
+	igt_info("Racing for 3 seconds...\n\n");
+	sleep(3);
+
+	igt_info("\nStopping threads...\n");
+	data.running = false;
+
+	pthread_join(hammer, NULL);
+	pthread_join(closer, NULL);
+	pthread_join(monitor, NULL);
+
+	pthread_barrier_destroy(&barrier);
+	pthread_mutex_destroy(&fd_lock);
+
+	if (main_fd >= 0)
+		close(main_fd);
+
+	kasan_after = check_kernel_traces();
+	int race_detected = kasan_after - kasan_before;
+
+	igt_info("\n═══════════════════════════════════════════════════════════\n");
+	igt_info("  RANDOM HANDLE TEST RESULTS\n");
+	igt_info("═══════════════════════════════════════════════════════════\n");
+	igt_info("  Total attempts: %u\n", data.attempt_count);
+	igt_info("  Successful swaps: %u\n", data.swap_count);
+	if (data.attempt_count > 0) {
+		igt_info("  Success rate: %.4f%%\n",
+			 100.0 * data.swap_count / data.attempt_count);
+	}
+	igt_info("  Total closes: %u\n", data.close_count);
+	igt_info("  KASAN concurrent access traces: %d\n", race_detected);
+	igt_info("═══════════════════════════════════════════════════════════\n\n");
+
+	if (race_detected > 0) {
+		igt_info("*** SUCCESS: RACE CONDITION TRIGGERED! ***\n\n");
+		igt_info("concurrent access detected with %d KASAN traces!\n\n", race_detected);
+		igt_info("This confirms the race with random handle probing.\n\n");
+		igt_info("View KASAN traces:\n");
+		igt_info("  sudo dmesg | grep -B10 -A40 'concurrent access issues'\n\n");
+	} else {
+		igt_info("=== NO concurrent access DETECTED ===\n\n");
+		if (data.swap_count == 0) {
+			igt_info("ERROR: No successful handle swaps!\n");
+			igt_info("Random probing also failed to find free handles.\n\n");
+		} else if (data.swap_count < 100) {
+			igt_info("WARNING: Very few swaps (%u). May not have hit race window.\n\n",
+				 data.swap_count);
+		} else {
+			igt_info("Completed %u swaps and %u closes without detecting concurrent access.\n\n",
+				 data.swap_count, data.close_count);
+			igt_info("Random handle probing success rate: %.4f%%\n\n",
+				 100.0 * data.swap_count / data.attempt_count);
+			if (data.swap_count > 1000) {
+				igt_info("Good swap rate - race window likely too small to hit.\n");
+			}
+		}
+	}
+}
+/*
+ * Close-before-lock test - Exact race from vulnerability report
+ *
+ * Tests concurrent GEM_CLOSE and CHANGE_HANDLE operations.
+ * The race exploits the window where GEM_CLOSE runs BEFORE change_handle
+ * takes table_lock for idr_alloc:
+ *
+ *   Thread A (change_handle)          Thread B (GEM_CLOSE on H)
+ *   -----------------------          -------------------------
+ *   obj = lookup(H)  refcount 1->2
+ *                                    handle_count 1->0 -> put(obj)
+ *                                      refcount 2->1
+ *                                    idr_remove(H)
+ *   idr_alloc(obj, N)
+ *   idr_replace(NULL, H): H empty,
+ *     returns NULL -- discarded!
+ *   idr_replace(obj, N)
+ *   out: put(obj)  refcount 1->0
+ *     -> obj FREED
+ *
+ * End state: object_idr[N] points at freed obj -> concurrent access
+ *
+ * Uses DRM_IOCTL_MODE_CREATE_DUMB (driver-agnostic, no libdrm needed).
+ * Semaphore sync + CPU pinning for maximum race window exploitation.
+ *
+ * Expected:
+ *   Unpatched kernel: "Race Success" + KASAN traces in dmesg
+ *   Patched kernel (Sima's fix): 0 race wins in 2000 iterations
+ */
+
+static void *race_change_worker(void *arg)
+{
+	struct race_shared *s = arg;
+
+	pin_to_cpu(1);
+	sem_wait(&s->change_sem);
+
+	if (igt_ioctl(s->fd, DRM_IOCTL_GEM_CHANGE_HANDLE, &s->ch) == 0)
+		s->change_success = 1;
+
+	return NULL;
+}
+
+static void *race_close_worker(void *arg)
+{
+	struct race_shared *s = arg;
+
+	pin_to_cpu(0);
+	sem_wait(&s->close_sem);
+
+	if (igt_ioctl(s->fd, DRM_IOCTL_GEM_CLOSE, &s->cl) == 0)
+		s->close_success = 1;
+
+	return NULL;
+}
+
+static void test_race_race_cve(struct gpu_ctx *ctx)
+{
+	struct race_shared shared;
+	int iterations = 2000;
+	int race_wins = 0;
+	int kasan_before, kasan_after;
+	int i;
+
+	igt_info("Testing Close-before-lock test on %s\n",
+		 gpu_name(ctx->driver));
+	igt_info("  Tests close-before-lock scenario)\n");
+	igt_info("  Race: GEM_CLOSE wins before CHANGE_HANDLE takes table_lock\n");
+	igt_info("  Method: Semaphore sync + CPU pinning \n");
+	igt_info("  Iterations: %d\n", iterations);
+	igt_info("  Detection: Both change AND close succeed simultaneously\n\n");
+
+	shared.fd = ctx->fd;
+	kasan_before = check_kernel_traces();
+
+	for (i = 0; i < iterations; i++) {
+		struct drm_mode_create_dumb create = {
+			.width = 64,
+			.height = 64,
+			.bpp = 32,
+		};
+		pthread_t tid_change, tid_close;
+		int ret;
+
+		ret = igt_ioctl(ctx->fd, DRM_IOCTL_MODE_CREATE_DUMB, &create);
+		if (ret < 0) {
+			/*
+			 * MODE_CREATE_DUMB may not be supported on all
+			 * drivers/configs. Fall back to gem_create_bo.
+			 */
+			create.handle = gem_create_bo(ctx, BO_SIZE);
+		}
+
+		shared.old_handle = create.handle;
+		shared.new_handle = 0x4000 + i;
+		shared.ch.handle = shared.old_handle;
+		shared.ch.new_handle = shared.new_handle;
+		shared.cl.handle = shared.old_handle;
+		shared.change_success = 0;
+		shared.close_success = 0;
+
+		sem_init(&shared.change_sem, 0, 0);
+		sem_init(&shared.close_sem, 0, 0);
+
+		igt_assert_eq(pthread_create(&tid_change, NULL,
+					     race_change_worker, &shared), 0);
+		igt_assert_eq(pthread_create(&tid_close, NULL,
+					     race_close_worker, &shared), 0);
+
+		/* Brief delay to let threads reach sem_wait */
+		usleep(100);
+
+		/* Fire both threads as close to simultaneously as possible */
+		sem_post(&shared.change_sem);
+		sem_post(&shared.close_sem);
+
+		pthread_join(tid_change, NULL);
+		pthread_join(tid_close, NULL);
+
+		sem_destroy(&shared.change_sem);
+		sem_destroy(&shared.close_sem);
+
+		if (shared.change_success && shared.close_success) {
+			race_wins++;
+			igt_info("  [%d] *** RACE WIN: both change and close "
+				 "succeeded (handle %u -> %u) ***\n",
+				 i, shared.old_handle, shared.new_handle);
+			/*
+			 * new_handle now points to a freed object.
+			 * Do NOT touch it -- just record the event.
+			 * The dangling handle will be cleaned up on fd close.
+			 */
+		} else if (shared.change_success) {
+			/* Change won, close lost -- normal, clean up new handle */
+			struct drm_gem_close cleanup = {
+				.handle = shared.new_handle
+			};
+			igt_ioctl(ctx->fd, DRM_IOCTL_GEM_CLOSE, &cleanup);
+		}
+		/* If close won and change lost: handle already freed, nothing to do */
+
+		if ((i + 1) % 500 == 0)
+			igt_info("  Progress: %d/%d (race wins: %d)\n",
+				 i + 1, iterations, race_wins);
+	}
+
+	kasan_after = check_kernel_traces();
+
+	igt_info("\n  Results:\n");
+	igt_info("  Iterations: %d\n", iterations);
+	igt_info("  Race wins (both succeeded): %d\n", race_wins);
+	igt_info("  KASAN concurrent access traces: %d\n", kasan_after - kasan_before);
+
+	if (race_wins > 0) {
+		igt_info("\n  *** concurrent access RACE DETECTED ***\n");
+		igt_info("  %d iterations had both CHANGE_HANDLE and GEM_CLOSE\n"
+			 "  succeed on the same handle. The new handle now\n"
+			 "  points to a freed GEM object.\n\n", race_wins);
+		igt_info("  View KASAN traces:\n");
+		igt_info("    sudo dmesg | grep -B5 -A40 'concurrent access issues'\n\n");
+	} else {
+		igt_info("\n  === NO RACE DETECTED ===\n");
+		igt_info("  Kernel appears patched. No iteration had both\n");
+		igt_info("  CHANGE_HANDLE and GEM_CLOSE succeed simultaneously.\n");
+	}
+
+	/*
+	 * Fail the test if races were detected -- this is a security bug.
+	 * If KASAN found concurrent access traces, that's definitive proof.
+	 */
+	igt_assert_f(race_wins == 0,
+		     "concurrent access race detected: %d wins in %d iterations\n",
+		     race_wins, iterations);
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
+		igt_info("═══════════════════════════════════════════════\n");
+		igt_info("  GPU-Agnostic Race Condition Tests\n");
+		igt_info("  Running on: %s\n", gpu_name(ctx.driver));
+		igt_info("═══════════════════════════════════════════════\n");
+
+#if HAS_AMDGPU
+		if (ctx.driver == DRIVER_TYPE_AMDGPU) {
+			uint32_t major, minor;
+			int err = amdgpu_device_initialize(ctx.fd, &major, &minor,
+							   &ctx.amdgpu_device);
+			igt_require(err == 0);
+			igt_info("  AMDGPU version: %d.%d\n", major, minor);
+		}
+#endif
+
+		if (ctx.driver == DRIVER_TYPE_I915) {
+			igt_require_gem(ctx.fd);
+			igt_info("  i915 GEM verified\n");
+		}
+
+		igt_info("═══════════════════════════════════════════════\n\n");
+	}
+
+	igt_describe("Race Condition #1: CHANGE_HANDLE vs GEM_CLOSE (concurrent access issues)");
+	igt_subtest("race-change-vs-close")
+		test_race_change_vs_close(&ctx);
+
+	igt_describe("Race Condition #2: Concurrent CHANGE_HANDLE (handle corruption)");
+	igt_subtest("race-change-vs-change")
+		test_race_change_vs_change(&ctx);
+
+	igt_describe("Race Condition #3: CHANGE_HANDLE vs Prime (stale references)");
+	igt_subtest("race-change-vs-prime")
+		test_race_change_vs_prime(&ctx);
+	igt_describe("Aggressive concurrent access race: CHANGE_HANDLE vs CLOSE with KASAN detection");
+	igt_subtest("race-aggressive-change-vs-close")
+		test_race_aggressive(&ctx);
+	igt_describe("Single-thread: One BO swapped H<->H+1 with periodic FD close");
+	igt_subtest("race-exploit-single-thread")
+		test_race_single_thread(&ctx);
+	igt_describe("Random handle probing: Try random new_handle values to find free slots");
+	igt_subtest("race-exploit-random-handles")
+		test_race_random_handles(&ctx);
+	igt_describe(" GEM_CLOSE races CHANGE_HANDLE lookup ");
+	igt_subtest("race-close-before-lock")
+		test_race_race_cve(&ctx);
+
+	igt_fixture() {
+#if HAS_AMDGPU
+		if (ctx.driver == DRIVER_TYPE_AMDGPU && ctx.amdgpu_device)
+			amdgpu_device_deinitialize(ctx.amdgpu_device);
+#endif
+		drm_close_driver(ctx.fd);
+	}
+}
-- 
2.54.0

