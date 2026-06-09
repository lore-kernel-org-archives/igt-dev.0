Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D5A0CD98C8
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jun 2026 19:31:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFA4C10E5E8;
	Tue,  9 Jun 2026 19:31:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VEVfVFIR";
	dkim-atps=neutral
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011051.outbound.protection.outlook.com [52.101.57.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6856410E5DD
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jun 2026 19:30:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uvOlys1euHJmp7Kio62Gf1zzf3jZSoyu8sWS0IoU6ml5a941SukLfd1y2u3hWHf5yZqLZtSWxtrWs2P4YWMohUCeNzo6j+iOgdSHz35tUVxStBilLYjX1AwZwqGF1jet0fQUoRrBpT0DWf8nKnpzcX+E2khy860y75pNx4ek5CICUklDWM6ebXum18GFK3P8XdfhD0mRrpulq6T5C9NWZ8euLbz4oXyusonnIi9ujW7q52sdtHylgrMDDQbbj5bEXr54XogNPVpBTA1ONKsjdjEkjuZNyrSLNUMP8W0QfNlq2Pvae+DOtRX217oZw9I+a8K6Ns9kLmsLs/UCy0YJqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5hC+RoUbLpfkojf8x+mgBQvNSquQRhgViycRN62GjWI=;
 b=qJKtUTdL7e0vmFmWxr458JRAYK/fexAJ/nYCHnEX3RJ8XYyaRw+UnYqzKSD81CdwI4oDSpAfgLcAaPssdXOny9W5GfqMNCmhX+Uw2y/gjouHLx5VBbT+vTohfuCE/9IRKL5cO2EVVfJC6e245btCRNF/53dcYsVny5C+fIL+pGRKpFwfRtEMBZ7CJPmXWkZZWj/OxDvJQ/JlmvrkOO+RwLDU3qXzrxB6Pz1AY6NrEgoQXC2YiJFEvOScj7PJnawyDLp33ybrdQhlv8/omLNkQEaAGTcAnLsGmbgG2OFOOqfX/fd8BTdAk2ZEySmw1LqPqVFlesmG6iDFW3Gxr3OcTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5hC+RoUbLpfkojf8x+mgBQvNSquQRhgViycRN62GjWI=;
 b=VEVfVFIRYDr58MwCwhsTzE6jgCTJxpKYN6HFB8V2oo61tFf5VEPza05z0U/w4ACQow2LnnWxBbt79p7e7UidMldgMiqGrZ3rCmTfVZnEBPqeBUNkung7zZC+NVZ7amAYc6tJm7nlrukpQCaMVVR3yGk/AQq/SSKEN12bgqbd3ZQ=
Received: from CH2PR02CA0001.namprd02.prod.outlook.com (2603:10b6:610:4e::11)
 by DS0PR12MB7606.namprd12.prod.outlook.com (2603:10b6:8:13c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 19:30:32 +0000
Received: from CH2PEPF0000013C.namprd02.prod.outlook.com
 (2603:10b6:610:4e:cafe::32) by CH2PR02CA0001.outlook.office365.com
 (2603:10b6:610:4e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Tue, 9
 Jun 2026 19:30:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF0000013C.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Tue, 9 Jun 2026 19:30:31 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 9 Jun
 2026 14:30:31 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 9 Jun
 2026 14:30:31 -0500
Received: from Intel-system.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 9 Jun 2026 14:30:30 -0500
From: Vitaly Prosyak <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Simona Vetter <simona@ffwll.ch>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH 2/2] tests/intel/gem_change_handle_race: Add edge-case and
 functional subtests
Date: Tue, 9 Jun 2026 15:30:19 -0400
Message-ID: <20260609193023.18720-2-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609193023.18720-1-vitaly.prosyak@amd.com>
References: <20260609193023.18720-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013C:EE_|DS0PR12MB7606:EE_
X-MS-Office365-Filtering-Correlation-Id: 83d8d53b-7acd-4551-9797-08dec65d9220
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700016|82310400026|22082099003|18002099003|6133799003|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: 08hkINIqx/W4wwax3ca76+Xs1hl0OF4z4eJmK69ycAf3hlr/WJ2+THldgiw2Y0avy5CAqZXvAQqfG87SWGKLm17/O0ep3OyYLq0S7UrSyfXu/+hwrHnQrhYz70aJIwCuiEu6JOMK9nGy+9yDfjoPxvUvKtZbZG999FfpsNb5zKBZtuvYpjitjSjbQpn0I0jrl6BX5NB8NB8n+PgFw0k3CSx0UG5WfRTQ+ZYOi2NH+BdsvRSnFx0rc8k2mrjtTigvxlkMTf0v3gPJiB4NTNk+MF5M9YyduxGUFk5gdaXmGVCek/+FBVhZ65SyDqy35sOkRda9fJNvi9EKf+etD+3zdcnejBic42NTpE947ceDlfYJB0bVMAY6K8mBM6f+S2tlUXj0iW6YWWOmPHrCYleKPIk7zgfOZLlwI35utrynf+a30L/inMKctcgsB+Kd7u2cnwf2U/xVegA2XPcx0ZjLrMzK1UN5MJNcP+M6B+bd/iJsIiLImSnJpLO3B++osApPNn91kxNfblFInrowhJklqPTJFjc7smzNUhgUlgItrDvQTizt1ZopE9Ig3yjBaquUZ41g/ovicTeLYWrauaeVaFx2dbmDGoktX7cV3uPDFZ1kU5jd1VXBZordeXY2mAOOKM4CKzNpHWMzZtpOnrb8OCiJuJfh8YxJ+hL8oBSRIWItzSjyxlGD22739gazSg6Zi+AzsbUZW0NrMkX4A+9rdFkYVJNGK9nCnMJFr1K5w/M=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(22082099003)(18002099003)(6133799003)(11063799006)(56012099006)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: AD//w8Mu9zwXj+usk5FqtZ9gqoGFjWAqq7EqfpS2TDYbnBHN27B6yWgYsMJAih7ln68MRssrjAoVB7Tfm94TEpVqZLp29nop3ySc1ZbqOEYJ05IfsRMQg35Fmq9kxNgCoNJQ8j+kdr9+kIvOoSl6RJLFsnFY6lzP+Gs4LOkV3Lc6EPX2dHvlfD+nX7tADISNOSbpWxNB7jFarUgp0DFXK0Bk/ln/tc4mWa+1DMxsH8b1IoSUtTT3yGD2saYj5Sy8NneH7Gf5v64ofdQncdS70VvR1kYM8ccVqth3alRw8TSBG7cj7W0LpPvHHs/ONwdIbXk2mi34lz0Jm8WtuDf63tCxqkLrhSpFOe33sAVNnQ+v9Uv8ofUUL6dy4NdOyhUR38pETOpifl9HuK1wniprFpIphYsCequjDzfPRt4xheoHGcZLPSYf3hJAXYmXi1LN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 19:30:31.8257 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83d8d53b-7acd-4551-9797-08dec65d9220
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7606
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

Add 5 new subtests requested by Simona Vetter to cover edge cases
and verify basic ioctl functionality:

- noop-same-handle: handle == new_handle returns success (noop)
- invalid-new-handle-exceeds-int-max: new_handle > INT_MAX returns -EINVAL
- invalid-handle-nonexistent: non-existent handle returns -ENOENT
- edge-new-handle-zero: new_handle == 0 (unhandled case Dave got report about)
- functional-rename-verification: after rename, GEM_CLOSE(old) fails
  with -ENOENT and GEM_CLOSE(new) succeeds

The functional test specifically checks whether the merged version of
the ioctl actually performs a working rename operation.

Cc: Simona Vetter <simona@ffwll.ch>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/intel/gem_change_handle_race.c | 260 ++++++++++++++++++++++-----
 1 file changed, 220 insertions(+), 40 deletions(-)

diff --git a/tests/intel/gem_change_handle_race.c b/tests/intel/gem_change_handle_race.c
index f3408baed..75ca7654c 100644
--- a/tests/intel/gem_change_handle_race.c
+++ b/tests/intel/gem_change_handle_race.c
@@ -11,6 +11,8 @@
 #include <fcntl.h>
 #include <limits.h>
 #include <pthread.h>
+#include <sched.h>
+#include <semaphore.h>
 #include <signal.h>
 #include <string.h>
 #include <sys/stat.h>
@@ -29,31 +31,6 @@
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
 /* Helper to check for UAF traces in kernel log */
 static int check_kasan_traces(void)
 {
@@ -76,9 +53,8 @@ static int check_kasan_traces(void)
 	if (fp == NULL)
 		return 0;
 
-	if (fgets(line, sizeof(line), fp) != NULL) {
+	if (fgets(line, sizeof(line), fp) != NULL)
 		trace_count = atoi(line);
-	}
 	pclose(fp);
 
 	return trace_count;
@@ -88,6 +64,7 @@ static int check_kasan_traces(void)
 static void pin_to_cpu(int cpu)
 {
 	cpu_set_t cpuset;
+
 	CPU_ZERO(&cpuset);
 	CPU_SET(cpu, &cpuset);
 	pthread_setaffinity_np(pthread_self(), sizeof(cpu_set_t), &cpuset);
@@ -107,6 +84,9 @@ struct drm_gem_change_handle {
  * TEST: gem change handle race
  * Description: Multi-threaded race condition tests for GEM_CHANGE_HANDLE
  * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: GEM handles
+ * Functionality: gem change handle
  * Feature: gem
  * Run type: FULL
  *
@@ -130,6 +110,21 @@ struct drm_gem_change_handle {
  *
  * SUBTEST: race-exploit-random-handles
  * Description: Random handle probing to find free slots and trigger UAF
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
@@ -138,7 +133,7 @@ IGT_TEST_DESCRIPTION("Multi-threaded race condition tests for GEM_CHANGE_HANDLE"
 #define RACE_DURATION_SEC 1
 
 /* Verbose logging - set to false to reduce output */
-static bool verbose_logging = false;
+static bool verbose_logging;
 
 
 /* Driver type detection */
@@ -238,6 +233,7 @@ static uint32_t gem_create_bo(struct gpu_ctx *ctx, uint64_t size)
 	switch (ctx->driver) {
 	case DRIVER_TYPE_I915: {
 		struct drm_i915_gem_create create = { .size = size };
+
 		do_ioctl(ctx->fd, DRM_IOCTL_I915_GEM_CREATE, &create);
 		handle = create.handle;
 		break;
@@ -260,6 +256,7 @@ static uint32_t gem_create_bo(struct gpu_ctx *ctx, uint64_t size)
 static int gem_close_bo(struct gpu_ctx *ctx, uint32_t handle)
 {
 	struct drm_gem_close close_args = { .handle = handle };
+
 	return igt_ioctl(ctx->fd, DRM_IOCTL_GEM_CLOSE, &close_args);
 }
 
@@ -415,9 +412,8 @@ static void test_race_change_vs_close(struct gpu_ctx *ctx)
 	pthread_barrier_destroy(&barrier);
 
 	/* Clean up final handle if exists */
-	if (data.handle) {
+	if (data.handle)
 		gem_close_bo(ctx, data.handle);
-	}
 
 	igt_info("  Race test completed. Suspicious conditions: %u\n", race_detected);
 	if (race_detected > 0) {
@@ -651,9 +647,8 @@ static void *change_handle_prime_thread(void *arg)
 		}
 
 		/* Flip direction for next iteration to keep swapping */
-		if (ret == 0) {
+		if (ret == 0)
 			swap_direction = !swap_direction;
-		}
 		/* All errors are acceptable during race - kernel will serialize */
 
 		sched_yield();
@@ -960,9 +955,8 @@ static void test_race_aggressive(struct gpu_ctx *ctx)
 			igt_info("  Progress: %d/%d, KASAN traces: %d\n",
 				 i + 1, iterations, kasan_new);
 
-			if (kasan_new > 0 && race_wins == 0) {
+			if (kasan_new > 0 && race_wins == 0)
 				race_wins = kasan_new;
-			}
 		}
 	}
 
@@ -1105,6 +1099,7 @@ static void *single_thread_closer(void *arg)
 		/* Check KASAN */
 		if (closes % 100 == 0) {
 			int kasan_now = check_kasan_traces();
+
 			if (kasan_now > 0) {
 				__sync_fetch_and_add(data->race_hits, 1);
 				igt_info("[CLOSER] *** KASAN DETECTED: %d traces ***\n", kasan_now);
@@ -1120,13 +1115,14 @@ static void *single_thread_monitor(void *arg)
 {
 	struct single_thread_data *data = arg;
 	int kasan_last = 0;
+	int kasan_now;
 
 	pthread_barrier_wait(data->barrier);
 
 	while (data->running) {
 		sleep(5);
 
-		int kasan_now = check_kasan_traces();
+		kasan_now = check_kasan_traces();
 		if (kasan_now > kasan_last) {
 			igt_info("[MONITOR] +%d KASAN traces (total: %d)\n",
 				 kasan_now - kasan_last, kasan_now);
@@ -1149,6 +1145,7 @@ static void test_race_single_thread(struct gpu_ctx *ctx)
 	uint32_t race_hits = 0;
 	int main_fd;
 	int kasan_before, kasan_after;
+	int uaf_detected;
 
 	igt_info("═══════════════════════════════════════════════════════════\n");
 	igt_info("  SINGLE-THREADED FOCUSED TEST (Fixed Timing)\n");
@@ -1203,7 +1200,7 @@ static void test_race_single_thread(struct gpu_ctx *ctx)
 		close(main_fd);
 
 	kasan_after = check_kasan_traces();
-	int uaf_detected = kasan_after - kasan_before;
+	uaf_detected = kasan_after - kasan_before;
 
 	igt_info("\n═══════════════════════════════════════════════════════════\n");
 	igt_info("  SINGLE-THREADED TEST RESULTS\n");
@@ -1306,6 +1303,7 @@ static void *random_handle_hammer(void *arg)
 	while (data->running) {
 		/* Try random handle numbers in different ranges */
 		int range = attempts % 4;
+
 		switch (range) {
 		case 0:
 			/* Small random offset (1-100) */
@@ -1403,6 +1401,7 @@ static void *random_handle_closer(void *arg)
 		/* Check KASAN */
 		if (closes % 100 == 0) {
 			int kasan_now = check_kasan_traces();
+
 			if (kasan_now > 0) {
 				__sync_fetch_and_add(data->race_hits, 1);
 				igt_info("[CLOSER] *** KASAN DETECTED: %d traces ***\n", kasan_now);
@@ -1418,13 +1417,14 @@ static void *random_handle_monitor(void *arg)
 {
 	struct random_handle_data *data = arg;
 	int kasan_last = 0;
+	int kasan_now;
 
 	pthread_barrier_wait(data->barrier);
 
 	while (data->running) {
 		sleep(5);
 
-		int kasan_now = check_kasan_traces();
+		kasan_now = check_kasan_traces();
 		if (kasan_now > kasan_last) {
 			igt_info("[MONITOR] +%d KASAN traces (total: %d)\n",
 				 kasan_now - kasan_last, kasan_now);
@@ -1449,6 +1449,7 @@ static void test_race_random_handles(struct gpu_ctx *ctx)
 	uint32_t race_hits = 0;
 	int main_fd;
 	int kasan_before, kasan_after;
+	int uaf_detected;
 
 	igt_info("═══════════════════════════════════════════════════════════\n");
 	igt_info("  RANDOM HANDLE TEST\n");
@@ -1504,7 +1505,7 @@ static void test_race_random_handles(struct gpu_ctx *ctx)
 		close(main_fd);
 
 	kasan_after = check_kasan_traces();
-	int uaf_detected = kasan_after - kasan_before;
+	uaf_detected = kasan_after - kasan_before;
 
 	igt_info("\n═══════════════════════════════════════════════════════════\n");
 	igt_info("  RANDOM HANDLE TEST RESULTS\n");
@@ -1538,9 +1539,8 @@ static void test_race_random_handles(struct gpu_ctx *ctx)
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
@@ -1719,6 +1719,165 @@ static void test_race_darknavy_cve(struct gpu_ctx *ctx)
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
@@ -1778,6 +1937,27 @@ int igt_main()
 	igt_subtest("race-darknavy-cve")
 		test_race_darknavy_cve(&ctx);
 
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
+
 	igt_fixture() {
 #if HAS_AMDGPU
 		if (ctx.driver == DRIVER_TYPE_AMDGPU && ctx.amdgpu_device)
-- 
2.54.0

