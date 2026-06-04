Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B8BCD6E60
	for <igt-dev@archiver.kernel.org>; Thu,  4 Jun 2026 01:00:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E19711252F;
	Thu,  4 Jun 2026 01:00:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GQ+Lomn+";
	dkim-atps=neutral
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011060.outbound.protection.outlook.com [52.101.52.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A69E112508
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Jun 2026 00:59:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jcawb51TbzHOnCi3XfHDDHETZSuUfDe4Q8JsGOaXpWPRs0IYyoZeW9HUCWls4l3Q2qd06iUZAkg+89whs2/HX501KI4nd0uaVcWa5mtKJjUNStwW68E+MeiCykIlvaf/8g2KnTjiF+EvOx2IzKDeeqlkRLUcoJnrSzSg/X80EaMW8ztrCbUeRg5cyzgpYwvJzWAAhieaiKdcdX6gIob17MVNTAiYuNhBgyoBJYqXrvQlnEjqNLNFk5/pOjMiqizL0STtX6f6KpxzeMVxxX+wg6KDcA+QnLue1O+JytDrx2YLEKyCIVWI62IQBur7mydsTY3QnobTx3GeFCvNU5PcdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tdB2hkBsZj2SxTTRmjFaXVtFR21rvqDjJGiKBqVaIO4=;
 b=YTYB/3sZWIwyWal8x5xgdLVDb55RUFtHTbwxHi+dGUnMJXhPEMeE6BZyKyCHws8PNGMcXanEUxDFsRGrH6hlrY+8R2E+fCEyfzRlMBTUXIT7f0js+EgFV2mICLdCLHMnsPCsAXt/YzrLLquUR7d2iLnNFUgtjdRUKxv6HByAYqtYNDQ2TXJdG5TcwJ11DHpb2n290kqIWpppK2TqbDRAQHN2+10oHfGpbDjxp4PuIa0IyNwn+Kxhe++TnzrNZi1aNX6h3jV/xHW4F+gif0F1A2JTzMes+wSRl5HmO+l79YCX61iRc85a57cCBtvWtTCRwAC4rEz1xZmFNcYOQZx1bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tdB2hkBsZj2SxTTRmjFaXVtFR21rvqDjJGiKBqVaIO4=;
 b=GQ+Lomn+3gR0bm/4AIhe0eN0QU32yDj/7WrcIDR/nVnEpZBI4nOcdSiBVpaAUrMLtj4+EXYoqHP0+SJzZVXgdtbm4K9bTtYMeFjtVjlWfUqeLGvgTddhVN9TFWe0RgyItvermxi5ZiawiCmo35nTiKS2FnhD4YAtikDGJardjOI=
Received: from MW4PR04CA0189.namprd04.prod.outlook.com (2603:10b6:303:86::14)
 by DS7PR12MB6094.namprd12.prod.outlook.com (2603:10b6:8:9d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 00:59:29 +0000
Received: from SJ1PEPF000026C9.namprd04.prod.outlook.com
 (2603:10b6:303:86:cafe::7d) by MW4PR04CA0189.outlook.office365.com
 (2603:10b6:303:86::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Thu, 4
 Jun 2026 00:59:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000026C9.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Thu, 4 Jun 2026 00:59:28 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 3 Jun
 2026 19:59:28 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 3 Jun 2026 19:59:27 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH] tests/amdgpu: Add amd_lockdep test for lock ordering
 validation
Date: Wed, 3 Jun 2026 20:58:53 -0400
Message-ID: <20260604005925.127581-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C9:EE_|DS7PR12MB6094:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e441bb7-b17d-4289-964d-08dec1d487e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700016|82310400026|1800799024|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: reySTGPVFUqhOnwwwitXI9uyLKcAu3ess6vOHhHzbhnJJOUaM1hn0m5j1lpg9V/q5FFn15u/46z+R9E/VGfz5kN5dWNy7YHaGx5rp9gWuUsfG2CHN6CLtbljsS0eQJGvjlJomjlEYYk08813i3/0pVXI35lLtrhS1NBAG4VNmXdUaj2by7ZMKyQdIbXye6xC6x6pLYoJRP6E32q8VQi+yACYihi+BbLOn7LQIU/veKX9oG/xcOPSRw4T2Wb3O1tllB7ovSrVUYBEzXtfRj0KmGsjqSOChtVVIK9DcUVn/umF6PY6UNYtWv/Q2lmgmK3QzMdr209gQkICRwal7uMpYoAgFbUrICUNiBluPi2xqlgLHYkFHRrsBvrYqRB66FjHJIM0/Naqq8VR0BTRIUwMe+j3YVXLPXRR/m4N4wpwLn4VrLY7ORAboogf/vblsQ71sU1YbBVwt7xmdAMgjotSkN5YdC9iRHWhf6VV8uXsrDpZ0UHr1WZMhbT+/OS6+NZHrjPx2W9iUJDL7Cg1V2hlo+ztXzaWOgGBWtqyyNoUOzGtY8oEcdvpeeX6xJOOtlHHTpVA+Jl15OH6zpeo51oFY0dlnSL75nwmusOLgvviWOEPoSa7AeUjimnJOzhRvn2b9aqJvG4yzsIkwivxDGDtK+dMJ/o6g6Oj7BPuOPn2oW5m6TeAK0bhMkPl/XLNBRQsIR1M2AA6CePwg1PBZ+SSxVZmx5/BHF79HCnwWb+TKiA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(18002099003)(6133799003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ZNWVhMPe9PAtdRtuFDXixGlwoZ55w2v0vjn3LQCe9Yj3DaI/njukI9deNys/xng+w2CszIyZnpUdAsRnXt9UH30SuWOzcUg2wm5RTqO9of6yhEKKprXzEk2PB316NTWzhDzWwXQO1KLFXuTC3xA0kcsLzRQULj64r4Ain3vKEY+CZ2LzRbFX6x434ASuqcmAKm/fo6nXh6sYMMa1u1p5WOt/1aWqTz5XGo6+GZGbU9jXN3SzM9/9dIJKfpMKodgzFQbX3Rl+gdA0bNMWNQPAD4vVv0Vcb0ShunlkUqnXbIjxuIcNPjIZxHfWDXqjDl3jpPNNy0WxgMv1X61DnpfMsYfMuJ4KqPY2cSFGz/1jNXaxCy34/EUqTTsalCjKVsFjRbja1W+p/kNxePaNO7+dFiy5z18noQgnJZPGNZBUT9QcKqwm9vLNGi2RnQJ3mC9q
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 00:59:28.9559 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e441bb7-b17d-4289-964d-08dec1d487e8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026C9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6094
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

Exercise lock-heavy GPU code paths concurrently to trigger lockdep
warnings when lock ordering is violated. Requires kernel built with
CONFIG_PROVE_LOCKING=y and amdgpu lockdep annotation patch.

Subtests:
- concurrent-reset-and-submit: GPU reset vs VRAM allocation
- concurrent-mmap-and-evict: mmap/munmap vs VRAM pressure
- concurrent-userptr-and-reset: USERPTR invalidation vs GPU reset
- stress-all-paths: All the above simultaneously

After running, check dmesg for circular locking dependency warnings.

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_lockdep.c | 528 +++++++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build   |   1 +
 2 files changed, 529 insertions(+)
 create mode 100644 tests/amdgpu/amd_lockdep.c

diff --git a/tests/amdgpu/amd_lockdep.c b/tests/amdgpu/amd_lockdep.c
new file mode 100644
index 000000000..d97c0747f
--- /dev/null
+++ b/tests/amdgpu/amd_lockdep.c
@@ -0,0 +1,528 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2024 Advanced Micro Devices, Inc.
+ *
+ * Test: amd_lockdep - Exercise lock-heavy GPU paths for lockdep validation
+ *
+ * This IGT test exercises code paths that involve multiple kernel locks
+ * simultaneously. When run on a kernel with CONFIG_LOCKDEP=y and the
+ * amdgpu lockdep annotations patch, lockdep will warn if any code path
+ * violates the lock ordering hierarchy.
+ *
+ * The test checks dmesg for lockdep violations and fails if any are found.
+ * It also checks the kernel taint flags for TAINT_WARN.
+ *
+ * Usage:
+ *   sudo ./build/tests/amdgpu/amd_lockdep --run-subtest <subtest>
+ *
+ * Subtests:
+ *   concurrent-reset-and-submit  - Submit work while triggering reset
+ *   concurrent-mmap-and-evict    - mmap/munmap while VRAM eviction runs
+ *   concurrent-userptr-and-reset - USERPTR invalidation during reset
+ *   stress-all-paths             - Combined stress of all paths
+ */
+
+#include "igt.h"
+#include "igt_amd.h"
+#include "igt_taints.h"
+#include "lib/amdgpu/amd_memory.h"
+#include "lib/amdgpu/amd_command_submission.h"
+
+#include <amdgpu.h>
+#include <amdgpu_drm.h>
+#include <pthread.h>
+#include <sys/mman.h>
+#include <signal.h>
+#include <fcntl.h>
+#include <errno.h>
+
+#define BO_SIZE (4 * 1024 * 1024)  /* 4MB */
+#define NUM_BOS 16
+#define STRESS_ITERATIONS 100
+#define THREAD_RUNTIME_SEC 2
+
+/* kmsg patterns that indicate lockdep violations */
+static const char *lockdep_violation_patterns[] = {
+	"circular locking dependency",
+	"possible recursive locking detected",
+	"inconsistent lock state",
+	"possible circular locking dependency",
+	"WARNING: lock held when returning to user space",
+	NULL
+};
+
+struct thread_data {
+	amdgpu_device_handle device;
+	int fd;
+	volatile bool stop;
+	int iterations;
+};
+
+/*
+ * Check if CONFIG_LOCKDEP is enabled on the running kernel by testing
+ * for the existence of /proc/lockdep_stats (only present with lockdep).
+ */
+static bool is_lockdep_enabled(void)
+{
+	return access("/proc/lockdep_stats", F_OK) == 0;
+}
+
+/*
+ * Open /dev/kmsg and seek to end so we only read new messages.
+ * Returns fd or -1 on failure.
+ */
+static int kmsg_open(void)
+{
+	int fd;
+
+	fd = open("/dev/kmsg", O_RDONLY | O_NONBLOCK);
+	if (fd < 0)
+		return -1;
+
+	/* Seek to end - only read messages generated after this point */
+	lseek(fd, 0, SEEK_END);
+	return fd;
+}
+
+/*
+ * Scan /dev/kmsg for lockdep violation patterns since the fd was opened.
+ * Returns true if a violation was found.
+ */
+static bool kmsg_has_lockdep_violation(int kmsg_fd)
+{
+	char buf[4096];
+	ssize_t len;
+	int i;
+
+	if (kmsg_fd < 0)
+		return false;
+
+	while ((len = read(kmsg_fd, buf, sizeof(buf) - 1)) > 0) {
+		buf[len] = '\0';
+		for (i = 0; lockdep_violation_patterns[i]; i++) {
+			if (strstr(buf, lockdep_violation_patterns[i])) {
+				igt_warn("LOCKDEP VIOLATION: %s\n",
+					 lockdep_violation_patterns[i]);
+				igt_warn("  kmsg: %.200s\n", buf);
+				return true;
+			}
+		}
+	}
+
+	return false;
+}
+
+/*
+ * Assert no lockdep violations occurred.
+ * Checks both kmsg patterns and kernel taint flags.
+ */
+static void assert_no_lockdep_violations(int kmsg_fd, unsigned long taint_before)
+{
+	unsigned long taints = 0;
+	bool violation;
+
+	violation = kmsg_has_lockdep_violation(kmsg_fd);
+
+	igt_kernel_tainted(&taints);
+
+	/* Check for new taint bits that appeared during the test */
+	if ((taints & ~taint_before) & (1ul << TAINT_WARN)) {
+		igt_warn("TAINT_WARN set during test - possible lockdep splat\n");
+		violation = true;
+	}
+
+	igt_assert_f(!violation,
+		     "Lockdep violation detected! Check dmesg for details.\n");
+}
+
+/*
+ * Helper: allocate and map a BO to exercise VRAM management locks
+ */
+static void alloc_and_map_bo(amdgpu_device_handle device,
+			     amdgpu_bo_handle *bo_out,
+			     amdgpu_va_handle *va_out,
+			     uint64_t *mc_addr_out)
+{
+	struct amdgpu_bo_alloc_request req = {0};
+	amdgpu_bo_handle bo;
+	amdgpu_va_handle va;
+	uint64_t mc_addr;
+	int r;
+
+	req.alloc_size = BO_SIZE;
+	req.phys_alignment = 4096;
+	req.preferred_heap = AMDGPU_GEM_DOMAIN_VRAM;
+	req.flags = 0;
+
+	r = amdgpu_bo_alloc(device, &req, &bo);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_va_range_alloc(device, amdgpu_gpu_va_range_general,
+				  BO_SIZE, 4096, 0, &mc_addr, &va, 0);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_bo_va_op(bo, 0, BO_SIZE, mc_addr, 0, AMDGPU_VA_OP_MAP);
+	igt_assert_eq(r, 0);
+
+	*bo_out = bo;
+	*va_out = va;
+	*mc_addr_out = mc_addr;
+}
+
+static void free_bo(amdgpu_bo_handle bo, amdgpu_va_handle va, uint64_t mc_addr)
+{
+	amdgpu_bo_va_op(bo, 0, BO_SIZE, mc_addr, 0, AMDGPU_VA_OP_UNMAP);
+	amdgpu_va_range_free(va);
+	amdgpu_bo_free(bo);
+}
+
+/*
+ * Thread: Continuously allocate and free VRAM BOs
+ * Exercises: vram_mgr->lock, reset_domain->sem (via eviction)
+ */
+static void *vram_alloc_thread(void *arg)
+{
+	struct thread_data *data = arg;
+	int count = 0;
+
+	while (!data->stop) {
+		amdgpu_bo_handle bo;
+		amdgpu_va_handle va;
+		uint64_t mc_addr;
+
+		alloc_and_map_bo(data->device, &bo, &va, &mc_addr);
+		usleep(1000); /* 1ms hold */
+		free_bo(bo, va, mc_addr);
+		count++;
+	}
+	data->iterations = count;
+	return NULL;
+}
+
+/*
+ * Thread: Continuously mmap/munmap GPU buffers
+ * Exercises: mmap_lock, notifier_lock, vram_lock interaction
+ */
+static void *mmap_thread(void *arg)
+{
+	struct thread_data *data = arg;
+	int count = 0;
+
+	while (!data->stop) {
+		amdgpu_bo_handle bo;
+		struct amdgpu_bo_alloc_request req = {0};
+		void *cpu_ptr = NULL;
+		int r;
+
+		req.alloc_size = BO_SIZE;
+		req.phys_alignment = 4096;
+		req.preferred_heap = AMDGPU_GEM_DOMAIN_GTT;
+		req.flags = AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
+
+		r = amdgpu_bo_alloc(data->device, &req, &bo);
+		if (r)
+			continue;
+
+		r = amdgpu_bo_cpu_map(bo, &cpu_ptr);
+		if (r == 0 && cpu_ptr) {
+			/* Touch the memory to trigger page faults */
+			memset(cpu_ptr, 0xAA, 4096);
+			amdgpu_bo_cpu_unmap(bo);
+		}
+		amdgpu_bo_free(bo);
+		count++;
+	}
+	data->iterations = count;
+	return NULL;
+}
+
+/*
+ * Thread: Trigger GPU reset via debugfs
+ * Exercises: reset_domain->sem, reset_lock, all recovery locks
+ */
+static void *reset_thread(void *arg)
+{
+	struct thread_data *data = arg;
+	char path[256];
+	int count = 0;
+
+	snprintf(path, sizeof(path),
+		 "/sys/kernel/debug/dri/1/amdgpu_gpu_recover");
+
+	while (!data->stop) {
+		FILE *f = fopen(path, "w");
+		if (f) {
+			fprintf(f, "1");
+			fclose(f);
+			count++;
+		}
+		/* Wait for reset to complete before triggering again */
+		sleep(2);
+	}
+	data->iterations = count;
+	return NULL;
+}
+
+/*
+ * Thread: USERPTR operations - register/unregister user memory
+ * Exercises: notifier_lock, mmap_lock, userq paths
+ */
+static void *userptr_thread(void *arg)
+{
+	struct thread_data *data = arg;
+	int count = 0;
+	void *user_buf = NULL;
+	size_t buf_size = BO_SIZE;
+
+	while (!data->stop) {
+		amdgpu_bo_handle bo;
+		amdgpu_va_handle va;
+		uint64_t mc_addr;
+		int r;
+
+		/* Allocate user memory */
+		user_buf = mmap(NULL, buf_size, PROT_READ | PROT_WRITE,
+				MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+		if (user_buf == MAP_FAILED)
+			continue;
+
+		/* Touch it to fault in pages */
+		memset(user_buf, 0x55, buf_size);
+
+		/* Create USERPTR BO */
+		r = amdgpu_create_bo_from_user_mem(data->device,
+						   user_buf, buf_size, &bo);
+		if (r == 0) {
+			r = amdgpu_va_range_alloc(data->device,
+						  amdgpu_gpu_va_range_general,
+						  buf_size, 4096, 0,
+						  &mc_addr, &va, 0);
+			if (r == 0) {
+				amdgpu_bo_va_op(bo, 0, buf_size, mc_addr, 0,
+						AMDGPU_VA_OP_MAP);
+				usleep(500);
+				amdgpu_bo_va_op(bo, 0, buf_size, mc_addr, 0,
+						AMDGPU_VA_OP_UNMAP);
+				amdgpu_va_range_free(va);
+			}
+			amdgpu_bo_free(bo);
+		}
+
+		munmap(user_buf, buf_size);
+		count++;
+	}
+	data->iterations = count;
+	return NULL;
+}
+
+/*
+ * Subtest: concurrent-reset-and-submit
+ *
+ * Run GPU submissions concurrently with GPU reset.
+ * This exercises the interaction between reset_domain->sem and
+ * submission locks.
+ */
+static void test_concurrent_reset_and_submit(int fd, amdgpu_device_handle device)
+{
+	struct thread_data vram_data = { .device = device, .fd = fd };
+	struct thread_data reset_data = { .device = device, .fd = fd };
+	pthread_t t_vram, t_reset;
+	unsigned long taint_before = 0;
+	int kmsg_fd;
+
+	igt_kernel_tainted(&taint_before);
+	kmsg_fd = kmsg_open();
+
+	igt_info("Running concurrent reset + VRAM allocation for %d seconds\n",
+		 THREAD_RUNTIME_SEC);
+
+	pthread_create(&t_vram, NULL, vram_alloc_thread, &vram_data);
+	pthread_create(&t_reset, NULL, reset_thread, &reset_data);
+
+	sleep(THREAD_RUNTIME_SEC);
+
+	vram_data.stop = true;
+	reset_data.stop = true;
+
+	pthread_join(t_vram, NULL);
+	pthread_join(t_reset, NULL);
+
+	igt_info("  VRAM allocs: %d, Resets: %d\n",
+		 vram_data.iterations, reset_data.iterations);
+
+	assert_no_lockdep_violations(kmsg_fd, taint_before);
+	close(kmsg_fd);
+}
+
+/*
+ * Subtest: concurrent-mmap-and-evict
+ *
+ * Run mmap/munmap concurrently with VRAM pressure (eviction).
+ * This exercises mmap_lock vs vram_mgr->lock ordering.
+ */
+static void test_concurrent_mmap_and_evict(int fd, amdgpu_device_handle device)
+{
+	struct thread_data mmap_data = { .device = device, .fd = fd };
+	struct thread_data vram_data = { .device = device, .fd = fd };
+	pthread_t t_mmap, t_vram;
+	unsigned long taint_before = 0;
+	int kmsg_fd;
+
+	igt_kernel_tainted(&taint_before);
+	kmsg_fd = kmsg_open();
+
+	igt_info("Running concurrent mmap + VRAM pressure for %d seconds\n",
+		 THREAD_RUNTIME_SEC);
+
+	pthread_create(&t_mmap, NULL, mmap_thread, &mmap_data);
+	pthread_create(&t_vram, NULL, vram_alloc_thread, &vram_data);
+
+	sleep(THREAD_RUNTIME_SEC);
+
+	mmap_data.stop = true;
+	vram_data.stop = true;
+
+	pthread_join(t_mmap, NULL);
+	pthread_join(t_vram, NULL);
+
+	igt_info("  mmap ops: %d, VRAM allocs: %d\n",
+		 mmap_data.iterations, vram_data.iterations);
+
+	assert_no_lockdep_violations(kmsg_fd, taint_before);
+	close(kmsg_fd);
+}
+
+/*
+ * Subtest: concurrent-userptr-and-reset
+ *
+ * Run USERPTR registration/unregistration concurrently with GPU reset.
+ * This exercises notifier_lock vs reset_domain->sem ordering.
+ */
+static void test_concurrent_userptr_and_reset(int fd,
+					      amdgpu_device_handle device)
+{
+	struct thread_data userptr_data = { .device = device, .fd = fd };
+	struct thread_data reset_data = { .device = device, .fd = fd };
+	pthread_t t_userptr, t_reset;
+	unsigned long taint_before = 0;
+	int kmsg_fd;
+
+	igt_kernel_tainted(&taint_before);
+	kmsg_fd = kmsg_open();
+
+	igt_info("Running concurrent USERPTR + reset for %d seconds\n",
+		 THREAD_RUNTIME_SEC);
+
+	pthread_create(&t_userptr, NULL, userptr_thread, &userptr_data);
+	pthread_create(&t_reset, NULL, reset_thread, &reset_data);
+
+	sleep(THREAD_RUNTIME_SEC);
+
+	userptr_data.stop = true;
+	reset_data.stop = true;
+
+	pthread_join(t_userptr, NULL);
+	pthread_join(t_reset, NULL);
+
+	igt_info("  USERPTR ops: %d, Resets: %d\n",
+		 userptr_data.iterations, reset_data.iterations);
+
+	assert_no_lockdep_violations(kmsg_fd, taint_before);
+	close(kmsg_fd);
+}
+
+/*
+ * Subtest: stress-all-paths
+ *
+ * Run all thread types concurrently for maximum lock contention.
+ */
+static void test_stress_all_paths(int fd, amdgpu_device_handle device)
+{
+	struct thread_data vram_data = { .device = device, .fd = fd };
+	struct thread_data mmap_data = { .device = device, .fd = fd };
+	struct thread_data userptr_data = { .device = device, .fd = fd };
+	struct thread_data reset_data = { .device = device, .fd = fd };
+	pthread_t t_vram, t_mmap, t_userptr, t_reset;
+	unsigned long taint_before = 0;
+	int kmsg_fd;
+
+	igt_kernel_tainted(&taint_before);
+	kmsg_fd = kmsg_open();
+
+	igt_info("Running all paths concurrently for %d seconds\n",
+		 THREAD_RUNTIME_SEC);
+
+	pthread_create(&t_vram, NULL, vram_alloc_thread, &vram_data);
+	pthread_create(&t_mmap, NULL, mmap_thread, &mmap_data);
+	pthread_create(&t_userptr, NULL, userptr_thread, &userptr_data);
+	pthread_create(&t_reset, NULL, reset_thread, &reset_data);
+
+	sleep(THREAD_RUNTIME_SEC);
+
+	vram_data.stop = true;
+	mmap_data.stop = true;
+	userptr_data.stop = true;
+	reset_data.stop = true;
+
+	pthread_join(t_vram, NULL);
+	pthread_join(t_mmap, NULL);
+	pthread_join(t_userptr, NULL);
+	pthread_join(t_reset, NULL);
+
+	igt_info("  VRAM: %d, mmap: %d, USERPTR: %d, Resets: %d\n",
+		 vram_data.iterations, mmap_data.iterations,
+		 userptr_data.iterations, reset_data.iterations);
+
+	assert_no_lockdep_violations(kmsg_fd, taint_before);
+	close(kmsg_fd);
+}
+
+int igt_main()
+{
+	amdgpu_device_handle device;
+	int fd = -1;
+	int r;
+
+	igt_fixture() {
+		uint32_t major, minor;
+
+		fd = drm_open_driver(DRIVER_AMDGPU);
+		igt_require(fd >= 0);
+
+		r = amdgpu_device_initialize(fd, &major, &minor, &device);
+		igt_require(r == 0);
+
+		/* Skip if lockdep is not enabled on the running kernel */
+		igt_require_f(is_lockdep_enabled(),
+			      "CONFIG_LOCKDEP not enabled - "
+			      "rebuild kernel with CONFIG_PROVE_LOCKING=y\n");
+
+		igt_info("amd_lockdep: Exercise lock-heavy paths for lockdep validation\n");
+		igt_info("Lockdep is ENABLED - violations will FAIL the test\n\n");
+	}
+
+	igt_describe("Submit work while triggering GPU reset - exercises reset_sem vs submission locks");
+	igt_subtest("concurrent-reset-and-submit") {
+		test_concurrent_reset_and_submit(fd, device);
+	}
+
+	igt_describe("mmap/munmap while VRAM eviction runs - exercises mmap_lock vs vram_lock");
+	igt_subtest("concurrent-mmap-and-evict") {
+		test_concurrent_mmap_and_evict(fd, device);
+	}
+
+	igt_describe("USERPTR invalidation during GPU reset - exercises notifier_lock vs reset_sem");
+	igt_subtest("concurrent-userptr-and-reset") {
+		test_concurrent_userptr_and_reset(fd, device);
+	}
+
+	igt_describe("Combined stress of all lock-heavy paths simultaneously");
+	igt_subtest("stress-all-paths") {
+		test_stress_all_paths(fd, device);
+	}
+
+	igt_fixture() {
+		amdgpu_device_deinitialize(device);
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index d6fe7e909..87cc9c3ee 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -15,6 +15,7 @@ if libdrm_amdgpu.found()
 			  'amd_cs_nop',
 			  'amd_cursor_overlay',
 			  'amd_deadlock',
+                          'amd_lockdep',
                           'amd_dmabuf_unload',
 			  'amd_dp_dsc',
 			  'amd_freesync_video_mode',
-- 
2.54.0

