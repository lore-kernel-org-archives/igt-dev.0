Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F37ACFD372
	for <igt-dev@archiver.kernel.org>; Tue, 25 Nov 2025 02:03:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 026CF10E33C;
	Tue, 25 Nov 2025 02:03:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1AbeFkzj";
	dkim-atps=neutral
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011037.outbound.protection.outlook.com
 [40.93.194.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0F9C10E33D
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Nov 2025 02:03:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jbW5KaX/kVaFWJKpahzr+Ce9QCQPbP0AJUrifPO0W4D8yxinhq8WoAzDqc0PLtQmwA+UkEHfmheqFIbITFw9mPjucvYEcwllFdU9RQDk4Yv6VrshyaOSpHWB33uLOWMPrJPDli+LJGuSQTPBV9weco6ei9wqm8t9L3nLaKeGMovI9reRe57MdjLkcGH6CUbu2RZp8GDutjoHcKbLjoMzn5tkPmDcDLC/CVuJyab+GDMv7zn9ua0KBHk/6cdzMU5WeD6QmVkQc9VxYflcnjU0C3BqeK7xnjHfqZc1JPHC/cD8lLCn83v/w3JxJMuwN54XIQm/jSOWNbF+XovPLcoawg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gHRtjgGeAZlSLgRzcA24QBuIjt+Eu6Notx1UfaZ6nag=;
 b=MLBoBs/dAV14y9n19p+a/j5UV1AULN7a14jbDZtSitJWikhO8iMh2VuMKWxTERLjYHU1L7vRvBuOpevLllSYtlwqHMbCOovMNZIv7cl4py0vhtNNIHjHkDNliIl4RTMw+zes0MlJuLieayMeGix3JA49fvMO6EXcX4KnjLlrS3JemoInw6a5AzJ6Zl4HpYUbr+ytYdy1cNPdEqt/1K0mgrg/W5lDwgYiS98jYUC3l0GXtEIIixpdK70evaCZjP2x5PdCZAw9xcagOVYKdLXG0UmZhfogRq9vEpOJGpYhVnQHXBGw3kLTBrqwP4pRsyN79n4lv7OVw+tDucHVVehJ9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gHRtjgGeAZlSLgRzcA24QBuIjt+Eu6Notx1UfaZ6nag=;
 b=1AbeFkzjK8Frx6r57C4F6ed+SQSjoH8XbGZoiWzehznA4R6lJNe+lX496DMRtBKdyJyj+N3IWH2jabFExX3cZ7AA1J3LbgMZV6xmdCfWpBUFfIdKfluwK6EVzFhEwZykKKNjar2IT/EfiMu00WkuNiuql/fMmwAmVZHMDCttrq0=
Received: from CY5PR22CA0058.namprd22.prod.outlook.com (2603:10b6:930:1d::9)
 by MN0PR12MB5978.namprd12.prod.outlook.com (2603:10b6:208:37d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 02:03:21 +0000
Received: from CY4PEPF0000EE34.namprd05.prod.outlook.com
 (2603:10b6:930:1d:cafe::7e) by CY5PR22CA0058.outlook.office365.com
 (2603:10b6:930:1d::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.17 via Frontend Transport; Tue,
 25 Nov 2025 02:03:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EE34.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Tue, 25 Nov 2025 02:03:20 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 24 Nov
 2025 20:03:19 -0600
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Mon, 24 Nov 2025 18:03:12 -0800
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse.zhang <Jesse.zhang@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH i-g-t 2/6] lib/amdgpu: Add compute dispatch helper for GPU
 memory verification
Date: Tue, 25 Nov 2025 09:59:47 +0800
Message-ID: <20251125020304.2898626-2-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251125020304.2898626-1-Jesse.Zhang@amd.com>
References: <20251125020304.2898626-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE34:EE_|MN0PR12MB5978:EE_
X-MS-Office365-Filtering-Correlation-Id: 08f084bd-e662-47c2-8695-08de2bc6ce87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LJqQJAYR7NS+UQ2Hple6AXCFfuFoLA/7VcHSYFZOg1vgTjdM/SEMMqET/nJa?=
 =?us-ascii?Q?udvhqr5LnS6aR8JdrlF8nxG94cSAKR7iArP5hzRN3ffEFW/olWcrFFXGsYNh?=
 =?us-ascii?Q?re7vyXqLnUb12rspGI2Wu3fsxiO3WUQJ/XNhzetm2fn+C0HXUFXs57fpAVoc?=
 =?us-ascii?Q?/pJ2YB+mwUN1xfQnrliOddNr/Qgczcn9HVZc3OdkfUItTGxjxoOisuHBRl1W?=
 =?us-ascii?Q?NYryWHU6VGf2DrjpStH3g9FZSd4aQM7iuACTqXB4PowC5Biy1srdwyqfVNkL?=
 =?us-ascii?Q?zeF5WCFUqll2ZjM78qihmlVKUXISn6ZCmwOlTjhMlnAckhEW8CQLd5DnTwA4?=
 =?us-ascii?Q?gayiGYKCYYrJklJUKHi1wO1wDgcLQQTKT/wUna8ISG94bFFtp7lu5g0Td8Kk?=
 =?us-ascii?Q?m9uF11R/ORfIXbCSz23CkkPH0WXFvgJz4Ng7fZaNdpRqSbVvZoexr8/Lj8hl?=
 =?us-ascii?Q?MKl/NgwHatPh8OC9gWVDQ9p21fb0r5rx9WwX8wdgddJV94kik59emaKBsroI?=
 =?us-ascii?Q?yELrv01DYsGut61A6OP4rDbup+V471de2qPtLKhZGDgdHVUOq1RmU+1bVTdS?=
 =?us-ascii?Q?2AcA8+vLMwnxyvKea+3GMlC8LjroIFsMt853+Wlp9Cbzvo8vA5dU+FjNwn0a?=
 =?us-ascii?Q?vYMnRFKP0AMen6YKnsYZUbdy/EoMp5dfxhxqiUjuv9gw+8IyvhUWesDuAQZl?=
 =?us-ascii?Q?RpiJowj301neGvGYiQdQAeWnIdVJg0C9J2x3Zjbd8dEKfyP0X5fFuKvgJklA?=
 =?us-ascii?Q?DjHnPlhh3OSbch1jCor7s2+X1I/uGKbH5mZtAfBvRJ3fccKA6jbOTgZ12dxK?=
 =?us-ascii?Q?1YXgGJ0aFePJ4xO5d/kiny/b/kTh33FUld5bUtnzfqZMsr+gUnGSw4wNd/fG?=
 =?us-ascii?Q?tIZl1fYFDrSILC1u7sLn3S86uJg9u6/WU+465eB0k6REdX8V/kxY0P32JBVq?=
 =?us-ascii?Q?XIJkfi1oBfNw9T8EwX0mxkCIiiSIVSFCVHFTuz0ASldNEVQVnm/EZ9rXUFbM?=
 =?us-ascii?Q?1oX32uNSluPi8IzRMPeUX3n9T6CUsZtQRITe7RN0K237ASc53IAMd+RFUDWi?=
 =?us-ascii?Q?2fFPRYB72AwYiAyBc2FGfDURUnDMqp2tyoQA6IUmvlej6kUjQ/6nTp7AzJZc?=
 =?us-ascii?Q?STWhV7pzApw1gxL8TLDW7Oqvd5m1Y4hjF//POstITCd9FNiIILOI0jOXRIWA?=
 =?us-ascii?Q?z4C+w9vA7MLSNHXDfx4nO8ww4LnhUPBtJ2479Vqs460vclWPI/HNI0QcR0cJ?=
 =?us-ascii?Q?5PNIEq0ycyVgm+X2zsRrLAn8qVAhA5uu49l0sWNfn9eYoFA3qEvLKVP0AnnL?=
 =?us-ascii?Q?6NaCqLxd0tWkNfoE0cDuw2164mugBHNHoC0zwGTMTCyqTsOLh/M/4lgKlYbP?=
 =?us-ascii?Q?iL86jp+n/994O1HLk9JHWn/SVAblrfPRmDfheaPKDmIslaPR+UxOH2eYXWPz?=
 =?us-ascii?Q?/pywcXWpVutrRj2Ai4DeCSe8SKPLFWF5YL2AAelDa8m3YCavhdi8Q9o2Uukb?=
 =?us-ascii?Q?38Tbd4msn0UdUz0kvDZct592KxzhvuBIMChun3UA/wBjCMAx2l4cHaj7yLSi?=
 =?us-ascii?Q?MMYVCoP3oiVMVvXSlUY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 02:03:20.0689 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08f084bd-e662-47c2-8695-08de2bc6ce87
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE34.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5978
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

From: "Jesse.zhang" <Jesse.zhang@amd.com>

Implement a reusable compute dispatch helper function that executes a pre-compiled
shader to copy a DWORD from a source to destination address and verifies the result.
This function is designed for GPU-side validation of memory operations (e.g., ptrace
modifications to VRAM) by ensuring the GPU can read/write the modified memory.

Key features:
1. Uses independent resources (context, command buffer, shader BO, destination BO)
   for each dispatch to avoid state pollution between tests.
2. Programs user data registers to pass source/destination addresses to the shader.
3. Dispatches a 1x1x1 workgroup to execute the shader once.
4. Waits for fence completion and verifies the destination buffer contains the
   expected value.
5. Cleans up all allocated resources even if an error occurs.

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 lib/amdgpu/amd_dispatch_helpers.c | 167 ++++++++++++++++++++++++++++++
 lib/amdgpu/amd_dispatch_helpers.h |   6 ++
 2 files changed, 173 insertions(+)

diff --git a/lib/amdgpu/amd_dispatch_helpers.c b/lib/amdgpu/amd_dispatch_helpers.c
index 9c9d04e30..b3850b0cf 100644
--- a/lib/amdgpu/amd_dispatch_helpers.c
+++ b/lib/amdgpu/amd_dispatch_helpers.c
@@ -6,6 +6,7 @@
  */
 
 #include "amd_dispatch_helpers.h"
+#include "amd_memory.h"
 #include <amdgpu_drm.h>
 #include "amd_PM4.h"
 #include "amd_ip_blocks.h"
@@ -182,3 +183,169 @@ int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base *base, uint64_t shader_addr,
 	}
 	return base->cdw - offset_prev;
 }
+
+/**
+ * execute_compute_dispatch - Execute a single compute dispatch for memory copy
+ * @device: AMDGPU device handle
+ * @version: GPU version for register programming
+ * @shader_mc_addr: Shader buffer GPU address
+ * @src_mc_addr: Source memory GPU address to read from
+ * @dst_mc_addr: Destination buffer GPU address to write to
+ * @expected_value: Expected 32-bit value for verification
+ *
+ * This function sets up and executes a compute dispatch that copies a single DWORD
+ * from source to destination using a pre-compiled shader. Each dispatch uses
+ * completely independent resources to avoid state pollution.
+ *
+ * Returns: 0 on success, -1 on failure
+ */
+int execute_compute_dispatch(amdgpu_device_handle device,
+				   uint32_t version,
+				   uint64_t shader_mc_addr,
+				   uint64_t src_mc_addr,
+				   uint64_t dst_mc_addr,
+				   uint32_t expected_value)
+{
+    amdgpu_context_handle context_handle;
+    amdgpu_bo_handle bo_cmd = NULL, bo_shader = NULL, bo_dst = NULL;
+    uint32_t *ptr_cmd = NULL;
+    void *ptr_shader = NULL;
+    volatile uint32_t *ptr_dst = NULL;
+    uint64_t mc_cmd = 0, mc_shader = 0, mc_dst = 0;
+    amdgpu_va_handle va_cmd = 0, va_shader = 0, va_dst = 0;
+    struct amdgpu_cs_request ib_req = {0};
+    struct amdgpu_cs_ib_info ib_info = {0};
+    amdgpu_bo_list_handle bo_list = NULL;
+    struct amdgpu_cs_fence fence = {0};
+    uint32_t expired = 0;
+    struct amdgpu_cmd_base *base_cmd = get_cmd_base();
+    amdgpu_bo_handle bos[3];
+    int ret = 0;
+
+    /* Create fresh context for each dispatch to avoid state pollution */
+    if (amdgpu_cs_ctx_create(device, &context_handle) != 0) {
+	igt_info("Failed to create context\n");
+	return -1;
+    }
+
+    /* Command buffer for PM4 packets */
+    if (amdgpu_bo_alloc_and_map(device, 4096, 4096,
+		AMDGPU_GEM_DOMAIN_GTT, 0,
+		&bo_cmd, (void **)&ptr_cmd, &mc_cmd, &va_cmd) != 0) {
+	igt_info("Failed to allocate command buffer\n");
+	ret = -1;
+	goto cleanup_context;
+    }
+    memset(ptr_cmd, 0, 4096);
+    base_cmd->attach_buf(base_cmd, ptr_cmd, 4096);
+
+    /* Shader buffer containing compiled ISA */
+    if (amdgpu_bo_alloc_and_map(device, 4096, 4096,
+		AMDGPU_GEM_DOMAIN_VRAM, 0,
+		&bo_shader, &ptr_shader, &mc_shader, &va_shader) != 0) {
+	igt_info("Failed to allocate shader buffer\n");
+	ret = -1;
+	goto cleanup_cmd;
+    }
+    memset(ptr_shader, 0, 4096);
+    /* Note: shader content should be copied by caller */
+
+    /* Destination buffer for shader output (CPU-visible) */
+    if (amdgpu_bo_alloc_and_map(device, 4096, 4096,
+		AMDGPU_GEM_DOMAIN_GTT, 0,
+		&bo_dst, (void **)&ptr_dst, &mc_dst, &va_dst) != 0) {
+	igt_info("Failed to allocate destination buffer\n");
+	ret = -1;
+	goto cleanup_shader;
+    }
+    *ptr_dst = 0; /* Initialize for verification */
+
+    /* Initialize compute dispatch state */
+    amdgpu_dispatch_init(AMDGPU_HW_IP_COMPUTE, base_cmd, version);
+    amdgpu_dispatch_write_cumask(base_cmd, version);
+    amdgpu_dispatch_write2hw(base_cmd, shader_mc_addr, version, 0);
+
+    /* Program user data registers:
+     * s[0:1] = source address (64-bit)
+     * s[2:3] = destination address (64-bit)
+     */
+    base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 4));
+    base_cmd->emit(base_cmd, 0x240); /* SH0 register offset */
+    base_cmd->emit(base_cmd, src_mc_addr & 0xFFFFFFFF);
+    base_cmd->emit(base_cmd, src_mc_addr >> 32);
+    base_cmd->emit(base_cmd, mc_dst & 0xFFFFFFFF);
+    base_cmd->emit(base_cmd, mc_dst >> 32);
+
+    /* Dispatch compute shader with 1x1x1 workgroup */
+    base_cmd->emit(base_cmd, PACKET3_COMPUTE(PACKET3_DISPATCH_DIRECT, 3));
+    base_cmd->emit(base_cmd, 0x10); /* Dispatch initiator */
+    base_cmd->emit(base_cmd, 1);    /* dim_x */
+    base_cmd->emit(base_cmd, 1);    /* dim_y */
+    base_cmd->emit(base_cmd, 1);    /* dim_z */
+    base_cmd->emit_aligned(base_cmd, 7, GFX_COMPUTE_NOP);
+
+    /* Submit command buffer */
+    bos[0] = bo_cmd;
+    bos[1] = bo_shader;
+    bos[2] = bo_dst;
+    if (amdgpu_bo_list_create(device, 3, bos, NULL, &bo_list) != 0) {
+	igt_info("Failed to create BO list\n");
+	ret = -1;
+	goto cleanup_dst;
+    }
+
+    ib_info.ib_mc_address = mc_cmd;
+    ib_info.size = base_cmd->cdw;
+    ib_req.ip_type = AMDGPU_HW_IP_COMPUTE;
+    ib_req.ring = 0;
+    ib_req.resources = bo_list;
+    ib_req.number_of_ibs = 1;
+    ib_req.ibs = &ib_info;
+    ib_req.fence_info.handle = NULL;
+
+    if (amdgpu_cs_submit(context_handle, 0, &ib_req, 1) != 0) {
+	igt_info("Failed to submit CS\n");
+	ret = -1;
+	goto cleanup_bo_list;
+    }
+
+    /* Wait for completion */
+    fence.context = context_handle;
+    fence.ip_type = AMDGPU_HW_IP_COMPUTE;
+    fence.ip_instance = 0;
+    fence.ring = 0;
+    fence.fence = ib_req.seq_no;
+
+    if (amdgpu_cs_query_fence_status(&fence, AMDGPU_TIMEOUT_INFINITE, 0, &expired) != 0) {
+	igt_info("Fence wait failed\n");
+	ret = -1;
+	goto cleanup_bo_list;
+    }
+
+    if (!expired) {
+	igt_info("Fence not expired\n");
+	ret = -1;
+	goto cleanup_bo_list;
+    }
+
+    /* Verify result */
+    if (*ptr_dst != expected_value) {
+	igt_info("Result mismatch: got 0x%x, expected 0x%x\n", *ptr_dst, expected_value);
+	ret = -1;
+    } else {
+	igt_info("Dispatch successful: got expected value 0x%x\n", *ptr_dst);
+    }
+
+cleanup_bo_list:
+    amdgpu_bo_list_destroy(bo_list);
+cleanup_dst:
+    amdgpu_bo_unmap_and_free(bo_dst, va_dst, mc_dst, 4096);
+cleanup_shader:
+    amdgpu_bo_unmap_and_free(bo_shader, va_shader, mc_shader, 4096);
+cleanup_cmd:
+    amdgpu_bo_unmap_and_free(bo_cmd, va_cmd, mc_cmd, 4096);
+cleanup_context:
+    amdgpu_cs_ctx_free(context_handle);
+
+    return ret;
+}
diff --git a/lib/amdgpu/amd_dispatch_helpers.h b/lib/amdgpu/amd_dispatch_helpers.h
index 55398377e..0a7ee7e63 100644
--- a/lib/amdgpu/amd_dispatch_helpers.h
+++ b/lib/amdgpu/amd_dispatch_helpers.h
@@ -35,4 +35,10 @@ int amdgpu_dispatch_write_cumask(struct amdgpu_cmd_base *base_cmd, uint32_t vers
 
 int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base *base_cmd, uint64_t shader_addr, uint32_t version, enum cmd_error_type err);
 
+int execute_compute_dispatch(amdgpu_device_handle device,
+				   uint32_t version,
+				   uint64_t shader_mc_addr,
+				   uint64_t src_mc_addr,
+				   uint64_t dst_mc_addr,
+				   uint32_t expected_value);
 #endif
-- 
2.49.0

