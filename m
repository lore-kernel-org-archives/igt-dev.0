Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C355C43458
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jul 2026 05:13:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 743F710E41A;
	Tue,  7 Jul 2026 05:13:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SehswWGP";
	dkim-atps=neutral
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010029.outbound.protection.outlook.com
 [40.93.198.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DC0210E41A
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jul 2026 05:12:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pF7pu+BxaYgjrtPy+RMRKXbEqn3NTbmMRT1HFtn9Rj1CNitv0BvTdIJ9/u9GAiBXzg4sWSRyL5uuIdHOv8gaiI7JpPY+1H4Ggmf10LOm4vf2vpUBYKOOaRGqfWZU9KvKY2cIM/Fx0Vlb2WGxIFj4U3zRi95DqCrquhtZ4fiL+NhPKFOkDK9FVaJzFz2BDNARL9ZZhWb5VVO4g56+Pjt92rX+q1/Wr78Na29kpH+tB23tlTuU99m0ABCp8UqOeF4Bvr+L1OCJ/m3qX3jsXALSztHIsm3nGQJAzsYUGCGpmjTfX52UynlwZyhYnJx4FHXDUqny4FcLIHVLSNUnvkNfAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4YQfQGlw+wdBbiLyuTRJT6eolZmip8o1sprGdR4lZmQ=;
 b=obPKTQsaZYUjRm/DVE0F5MYyjmYS7tdY7+as0pVBMNnON3lKjgKo/kxWJY42LTGihezB+T/3tFgmVvYtRxJCSMV2KAFOuGXq2DZ4aMOIVISOTSknovxpU+MGVIoyONx5EbX88UqRZP+alAvvmSNb0uxDOrD1TygMZDZ5DQgRoWJKHvd5tpG1SAz/SLfgEDeTvclOZOFeF6vq6UzL0GDy1tMULnbXalElWpOW0xfKrTruIqIaF2tBvHiKh7TFc9v3uEBZ/K0gvXnt7LNwK8SpG4+1Rfl/M5ZTDQjVTo1C541u67MW2B/Y6++tjQFs3zI4eG7Bx91brrFI0CTKpLuSvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4YQfQGlw+wdBbiLyuTRJT6eolZmip8o1sprGdR4lZmQ=;
 b=SehswWGP1XYPmz/2vbf7Bpc1xw5IHGhXC3ukjXzWyzRu9uOuxkWONvkCElsvJbKUfYaIqdGnj5w7/q9mwI3GXSNXkqm5c1tNVRCyG+qsTCUU/M03DfuSn+xe0nSavntrPryDCd3O9625FlEfNYD6dGG53lwqOz3OrK9A1DFwV40=
Received: from SJ0PR05CA0090.namprd05.prod.outlook.com (2603:10b6:a03:332::35)
 by MW5PR12MB5682.namprd12.prod.outlook.com (2603:10b6:303:19f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 7 Jul
 2026 05:12:40 +0000
Received: from CO1PEPF000075ED.namprd03.prod.outlook.com
 (2603:10b6:a03:332:cafe::31) by SJ0PR05CA0090.outlook.office365.com
 (2603:10b6:a03:332::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.8 via Frontend Transport; Tue, 7
 Jul 2026 05:12:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000075ED.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 05:12:40 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 00:12:39 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 00:12:39 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 7 Jul 2026 00:12:38 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Simona Vetter <simona@ffwll.ch>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH 2/2] tests/intel/gem_change_handle_race: Add edge-case and
 functional subtests
Date: Tue, 7 Jul 2026 01:10:58 -0400
Message-ID: <20260707051235.208336-2-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707051235.208336-1-vitaly.prosyak@amd.com>
References: <20260707051235.208336-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075ED:EE_|MW5PR12MB5682:EE_
X-MS-Office365-Filtering-Correlation-Id: 67119a01-fae8-4e27-e116-08dedbe65e3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|1800799024|376014|82310400026|23010399003|6133799003|3023799007|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: HTS35L5y5xR8Kw5+D2ZXqwJTvYZPMeeOAAenMOqlE6c2Kbtb059EvHorO4QTZPn1jQwHqA0b87fR9S707aBtWMxkFAdqbz8R0u+st20W+VxxcMDAy9TnuFWtxmtGhdnN0d3NJG7FP8lUhh7cUAXPDtUkOB+IOxz+dZQPzr5YRZshm4Aw6TBP2QwDxoBbmCwDxP6166Jf56DEdp6ASnmzkSHkdWcFlVvQDR+8uuE1Bfdb78Zs+8fwygb9LqSja52sboLAGY0NCS3AYFSzTWu5dwSQMBJcpG0dQtODfFELzYTOo7k/IY4wCOjQYgp/ZPIEFvRb7axf9Xf9raUmGjbTuY70WoDpDvGIo9iuMRnfey0uJp9xRKwvQwQQz9i6DyuTyRL9ixbdv7Gta5xAWo+qwU/PrEpQJFDqcrmM21aUE6hXqnUMZzxHoM4R/1dpZnM7bxR6atMfwXSOgawKlEDHGD1Xr4OuLSQtIcYWDW+A9dijYiYNxrH6TT08erxymNlsYTYFIfxouOT6Qxe5liHc0bR7eYoLVww+7YY+VA1J7KocqADa162sEIN+FgtMlICtSoShx+wjznc7ahNqEEFrI34Ceavx1jO+oLHdoYc7DHTg8qVX5oPTsqtmD163mVE1j16oHtunXlnXqEeorRz0odvTsqFmNmFTz71TQ9ME9x6obEptDOtChnmMtBOJ225BiXuZhHtvtECkqEtO5jDn+g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(23010399003)(6133799003)(3023799007)(22082099003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: E2F0bPIvwVsQPPLI9M77vbBcP4PE/1oo/ixIZzSieR/W1TFuj4cpTyqMXNfDt1SSMDRGb6RzkxK9Unq4rvT55fdYN5NIyUnetSiIGxpHeBMMsdQZhNe9rXqI4azNWqQIHF9W4YPhMJq1QDyaYGmrjyu1PX/lpcnxIIqNTyZE84H6iEDSQKJuWHRBEwDSRrjvuZGVFm5kGraa1UMeHMHzTXusf3MsEDkY78APyiX6+TZ+PJGsa0z1ozfJzD+llweuBp2p4CB5d1+DnkBt/cCN4xnzn6+rkFEBHmalMP57pBEjtlk9olRFa81BoU6CYiHc7mbtOQ+jmJLtHysuDVvEj9cUQKZhlwYy3qLgWIfAPtw4+g6A9f3TjMHQVgfAhZDyEb38C8FR2uK9PevuBS1VO6T2qJI1FUCCRScP9GwiP5dHeE7UFRhMtx0EYP/+h1m6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 05:12:40.2511 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67119a01-fae8-4e27-e116-08dedbe65e3e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075ED.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5682
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

Add 5 new subtests requested by Simona Vetter to cover edge cases
and verify basic ioctl functionality:

- noop-same-handle: handle == new_handle returns success (noop)
- invalid-new-handle-exceeds-int-max: new_handle > INT_MAX returns -EINVAL
- invalid-handle-nonexistent: non-existent handle returns -ENOENT
- edge-new-handle-zero: new_handle == 0 (unhandled case)
- functional-rename-verification: after rename, GEM_CLOSE(old) fails
  with -ENOENT and GEM_CLOSE(new) succeeds

The functional test specifically checks whether the merged version of
the ioctl actually performs a working rename operation.

v3 changes (addressing Kamil Konieczny's review feedback):
 - Removed reference to external documentation (RACE_CONDITIONS_EXPLAINED.md)
 - Sanitized test descriptions and comments (security consideration)
 - Renamed 'race-darknavy-cve' to 'race-close-before-lock'
 - Renamed internal functions and variables for clarity
 - No functional changes to test logic

v2 changes (addressing Kamil Konieczny's review feedback):
 - Added header comment explaining why test is in tests/intel/ directory:
   * All gem_* tests follow IGT convention of being in tests/intel/
   * Uses i915/gem.h for GEM object creation infrastructure
   * Some subtests designed by Simona Vetter (Intel) - hence Intel copyright

 - ARM compatibility fixes:
   * Added #define _GNU_SOURCE for pthread_setaffinity_np()
   * Made pin_to_cpu() handle failures gracefully with igt_debug()
   * CPU pinning is best-effort optimization, not hard requirement
   * Added comment explaining ARM-specific considerations

Cc: Simona Vetter <simona@ffwll.ch>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Change-Id: I5f1f62338411070571b9dfc7685b6cef6b88f724
---
 tests/intel/gem_change_handle_race.c | 293 +++++++++++++++++++++++----
 1 file changed, 248 insertions(+), 45 deletions(-)

diff --git a/tests/intel/gem_change_handle_race.c b/tests/intel/gem_change_handle_race.c
index 0ac8657ac..f65cc5d4e 100644
--- a/tests/intel/gem_change_handle_race.c
+++ b/tests/intel/gem_change_handle_race.c
@@ -1,16 +1,30 @@
+#define _GNU_SOURCE
 // SPDX-License-Identifier: MIT
 /*
  * Copyright 2026 Advanced Micro Devices, Inc.
  * Copyright 2026 Intel Corporation
  *
  * GPU-agnostic race condition tests for GEM_CHANGE_HANDLE ioctl
- * 
+ *
+ * NOTE: This test is located in tests/intel/ directory because:
+ * 1. All gem_* tests are traditionally placed in tests/intel/ regardless
+ *    of GPU vendor, following IGT convention for GEM-related tests
+ * 2. The test uses i915/gem.h and i915/gem_create.h for GEM object creation
+ *    on Intel platforms, though it works vendor-agnostically via DRM core
+ * 3. Some subtest designs (noop-same-handle, invalid-*, edge-*, functional-*)
+ *    were proposed by Simona Vetter (Intel), hence Intel copyright header
+ *
+ * ARM compatibility: This test uses pthread_setaffinity_np() which requires
+ * _GNU_SOURCE and may behave differently on ARM due to different CPU topology.
+ * The test gracefully handles CPU pinning failures and continues execution.
  */
 
 #include <errno.h>
 #include <fcntl.h>
 #include <limits.h>
 #include <pthread.h>
+#include <sched.h>
+#include <semaphore.h>
 #include <signal.h>
 #include <string.h>
 #include <sys/stat.h>
@@ -29,31 +43,6 @@
 #define HAS_AMDGPU 0
 #endif
 
-/* Helper to detect if running under gdb */
-static bool running_under_gdb(void)
-{
-	char buf[1024];
-	FILE *fp;
-	bool under_gdb = false;
-
-	/* Check if parent process is gdb */
-	fp = fopen("/proc/self/status", "r");
-	if (!fp)
-		return false;
-
-	while (fgets(buf, sizeof(buf), fp)) {
-		if (strncmp(buf, "TracerPid:", 10) == 0) {
-			int tracer_pid = atoi(buf + 10);
-			if (tracer_pid != 0)
-				under_gdb = true;
-			break;
-		}
-	}
-	fclose(fp);
-
-	return under_gdb;
-}
-
 /* Helper to check for concurrent access traces in kernel log */
 static int check_kernel_traces(void)
 {
@@ -76,23 +65,34 @@ static int check_kernel_traces(void)
 	if (fp == NULL)
 		return 0;
 
-	if (fgets(line, sizeof(line), fp) != NULL) {
+	if (fgets(line, sizeof(line), fp) != NULL)
 		trace_count = atoi(line);
-	}
 	pclose(fp);
 
 	return trace_count;
 }
 
 
+
 static void pin_to_cpu(int cpu)
 {
 	cpu_set_t cpuset;
+	int ret;
+
 	CPU_ZERO(&cpuset);
 	CPU_SET(cpu, &cpuset);
-	pthread_setaffinity_np(pthread_self(), sizeof(cpu_set_t), &cpuset);
+	ret = pthread_setaffinity_np(pthread_self(), sizeof(cpu_set_t), &cpuset);
+	
+	/*
+	 * ARM compatibility: pthread_setaffinity_np() may fail on ARM systems
+	 * due to different CPU topology or when running in containers/VMs.
+	 * We don't fail the test - CPU pinning is a best-effort optimization
+	 * to increase race condition probability, not a hard requirement.
+	 */
+	if (ret != 0)
+		igt_debug("Failed to pin to CPU %d (errno=%d), continuing anyway\n",
+			  cpu, ret);
 }
-
 /* Define DRM_IOCTL_GEM_CHANGE_HANDLE if not available in kernel headers */
 #ifndef DRM_IOCTL_GEM_CHANGE_HANDLE
 struct drm_gem_change_handle {
@@ -107,6 +107,9 @@ struct drm_gem_change_handle {
  * TEST: gem change handle race
  * Description: Multi-threaded race condition tests for GEM_CHANGE_HANDLE
  * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: GEM handles
+ * Functionality: gem change handle
  * Feature: gem
  * Run type: FULL
  *
@@ -130,6 +133,21 @@ struct drm_gem_change_handle {
  *
  * SUBTEST: race-exploit-random-handles
  * Description: Random handle probing to find free slots and trigger concurrent access
+ *
+ * SUBTEST: noop-same-handle
+ * Description: Edge case where handle equals new_handle should succeed as noop
+ *
+ * SUBTEST: invalid-new-handle-exceeds-int-max
+ * Description: new_handle exceeding INT_MAX should fail with EINVAL
+ *
+ * SUBTEST: invalid-handle-nonexistent
+ * Description: Non-existent handle should fail with ENOENT
+ *
+ * SUBTEST: edge-new-handle-zero
+ * Description: new_handle of zero exercises the unhandled zero-handle case
+ *
+ * SUBTEST: functional-rename-verification
+ * Description: After rename old handle returns EINVAL on close and new handle closes successfully
  */
 
 IGT_TEST_DESCRIPTION("Multi-threaded race condition tests for GEM_CHANGE_HANDLE");
@@ -138,7 +156,7 @@ IGT_TEST_DESCRIPTION("Multi-threaded race condition tests for GEM_CHANGE_HANDLE"
 #define RACE_DURATION_SEC 1
 
 /* Verbose logging - set to false to reduce output */
-static bool verbose_logging = false;
+static bool verbose_logging;
 
 
 /* Driver type detection */
@@ -238,6 +256,7 @@ static uint32_t gem_create_bo(struct gpu_ctx *ctx, uint64_t size)
 	switch (ctx->driver) {
 	case DRIVER_TYPE_I915: {
 		struct drm_i915_gem_create create = { .size = size };
+
 		do_ioctl(ctx->fd, DRM_IOCTL_I915_GEM_CREATE, &create);
 		handle = create.handle;
 		break;
@@ -260,6 +279,7 @@ static uint32_t gem_create_bo(struct gpu_ctx *ctx, uint64_t size)
 static int gem_close_bo(struct gpu_ctx *ctx, uint32_t handle)
 {
 	struct drm_gem_close close_args = { .handle = handle };
+
 	return igt_ioctl(ctx->fd, DRM_IOCTL_GEM_CLOSE, &close_args);
 }
 
@@ -413,9 +433,8 @@ static void test_race_change_vs_close(struct gpu_ctx *ctx)
 	pthread_barrier_destroy(&barrier);
 
 	/* Clean up final handle if exists */
-	if (data.handle) {
+	if (data.handle)
 		gem_close_bo(ctx, data.handle);
-	}
 
 	igt_info("  Race test completed. Suspicious conditions: %u\n", race_detected);
 	if (race_detected > 0) {
@@ -646,9 +665,8 @@ static void *change_handle_prime_thread(void *arg)
 		}
 
 		/* Flip direction for next iteration to keep swapping */
-		if (ret == 0) {
+		if (ret == 0)
 			swap_direction = !swap_direction;
-		}
 		/* All errors are acceptable during race - kernel will serialize */
 
 		sched_yield();
@@ -954,9 +972,8 @@ static void test_race_aggressive(struct gpu_ctx *ctx)
 			igt_info("  Progress: %d/%d, KASAN traces: %d\n",
 				 i + 1, iterations, kasan_new);
 
-			if (kasan_new > 0 && race_wins == 0) {
+			if (kasan_new > 0 && race_wins == 0)
 				race_wins = kasan_new;
-			}
 		}
 	}
 
@@ -1099,6 +1116,7 @@ static void *single_thread_closer(void *arg)
 		/* Check KASAN */
 		if (closes % 100 == 0) {
 			int kasan_now = check_kernel_traces();
+
 			if (kasan_now > 0) {
 				__sync_fetch_and_add(data->race_hits, 1);
 				igt_info("[CLOSER] *** KASAN DETECTED: %d traces ***\n", kasan_now);
@@ -1114,13 +1132,14 @@ static void *single_thread_monitor(void *arg)
 {
 	struct single_thread_data *data = arg;
 	int kasan_last = 0;
+	int kasan_now;
 
 	pthread_barrier_wait(data->barrier);
 
 	while (data->running) {
 		sleep(5);
 
-		int kasan_now = check_kernel_traces();
+		kasan_now = check_kernel_traces();
 		if (kasan_now > kasan_last) {
 			igt_info("[MONITOR] +%d KASAN traces (total: %d)\n",
 				 kasan_now - kasan_last, kasan_now);
@@ -1143,6 +1162,7 @@ static void test_race_single_thread(struct gpu_ctx *ctx)
 	uint32_t race_hits = 0;
 	int main_fd;
 	int kasan_before, kasan_after;
+	int race_detected;
 
 	igt_info("═══════════════════════════════════════════════════════════\n");
 	igt_info("  SINGLE-THREADED FOCUSED TEST (Fixed Timing)\n");
@@ -1197,7 +1217,7 @@ static void test_race_single_thread(struct gpu_ctx *ctx)
 		close(main_fd);
 
 	kasan_after = check_kernel_traces();
-	int race_detected = kasan_after - kasan_before;
+	race_detected = kasan_after - kasan_before;
 
 	igt_info("\n═══════════════════════════════════════════════════════════\n");
 	igt_info("  SINGLE-THREADED TEST RESULTS\n");
@@ -1300,6 +1320,7 @@ static void *random_handle_hammer(void *arg)
 	while (data->running) {
 		/* Try random handle numbers in different ranges */
 		int range = attempts % 4;
+
 		switch (range) {
 		case 0:
 			/* Small random offset (1-100) */
@@ -1397,6 +1418,7 @@ static void *random_handle_closer(void *arg)
 		/* Check KASAN */
 		if (closes % 100 == 0) {
 			int kasan_now = check_kernel_traces();
+
 			if (kasan_now > 0) {
 				__sync_fetch_and_add(data->race_hits, 1);
 				igt_info("[CLOSER] *** KASAN DETECTED: %d traces ***\n", kasan_now);
@@ -1412,13 +1434,14 @@ static void *random_handle_monitor(void *arg)
 {
 	struct random_handle_data *data = arg;
 	int kasan_last = 0;
+	int kasan_now;
 
 	pthread_barrier_wait(data->barrier);
 
 	while (data->running) {
 		sleep(5);
 
-		int kasan_now = check_kernel_traces();
+		kasan_now = check_kernel_traces();
 		if (kasan_now > kasan_last) {
 			igt_info("[MONITOR] +%d KASAN traces (total: %d)\n",
 				 kasan_now - kasan_last, kasan_now);
@@ -1443,6 +1466,7 @@ static void test_race_random_handles(struct gpu_ctx *ctx)
 	uint32_t race_hits = 0;
 	int main_fd;
 	int kasan_before, kasan_after;
+	int race_detected;
 
 	igt_info("═══════════════════════════════════════════════════════════\n");
 	igt_info("  RANDOM HANDLE TEST\n");
@@ -1498,7 +1522,7 @@ static void test_race_random_handles(struct gpu_ctx *ctx)
 		close(main_fd);
 
 	kasan_after = check_kernel_traces();
-	int race_detected = kasan_after - kasan_before;
+	race_detected = kasan_after - kasan_before;
 
 	igt_info("\n═══════════════════════════════════════════════════════════\n");
 	igt_info("  RANDOM HANDLE TEST RESULTS\n");
@@ -1532,9 +1556,8 @@ static void test_race_random_handles(struct gpu_ctx *ctx)
 				 data.swap_count, data.close_count);
 			igt_info("Random handle probing success rate: %.4f%%\n\n",
 				 100.0 * data.swap_count / data.attempt_count);
-			if (data.swap_count > 1000) {
+			if (data.swap_count > 1000)
 				igt_info("Good swap rate - race window likely too small to hit.\n");
-			}
 		}
 	}
 }
@@ -1594,7 +1617,7 @@ static void *race_close_worker(void *arg)
 	return NULL;
 }
 
-static void test_race_race_cve(struct gpu_ctx *ctx)
+static void test_race_close_before_lock(struct gpu_ctx *ctx)
 {
 	struct race_shared shared;
 	int iterations = 2000;
@@ -1713,6 +1736,165 @@ static void test_race_race_cve(struct gpu_ctx *ctx)
 		     race_wins, iterations);
 }
 
+/*
+ * ═══════════════════════════════════════════════════════════════════════
+ * EDGE CASE TESTS (requested by Simona Vetter)
+ * ═══════════════════════════════════════════════════════════════════════
+ */
+
+/**
+ * test_noop_same_handle - handle == new_handle should be a noop
+ *
+ * When old handle equals new handle, the ioctl should return success
+ * without modifying anything.
+ */
+static void test_noop_same_handle(struct gpu_ctx *ctx)
+{
+	uint32_t handle;
+
+	handle = gem_create_bo(ctx, 4096);
+
+	/* Renaming to the same handle should succeed (noop) */
+	igt_assert_eq(gem_change_handle(ctx, handle, handle), 0);
+
+	/* Handle should still be valid */
+	igt_assert_eq(gem_close_bo(ctx, handle), 0);
+
+	igt_info("  PASS: handle == new_handle is a noop\n");
+}
+
+/**
+ * test_new_handle_exceeds_int_max - new_handle > INT_MAX should fail
+ *
+ * The kernel enforces idr_alloc() limitation: new_handle must be <= INT_MAX.
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
+
+	igt_info("  PASS: new_handle > INT_MAX returns -EINVAL\n");
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
+
+	igt_info("  PASS: invalid/non-existent handle returns -ENOENT\n");
+}
+
+/**
+ * test_new_handle_zero - new_handle == 0 (unhandled case)
+ *
+ * Dave got a report that new_handle == 0 is not properly handled.
+ * Document the current kernel behavior.
+ */
+static void test_new_handle_zero(struct gpu_ctx *ctx)
+{
+	uint32_t handle;
+	int ret;
+
+	handle = gem_create_bo(ctx, 4096);
+
+	/*
+	 * new_handle == 0: This is an unhandled edge case.
+	 * Handle 0 is typically reserved/invalid in DRM.
+	 * The kernel should reject this with -EINVAL.
+	 */
+	ret = gem_change_handle(ctx, handle, 0);
+	if (ret < 0) {
+		igt_info("  new_handle=0 rejected with errno=%d (%s)\n",
+			 errno, strerror(errno));
+		/* Expected: kernel rejects handle 0 */
+		igt_assert(errno == EINVAL || errno == ENOENT || errno == ENOSPC);
+		/* Original handle still valid */
+		igt_assert_eq(gem_close_bo(ctx, handle), 0);
+	} else {
+		/*
+		 * If kernel allowed it, the object moved to handle 0.
+		 * This is arguably a bug - document it.
+		 */
+		igt_warn("  WARNING: kernel allowed new_handle=0 (may be a bug)\n");
+		/* Old handle should be gone */
+		igt_assert(gem_close_bo(ctx, handle) < 0);
+		/* New handle 0 should exist */
+		igt_assert_eq(gem_close_bo(ctx, 0), 0);
+	}
+
+	igt_info("  PASS: new_handle=0 edge case handled\n");
+}
+
+/**
+ * test_functional_rename - verify rename actually works
+ *
+ * After a successful rename:
+ * - GEM_CLOSE(old_handle) must FAIL (handle no longer exists)
+ * - GEM_CLOSE(new_handle) must SUCCEED (object is there)
+ *
+ * Simona suspects the merged version of Francis' patch may have broken
+ * this fundamental behavior.
+ */
+static void test_functional_rename(struct gpu_ctx *ctx)
+{
+	uint32_t handle, new_h;
+	int ret;
+
+	handle = gem_create_bo(ctx, 4096);
+	new_h = handle + 1000; /* Pick a handle far away to avoid collisions */
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
+
+	igt_info("  PASS: rename works - old handle invalid, new handle valid\n");
+}
+
 int igt_main()
 {
 	struct gpu_ctx ctx = { .fd = -1 };
@@ -1770,7 +1952,28 @@ int igt_main()
 		test_race_random_handles(&ctx);
 	igt_describe(" GEM_CLOSE races CHANGE_HANDLE lookup ");
 	igt_subtest("race-close-before-lock")
-		test_race_race_cve(&ctx);
+		test_race_close_before_lock(&ctx);
+
+
+	igt_describe("Edge case: handle == new_handle should be a noop");
+	igt_subtest("noop-same-handle")
+		test_noop_same_handle(&ctx);
+
+	igt_describe("Edge case: new_handle > INT_MAX must return -EINVAL");
+	igt_subtest("invalid-new-handle-exceeds-int-max")
+		test_new_handle_exceeds_int_max(&ctx);
+
+	igt_describe("Edge case: non-existent handle must return -ENOENT");
+	igt_subtest("invalid-handle-nonexistent")
+		test_invalid_handle(&ctx);
+
+	igt_describe("Edge case: new_handle == 0 (unhandled case reported to Dave)");
+	igt_subtest("edge-new-handle-zero")
+		test_new_handle_zero(&ctx);
+
+	igt_describe("Functional: verify rename moves object from old to new handle");
+	igt_subtest("functional-rename-verification")
+		test_functional_rename(&ctx);
 
 	igt_fixture() {
 #if HAS_AMDGPU
-- 
2.54.0

