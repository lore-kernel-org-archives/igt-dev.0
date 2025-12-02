Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A68D116F1
	for <igt-dev@archiver.kernel.org>; Tue,  2 Dec 2025 02:06:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B221910E09C;
	Tue,  2 Dec 2025 02:06:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="X2WyRqkC";
	dkim-atps=neutral
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012036.outbound.protection.outlook.com [52.101.53.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994C110E09C
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Dec 2025 02:06:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oqToi5vDYLAklZzU3Yt+BGe8y/K7A02jbFiTN1/nRcufah6xambXRBszcoqX9XPY5QAoEmbk0d6EhwQFM8mXwpr5E1hkePmWPrcgdjVYjfqAFzNuEzzQiuLuP7HaDIFbFVMbtvZoDmxx55U+0BVfANTLT69+2kqOx1MlzhITINeuvEr5BwLhhWOyBtvduo3QH3K7/UptJWZZ4Rdo2+sAThcGDJkY3n+A4cViF9IJyI6pql6EgovsvFCviMTt5eujN+muT/mwLr2e5vw/H+vdgVKBpxHVpJuZIem1XWUzZvrg/CfKmgm8E+WvilTTVe5PPkAnH1WsfvGNTO+2ACTqxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wn9OEUzuScUN4eUieMW08ppwP0CrftVdcW/CGkz9bCk=;
 b=PK386jMWCx9yiX854yNKks3p5JH/FqGtHEHijTq7Nto6XK/pwzoeVC5X1UEwswUoDbvZ51k0ZSfwmxqkWjgP4u+p3d6dWyP8CNIYw2wQ3v8ruEQxrn6mzBpZdOujvlSf/CYApaHsNY7TVaogOHVhT0t5usXpE6o1ymftcdJqd02w5SyZ7LocFvqTu8BppMrCzJNiuDQCP3T6ZJTh3ucacCFG5dfFQs8FDujjh3DvVfV6qtgpch04Pf366LvFl8GiaJAvuHBqAhZ3nbx3HcLLFwhUUHUkNwLkdZfFXPZ4hHA0XgxGD/NNoZcPV5RV8szOURyE8Eyz9diYHOth3P3EXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wn9OEUzuScUN4eUieMW08ppwP0CrftVdcW/CGkz9bCk=;
 b=X2WyRqkCM3mo8sOElJo+i8Sw4yNAIxsBrIZvwTiRLXXrwQ0VPFaKt9dG4Io9scJbhOilvU8b5AQI2di1zi9w/iSEeiZc6okDKBia6cybQ6XIRAVhcvsgf+mYkAm0xMxLutmNkHxaVDzlZKs7agruh7rg9WF3AsHKcjafHNO1mSc=
Received: from PH7P221CA0031.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:33c::26)
 by LV2PR12MB5847.namprd12.prod.outlook.com (2603:10b6:408:174::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 02:06:12 +0000
Received: from CY4PEPF0000E9D6.namprd05.prod.outlook.com
 (2603:10b6:510:33c:cafe::a8) by PH7P221CA0031.outlook.office365.com
 (2603:10b6:510:33c::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Tue,
 2 Dec 2025 02:06:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9D6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 02:06:11 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 1 Dec
 2025 20:06:09 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 1 Dec
 2025 18:06:09 -0800
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Mon, 1 Dec 2025 18:06:02 -0800
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse.Zhang <Jesse.Zhang@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH i-g-t v3 1/6] lib/amdgpu: Add flexible command context API
 with external BO support
Date: Tue, 2 Dec 2025 10:05:34 +0800
Message-ID: <20251202020602.3823838-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D6:EE_|LV2PR12MB5847:EE_
X-MS-Office365-Filtering-Correlation-Id: 13e0d69e-aa4a-4728-d3c5-08de31475d8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FrJ2pGPv2dTV3RVRBw0IrtRk7K7R080K49g6Zxew6a97H98tW6ugZXoLaYCx?=
 =?us-ascii?Q?95WPYEKhpd9gQShdboVrkxYm8OjQLPq0V9+vxPHze2UuwLskBN4dI2G8aQKu?=
 =?us-ascii?Q?NzyoNOhYASW7tScjXOH8iEVE3m1ivaihg30B5PkCnDz8Sh6yUOIXwaW1KqOX?=
 =?us-ascii?Q?2LJy4ChERTXyZQS+DKRmUYEgVJNibLaKCj46kuJbqVejulXG0dJ2c3n5IDJx?=
 =?us-ascii?Q?hjh3SK+EdHhuG5JilYovynRbqdTvFUwKdknKoOsiF0pyFhkpXldPkCfEUEo8?=
 =?us-ascii?Q?uInMG4/TjPGvBn2F1fYWk9nnHZTLK+wLW9bZV7T8MC6q+ewf4oeoAZT62nqT?=
 =?us-ascii?Q?v7pSXhzGhw8LIyH7zPTjr7wW/6ECLCwMy0pIj0olG3ov5hM2OijV7D08hEXV?=
 =?us-ascii?Q?xDTitYV4s/X1B/sMfvhb05ZpFCCZe2bBzzk3lrLzqAC8iMWkfCSpGWPvrQ9k?=
 =?us-ascii?Q?Mf/qPsrrJPe/E6clr+t+JlZQei4YaQ3zifyCG074dvuRzZrwOp/93P8niic5?=
 =?us-ascii?Q?D4qguxgWalpur0oN4lvGUXoVuZYjgcGx2Jnx0OjnEXzfaRAgNcTLVq7y3RMI?=
 =?us-ascii?Q?s5J81ty9EiV0O6kMwDNBKnRcDEvrQs5GnvxdjmR+3Hu1Z2tS5ePW5R10gfHC?=
 =?us-ascii?Q?ER7MgdqOwI4moxFBk+USJf4y5reyk8GufvHRcESGgWufOVN6e+pm3YCeqc9b?=
 =?us-ascii?Q?OjGu1sna2J4gFhDihMR/zQ0Q+gAV34VnwUxfeAfIY0+tfkyICJdsVf07Vbv3?=
 =?us-ascii?Q?Yf3xYvKNgBaN/7AONM28DGDab8LoXZ0xACttNE+7baFwcRtPvcD5XXN5EH0S?=
 =?us-ascii?Q?GZYJ/ldJDENY2n6GXi0FHaRr5S7oq3pZIseB4xQhdimRz07N35pbQeewm3+Y?=
 =?us-ascii?Q?TP6H3NYBZHRuNtBo0SwXaeKdxUjrEliz9w6niLt0r0V/dZjfuejIyBEwfMJz?=
 =?us-ascii?Q?k1lSEPDnGBoWITQntVRAuKEuZDXNrgblaBTLi7dfel1uzkmW2gxOdVVuqYhg?=
 =?us-ascii?Q?L/P5SlMeojsbGnDt/SuPPKOYrN6ILtUDdcURFQqbtIcraXzWm/5rSq4ZWWdV?=
 =?us-ascii?Q?TOt9wHfYOvXYu8tBiSdeln6qUJhfkwn5Na8zc793+YjqCrVZEKMjWn3YCTlX?=
 =?us-ascii?Q?xfAPl7TrfwLhkr4RGJw4D4P1gB2Rjasc3ddfULsrSRmWlH8ORmNRI+2TCsUt?=
 =?us-ascii?Q?OA1/xSnLm2n9z3PrZ2IIgUIjr0+KSrxEi3KqqTUJlS32W5PXeZ56vc8GMmEA?=
 =?us-ascii?Q?Lay01V0ML3htHtxoO9yRoaQqomMFSeheCeK2ViWT/uYyWEcUDxR8nEwWZ8WY?=
 =?us-ascii?Q?A4ZhtLyfaczMJelcpc2Vn5R6Vh4SNQ9kdpKI/Zcjj8egPpEAOZAqOGiKslV2?=
 =?us-ascii?Q?OyQFmnW6rKwLoe9DYni3WFgruojsqJgijQvpIyr9xlKx8BWaiFszZY+VPkFT?=
 =?us-ascii?Q?0urp2iiW4XYBdULcLWFY+D/+MOosL8kDDoAG7ZZlCK0ytCdUvH3cD1g7+g4U?=
 =?us-ascii?Q?t/23VBTLHb5mI/4soXTJUxeGduKNGiV8W6fICtzGd8+MNbFZVjggZ7RCImXO?=
 =?us-ascii?Q?RamQeohA9C8LooPQszk=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 02:06:11.4136 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13e0d69e-aa4a-4728-d3c5-08de31475d8a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5847
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

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 lib/amdgpu/amd_command_submission.c | 592 ++++++++++++++++++++++++++++
 lib/amdgpu/amd_command_submission.h |  72 ++++
 2 files changed, 664 insertions(+)

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index 4b59cdab0..f53f1b070 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -852,3 +852,595 @@ amdgpu_command_ce_write_fence(amdgpu_device_handle dev,
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
+    cmd_context_t *ctx;
+    void *cpu_ptr = NULL;
+    uint64_t bo_mc = 0;
+    amdgpu_va_handle va_handle = NULL;
+    int r;
+
+    if (!device)
+        return NULL;
+
+    /* Check if the requested ring is available */
+    if (!cmd_ring_available(device, ip_type, ring_id, user_queue))
+        return NULL;
+
+    /* Allocate context structure */
+    ctx = calloc(1, sizeof(cmd_context_t));
+    if (!ctx)
+        return NULL;
+
+    ctx->device = device;
+    ctx->ip_type = ip_type;
+    ctx->user_queue = user_queue;
+    ctx->last_submit_seq = 0;
+    ctx->uses_external_bo = (external_bo != NULL);  // Now this member exists
+    ctx->initialized = false;
+
+    /* Get IP block for the specified IP type */
+    ctx->ip_block = get_ip_block(device, (unsigned int)ip_type);
+    if (!ctx->ip_block) {
+        free(ctx);
+        return NULL;
+    }
+
+    /* Allocate ring context structure */
+    ctx->ring_ctx = calloc(1, sizeof(struct amdgpu_ring_context));
+    if (!ctx->ring_ctx) {
+        free(ctx);
+        return NULL;
+    }
+
+    /* Setup ring context parameters */
+    ctx->ring_ctx->write_length = write_length ? write_length : 128;
+    ctx->ring_ctx->pm4_size = 256;
+    ctx->ring_ctx->pm4 = calloc(ctx->ring_ctx->pm4_size, sizeof(uint32_t));
+    if (!ctx->ring_ctx->pm4) {
+        free(ctx->ring_ctx);
+        free(ctx);
+        return NULL;
+    }
+
+    ctx->ring_ctx->res_cnt = 1;
+    ctx->ring_ctx->ring_id = ring_id;
+    ctx->ring_ctx->secure = false;
+    ctx->ring_ctx->user_queue = user_queue;
+    ctx->ring_ctx->time_out = 0;
+
+    if (user_queue) {
+        /* Initialize user queue if requested */
+        if (!ctx->ip_block->funcs->userq_create) {
+            free(ctx->ring_ctx->pm4);
+            free(ctx->ring_ctx);
+            free(ctx);
+            return NULL;
+        }
+        ctx->ip_block->funcs->userq_create(device, ctx->ring_ctx, (unsigned int)ip_type);
+    } else {
+        /* Create regular command submission context */
+        r = amdgpu_cs_ctx_create(device, &ctx->ring_ctx->context_handle);
+        if (r) {
+            free(ctx->ring_ctx->pm4);
+            free(ctx->ring_ctx);
+            free(ctx);
+            return NULL;
+        }
+    }
+
+    /* BO allocation strategy: use external BO if provided, otherwise allocate internally */
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
+    } else {
+        /* Allocate internal BO for command operations */
+        r = amdgpu_bo_alloc_and_map(device,
+                                   ctx->ring_ctx->write_length * sizeof(uint32_t),
+                                   4096,
+                                   AMDGPU_GEM_DOMAIN_GTT,
+                                   0,
+                                   &ctx->ring_ctx->bo,
+                                   &cpu_ptr,
+                                   &bo_mc,
+                                   &va_handle);
+        if (r) {
+            goto cleanup_error;
+        }
+
+        ctx->ring_ctx->bo_mc = bo_mc;
+        ctx->ring_ctx->bo_cpu = (volatile uint32_t *)cpu_ptr;
+        ctx->ring_ctx->va_handle = va_handle;
+
+		igt_info("Allocated internal BO: GPU=0x%llx, CPU=%p\n",
+			 (unsigned long long)bo_mc, cpu_ptr);
+    }
+
+    /* Initialize resources array */
+    ctx->ring_ctx->resources[0] = ctx->ring_ctx->bo;
+    for (int i = 1; i < 4; i++) {
+        ctx->ring_ctx->resources[i] = NULL;
+    }
+
+    ctx->initialized = true;
+    return ctx;
+
+cleanup_error:
+    /* Cleanup resources in case of allocation failure */
+    if (user_queue) {
+        ctx->ip_block->funcs->userq_destroy(device, ctx->ring_ctx, (unsigned int)ip_type);
+    } else {
+        if (ctx->ring_ctx->context_handle)
+            amdgpu_cs_ctx_free(ctx->ring_ctx->context_handle);
+    }
+    free(ctx->ring_ctx->pm4);
+    free(ctx->ring_ctx);
+    free(ctx);
+    return NULL;
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
+    if (!ctx || !ctx->initialized)
+        return;
+
+    if (ctx->ring_ctx) {
+        /* Handle BO cleanup based on allocation type */
+        if (ctx->ring_ctx->bo) {
+            if (!ctx->uses_external_bo || destroy_external_bo) {
+                /* Clean up internal BO or external BO if explicitly requested */
+                if (ctx->ring_ctx->va_handle) {
+                    /* Internal BO with VA handle - full cleanup */
+                    amdgpu_bo_unmap_and_free(ctx->ring_ctx->bo, ctx->ring_ctx->va_handle,
+                                           ctx->ring_ctx->bo_mc,
+                                           ctx->ring_ctx->write_length * sizeof(uint32_t));
+                } else if (destroy_external_bo) {
+                    /* External BO without VA handle - just free the BO */
+                    amdgpu_bo_free(ctx->ring_ctx->bo);
+                }
+            } else {
+				/* External BO, preserve it as requested by caller */
+				igt_info("Preserving external BO (GPU=0x%llx)\n",
+						 (unsigned long long)ctx->ring_ctx->bo_mc);
+            }
+        }
+
+        /* Clean up command submission context */
+        if (ctx->user_queue) {
+            if (ctx->ip_block && ctx->ip_block->funcs->userq_destroy) {
+                ctx->ip_block->funcs->userq_destroy(ctx->device, ctx->ring_ctx,
+                                                  (unsigned int)ctx->ip_type);
+            }
+        } else {
+            if (ctx->ring_ctx->context_handle) {
+                amdgpu_cs_ctx_free(ctx->ring_ctx->context_handle);
+            }
+        }
+
+        /* Free PM4 command buffer */
+        if (ctx->ring_ctx->pm4) {
+            free(ctx->ring_ctx->pm4);
+        }
+
+        free(ctx->ring_ctx);
+    }
+
+    free(ctx);
+}
+
+/**
+ * Submit command packet without waiting - Fixed submission logic
+ */
+int cmd_submit_packet(cmd_context_t *ctx)
+{
+    amdgpu_bo_list_handle bo_list;
+    int r;
+    struct amdgpu_cs_request ibs_request;
+    struct amdgpu_cs_ib_info ib_info;
+    amdgpu_bo_handle ib_bo;
+    void *ib_cpu;
+    uint64_t ib_mc_address;
+    amdgpu_va_handle ib_va_handle;
+    amdgpu_bo_handle all_res[5] = {0};
+    uint32_t res_count = 0;
+    uint32_t i;
+
+    if (!ctx || !ctx->initialized || !ctx->ring_ctx) {
+        igt_debug("Invalid context parameters\n");
+        return -EINVAL;
+    }
+
+    /* Check required parameters */
+    if (ctx->ring_ctx->pm4_dw == 0 || ctx->ring_ctx->pm4_dw > 1024) {
+        igt_debug("Invalid PM4 size: %u (must be 1-1024)\n", ctx->ring_ctx->pm4_dw);
+        return -EINVAL;
+    }
+
+    /* For user queues, use userq_submit */
+    if (ctx->user_queue) {
+        if (!ctx->ip_block || !ctx->ip_block->funcs->userq_submit) {
+            igt_debug("User queue submission not supported\n");
+            return -ENOTSUP;
+        }
+
+        if (!ctx->ring_ctx->bo_mc) {
+            igt_debug("Invalid BO MC address for user queue\n");
+            return -EINVAL;
+        }
+
+        ctx->ip_block->funcs->userq_submit(ctx->device, ctx->ring_ctx,
+                      (unsigned int)ctx->ip_type,
+                      ctx->ring_ctx->bo_mc);
+        ctx->last_submit_seq = ctx->ring_ctx->point;
+        igt_info("User queue submission successful, point=%lu\n", ctx->last_submit_seq);
+        return 0;
+    }
+
+    /* For regular queues, setup and submit CS */
+    memset(&ibs_request, 0, sizeof(ibs_request));
+    memset(&ib_info, 0, sizeof(ib_info));
+
+    /* Allocate separate IB buffer instead of reusing command buffer */
+    r = amdgpu_bo_alloc_and_map(ctx->device,
+                               ctx->ring_ctx->pm4_dw * sizeof(uint32_t),
+                               4096,
+                               AMDGPU_GEM_DOMAIN_GTT,
+                               0,
+                               &ib_bo,
+                               &ib_cpu,
+                               &ib_mc_address,
+                               &ib_va_handle);
+    if (r) {
+        igt_debug("Failed to allocate IB: %d\n", r);
+        return r;
+    }
+
+    /* Copy PM4 commands to IB */
+    memcpy(ib_cpu, ctx->ring_ctx->pm4, ctx->ring_ctx->pm4_dw * sizeof(uint32_t));
+
+    /* Setup IB information */
+    ib_info.ib_mc_address = ib_mc_address;
+    ib_info.size = ctx->ring_ctx->pm4_dw;
+    if (ctx->ring_ctx->secure)
+        ib_info.flags |= AMDGPU_IB_FLAGS_SECURE;
+
+    /* Setup submission request */
+    ibs_request.ip_type = (unsigned int)ctx->ip_type;
+    ibs_request.ring = ctx->ring_ctx->ring_id;
+    ibs_request.number_of_ibs = 1;
+    ibs_request.ibs = &ib_info;
+    ibs_request.fence_info.handle = NULL;
+
+    /* Create resource list containing both original resources and IB */
+    /* Add original resources */
+    for (i = 0; i < ctx->ring_ctx->res_cnt && i < 4; i++) {
+        if (ctx->ring_ctx->resources[i]) {
+            all_res[res_count++] = ctx->ring_ctx->resources[i];
+        }
+    }
+
+    /* Add IB as the last resource */
+    all_res[res_count++] = ib_bo;
+
+    /* Create BO list */
+    r = amdgpu_bo_list_create(ctx->device, res_count, all_res, NULL, &bo_list);
+    if (r) {
+        igt_debug("amdgpu_bo_list_create failed: %d\n", r);
+        amdgpu_bo_unmap_and_free(ib_bo, ib_va_handle, ib_mc_address,
+                               ctx->ring_ctx->pm4_dw * sizeof(uint32_t));
+        return r;
+    }
+
+    ibs_request.resources = bo_list;
+
+    /* Submit command - strict error checking */
+    r = amdgpu_cs_submit(ctx->ring_ctx->context_handle, 0, &ibs_request, 1);
+
+    if (r != 0) {
+        igt_debug("amdgpu_cs_submit failed: %d\n", r);
+        amdgpu_bo_list_destroy(bo_list);
+        amdgpu_bo_unmap_and_free(ib_bo, ib_va_handle, ib_mc_address,
+                               ctx->ring_ctx->pm4_dw * sizeof(uint32_t));
+        return r;
+    }
+
+    /* Record submission sequence number for waiting */
+    ctx->last_submit_seq = ibs_request.seq_no;
+    igt_debug("Command submitted successfully, seq_no=%lu\n", ctx->last_submit_seq);
+
+    /* Cleanup resources */
+    amdgpu_bo_list_destroy(bo_list);
+    amdgpu_bo_unmap_and_free(ib_bo, ib_va_handle, ib_mc_address,
+                           ctx->ring_ctx->pm4_dw * sizeof(uint32_t));
+
+    return 0;
+}
+
+int cmd_place_packet(cmd_context_t *ctx, const cmd_packet_params_t *params)
+{
+    int result = -EINVAL;
+
+    if (!ctx || !ctx->initialized || !ctx->ip_block || !params)
+	return -EINVAL;
+
+    if (!ctx->ring_ctx || !ctx->ring_ctx->bo_cpu)
+	return -EINVAL;
+
+    /* Clear the buffer before operation */
+    memset((void *)ctx->ring_ctx->bo_cpu, 0,
+	   ctx->ring_ctx->write_length * sizeof(uint32_t));
+
+
+    /* Build the command packet based on type */
+    switch (params->type) {
+	case CMD_PACKET_WRITE_LINEAR:
+	    if (!ctx->ip_block->funcs->write_linear)
+		    return -ENOTSUP;
+
+	    /* TODO: allow user set the dst and data */
+	    //ctx->ring_ctx->bo_mc = params->dst_addr;
+	    ctx->ring_ctx->write_length = params->size / sizeof(uint32_t);
+
+	    /* Build PM4 packet */
+	    result = ctx->ip_block->funcs->write_linear(ctx->ip_block->funcs,
+						       ctx->ring_ctx,
+						       &ctx->ring_ctx->pm4_dw);
+
+	    /*  Copy PM4 packet to ring buffer */
+	    if (result == 0 && ctx->ring_ctx->pm4_dw > 0) {
+	        memcpy((void *)ctx->ring_ctx->bo_cpu,
+	               ctx->ring_ctx->pm4,
+	               ctx->ring_ctx->pm4_dw * sizeof(uint32_t));
+
+	        //igt_info("cmd_place_packet: Copied %u DWORDs to ring buffer\n",
+	          //       ctx->ring_ctx->pm4_dw);
+	    }
+	    return result;
+
+	case CMD_PACKET_WRITE_ATOMIC:
+	    if (!ctx->ip_block->funcs->write_linear_atomic)
+		    return -ENOTSUP;
+
+	    /* TODO: allow user set the dst and data */
+	    //ctx->ring_ctx->bo_mc = params->dst_addr;
+	    ctx->ring_ctx->write_length = 1; /* Atomic operations typically work on single DWORD */
+
+	    result = ctx->ip_block->funcs->write_linear_atomic(ctx->ip_block->funcs,
+							      ctx->ring_ctx,
+							      &ctx->ring_ctx->pm4_dw);
+
+	    /*  Copy PM4 packet to ring buffer */
+	    if (result == 0 && ctx->ring_ctx->pm4_dw > 0) {
+	        memcpy((void *)ctx->ring_ctx->bo_cpu,
+	               ctx->ring_ctx->pm4,
+	               ctx->ring_ctx->pm4_dw * sizeof(uint32_t));
+
+	        //igt_info("cmd_place_packet: Copied %u DWORDs to ring buffer (atomic)\n",
+	          //       ctx->ring_ctx->pm4_dw);
+	    }
+	    return result;
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
+	    /* TODO: Implement atomic copy if supported */
+	    igt_info("cmd_place_packet: ATOMIC_COPY not implemented\n");
+	    return -ENOTSUP;
+
+	case CMD_PACKET_FENCE:
+	    /* TODO: Implement fence operation */
+	    igt_info("cmd_place_packet: FENCE not implemented\n");
+	    return -ENOTSUP;
+
+	case CMD_PACKET_TIMESTAMP:
+	    /* TODO: Implement timestamp operation */
+	    igt_info("cmd_place_packet: TIMESTAMP not implemented\n");
+	    return -ENOTSUP;
+
+	default:
+	    igt_info("cmd_place_packet: Unknown packet type: %d\n", params->type);
+	    return -EINVAL;
+    }
+}
+
+/**
+ * Build and submit packet in one operation
+ */
+int cmd_place_and_submit_packet(cmd_context_t *ctx, const cmd_packet_params_t *params)
+{
+    int r;
+
+    r = cmd_place_packet(ctx, params);
+    if (r)
+	return r;
+
+    return cmd_submit_packet(ctx);
+}
+
+/**
+ * Convenience function for write linear
+ */
+int cmd_submit_write_linear(cmd_context_t *ctx, uint64_t dst_addr, uint32_t size, uint32_t data)
+{
+    cmd_packet_params_t params = {
+	.type = CMD_PACKET_WRITE_LINEAR,
+	.dst_addr = dst_addr,
+	.size = size,
+	.data = data,
+    };
+
+    return cmd_place_and_submit_packet(ctx, &params);
+}
+
+/**
+ * Convenience function for copy linear
+ */
+int cmd_submit_copy_linear(cmd_context_t *ctx, uint64_t src_addr, uint64_t dst_addr, uint32_t size)
+{
+    cmd_packet_params_t params = {
+	.type = CMD_PACKET_COPY_LINEAR,
+	.src_addr = src_addr,
+	.dst_addr = dst_addr,
+	.size = size,
+    };
+
+    return cmd_place_and_submit_packet(ctx, &params);
+}
+
+/**
+ * Convenience function for atomic operation
+ */
+int cmd_submit_atomic(cmd_context_t *ctx, uint64_t dst_addr, uint32_t data)
+{
+    cmd_packet_params_t params = {
+	.type = CMD_PACKET_WRITE_ATOMIC,
+	.dst_addr = dst_addr,
+	.data = data,
+    };
+
+    return cmd_place_and_submit_packet(ctx, &params);
+}
+
+/**
+ * Wait for all submitted packets to complete (equivalent to Wait4PacketConsumption)
+ */
+int cmd_wait_completion(cmd_context_t *ctx)
+{
+    struct amdgpu_cs_fence fence_status = {0};
+    uint32_t expired;
+
+    if (!ctx || !ctx->initialized)
+	return -EINVAL;
+
+    /* For user queues, wait on timeline syncobj */
+    if (ctx->user_queue) {
+	if (!ctx->ring_ctx->timeline_syncobj_handle)
+	return -EINVAL;
+
+	return amdgpu_timeline_syncobj_wait(ctx->device,
+					   ctx->ring_ctx->timeline_syncobj_handle,
+					   ctx->ring_ctx->point);
+    }
+
+    /* For regular queues, wait on fence */
+    fence_status.ip_type = (unsigned int)ctx->ip_type;
+    fence_status.ip_instance = 0;
+    fence_status.ring = ctx->ring_ctx->ring_id;
+    fence_status.context = ctx->ring_ctx->context_handle;
+    fence_status.fence = ctx->last_submit_seq;
+
+    return amdgpu_cs_query_fence_status(&fence_status,
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
+    struct drm_amdgpu_info_hw_ip hw_ip_info;
+    int r;
+
+    r = amdgpu_query_hw_ip_info(device, (unsigned int)ip_type, 0, &hw_ip_info);
+    if (r)
+	return false;
+
+    if (user_queue) {
+	/* For user queues, check user queue slots */
+	uint32_t userq_slots = hw_ip_info.num_userq_slots;
+
+	return (ring_id < userq_slots);
+    } else {
+	/* For regular queues, check available rings */
+		return !!(hw_ip_info.available_rings & (1ULL << ring_id));
+    }
+}
+
+/**
+ * Get number of available rings
+ */
+uint32_t cmd_get_available_rings(amdgpu_device_handle device,
+				 enum amd_ip_block_type ip_type,
+				bool user_queue)
+{
+    struct drm_amdgpu_info_hw_ip hw_ip_info;
+    int r;
+
+    r = amdgpu_query_hw_ip_info(device, (unsigned int)ip_type, 0, &hw_ip_info);
+    if (r)
+	return 0;
+
+    if (user_queue) {
+	return hw_ip_info.num_userq_slots;
+    } else {
+		return __builtin_popcountll(hw_ip_info.available_rings);
+    }
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

