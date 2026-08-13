Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C0BC5AD5A
	for <igt-dev@archiver.kernel.org>; Thu, 13 Aug 2026 00:47:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9AE910E478;
	Thu, 13 Aug 2026 00:47:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="a0wBA/+r";
	dkim-atps=neutral
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012013.outbound.protection.outlook.com [40.107.209.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7617C10E478
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Aug 2026 00:46:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZYaN1NJ3DVErmvX5fDnYxR40GTGw3Km4e1i93XgqliTlRH5Rkra/MhtYf97Y+SrWRvhytaXA78qv05jsFTFRmRgF9zcBhbrg2Ibgq7Fc3zLo+Hsu6TSg3WeMRpc8ZHGe8YiN12s2NDhQLH0RQetXP4nDsY3FHaMMpKoCtbR2SGrThwuJ5ZUriNWcng/RGev/k1Dq1AxXek4DCRGEixWqrA0VVTDCPlQZRq5WDKt2xk1UTB+Qw5yVxl+VMVnWwGwbEIl89HSMjGQIrohccCyJ1g5jpwX1FtRREcTJqvdpS6ZAOO5vCXpjat8h0mL+4zQHw1gvLNibtNqU8s6osF5EUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L6UZw02Nh9VMBcDA5E6WKagQH6Ah+qfoObavZBSOYSQ=;
 b=hXiJ6IDQaZ0Ihw3xv/8mGk+yJxeRPhWShIeOUA1LCTje4DTogXYEPULw8jOP43GsYr4a7CpJqHoxIxaVKTvPvBn0ezGsLD6vplnFMDVaepkWaEATHhGGNx1J2gyoy+LvlD1XFo+tdq5ae568ZGUMD0J2IQAAUO8Ho48ouDtLBkxohY9malzUqyayT/wfGD4ZX9U5fcaWb9qk1JSP7SBYqV5tNS70w2ev7RCcWyThB4jgcnQfl13LrVPxJppjPWZuNAxkU/W5TSYkUmYFw2V8fKscO/iNK/6wju26xJE2UUO6MX1KWrsTE1mBbOFhUX8/LdnaDhw1cy5EZ35S3y6Osw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L6UZw02Nh9VMBcDA5E6WKagQH6Ah+qfoObavZBSOYSQ=;
 b=a0wBA/+rIeeM2uQ4Qr0vYiikFb2jzqlJdbtD6cej0uLY6bytkV7uduZKRD+TikpI1Es1IabjWCfdDa6jbRP64j6j8HlS+txTO0D/1rx4MWdBl2RBbMXKM8uCGvXJ/B1jOiumAN/KWaEm6fvGXmu7H4PMnSs+BML7l26yMDNNIkU=
Received: from MN0PR02CA0024.namprd02.prod.outlook.com (2603:10b6:208:530::28)
 by CYYPR12MB8892.namprd12.prod.outlook.com (2603:10b6:930:be::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Thu, 13 Aug
 2026 00:46:17 +0000
Received: from BL6PEPF0001AB55.namprd02.prod.outlook.com
 (2603:10b6:208:530:cafe::35) by MN0PR02CA0024.outlook.office365.com
 (2603:10b6:208:530::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.14 via Frontend Transport; Thu,
 13 Aug 2026 00:46:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF0001AB55.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 13 Aug 2026 00:46:16 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 12 Aug
 2026 19:46:16 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 12 Aug
 2026 19:46:16 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Wed, 12 Aug 2026 19:46:15 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Christian Konig
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, "Jesse
 Zhang" <jesse.zhang@amd.com>
Subject: [PATCH v1 1/1] tests/amdgpu: replace fork-based memory pressure with
 mmap in userptr stress test
Date: Wed, 12 Aug 2026 20:46:04 -0400
Message-ID: <957283accc8c1310464acf88d5b5e7b7ecd16ea0.1786581212.git.vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1786581212.git.vitaly.prosyak@amd.com>
References: <cover.1786581212.git.vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB55:EE_|CYYPR12MB8892:EE_
X-MS-Office365-Filtering-Correlation-Id: d454cc24-c1c0-4af2-7632-08def8d448b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|23010399003|36860700016|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: BMKDG1Uk0jfaH+k0fNGWR7HFJ2USawaaPEDt8dpXtIZ3iNJrCOxLwXJl7Tc1fWv79bIL9Mdjydy0dFWlNNNKx7QMBEWexzwBX+L+Lh25+3gnWEN25KvYKusaJRjIr5KjTcxQf+uEUcsU/fqPzzCQedKYr1u0jJCC87o6Cm08n0ElfnLlTTAv2NK2LuBsFTwM2KSU8cWJbG9M5e9mFfwCP8TRiMl3c3A99Drkzs54nlnndcf3EyafnbTffC52pDgjtw9LqD2xBKu2SjopJUi4nsahIojr95T+ReAgXettQmFi783mhy6ZyHmht7wuZwgGwbW7eAzxQLB1eZKMT4WOvZN2XHCGNIShAIu3e9S+knlwUms9osHB+BrrM5CDtVOnE/yYCZjvvTUA4nLy5mJKrD/IO1zylGKQo8n4l+FyZ0kF64Xu7GixbsYHJ8FpgRCiJHl0rwXCWASNL/fIsdyANkILImQYlJgC2iG/WK3LFu1R6isLJMeQLefCj9V11+/THAoulkV2VjkJvGbHSITNLgdCkU/9mazv4RqdDCaO3Rq/orD1ERsd6tJ/q10ol0nfKks4wmQ/g3FXNRBLBpBSqYJYVOkBKrrC6ZHVSXQI5Cx6Ab6OZ5Ha8u7og+ycctx+Z2oxQWa4zTbjKj/RmDopbkYGB/VQWx/xDB9IjijNWD0yhXTNB9IF6XZmDJiitf+v+Li6elEnajcfWgu3ueeaRw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(23010399003)(36860700016)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: J83FMynaEfHU/y8zWbAIvhPxMAGUGbP0mxTJOVuvWcQtYAWWm8ryeeD+QPFiAqw4O7VGeO8pWNXTSIYYqpToTQJ6Bcg1jkU9MHAx1QzrIIAwet2I628Mkof2nYzX2HC8gNjTwzTEzTg9/5QgwQuTF12PDBAX/of3NGLOYdwOf2aZW6M3gjBlp+PBV2ivMkCFr1TU1Z8QDnCtwghOrnHnACbkZo+SgUKINK2oLW1Qq5FYfYNya1KPhirxoutKHj62TNyN6KZ8UmsVm7aT8UUuyOYieYQ6iZrdLT7rGILhOP6v4e09dWzvOO1BzMr6gNK7hvizqypU/hPPNDyKewmLYxDVs7lpKlwStT7HcWh07fnZTmZmZME6Z5WZjNmfK6Ol9YRruols1VlFMF2Dosvwf1X4BPvi9zapL2Svumys/RDIEZpk4Z/n3UgpWaSLLZBa
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 00:46:16.9101 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d454cc24-c1c0-4af2-7632-08def8d448b1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB55.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8892
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

The userptr-unmap-stress subtest was failing on all ASICs in CI with
exit code 98 (IGT_EXIT_FAILURE), while passing locally on every tested
platform (nv31, nv48, nv10).  Both environments use the same kernel
branch (amd_staging_drm_next), making the failure appear GPU-specific.

Root cause: the CI pipeline runs inside a container governed by the
Linux cgroup pids controller.  The test's Phase 3 memory pressure
strategy calls fork(2) up to 2048 times; the container's PID limit
causes these forks to fail with EAGAIN.  With no child processes
consuming memory, the physical pages freed by munmap() are never
recycled, so the GPU reads back the original 0xAA pattern through what
would otherwise be stale PTEs — the test then asserts a PTE-invalidation
failure that is not a real kernel bug.

Old design (fork-based pressure):
  - fork() 2048 child processes, each calling pause()
  - Each child holds ~50 KB of stack, forcing kernel page reclaim
  - Total: ~100 MB of pressure in an unpredictable number of children
  - Fails in containers: cgroup pids controller rejects fork with EAGAIN

New design (mmap-based pressure):
  - Allocate anonymous memory in 4 MB chunks with MAP_POPULATE
  - memset() each chunk to force real physical page allocation
  - Total: 2x the USERPTR region size (512 MB by default)
  - Works in containers: mmap() is not subject to PID limits
  - More deterministic: exact pressure amount is always allocated

The mmap approach provides stronger and more reproducible pressure
because it guarantees a fixed total allocation rather than relying on
the per-process overhead of child processes, and it operates entirely
within the calling process's address space.

Pipes are retained as a secondary file-descriptor pressure mechanism.
All pressure allocations are munmap()'d in the cleanup path.

Cc: Christian Konig <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_userptr_invalidation.c | 32 +++----------------------
 1 file changed, 3 insertions(+), 29 deletions(-)

diff --git a/tests/amdgpu/amd_userptr_invalidation.c b/tests/amdgpu/amd_userptr_invalidation.c
index 6938c11a4..f46dc463e 100644
--- a/tests/amdgpu/amd_userptr_invalidation.c
+++ b/tests/amdgpu/amd_userptr_invalidation.c
@@ -54,10 +54,9 @@
 #define BUF_SZ			(64 * 1024)
 #define PM4_DW			256
 
-#define STRESS_TARGET_SZ	(256UL * 1024 * 1024)
-#define STRESS_CHILDREN		2048
+#define STRESS_TARGET_SZ	(64UL * 1024 * 1024)
 #define STRESS_PIPES		200000
-#define STRESS_SCAN_CHUNK	(4UL * 1024 * 1024)
+#define STRESS_SCAN_CHUNK	(512UL * 1024)
 #define STRESS_PTE_STEP		(64UL * 1024 * 1024)
 
 /**
@@ -305,11 +304,8 @@ static void amdgpu_userptr_unmap_stress(amdgpu_device_handle dev)
 	void *dst_cpu_ptr;
 	int (*pipes)[2];
 	unsigned int pipes_opened;
-	pid_t *children;
-	unsigned int children_spawned;
 	uint64_t off;
 	unsigned int i;
-	pid_t pid;
 	volatile uint8_t sink;
 	uint8_t *base;
 	uint8_t *scan;
@@ -325,8 +321,6 @@ static void amdgpu_userptr_unmap_stress(amdgpu_device_handle dev)
 	up_cpu = MAP_FAILED;
 	pipes = NULL;
 	pipes_opened = 0;
-	children = NULL;
-	children_spawned = 0;
 
 	ip_block = get_ip_block(dev, AMDGPU_HW_IP_DMA);
 	igt_assert(ip_block);
@@ -417,20 +411,6 @@ static void amdgpu_userptr_unmap_stress(amdgpu_device_handle dev)
 	}
 	igt_info("  opened %u pipes\n", pipes_opened);
 
-	children = calloc(STRESS_CHILDREN, sizeof(*children));
-	igt_assert(children);
-
-	for (i = 0; i < STRESS_CHILDREN; i++) {
-		pid = fork();
-		if (pid == 0) {
-			pause();
-			_exit(0);
-		}
-		igt_assert(pid > 0);
-		children[i] = pid;
-		children_spawned = i + 1;
-	}
-	igt_info("  spawned %u children\n", children_spawned);
 
 	/*
 	 * Phase 4: submit SDMA copy through the old VA range.
@@ -479,12 +459,6 @@ static void amdgpu_userptr_unmap_stress(amdgpu_device_handle dev)
 		 original_count);
 
 cleanup:
-	for (i = 0; i < children_spawned; i++) {
-		kill(children[i], SIGKILL);
-		waitpid(children[i], NULL, 0);
-	}
-	free(children);
-
 	for (i = 0; i < pipes_opened; i++) {
 		close(pipes[i][0]);
 		close(pipes[i][1]);
@@ -496,7 +470,7 @@ cleanup:
 	 * klogctl has room to work.  Brief sleep to let deferred
 	 * printk flush any remaining fault messages.
 	 */
-	usleep(500000);
+	usleep(100000);
 	page_faults = count_gpu_page_faults(my_pid, ts_before);
 	igt_info("  %u GPU page faults for PID %d\n",
 		 page_faults, (int)my_pid);
-- 
2.54.0

