Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99988D1266D
	for <igt-dev@archiver.kernel.org>; Wed,  3 Dec 2025 09:03:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4401B10E7B0;
	Wed,  3 Dec 2025 09:03:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bRmPYz54";
	dkim-atps=neutral
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012048.outbound.protection.outlook.com [40.107.209.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F129710E7B0
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Dec 2025 09:03:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R5Z/epDoK0I7razDOHs7/FcASGnqWwNXT2SNWMULhO9W92TvqRQ+406YLosrzlbjvLsKGubKva1wdpAGhyjoII+fEdzn6BQ3BR4Wxh3M0GAfR3FB0Elp2HQUj76p+NLVblA9461hdWtmvb6t7NXVcb4yeMSffWAx6LiZE+qraZ6l1wmW6173pUEmUUgpcWrV9LgCL/ZeXopI0+f4sQoqWXlgSYtI/BzdL2mpfCjM+XuXNscvef4mg8HwK4+1OS4mcbYgFSzupo6fapaqAgZIbyQAZpOHeU234CNtRHcaOGj6pBk5rEhC7ciWKIpW8h4qoGnuFuamoChFFaqRCHPUvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WN3wBUuffAIrxh/162Cr48sV0jfytpmW9Rp4sQwL4vs=;
 b=HBr1r0OUy06gMzrPucXQKPuAoQ+m6bFCY+muDAI3TAytbkXjhBrSW6rxmbTVPgAeaGrOlB91IXqyibaRUv5SF56R+EUjmap/34pvoHpwGvK4XvSCIU9aStgD3EMfQ8spnzCuNSzgXjElbJU2dCtLcuAJ5xqjAQglJhSEGJWWSIRbMkp1pEo2gqkJK73zzqCSRfwbn0V4Yq/TSA+9+7fd3bCLlMnOOXveEcyn1BWISvefBlA8HBQvpvJMUZZMHwIyGQevIl+jsg/6NzOvqPYEGSOGQuZiZHnw/igPTTLmi8nMV018WW2DGhahrQxrNOUrg4TwX+UFKAhGLFoeyVZEhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WN3wBUuffAIrxh/162Cr48sV0jfytpmW9Rp4sQwL4vs=;
 b=bRmPYz54bz79D2sm0qokAJKprPF0DdyAwjb9Ac2xxyKZzlWnXE/09Zo3mYwhqJ6ENYJQgAEsjIl7Hfx/omgzWk13MbwxKkkLhKr/J0tOLSqrbEo8b8C3TtdbWBzX/t8gilNtMl2A2OqG5IK/QXd9IyYoMqLmII0X2xPL5xFRzJY=
Received: from CH2PR14CA0028.namprd14.prod.outlook.com (2603:10b6:610:60::38)
 by DS0PR12MB7748.namprd12.prod.outlook.com (2603:10b6:8:130::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 09:03:21 +0000
Received: from CH1PEPF0000A346.namprd04.prod.outlook.com
 (2603:10b6:610:60:cafe::6d) by CH2PR14CA0028.outlook.office365.com
 (2603:10b6:610:60::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Wed, 3
 Dec 2025 09:03:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH1PEPF0000A346.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Wed, 3 Dec 2025 09:03:21 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 3 Dec
 2025 03:03:20 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 3 Dec
 2025 03:03:20 -0600
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Wed, 3 Dec 2025 01:03:13 -0800
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse.Zhang <Jesse.Zhang@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH i-g-t v4 1/6] lib/amdgpu: Add flexible command context API
 with external BO support
Date: Wed, 3 Dec 2025 17:02:04 +0800
Message-ID: <20251203090307.467031-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A346:EE_|DS0PR12MB7748:EE_
X-MS-Office365-Filtering-Correlation-Id: 33995e51-04fd-419c-ed22-08de324acecb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?htEAzwzz/gR7bEyVdRsant2uehKmFb+ZU7D4llZpVUQXZgtpH6kWZau3LSm0?=
 =?us-ascii?Q?pKB0/GRHxS9FkpcgWlPy+nUGzLf7LV0MO7zl+Xf2PtV7Bz4jRIiVeLlrzKvR?=
 =?us-ascii?Q?k40/F+JcCbb3HZp4arYNaaed1qUWTsMryhgH0Jbn2ecR3qmrF4HJpG3v8KRE?=
 =?us-ascii?Q?2KRBxrrG7BjVcjgWueouM2lyKkam5zmEpzlAOuPSYk8lbrpwPgM3+7p9RJP2?=
 =?us-ascii?Q?41lquwPzykHLwEkF3mfniuOXDPLz+wZIriHFJA5BXCdGFegZnh6aP6IrzTZY?=
 =?us-ascii?Q?zhR187L2Q70Du3vR2qQqPXuvCfP9ZXP2Ocz10mBDhBhN9OrMBu7N/RGB0Yeg?=
 =?us-ascii?Q?huN3y3ttashu0s+fVFRlWSqpZykGVFxkANmo0WBnt5XfExaCCxk21++IAI3/?=
 =?us-ascii?Q?l16ATvsWE5UsVq6kVSE9Dx1+zO9hGx1N7UJJ9MVMj7T3/zcpfdlKok69CGdt?=
 =?us-ascii?Q?5Qf6xCBjCP0l5eNLrfhmnBkGbs7vI06TEk49+jx9Ch4dHHRcwYuTwBANTwz3?=
 =?us-ascii?Q?5k3blq0lLZQsrtSgSKmF7cagwlgduFfubnaKjdwrIar6kEstKN0EubZRepc6?=
 =?us-ascii?Q?kpTS0emGFxavFBFWiNZ9Q+zIkSM/+RYxqG9MfcXdYq5hFqxIro/CeTTu1C4D?=
 =?us-ascii?Q?EtHHqH1k/q0Rp9aiinj9A3wdQymT3PSBI/nMKCO2dO2NwixmV4apY4M5BmSb?=
 =?us-ascii?Q?GsVeVCItKGDyd4ldxLYROK9fj/9iUq3h3uNtHBuqMqelhmlIJCcYXYjeC185?=
 =?us-ascii?Q?fvi5NO7L3EULoF4B/U+P/CWfykKZBJGB4GqvHs+oEQLh/Fow9CyPrVwuRXUp?=
 =?us-ascii?Q?PhxGi1FFl0KbUfK6loAPQhvbkzu4rfLft76VKlhbmPYc93CfsY3BPYNoZX+O?=
 =?us-ascii?Q?r38epvNFMXQcFC9aBxGKea8o/yjh7jFWtmNWk1O5AExer8VlvqWmhzkyVGWx?=
 =?us-ascii?Q?ay7oogjkj7c0KkkXyp1IynNr+hicymOuGZd8IYZZN5D9YTTcaobZIIQVMBbr?=
 =?us-ascii?Q?ZNrsse+MydfK0brdWDNdMTRjrnsaWdXoKF8hXTVXCm7/nFtffnHBhWKB9vkx?=
 =?us-ascii?Q?Ib3B6+38nBD6upbpCP0h1jxeCWYy16K/h30++jTiRWWasFin6jhAWjPuPFxG?=
 =?us-ascii?Q?xTIPP4BNJTkhROqI8EXV8Sh8vPyNFgVG551Ccq19KyUchFdNOb+Ui/9E5rZH?=
 =?us-ascii?Q?YU+A4OFh3aKrxqmK9iW52AKlppmCR6YdYrDD+jQswlVmBDfmg59vjL+6NNHx?=
 =?us-ascii?Q?hLgOe10RGJAfVthZjRvfJUxubBBWjZqhqAyP7zjpsccB/qAbMO4X6JFRZDYK?=
 =?us-ascii?Q?pDHib7M5QBwmRRYmki8DydWi7bl/v3DqUoeCfIJr/bMtiE9g5lWogyzyHDSo?=
 =?us-ascii?Q?LLfkg0IJ7M4F7NzKfB+IB7LMI2YIn6d+gsixvWuBD9tudsQ4ZoWgWGHCIPiW?=
 =?us-ascii?Q?aoegrKlbyf1+PPSqOWXuYjz8Syy+Dh/Bl4YGIVXF2c+3S2HAWtH604LnTKn2?=
 =?us-ascii?Q?bBzAdY0a4EJvP2W45EJWLwfQv9muE4gzs44gMFmpN5JbFRVqJaEs+MD8ooE+?=
 =?us-ascii?Q?vBbSXOP0OhsWKs/6/Fo=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 09:03:21.1095 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33995e51-04fd-419c-ed22-08de324acecb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A346.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7748
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

Implement a new command context management API that supports for command submission.

Key changes:
1. Add `cmd_context_create()`: Supports external BO injection with GPU/CPU
   address tracking, and maintains backward compatibility for internal BO
   allocation.
2. Add `cmd_context_destroy()`: Conditional BO cleanup (preserve external
   BOs unless explicitly requested to destroy).
3. Add `cmd_submit_packet()`: Use separate IB buffer for command submission
   to avoid overwriting original BO data, and properly manage resource lists
   including both user-provided and internal resources.
4. Add convenience functions: `cmd_submit_write_linear()`,
   `cmd_submit_copy_linear()`, `cmd_submit_atomic()` for common operations.
5. Add utility functions: `cmd_ring_available()` and
   `cmd_get_available_rings()` for ring validation.
6. Add `cmd_wait_completion()`: Unified waiting for both user queues
   (timeline syncobj) and kernel queues (fence status query).


Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 lib/amdgpu/amd_command_submission.c | 587 ++++++++++++++++++++++++++++
 lib/amdgpu/amd_command_submission.h |  72 ++++
 2 files changed, 659 insertions(+)

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index 4b59cdab0..fc5a0ed32 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -852,3 +852,590 @@ amdgpu_command_ce_write_fence(amdgpu_device_handle dev,
 	free_cmd_base(base);
 }
 
+/**
+ * command context creation with optional external BO
+ *
+ * @param device AMDGPU device handle
+ * @param ip_type IP block type (GFX, DMA, etc.)
+ * @param ring_id Ring index to use
+ * @param user_queue Whether to use user queue mode
+ * @param write_length Size of write operations in DWORDs
+ * @param external_bo Optional external buffer object (NULL for internal allocation)
+ * @param external_bo_mc GPU MC address of external BO (required if external_bo provided)
+ * @param external_bo_cpu CPU mapping of external BO (required if external_bo provided)
+ * @return New command context, or NULL on failure
+ */
+cmd_context_t* cmd_context_create(amdgpu_device_handle device,
+                                    enum amd_ip_block_type ip_type,
+                                    uint32_t ring_id,
+                                    bool user_queue,
+                                    uint32_t write_length,
+                                    amdgpu_bo_handle external_bo,
+                                    uint64_t external_bo_mc,
+                                    volatile uint32_t *external_bo_cpu)
+{
+	cmd_context_t *ctx;
+	void *cpu_ptr = NULL;
+	uint64_t bo_mc = 0;
+	amdgpu_va_handle va_handle = NULL;
+	int r;
+
+	if (!device)
+		return NULL;
+
+	/* Check if the requested ring is available */
+	if (!cmd_ring_available(device, ip_type, ring_id, user_queue))
+		return NULL;
+
+	/* Allocate context structure */
+	ctx = calloc(1, sizeof(cmd_context_t));
+	if (!ctx)
+		return NULL;
+
+	ctx->device = device;
+	ctx->ip_type = ip_type;
+	ctx->user_queue = user_queue;
+	ctx->last_submit_seq = 0;
+	ctx->uses_external_bo = (external_bo != NULL);  // Now this member exists
+	ctx->initialized = false;
+
+	/* Get IP block for the specified IP type */
+	ctx->ip_block = get_ip_block(device, (unsigned int)ip_type);
+	if (!ctx->ip_block) {
+		free(ctx);
+		return NULL;
+	}
+
+	/* Allocate ring context structure */
+	ctx->ring_ctx = calloc(1, sizeof(struct amdgpu_ring_context));
+	if (!ctx->ring_ctx) {
+		free(ctx);
+		return NULL;
+	}
+
+	/* Setup ring context parameters */
+	ctx->ring_ctx->write_length = write_length ? write_length : 128;
+	ctx->ring_ctx->pm4_size = 256;
+	ctx->ring_ctx->pm4 = calloc(ctx->ring_ctx->pm4_size, sizeof(uint32_t));
+	if (!ctx->ring_ctx->pm4) {
+		free(ctx->ring_ctx);
+		free(ctx);
+		return NULL;
+	}
+
+	ctx->ring_ctx->res_cnt = 1;
+	ctx->ring_ctx->ring_id = ring_id;
+	ctx->ring_ctx->secure = false;
+	ctx->ring_ctx->user_queue = user_queue;
+	ctx->ring_ctx->time_out = 0;
+
+	if (user_queue) {
+	/* Initialize user queue if requested */
+		if (!ctx->ip_block->funcs->userq_create) {
+			free(ctx->ring_ctx->pm4);
+			free(ctx->ring_ctx);
+			free(ctx);
+			return NULL;
+		}
+		ctx->ip_block->funcs->userq_create(device, ctx->ring_ctx, (unsigned int)ip_type);
+	}else {
+		/* Create regular command submission context */
+		r = amdgpu_cs_ctx_create(device, &ctx->ring_ctx->context_handle);
+		if (r) {
+			free(ctx->ring_ctx->pm4);
+			free(ctx->ring_ctx);
+			free(ctx);
+			return NULL;
+		}
+	}
+
+	/* BO allocation strategy: use external BO if provided, otherwise allocate internally */
+	if (external_bo) {
+		/* Validate external BO arguments */
+		if (!external_bo_cpu || !external_bo_mc) {
+			igt_debug("Invalid external BO arguments (mc=0x%llx, cpu=%p)\n",
+					  (unsigned long long)external_bo_mc, external_bo_cpu);
+			free(ctx->ring_ctx->pm4);
+			free(ctx->ring_ctx);
+			free(ctx);
+			return NULL;
+		}
+
+		/* Use caller-provided external BO */
+		ctx->ring_ctx->bo = external_bo;
+		ctx->ring_ctx->bo_mc = external_bo_mc;
+		ctx->ring_ctx->bo_cpu = external_bo_cpu;
+		ctx->ring_ctx->va_handle = NULL;  // VA management is caller's responsibility
+
+		igt_info("Using external BO: GPU=0x%llx, CPU=%p\n",
+				 (unsigned long long)external_bo_mc, external_bo_cpu);
+	} else {
+		/* Allocate internal BO for command operations */
+		r = amdgpu_bo_alloc_and_map(device,
+				   ctx->ring_ctx->write_length * sizeof(uint32_t),
+				   4096,
+				   AMDGPU_GEM_DOMAIN_GTT,
+				   0,
+				   &ctx->ring_ctx->bo,
+				   &cpu_ptr,
+				   &bo_mc,
+				   &va_handle);
+		if (r) {
+			goto cleanup_error;
+		}
+
+		ctx->ring_ctx->bo_mc = bo_mc;
+		ctx->ring_ctx->bo_cpu = (volatile uint32_t *)cpu_ptr;
+		ctx->ring_ctx->va_handle = va_handle;
+
+		igt_info("Allocated internal BO: GPU=0x%llx, CPU=%p\n",
+			 (unsigned long long)bo_mc, cpu_ptr);
+	}
+
+	/* Initialize resources array */
+	ctx->ring_ctx->resources[0] = ctx->ring_ctx->bo;
+	for (int i = 1; i < 4; i++) {
+		ctx->ring_ctx->resources[i] = NULL;
+	}
+
+	ctx->initialized = true;
+	return ctx;
+
+cleanup_error:
+	/* Cleanup resources in case of allocation failure */
+	if (user_queue) {
+		ctx->ip_block->funcs->userq_destroy(device, ctx->ring_ctx, (unsigned int)ip_type);
+	} else {
+		if (ctx->ring_ctx->context_handle)
+		    amdgpu_cs_ctx_free(ctx->ring_ctx->context_handle);
+	}
+
+	free(ctx->ring_ctx->pm4);
+	free(ctx->ring_ctx);
+	free(ctx);
+	return NULL;
+}
+
+/**
+ * context destruction function with external BO control
+ *
+ * @param ctx Command context to destroy
+ * @param destroy_external_bo Whether to destroy external BO (if used)
+ */
+void cmd_context_destroy(cmd_context_t *ctx, bool destroy_external_bo)
+{
+	if (!ctx || !ctx->initialized)
+		return;
+
+	if (ctx->ring_ctx) {
+		/* Handle BO cleanup based on allocation type */
+		if (ctx->ring_ctx->bo) {
+			if (!ctx->uses_external_bo || destroy_external_bo) {
+				/* Clean up internal BO or external BO if explicitly requested */
+				if (ctx->ring_ctx->va_handle) {
+				    /* Internal BO with VA handle - full cleanup */
+				    amdgpu_bo_unmap_and_free(ctx->ring_ctx->bo, ctx->ring_ctx->va_handle,
+							   ctx->ring_ctx->bo_mc,
+							   ctx->ring_ctx->write_length * sizeof(uint32_t));
+				} else if (destroy_external_bo) {
+				    /* External BO without VA handle - just free the BO */
+				    amdgpu_bo_free(ctx->ring_ctx->bo);
+				}
+			} else {
+				/* External BO, preserve it as requested by caller */
+				igt_info("Preserving external BO (GPU=0x%llx)\n",
+						 (unsigned long long)ctx->ring_ctx->bo_mc);
+			}
+		}
+
+		/* Clean up command submission context */
+		if (ctx->user_queue) {
+			if (ctx->ip_block && ctx->ip_block->funcs->userq_destroy) {
+				ctx->ip_block->funcs->userq_destroy(ctx->device, ctx->ring_ctx,
+							  (unsigned int)ctx->ip_type);
+		    }
+		} else {
+			if (ctx->ring_ctx->context_handle) {
+				amdgpu_cs_ctx_free(ctx->ring_ctx->context_handle);
+		    }
+		}
+
+		/* Free PM4 command buffer */
+		if (ctx->ring_ctx->pm4) {
+			free(ctx->ring_ctx->pm4);
+		}
+
+		free(ctx->ring_ctx);
+	}
+
+	free(ctx);
+}
+
+/**
+ * Submit command packet without waiting - Fixed submission logic
+ */
+int cmd_submit_packet(cmd_context_t *ctx)
+{
+	amdgpu_bo_list_handle bo_list;
+	int r;
+	struct amdgpu_cs_request ibs_request;
+	struct amdgpu_cs_ib_info ib_info;
+	amdgpu_bo_handle ib_bo;
+	void *ib_cpu;
+	uint64_t ib_mc_address;
+	amdgpu_va_handle ib_va_handle;
+	amdgpu_bo_handle all_res[5] = {0};
+	uint32_t res_count = 0;
+	uint32_t i;
+
+	if (!ctx || !ctx->initialized || !ctx->ring_ctx) {
+		igt_debug("Invalid context parameters\n");
+		return -EINVAL;
+	}
+
+	/* Check required parameters */
+	if (ctx->ring_ctx->pm4_dw == 0 || ctx->ring_ctx->pm4_dw > 1024) {
+		igt_debug("Invalid PM4 size: %u (must be 1-1024)\n", ctx->ring_ctx->pm4_dw);
+		return -EINVAL;
+	}
+
+	/* For user queues, use userq_submit */
+	if (ctx->user_queue) {
+		if (!ctx->ip_block || !ctx->ip_block->funcs->userq_submit) {
+			igt_debug("User queue submission not supported\n");
+			return -ENOTSUP;
+		}
+
+		if (!ctx->ring_ctx->bo_mc) {
+		igt_debug("Invalid BO MC address for user queue\n");
+		return -EINVAL;
+		}
+
+		ctx->ip_block->funcs->userq_submit(ctx->device, ctx->ring_ctx,
+		      (unsigned int)ctx->ip_type,
+		      ctx->ring_ctx->bo_mc);
+		ctx->last_submit_seq = ctx->ring_ctx->point;
+		igt_info("User queue submission successful, point=%lu\n", ctx->last_submit_seq);
+		return 0;
+	}
+
+	/* For regular queues, setup and submit CS */
+	memset(&ibs_request, 0, sizeof(ibs_request));
+	memset(&ib_info, 0, sizeof(ib_info));
+
+	/* Allocate separate IB buffer instead of reusing command buffer */
+	r = amdgpu_bo_alloc_and_map(ctx->device,
+			       ctx->ring_ctx->pm4_dw * sizeof(uint32_t),
+			       4096,
+			       AMDGPU_GEM_DOMAIN_GTT,
+			       0,
+			       &ib_bo,
+			       &ib_cpu,
+			       &ib_mc_address,
+			       &ib_va_handle);
+	if (r) {
+		igt_debug("Failed to allocate IB: %d\n", r);
+		return r;
+	}
+
+	/* Copy PM4 commands to IB */
+	memcpy(ib_cpu, ctx->ring_ctx->pm4, ctx->ring_ctx->pm4_dw * sizeof(uint32_t));
+
+	/* Setup IB information */
+	ib_info.ib_mc_address = ib_mc_address;
+	ib_info.size = ctx->ring_ctx->pm4_dw;
+	if (ctx->ring_ctx->secure)
+		ib_info.flags |= AMDGPU_IB_FLAGS_SECURE;
+
+	/* Setup submission request */
+	ibs_request.ip_type = (unsigned int)ctx->ip_type;
+	ibs_request.ring = ctx->ring_ctx->ring_id;
+	ibs_request.number_of_ibs = 1;
+	ibs_request.ibs = &ib_info;
+	ibs_request.fence_info.handle = NULL;
+
+	/* Create resource list containing both original resources and IB */
+	/* Add original resources */
+	for (i = 0; i < ctx->ring_ctx->res_cnt && i < 4; i++) {
+		if (ctx->ring_ctx->resources[i]) {
+			all_res[res_count++] = ctx->ring_ctx->resources[i];
+		}
+	}
+
+	/* Add IB as the last resource */
+	all_res[res_count++] = ib_bo;
+
+	/* Create BO list */
+	r = amdgpu_bo_list_create(ctx->device, res_count, all_res, NULL, &bo_list);
+	if (r) {
+		igt_debug("amdgpu_bo_list_create failed: %d\n", r);
+		amdgpu_bo_unmap_and_free(ib_bo, ib_va_handle, ib_mc_address,
+				       ctx->ring_ctx->pm4_dw * sizeof(uint32_t));
+		return r;
+	}
+
+	ibs_request.resources = bo_list;
+
+	/* Submit command - strict error checking */
+	r = amdgpu_cs_submit(ctx->ring_ctx->context_handle, 0, &ibs_request, 1);
+
+	if (r != 0) {
+		igt_debug("amdgpu_cs_submit failed: %d\n", r);
+		amdgpu_bo_list_destroy(bo_list);
+		amdgpu_bo_unmap_and_free(ib_bo, ib_va_handle, ib_mc_address,
+				       ctx->ring_ctx->pm4_dw * sizeof(uint32_t));
+		return r;
+	}
+
+	/* Record submission sequence number for waiting */
+	ctx->last_submit_seq = ibs_request.seq_no;
+	igt_debug("Command submitted successfully, seq_no=%lu\n", ctx->last_submit_seq);
+
+	/* Cleanup resources */
+	amdgpu_bo_list_destroy(bo_list);
+	amdgpu_bo_unmap_and_free(ib_bo, ib_va_handle, ib_mc_address,
+			   ctx->ring_ctx->pm4_dw * sizeof(uint32_t));
+
+	return 0;
+}
+
+int cmd_place_packet(cmd_context_t *ctx, const cmd_packet_params_t *params)
+{
+	int result = -EINVAL;
+
+	if (!ctx || !ctx->initialized || !ctx->ip_block || !params)
+		return -EINVAL;
+
+	if (!ctx->ring_ctx || !ctx->ring_ctx->bo_cpu)
+		return -EINVAL;
+
+	/* Clear the buffer before operation */
+	memset((void *)ctx->ring_ctx->bo_cpu, 0,
+	ctx->ring_ctx->write_length * sizeof(uint32_t));
+
+
+	/* Build the command packet based on type */
+	switch (params->type) {
+	case CMD_PACKET_WRITE_LINEAR:
+		if (!ctx->ip_block->funcs->write_linear)
+			return -ENOTSUP;
+
+		/* TODO: allow user set the dst and data */
+		//ctx->ring_ctx->bo_mc = params->dst_addr;
+		ctx->ring_ctx->write_length = params->size / sizeof(uint32_t);
+
+		/* Build PM4 packet */
+		result = ctx->ip_block->funcs->write_linear(ctx->ip_block->funcs,
+						       ctx->ring_ctx,
+						       &ctx->ring_ctx->pm4_dw);
+
+		/*  Copy PM4 packet to ring buffer */
+		if (result == 0 && ctx->ring_ctx->pm4_dw > 0) {
+			memcpy((void *)ctx->ring_ctx->bo_cpu,
+			       ctx->ring_ctx->pm4,
+			       ctx->ring_ctx->pm4_dw * sizeof(uint32_t));
+		}
+		return result;
+
+	case CMD_PACKET_WRITE_ATOMIC:
+		if (!ctx->ip_block->funcs->write_linear_atomic)
+			return -ENOTSUP;
+
+		/* TODO: allow user set the dst and data */
+		//ctx->ring_ctx->bo_mc = params->dst_addr;
+		ctx->ring_ctx->write_length = 1; /* Atomic operations typically work on single DWORD */
+
+		result = ctx->ip_block->funcs->write_linear_atomic(ctx->ip_block->funcs,
+						      ctx->ring_ctx,
+						      &ctx->ring_ctx->pm4_dw);
+
+		/*  Copy PM4 packet to ring buffer */
+		if (result == 0 && ctx->ring_ctx->pm4_dw > 0) {
+		memcpy((void *)ctx->ring_ctx->bo_cpu,
+		ctx->ring_ctx->pm4,
+		ctx->ring_ctx->pm4_dw * sizeof(uint32_t));
+		}
+		return result;
+
+	case CMD_PACKET_COPY_LINEAR:
+	    if (!ctx->ip_block->funcs->copy_linear)
+		    return -ENOTSUP;
+
+	    /* For copy operations, we need both source and destination addresses */
+	    /* This would require extending the API to pass both addresses */
+	    /* For now, use the internal buffer as source */
+	    ctx->ring_ctx->write_length = params->size / sizeof(uint32_t);
+
+	    result = ctx->ip_block->funcs->copy_linear(ctx->ip_block->funcs,
+						      ctx->ring_ctx,
+						      &ctx->ring_ctx->pm4_dw);
+
+	    /* Copy PM4 packet to ring buffer */
+	    if (result == 0 && ctx->ring_ctx->pm4_dw > 0) {
+	        memcpy((void *)ctx->ring_ctx->bo_cpu,
+	               ctx->ring_ctx->pm4,
+	               ctx->ring_ctx->pm4_dw * sizeof(uint32_t));
+
+	        //igt_info("cmd_place_packet: Copied %u DWORDs to ring buffer (copy)\n",
+	          //       ctx->ring_ctx->pm4_dw);
+	    }
+	    return result;
+
+	case CMD_PACKET_COPY_ATOMIC:
+		/* TODO: Implement atomic copy if supported */
+		igt_info("cmd_place_packet: ATOMIC_COPY not implemented\n");
+		return -ENOTSUP;
+
+	case CMD_PACKET_FENCE:
+		/* TODO: Implement fence operation */
+		igt_info("cmd_place_packet: FENCE not implemented\n");
+		return -ENOTSUP;
+
+	case CMD_PACKET_TIMESTAMP:
+		/* TODO: Implement timestamp operation */
+		igt_info("cmd_place_packet: TIMESTAMP not implemented\n");
+		return -ENOTSUP;
+
+	default:
+		igt_info("cmd_place_packet: Unknown packet type: %d\n", params->type);
+		return -EINVAL;
+	}
+}
+
+/**
+ * Build and submit packet in one operation
+ */
+int cmd_place_and_submit_packet(cmd_context_t *ctx, const cmd_packet_params_t *params)
+{
+	int r;
+
+	r = cmd_place_packet(ctx, params);
+	if (r)
+		return r;
+
+	return cmd_submit_packet(ctx);
+}
+
+/**
+ * Convenience function for write linear
+ */
+int cmd_submit_write_linear(cmd_context_t *ctx, uint64_t dst_addr, uint32_t size, uint32_t data)
+{
+	cmd_packet_params_t params = {
+		.type = CMD_PACKET_WRITE_LINEAR,
+		.dst_addr = dst_addr,
+		.size = size,
+		.data = data,
+	};
+
+	return cmd_place_and_submit_packet(ctx, &params);
+}
+
+/**
+ * Convenience function for copy linear
+ */
+int cmd_submit_copy_linear(cmd_context_t *ctx, uint64_t src_addr, uint64_t dst_addr, uint32_t size)
+{
+	cmd_packet_params_t params = {
+		.type = CMD_PACKET_COPY_LINEAR,
+		.src_addr = src_addr,
+		.dst_addr = dst_addr,
+		.size = size,
+	};
+
+	return cmd_place_and_submit_packet(ctx, &params);
+}
+
+/**
+ * Convenience function for atomic operation
+ */
+int cmd_submit_atomic(cmd_context_t *ctx, uint64_t dst_addr, uint32_t data)
+{
+	cmd_packet_params_t params = {
+		.type = CMD_PACKET_WRITE_ATOMIC,
+		.dst_addr = dst_addr,
+		.data = data,
+	};
+
+	return cmd_place_and_submit_packet(ctx, &params);
+}
+
+/**
+ * Wait for all submitted packets to complete (equivalent to Wait4PacketConsumption)
+ */
+int cmd_wait_completion(cmd_context_t *ctx)
+{
+	struct amdgpu_cs_fence fence_status = {0};
+	uint32_t expired;
+
+	if (!ctx || !ctx->initialized)
+		return -EINVAL;
+
+	/* For user queues, wait on timeline syncobj */
+	if (ctx->user_queue) {
+		if (!ctx->ring_ctx->timeline_syncobj_handle)
+			return -EINVAL;
+
+		return amdgpu_timeline_syncobj_wait(ctx->device,
+						   ctx->ring_ctx->timeline_syncobj_handle,
+						   ctx->ring_ctx->point);
+	}
+
+	/* For regular queues, wait on fence */
+	fence_status.ip_type = (unsigned int)ctx->ip_type;
+	fence_status.ip_instance = 0;
+	fence_status.ring = ctx->ring_ctx->ring_id;
+	fence_status.context = ctx->ring_ctx->context_handle;
+	fence_status.fence = ctx->last_submit_seq;
+
+	return amdgpu_cs_query_fence_status(&fence_status,
+				       AMDGPU_TIMEOUT_INFINITE,
+				       0, &expired);
+}
+
+/**
+ * Check if ring is available
+ */
+bool cmd_ring_available(amdgpu_device_handle device,
+			enum amd_ip_block_type ip_type,
+		       uint32_t ring_id,
+		       bool user_queue)
+{
+	struct drm_amdgpu_info_hw_ip hw_ip_info;
+	int r;
+
+	r = amdgpu_query_hw_ip_info(device, (unsigned int)ip_type, 0, &hw_ip_info);
+	if (r)
+		return false;
+
+	if (user_queue) {
+		/* For user queues, check user queue slots */
+		uint32_t userq_slots = hw_ip_info.num_userq_slots;
+
+		return (ring_id < userq_slots);
+	} else {
+		/* For regular queues, check available rings */
+		return !!(hw_ip_info.available_rings & (1ULL << ring_id));
+	}
+}
+
+/**
+ * Get number of available rings
+ */
+uint32_t cmd_get_available_rings(amdgpu_device_handle device,
+				 enum amd_ip_block_type ip_type,
+				bool user_queue)
+{
+	struct drm_amdgpu_info_hw_ip hw_ip_info;
+	int r;
+
+	r = amdgpu_query_hw_ip_info(device, (unsigned int)ip_type, 0, &hw_ip_info);
+	if (r)
+		return 0;
+
+	if (user_queue) {
+		return hw_ip_info.num_userq_slots;
+	} else {
+		return __builtin_popcountll(hw_ip_info.available_rings);
+	}
+}
diff --git a/lib/amdgpu/amd_command_submission.h b/lib/amdgpu/amd_command_submission.h
index 8b090359a..7826c2d0f 100644
--- a/lib/amdgpu/amd_command_submission.h
+++ b/lib/amdgpu/amd_command_submission.h
@@ -28,6 +28,45 @@
 
 #include "amd_ip_blocks.h"
 
+/**
+ * Packet types supported by the command submission library
+ */
+typedef enum {
+    CMD_PACKET_WRITE_LINEAR,
+    CMD_PACKET_WRITE_ATOMIC,
+    CMD_PACKET_COPY_LINEAR,
+    CMD_PACKET_COPY_ATOMIC,
+    CMD_PACKET_FENCE,
+    CMD_PACKET_TIMESTAMP,
+} cmd_packet_type_t;
+
+/**
+ * Command submission context structure
+ */
+typedef struct {
+    amdgpu_device_handle device;
+    struct amdgpu_ring_context *ring_ctx;
+    const struct amdgpu_ip_block_version *ip_block;
+    enum amd_ip_block_type ip_type;
+    bool initialized;
+    bool user_queue;
+    bool uses_external_bo;
+    uint64_t last_submit_seq; /* Last submission sequence number */
+} cmd_context_t;
+
+/**
+ * Packet building parameters
+ */
+typedef struct {
+    cmd_packet_type_t type;
+    uint64_t src_addr;
+    uint64_t dst_addr;
+    uint32_t size;
+    uint32_t data;
+    uint32_t *custom_data;
+    uint32_t custom_data_size;
+} cmd_packet_params_t;
+
 int amdgpu_test_exec_cs_helper(amdgpu_device_handle device,
 				unsigned int ip_type, struct amdgpu_ring_context *ring_context,
 				int expect);
@@ -49,4 +88,37 @@ void amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle device,
 
 void  amdgpu_command_ce_write_fence(amdgpu_device_handle dev,
 					  amdgpu_context_handle ctx);
+
+cmd_context_t* cmd_context_create(amdgpu_device_handle device,
+                                    enum amd_ip_block_type ip_type,
+                                    uint32_t ring_id,
+                                    bool user_queue,
+                                    uint32_t write_length,
+                                    amdgpu_bo_handle external_bo,
+                                    uint64_t external_bo_mc,
+                                    volatile uint32_t *external_bo_cpu);
+void cmd_context_destroy(cmd_context_t *ctx, bool destroy_external_bo);
+
+int cmd_place_packet(cmd_context_t *ctx, const cmd_packet_params_t *params);
+
+int cmd_submit_packet(cmd_context_t *ctx);
+
+int cmd_place_and_submit_packet(cmd_context_t *ctx, const cmd_packet_params_t *params);
+
+int cmd_wait_completion(cmd_context_t *ctx);
+
+int cmd_submit_write_linear(cmd_context_t *ctx, uint64_t dst_addr, uint32_t size, uint32_t data);
+
+int cmd_submit_copy_linear(cmd_context_t *ctx, uint64_t src_addr, uint64_t dst_addr, uint32_t size);
+
+int cmd_submit_atomic(cmd_context_t *ctx, uint64_t dst_addr, uint32_t data);
+
+bool cmd_ring_available(amdgpu_device_handle device,
+                        enum amd_ip_block_type ip_type,
+                       uint32_t ring_id,
+                       bool user_queue);
+
+uint32_t cmd_get_available_rings(amdgpu_device_handle device,
+                                 enum amd_ip_block_type ip_type,
+                                bool user_queue);
 #endif
-- 
2.49.0

