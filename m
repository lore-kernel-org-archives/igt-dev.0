Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D811091936
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 00:10:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 112C410E8EE;
	Fri, 20 Mar 2026 00:10:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wf60wojZ";
	dkim-atps=neutral
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010020.outbound.protection.outlook.com
 [52.101.193.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F3E710E8EE
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 00:10:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U1QwuTFkYrO3c9RRbtV+PwtDXXklqAJIEVDWcoTJ5L5U2aaRHDFz3LS2RSN19EjWYTzxZC8mUNmT0Wl66tZTD6MzZ+UYS36W3/ZBM7zyzqcvml5JYexcbuwRYwgHhzzLppFL/ra8k9JIpyrqd2vKSbJs2NhZMa1X1ETG2FahMRpZLimyS7mEa6KVmLGVriycU4wtxDw4xER7vAdXKFjysx1tMf2fPfCvTCzTTsg4hAvj+/NTbEuxy6Zba8rwAqBXQqdyFYsiup5TDvIYa2OwtZzX0ZPXgKbyDLZt7w4goyOC+aQ+g4INZFX73uPktbBccex/q9CrphcgrUVGoa261g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F2yRGsj8NZnHd0ZPB2QW24cgjseM8BnpIOroaIvcJug=;
 b=Fr/CSGn2l2HhVvaTwaVhkfybapGIHoX98aCIPk52ECY1PzhNlmUmuHcEvoK3GbNbe0FhwM4GcFxbGNV2Xf5kbCgsNMrzpRIBThdn1PZU8mbVj9DJc/OwcJ+AWESjfYJFbWuxRDqMoVBr1PrwhZ+YG2bptbzNAwO2W3t/4+ws6KjMYsSvkjUB1n+s8tzqAE7DChKWIoJKS2c1Vg8kymwvTCjX30QAVcDh67gDOMozfDULCtcQczHzggHGymRzXHywFJ5TQaOXy/XlqSu59HTosBECelUgfhveC5LpWLrHfWl0GiWdUWfJ7AUNgtI0iwPeU6xQLkhkHVDtslZq6yjzmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F2yRGsj8NZnHd0ZPB2QW24cgjseM8BnpIOroaIvcJug=;
 b=wf60wojZHF6SrRmsMmyneKvz2zJ0/rL36Hxa2vaKXMJ6DRGn87N4TPwTRQINbCM6TR+x1K99k2YKcdmjrmyF/4V7K30AfqfTwUIJ0GdmX2xaQ6SZuz8+8Bu3gnJ9vzfvWQaxwvNZzkfTiVMIhaTB9/LaXbldJaSRHJO6byJBXd8=
Received: from BL0PR01CA0004.prod.exchangelabs.com (2603:10b6:208:71::17) by
 DS0PR12MB6463.namprd12.prod.outlook.com (2603:10b6:8:c5::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.9; Fri, 20 Mar 2026 00:10:45 +0000
Received: from MN1PEPF0000ECD7.namprd02.prod.outlook.com
 (2603:10b6:208:71:cafe::7e) by BL0PR01CA0004.outlook.office365.com
 (2603:10b6:208:71::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Fri,
 20 Mar 2026 00:10:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MN1PEPF0000ECD7.mail.protection.outlook.com (10.167.242.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Fri, 20 Mar 2026 00:10:44 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 19 Mar
 2026 19:10:43 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 19 Mar
 2026 17:06:00 -0700
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 19 Mar 2026 19:06:00 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH 1/2] tests/amdgpu: add DMA-BUF fence-outlives-module unload
 test
Date: Thu, 19 Mar 2026 20:05:30 -0400
Message-ID: <20260320000553.91398-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD7:EE_|DS0PR12MB6463:EE_
X-MS-Office365-Filtering-Correlation-Id: e7e9a297-59ef-422a-28d4-08de86152194
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: kYrI6LynT2z/FJAcGLZtMd3Q0Ie6p6sxdOqBc8S385b4q/SuCe3J33S3KpRUG2I/ak5M+29FtpBjSTSJzRLVoHvQ8GlvN30Pq6d9cCj5JgjyYHaTwURn4e22b3WZwpIX5s3cPbAt7cD7nS8uQQ0E+zcLXwc2/9VpIXdQy8wo3AA2qAJbDnN/0rhqga4NFRcsg6bzE8KkkekhDZIt2ZG/LK5rxwXqiHWofoFmHlMIiv/CzQ9nBEI3axaI6/ikJMNyVw6R7YpUq7E3Ev8DnRRBeLY0YfP12ksMbLVtNcaTomsaNfACfe3qHtAqwRMzUxESRP93DB5mE6N9IiR24DzNsLHhZAEmfOj8LIsJPwD/ghJnkv97KyKqqgiACxBN6BdJ4WreP8D/AG6zyXg/EhdhignyzpD5XeMJG318W//Apdqr3rRXqxN0YQJbJsgc7doNWTGsCgGgea6VVUOSlLDvXsLgnp7m5U7I456U/r9QXpH06TELJafuik3mSvMDQWIoMvzQQfZjfiuyegBpWyFDrd6ZmFlhOe2lU8wHGaCXkGsfEoB2ufXl2n7BJNTZQHeJDAQJJTWZBFjIcikMCh3udBv27vCdLVYOjjTAU5mhxdKz74ok9St2NCeYceNygvUng7OGHXrkX/sP1FYghVpikWtQaHjvswlj8rBXyK2jyX9iscS+ISahsAdw5C+yqW+cIYc/LBNEgt32Kni0DNOX1sWUfHm6KHWDDeq5HwHpnsdM8WJW9Tqkroze2ihUr+NB323dc4NRVEunoVffoCoIyA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: z58kSPTB9HdiYibcmRbfPhTl7bCwdHs2TNK5//sBZhOVGGCx8dbKNT+6FtWrOiUvXyWMawHpyYnmHyYbsl/FPgkoWpXL6QOu6aa8L7iWNceyYzO/5YV9huibHDxElBOE/UPWC5nWquVcY8BW4XdlQBhnyzQk0UM6Mf5mkdxz+p4+eNFh7K/u0ughnwY+bHo+pnybwej++hPCX88vTjc//0j+pkPSqY0au8tDg4jSpSLFJ5gNf/I6JQln+gk1YBjv7iYu+CKUgHfiLi118oqgP43ksQoDlNDEDiSNqtDvPBKaK2mU6xAn+y0M/RfZSEdyeQmmodxKmBj+LNo/el7i22JsKc9mKWo+1Sz3SY42hE2KBwwMzMOETIQIWMBSJ5dZWRAohiGRT8mX3a5jXzCk4NkYHqAnKXHysXPo4e+HQ5uxbg/XyqKqy4O3VwiXNxGq
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 00:10:44.8536 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7e9a297-59ef-422a-28d4-08de86152194
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6463
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

Add amd_dmabuf_unload, a test that validates fence independence
during amdgpu module unload with cross-driver (VGEM) DMA-BUF
shared reservations.

The fence-outlives-module subtest:
  1. Creates a VGEM BO and exports it as a DMA-BUF.
  2. Imports the DMA-BUF into amdgpu and maps it into GPU VA space
     so the kernel can validate it during CS submission.
  3. Submits 64 max-size SDMA copy_linear operations with the
     imported BO in the bo_list, attaching SDMA fences to the
     VGEM BO's dma_resv.
  4. Closes all amdgpu fds WITHOUT waiting for completion, then
     rmmods amdgpu.
  5. After unload, poll()s the DMA-BUF fd to exercise dma_resv
     fences whose ops/spinlock/names pointed into the now-unloaded
     module.

Without the fence independence patches this is a use-after-free;
with them the fences are self-contained and safe.  Best run with
KASAN enabled.

v2 : Update header SPDX-License-Identifier: MIT

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_dmabuf_unload.c | 264 +++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build         |   1 +
 2 files changed, 265 insertions(+)
 create mode 100644 tests/amdgpu/amd_dmabuf_unload.c

diff --git a/tests/amdgpu/amd_dmabuf_unload.c b/tests/amdgpu/amd_dmabuf_unload.c
new file mode 100644
index 000000000..05ca3cf2c
--- /dev/null
+++ b/tests/amdgpu/amd_dmabuf_unload.c
@@ -0,0 +1,264 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2026 Advanced Micro Devices, Inc.
+ */
+
+#include <amdgpu.h>
+#include <amdgpu_drm.h>
+#include <poll.h>
+#include <unistd.h>
+
+#include "igt.h"
+#include "igt_kmod.h"
+#include "igt_vgem.h"
+#include "drmtest.h"
+#include "lib/amdgpu/amd_sdma.h"
+#include "lib/amdgpu/amd_ip_blocks.h"
+#include "lib/amdgpu/amd_command_submission.h"
+#include "lib/amdgpu/amd_memory.h"
+
+/**
+ * TEST: amd dmabuf unload
+ * Description: Test fence independence during amdgpu module unload with
+ *              outstanding SDMA fences on cross-driver (VGEM) DMA-BUF
+ *              shared reservations.
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: DRM
+ * Functionality: prime
+ * Test category: GEM_Legacy
+ * Feature: prime, vgem
+ *
+ * SUBTEST: fence-outlives-module
+ * Description: Validates fence independence patches.  Submits 64 max-size
+ *              SDMA copy_linear operations on a bo_list that includes an
+ *              imported VGEM DMA-BUF, attaching SDMA fences to the VGEM
+ *              BO dma_resv.  Closes all amdgpu fds WITHOUT waiting for
+ *              completion, then rmmods amdgpu.  After unload, poll()s the
+ *              DMA-BUF fd to iterate dma_resv fences whose ops/spinlock/
+ *              names pointed into the now-unloaded module.  Without the
+ *              fence independence patches this is a use-after-free; with
+ *              them the fences are self-contained.
+ *              Best run with KASAN enabled to catch the UAF.
+ */
+
+IGT_TEST_DESCRIPTION("Test amdgpu module unload safety with imported DMA-BUF "
+		      "references from VGEM driver.");
+
+/**
+ * dmabuf_busy - check whether a DMA-BUF fd has unsignaled fences
+ * @fd: DMA-BUF file descriptor
+ * @write: true to check for exclusive (write) fences, false for shared (read)
+ *
+ * Returns true if poll() indicates the fd is not yet ready (busy).
+ */
+static bool dmabuf_busy(int fd, bool write)
+{
+	struct pollfd pfd = { .fd = fd, .events = write ? POLLOUT : POLLIN };
+
+	return poll(&pfd, 1, 0) == 0;
+}
+
+/* Number of back-to-back SDMA copies to submit without waiting. */
+#define NUM_SDMA_COPIES 64
+
+/**
+ * test_fence_outlives_module - fence independence validation
+ * @vgem: VGEM device fd
+ * @amd_fd: amdgpu device fd (will be closed inside this function)
+ * @dev: amdgpu device handle
+ *
+ * Create amdgpu SDMA fences on a cross-driver shared buffer, then close
+ * every amdgpu fd so the module can actually be unloaded.  After rmmod,
+ * the fences survive in the VGEM BO dma_resv.  Accessing them (via poll)
+ * exercises fence->ops, fence->lock, and the driver/timeline name strings
+ * -- all of which used to live in the module .text/.data.
+ *
+ * Without the patches: use-after-free (KASAN splat or crash).
+ * With the patches: fences are self-contained and safe.
+ */
+static void test_fence_outlives_module(int vgem, int amd_fd,
+				       amdgpu_device_handle dev)
+{
+	struct amdgpu_bo_import_result import;
+	struct amdgpu_dma_limits limits = {0};
+	amdgpu_bo_handle src_bo, dst_bo;
+	amdgpu_va_handle src_va, dst_va, imp_va;
+	void *src_cpu, *dst_cpu;
+	uint64_t src_mc, dst_mc, imp_mc, copy_size;
+	cmd_context_t *cmd_ctx;
+	struct vgem_bo bo;
+	int dmabuf, r, i;
+
+	/* Create VGEM BO and export as DMA-BUF */
+	bo.width = 1024;
+	bo.height = 1;
+	bo.bpp = 32;
+	vgem_create(vgem, &bo);
+	dmabuf = prime_handle_to_fd(vgem, bo.handle);
+
+	/* Import the VGEM DMA-BUF into amdgpu */
+	r = amdgpu_bo_import(dev, amdgpu_bo_handle_type_dma_buf_fd,
+			     dmabuf, &import);
+	igt_assert_eq(r, 0);
+
+	/* Query max SDMA copy size from HW limits */
+	amdgpu_dma_limits_query(dev, &limits);
+	copy_size = limits.sdma_max_bytes;
+	igt_assert(copy_size > 0);
+
+	/* Allocate source BO and fill with pattern */
+	r = amdgpu_bo_alloc_and_map(dev, copy_size, 4096,
+				    AMDGPU_GEM_DOMAIN_GTT, 0,
+				    &src_bo, &src_cpu, &src_mc, &src_va);
+	igt_assert_eq(r, 0);
+	memset(src_cpu, 0xDE, copy_size);
+
+	/* Allocate destination BO */
+	r = amdgpu_bo_alloc_and_map(dev, copy_size, 4096,
+				    AMDGPU_GEM_DOMAIN_GTT, 0,
+				    &dst_bo, &dst_cpu, &dst_mc, &dst_va);
+	igt_assert_eq(r, 0);
+
+	/* Create SDMA command context */
+	cmd_ctx = cmd_context_create(dev, AMD_IP_DMA, 0, false,
+				     copy_size, src_bo, src_mc,
+				     (volatile uint32_t *)src_cpu);
+	igt_assert(cmd_ctx != NULL);
+
+	/*
+	 * Map the imported VGEM BO into GPU VA space so the kernel can
+	 * validate it during amdgpu_cs_vm_handling().  Without a VA
+	 * mapping the BO in the bo_list causes a GPU page fault.
+	 */
+	r = amdgpu_va_range_alloc(dev, amdgpu_gpu_va_range_general,
+				  4096, 4096, 0, &imp_mc, &imp_va, 0);
+	igt_assert_eq(r, 0);
+	r = amdgpu_bo_va_op(import.buf_handle, 0, 4096, imp_mc, 0,
+			     AMDGPU_VA_OP_MAP);
+	igt_assert_eq(r, 0);
+
+	/* Set up bo_list: IB (src), dst, imported VGEM BO */
+	cmd_ctx->ring_ctx->bo2 = dst_bo;
+	cmd_ctx->ring_ctx->bo_mc2 = dst_mc;
+	cmd_ctx->ring_ctx->resources[1] = dst_bo;
+	cmd_ctx->ring_ctx->resources[2] = import.buf_handle;
+	cmd_ctx->ring_ctx->res_cnt = 3;
+
+	igt_info("Submitting %d x %llu-byte SDMA copies (no wait)...\n",
+		 NUM_SDMA_COPIES, (unsigned long long)copy_size);
+
+	for (i = 0; i < NUM_SDMA_COPIES; i++) {
+		r = cmd_submit_copy_linear(cmd_ctx,
+					   src_mc, dst_mc,
+					   (uint32_t)copy_size);
+		igt_assert_eq(r, 0);
+	}
+
+	igt_info("All %d copies submitted -- closing immediately "
+		 "(no wait)...\n", NUM_SDMA_COPIES);
+
+	/*
+	 * Do NOT wait -- close everything immediately.
+	 * SDMA fences stay in the VGEM BO dma_resv.
+	 */
+	drm_close_driver(amd_fd);
+
+	/*
+	 * At this point:
+	 *   - Zero open amdgpu file descriptors
+	 *   - The VGEM BO dma_resv still holds references to amdgpu
+	 *     SDMA fences (likely still unsignaled -- 64 x max-SDMA
+	 *     copies take seconds)
+	 *   - We hold the DMA-BUF fd and VGEM BO handle
+	 *
+	 * Unload the module.  With no open amdgpu fds this should
+	 * succeed.
+	 */
+	igt_info("All amdgpu fds closed, attempting module unload...\n");
+	r = igt_kmod_unload("amdgpu");
+	igt_info("igt_kmod_unload returned %d\n", r);
+
+	if (r == 0) {
+		bool busy_r, busy_w;
+
+		/*
+		 * Module unloaded.  amdgpu .text/.data is unmapped.
+		 * Exercise dma_resv fences via poll() -- this calls
+		 * fence->ops->signaled and touches fence->lock, which
+		 * used to point into module memory.
+		 */
+		igt_info("Module unloaded -- exercising fences via "
+			 "poll()...\n");
+
+		busy_r = dmabuf_busy(dmabuf, false);
+		igt_info("DMA-BUF read-busy:  %s\n",
+			 busy_r ? "yes" : "no");
+
+		busy_w = dmabuf_busy(dmabuf, true);
+		igt_info("DMA-BUF write-busy: %s\n",
+			 busy_w ? "yes" : "no");
+
+		igt_info("Fences survived module unload -- reloading...\n");
+		r = igt_kmod_load("amdgpu", NULL);
+		igt_info("Module reload returned %d\n", r);
+	} else {
+		igt_info("Module unload refused (r=%d) -- fences may hold "
+			 "module refs (expected with patches)\n", r);
+	}
+
+	close(dmabuf);
+	gem_close(vgem, bo.handle);
+}
+
+int igt_main()
+{
+	amdgpu_device_handle device;
+	struct amdgpu_gpu_info gpu_info = {0};
+	int vgem = -1, amd = -1;
+	uint32_t major, minor;
+	int err, r;
+
+	igt_fixture() {
+		uint64_t cap;
+
+		vgem = drm_open_driver(DRIVER_VGEM);
+		igt_require(vgem >= 0);
+
+		amd = drm_open_driver(DRIVER_AMDGPU);
+		igt_require(amd >= 0);
+
+		err = amdgpu_device_initialize(amd, &major, &minor, &device);
+		igt_require(err == 0);
+
+		r = amdgpu_query_gpu_info(device, &gpu_info);
+		igt_assert_eq(r, 0);
+		r = setup_amdgpu_ip_blocks(major, minor, &gpu_info, device);
+		igt_assert_eq(r, 0);
+
+		/* Verify PRIME import/export support */
+		igt_require(drmGetCap(vgem, DRM_CAP_PRIME, &cap) == 0 &&
+			    (cap & DRM_PRIME_CAP_EXPORT));
+		igt_require(drmGetCap(amd, DRM_CAP_PRIME, &cap) == 0 &&
+			    (cap & DRM_PRIME_CAP_IMPORT));
+	}
+
+	/*
+	 * This subtest closes the fixture amdgpu fd so that rmmod can
+	 * succeed, then re-opens it for fixture teardown.
+	 */
+	igt_subtest("fence-outlives-module") {
+		test_fence_outlives_module(vgem, amd, device);
+
+		/* Re-open for fixture teardown */
+		amd = drm_open_driver(DRIVER_AMDGPU);
+		err = amdgpu_device_initialize(amd, &major, &minor, &device);
+		igt_assert_eq(err, 0);
+	}
+
+	igt_fixture() {
+		amdgpu_device_deinitialize(device);
+		drm_close_driver(amd);
+		drm_close_driver(vgem);
+	}
+}
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index dcfb7685a..6bbe5009d 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -15,6 +15,7 @@ if libdrm_amdgpu.found()
 			  'amd_cs_nop',
 			  'amd_cursor_overlay',
 			  'amd_deadlock',
+                          'amd_dmabuf_unload',
 			  'amd_dp_dsc',
 			  'amd_freesync_video_mode',
 			  'amd_fuzzing',
-- 
2.52.0

