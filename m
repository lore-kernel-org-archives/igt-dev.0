Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92FE9D1266D
	for <igt-dev@archiver.kernel.org>; Wed,  3 Dec 2025 09:03:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EF6A10E7C8;
	Wed,  3 Dec 2025 09:03:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="V9XYS4K7";
	dkim-atps=neutral
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013059.outbound.protection.outlook.com
 [40.107.201.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA99710E7C8
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Dec 2025 09:03:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wK90LX4aKh/0/4C748pjRTE7Kem3+5HnN1uTYGo6Z1hBrAsf3HjSUhNvWf75FhAFCDfczsA/H1WCOPZVPyfWA9LJjjrAAoqgXi/ErF1eTcfUV0rAw9Rk11R//4VeqfzktQwhgXvx4ohoQdWj10DBI08ApD+1elVBxVR5JQScQo7eKhQW00rX2rgE0ez7JwlL1gqN28keGDk/OR8HLYCmWB7TSqCvKFdT/nac/C944Q6IFfSzJzCorIxecf/540wNU45bH3Qli+rpvGoaTzs0Dhv8G2cefYZTS2Of5bQpUZ6MpQ/PkftQX48+Yvn+q3NAvwreJftaG0fWMLp52IBipA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=votITRdyW/Teuli584izts7K5enJ5NTyqx6eQCh1Z5o=;
 b=pG4RJsl1vLUwCauU8jRzggMqdNkxybNQkxaTO/H5ATjvP0t6+iimacebYpT4ypX5J8YL2skMNrrh5Ld/LNQ5Ewv1hyDAKsr5rVVJoLTR9eEt3qE/nwCQVFl1bClNTnfAIX459gW2AV1qr5OxrlHWmt7N9/xeyMK1XEJOQkezHDhsiTeYYWAIxcXCL8BZD9OGGISgjFcWfYLVcrVrPBcoyzadWyn3bpAtgR0W1pHM0BJbvmrns1b0YC3Ef0agwcEr8vKBZItFZfu/Hk3/V3I06lLg9Cnnc2/dNPrN7S6QkBRLWDPh6AU4rOZDUytl672KEk2PEvDnZPD/1t3vBE83bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=votITRdyW/Teuli584izts7K5enJ5NTyqx6eQCh1Z5o=;
 b=V9XYS4K77DAEBYN5pBxxmPU+tzkYH8hIt7xzYjN/FBetT13pN5Qazr82avw/j9J6jl38qxargT5tnawxEBeEFjDzfc83mDkW7jD2yxIpT5YLXokouilN0PAM5SsnTQqNNoZOppbW1xcEkkEbAGrYEX/nTZTnoO+9GH7sxnZIa+s=
Received: from SJ0PR03CA0346.namprd03.prod.outlook.com (2603:10b6:a03:39c::21)
 by SN7PR12MB7834.namprd12.prod.outlook.com (2603:10b6:806:34d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 09:03:35 +0000
Received: from SJ1PEPF0000231E.namprd03.prod.outlook.com
 (2603:10b6:a03:39c:cafe::bf) by SJ0PR03CA0346.outlook.office365.com
 (2603:10b6:a03:39c::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Wed, 3
 Dec 2025 09:03:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF0000231E.mail.protection.outlook.com (10.167.242.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Wed, 3 Dec 2025 09:03:35 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 3 Dec
 2025 03:03:34 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 3 Dec
 2025 03:03:34 -0600
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Wed, 3 Dec 2025 01:03:27 -0800
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse.Zhang <Jesse.Zhang@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH i-g-t v4 3/6] lib/amdgpu: add GPU memory utilities
Date: Wed, 3 Dec 2025 17:02:06 +0800
Message-ID: <20251203090307.467031-3-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251203090307.467031-1-Jesse.Zhang@amd.com>
References: <20251203090307.467031-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231E:EE_|SN7PR12MB7834:EE_
X-MS-Office365-Filtering-Correlation-Id: 110e3d96-d238-43c0-f206-08de324ad725
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aZ45YpfLVsZGYqeoMq3F1FPq9mYGiMHkDihAoJ5094XYwO1waGarhJ46uJmg?=
 =?us-ascii?Q?tNdnkDPjSvRtf56ZCtQhhtVIBccDJPswjstPa2blRWf+Yqk9RyKWuLYcTgTW?=
 =?us-ascii?Q?DxfopaNg+lPkHTe36xYERBxClQxT+044mpUL0W8FdI72clWDT62HheMdFnRc?=
 =?us-ascii?Q?sAvq9asMw4qVDj5uu6kTo49OCfjAraz/m+nspiSSfUTqLNsSfCcp3PRuMLEX?=
 =?us-ascii?Q?Cc3WqBciKtdEszHCSKWTZKylO8cxTfFsZoygOXrvEDf7N+MdkWF8EKGF88aV?=
 =?us-ascii?Q?WcZVM4u334H8g1ZFYWrfYZIKgmHcnhgv6vzLgY/kFDGZ8uAGe4pVnS1366nS?=
 =?us-ascii?Q?22ISExshsEqd2J16lmsa2v1y8wkpKbYUrbj6ElDJf0zuC5cxhOzV+8eNemID?=
 =?us-ascii?Q?Rr5Khvr3Hq3rBLK+a6vy1IcLg+NFwxVZgh7dfXDH2FBbxyaSQ6Y+xpkeFSGV?=
 =?us-ascii?Q?DAoItWWIRLjlOeS4o0ePd/eDE32ojPReda4entUbo+KJTuVAGe5gVOgXDCfu?=
 =?us-ascii?Q?1UYsMT0urTepguLsfCCGryfkO4jVDsvOE0lfNh+WBs3QJaYDd5r0tQEo0CLt?=
 =?us-ascii?Q?FOXkmdtWJnROaISnIIi8WWp0MCWfzEvLO9MSpz0qryj3IBD5PhUqR0Kw6cxX?=
 =?us-ascii?Q?5ROUeMcKFJZDiGPJVz2ZULouGmqKd/neXg1arE/GoZyDjBbpmdOFEIy712Hi?=
 =?us-ascii?Q?i8Znc7jggW33+ovg3TdUrJBSOqfD8oPKKNIqKxBxv7QlFRZCcQp7M4daJ6rG?=
 =?us-ascii?Q?elAZ3r9uQWz45FokNgx2dvFjnjn65E2Pg3YwUOD1YEPTqG3mgO0e3X92RwOX?=
 =?us-ascii?Q?m3Owrv+bcdQ1n89ijSTtyUhh/4z5KPzuB2oHVp8uKDlJxrAyEqe0zW1Fz/Uv?=
 =?us-ascii?Q?FjVMftJ48tqBEZJAOl/rexekJIQbpVZYGZQOfzmB4dK1NrD0Sw0dgOv9GQGY?=
 =?us-ascii?Q?i9Di7OvX0V7yDEtg5mjfWR4kWpp8xsgG3kc4xgh3NRmCntATYZGFL8+ZmRfl?=
 =?us-ascii?Q?Rh1+UTQ7X4hUHc5I+PxlA3kuMtbyAUK++DCxmn5+D+9mprL72Mp+FoF8xc1Q?=
 =?us-ascii?Q?hS7xRKdEu+CLrgDF2XoIk3sXfdLmdLdZljy74VVuLnph7rJgXgET+JYHjvmV?=
 =?us-ascii?Q?8fDi1ySqN9SUVD3G7SxPWJxy4CmcfehXVpQ6taGYDeJo/+yoHDP3Vv3CbZdG?=
 =?us-ascii?Q?/Q3gHNYYnKb1FXGxYsLyHGdbhdDzH0MPZTscFeXDwu/mp3YAbEWKJ094CD+t?=
 =?us-ascii?Q?JNdCGLQdZYJk2GB/lrYYaesTUowQLFslPSlQ6QtIsjNV2Skf++7Z/Nd/oDnW?=
 =?us-ascii?Q?shYz6hOFpeHqJTY/X5wXQBk8yzNFFlWs2twTV2sxMOsXScejysUGfitsf5p/?=
 =?us-ascii?Q?9itwBzdjynLAtP5T9GladphqflwRrrvMubZL9WFJCEHNCzklm8l8RHAiyCSD?=
 =?us-ascii?Q?Js8lswvm+iS4nlATom/pmu1HCvFiBPer/+cmoTo1RpaVA7iywmocBAeXXSET?=
 =?us-ascii?Q?w4srFUdl/ZctUhbMMTP7OhS+e3v8vxIhKaYOsSoMo56QcffrubFFqWAnHVOE?=
 =?us-ascii?Q?FtT7tM/VmOI0ygXkN4o=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 09:03:35.0667 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 110e3d96-d238-43c0-f206-08de324ad725
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF0000231E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7834
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

Extend amd_memory.c with a suite of reusable memory management utilities.

Key additions:
1. Memory info queries:
   - get_available_system_memory(): Fetch max allocatable GTT size via heap info
   - get_available_vram(): Fetch max allocatable VRAM size via heap info
   - get_gpu_memory_info(): Comprehensive memory info (VRAM/GTT/CPU-accessible VRAM)
     using amdgpu_query_info(AMDGPU_INFO_MEMORY)

2. DMA-BUF and GPU BO utilities:
   - create_dmabuf(): Convert user-space memory to GPU-accessible DMA-BUF via amdgpu_bo
   - virtual_mem_to_gpu_bo(): Map user-space memory to GPU BO (DMA-BUF import + VA mapping)
   - virtual_alloc_memory(): Wrapper for mmap with protection flag mapping
   - virtual_free_memory(): Wrapper for munmap
   - wait_on_value(): Poll memory for expected value with timeout (test utility)

Suggested-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_memory.c | 300 ++++++++++++++++++++++++++++++++++++++++
 lib/amdgpu/amd_memory.h |  29 +++-
 2 files changed, 328 insertions(+), 1 deletion(-)

diff --git a/lib/amdgpu/amd_memory.c b/lib/amdgpu/amd_memory.c
index 72ea3db6c..12fe23c65 100644
--- a/lib/amdgpu/amd_memory.c
+++ b/lib/amdgpu/amd_memory.c
@@ -26,6 +26,14 @@
 #include "amd_memory.h"
 #include "amd_PM4.h"
 #include "amd_ip_blocks.h"
+#include <amdgpu.h>
+#include <amdgpu_drm.h>
+#include <stdio.h>
+#include <string.h>
+#include <unistd.h>
+#include <sys/mman.h>
+#include <inttypes.h>
+
 /**
  *
  * @param device_handle
@@ -398,4 +406,296 @@ void amdgpu_command_submission_multi_fence_wait_all(amdgpu_device_handle device,
 	igt_assert_eq(r, 0);
 }
 
+/*
+ * Get available GTT size of the GPU node
+ * Equivalent to Thunk's hsaKmtAvailableMemory function, using amdgpu_query_heap_info
+ * to fetch max allocatable size from GTT domain heap.
+ */
+uint64_t get_available_system_memory(amdgpu_device_handle dev)
+{
+	struct amdgpu_heap_info gtt_heap;
+	int ret;
+
+	ret = amdgpu_query_heap_info(dev, AMDGPU_GEM_DOMAIN_GTT, 0, &gtt_heap);
+	if (ret != 0) {
+		fprintf(stderr, "Failed to query VRAM heap: %d\n", ret);
+		return 0;
+	}
+
+	return gtt_heap.max_allocation;
+}
+
+/*
+ * Get available VRAM size of the GPU node
+ * Equivalent to Thunk's hsaKmtAvailableMemory function, using amdgpu_query_heap_info
+ * to fetch max allocatable size from VRAM domain heap.
+ */
+uint64_t get_available_vram(amdgpu_device_handle dev)
+{
+	struct amdgpu_heap_info vram_heap;
+	int ret;
+
+	ret = amdgpu_query_heap_info(dev, AMDGPU_GEM_DOMAIN_VRAM, 0, &vram_heap);
+	if (ret != 0) {
+		fprintf(stderr, "Failed to query VRAM heap: %d\n", ret);
+		return 0;
+	}
+
+	return vram_heap.max_allocation;
+}
+
+/**
+ * get_gpu_memory_info - Get GPU memory information
+ * @device: AMDGPU device handle
+ * @vram_size: Output for VRAM usable heap size
+ * @cpu_accessible_vram_size: Output for CPU accessible VRAM usable heap size
+ * @gtt_size: Output for GTT usable heap size
+ *
+ * Returns 0 on success, error code on failure.
+ */
+int get_gpu_memory_info(amdgpu_device_handle device,
+			       uint64_t *vram_size,
+			       uint64_t *cpu_accessible_vram_size,
+			       uint64_t *gtt_size)
+{
+	struct drm_amdgpu_memory_info mem_info;
+	int r;
+
+	r = amdgpu_query_info(device, AMDGPU_INFO_MEMORY, sizeof(mem_info), &mem_info);
+	if (r) {
+		igt_info("Failed to query GPU memory info, error: %d\n", r);
+		return r;
+	}
+
+	if (vram_size)
+		*vram_size = mem_info.vram.usable_heap_size;
+
+	if (cpu_accessible_vram_size)
+		*cpu_accessible_vram_size = mem_info.cpu_accessible_vram.usable_heap_size;
+
+	if (gtt_size)
+		*gtt_size = mem_info.gtt.usable_heap_size;
+
+	igt_debug("GPU Memory Info: VRAM=%" PRIu64 " MB, CPU_ACCESSIBLE_VRAM=%" PRIu64 " MB, GTT=%" PRIu64 " MB\n",
+		(uint64_t)(mem_info.vram.usable_heap_size / (1024 * 1024)),
+		(uint64_t)(mem_info.cpu_accessible_vram.usable_heap_size / (1024 * 1024)),
+		(uint64_t)(mem_info.gtt.usable_heap_size / (1024 * 1024)));
+	return 0;
+}
+
+/**
+ * Create a DMA-BUF to encapsulate system memory (using amdgpu_bo_alloc instead of DRM_IOCTL_GEM_CREATE)
+ * Workflow: Allocate GPU-accessible BO -> Map to user space -> Copy system memory data -> Export as DMA-BUF
+ */
+int create_dmabuf(amdgpu_device_handle dev, void *sys_addr, size_t size)
+{
+	struct amdgpu_bo *bo = NULL;
+	struct amdgpu_bo_alloc_request alloc_req = {0};
+	void *bo_map = NULL;
+	int dmabuf_fd = -1;
+	int ret;
+
+	/* 1. Allocate GPU buffer object (replaces DRM_IOCTL_GEM_CREATE) */
+	alloc_req.alloc_size = size;
+	alloc_req.flags = AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;  // Allow CPU access
+	alloc_req.preferred_heap = AMDGPU_GEM_DOMAIN_GTT;  // Use GTT domain (system memory accessible)
+	ret = amdgpu_bo_alloc(dev, &alloc_req, &bo);
+	if (ret != 0) {
+		igt_warn("amdgpu_bo_alloc failed: %d\n", ret);
+		return -1;
+	}
+
+	/* 2. Map BO to user space (facilitates copying system memory data) */
+	ret = amdgpu_bo_cpu_map(bo, &bo_map);
+	if (ret != 0) {
+		igt_warn("amdgpu_bo_cpu_map failed: %d\n", ret);
+		goto free_bo;
+	}
+
+	/* 3. Copy system memory data to GPU BO */
+	memcpy(bo_map, sys_addr, size);
+
+	/* 4. Unmap from user space (data copy completed) */
+	amdgpu_bo_cpu_unmap(bo);
+	bo_map = NULL;
 
+	/* 5. Export BO as DMA-BUF (replaces DRM_IOCTL_PRIME_HANDLE_TO_FD) */
+	ret = amdgpu_bo_export(bo, amdgpu_bo_handle_type_dma_buf_fd, (uint32_t *)&dmabuf_fd);
+	if (ret != 0) {
+		igt_warn("amdgpu_bo_export failed: %d\n", ret);
+		goto free_bo;
+	}
+
+	/* 6. Free BO handle (DMA-BUF exists independently) */
+	amdgpu_bo_free(bo);
+	return dmabuf_fd;
+
+free_bo:
+	if (bo)
+		amdgpu_bo_free(bo);
+	return -1;
+}
+
+/**
+ * virtual_mem_to_gpu_bo - Map user-space virtual memory to GPU buffer object
+ * @device: AMDGPU device handle
+ * @cpu_ptr: Pointer to user-space memory to map
+ * @size: Size of the memory region to map
+ * @out_bo: Output pointer for the created GPU buffer handle
+ * @out_gpu_va: Output pointer for the GPU virtual address of the mapped buffer
+ * @out_va_handle: Output pointer for the VA range handle
+ *
+ * This function converts a user-space memory region to a DMA-BUF, imports it
+ * as a GPU buffer object (BO), and maps it to the GPU's virtual address space.
+ * Returns 0 on success, negative error code on failure.
+ */
+int virtual_mem_to_gpu_bo(amdgpu_device_handle device,
+			  void *cpu_ptr,
+				 size_t size,
+				 amdgpu_bo_handle *out_bo,
+				 uint64_t *out_gpu_va,
+				 amdgpu_va_handle *out_va_handle)
+{
+	int r;
+	int dmabuf_fd;
+	struct amdgpu_bo_import_result import_result = {0};
+	uint64_t aligned_size = ALIGN(size, getpagesize());
+	uint64_t va_base;
+	amdgpu_va_handle va_handle;
+
+	/* Convert user memory to DMA-BUF */
+	dmabuf_fd = create_dmabuf(device, cpu_ptr, size);
+	if (dmabuf_fd < 0) {
+		igt_warn("Failed to create DMA-BUF fd\n");
+		return -1;
+	}
+
+	/* Import DMA-BUF into AMDGPU as a buffer object */
+	r = amdgpu_bo_import(device,
+			     amdgpu_bo_handle_type_dma_buf_fd,
+			     dmabuf_fd,
+			     &import_result);
+	close(dmabuf_fd); /* FD no longer needed after import */
+	if (r != 0) {
+		igt_warn("amdgpu_bo_import failed: %d\n", r);
+		return r;
+	}
+
+	/* Allocate GPU virtual address range for the buffer */
+	r = amdgpu_va_range_alloc(device,
+				  amdgpu_gpu_va_range_general,
+				 aligned_size,
+				 getpagesize(),
+				 0,
+				 &va_base,
+				 &va_handle,
+				 0);
+	if (r != 0) {
+		igt_warn("amdgpu_va_range_alloc failed: %d\n", r);
+		amdgpu_bo_free(import_result.buf_handle);
+		return r;
+	}
+
+	/* Map buffer object to the allocated GPU virtual address */
+	r = amdgpu_bo_va_op(import_result.buf_handle,
+			    0,
+			   aligned_size,
+			   va_base,
+			   AMDGPU_VM_PAGE_READABLE | AMDGPU_VM_PAGE_WRITEABLE,
+			   AMDGPU_VA_OP_MAP);
+	if (r != 0) {
+		igt_warn("amdgpu_bo_va_op failed: %d\n", r);
+		amdgpu_va_range_free(va_handle);
+		amdgpu_bo_free(import_result.buf_handle);
+		return r;
+	}
+
+	/* Output results */
+	*out_bo = import_result.buf_handle;
+	*out_gpu_va = va_base;
+	*out_va_handle = va_handle;
+
+	return 0;
+}
+
+/**
+ * Virtual memory allocation wrapper
+ */
+void *virtual_alloc_memory(void *address, unsigned int size, int memProtection)
+{
+	void *ptr;
+	/**
+	* Memory protection flags mapping table
+	*
+	* This array maps logical memory protection combinations to the corresponding
+	* POSIX mmap protection flags. The index corresponds to the memory protection
+	* type defined in the test framework.
+	*
+	* Index mapping:
+	* 0: MEM_NONE      - No access permissions
+	* 1: MEM_READ      - Read-only access
+	* 2: MEM_WRITE     - Write-only access
+	* 3: MEM_READ_WRITE - Read and write access
+	* 4: MEM_EXEC      - Execute-only access
+	* 5: MEM_EXEC_READ - Execute and read access
+	* 6: MEM_EXEC_WRITE - Execute and write access
+	* 7: MEM_EXEC_READ_WRITE - Execute, read and write access
+	*
+	* Note: Some combinations like write-only (PROT_WRITE) may not be supported
+	* on all systems and typically require read permission as well.
+	*/
+	static int protection_flags[8] = {
+	PROT_NONE,                           // 0: No access
+	PROT_READ,                           // 1: Read-only
+	PROT_WRITE,                          // 2: Write-only (may not work on some systems)
+	PROT_READ | PROT_WRITE,              // 3: Read and write
+	PROT_EXEC,                           // 4: Execute-only
+	PROT_EXEC | PROT_READ,               // 5: Execute and read
+	PROT_EXEC | PROT_WRITE,              // 6: Execute and write
+	PROT_EXEC | PROT_READ | PROT_WRITE   // 7: Execute, read and write
+	};
+
+	ptr = mmap(address, size, protection_flags[memProtection],
+		   MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+
+	if (ptr == MAP_FAILED) {
+		igt_warn("mmap failed: %s\n", strerror(errno));
+		ptr = NULL;
+	}
+
+	return ptr;
+}
+
+/**
+ * Virtual memory free wrapper
+ */
+bool virtual_free_memory(void *address, unsigned int size)
+{
+	if (munmap(address, size) == 0)
+		return true;
+	else {
+		igt_warn("munmap failed: %s\n", strerror(errno));
+		return false;
+	}
+}
+
+/**
+ * Wait for specific value in memory with timeout
+ */
+bool wait_on_value(unsigned int *ptr, unsigned int expected)
+{
+	const int timeout_ms = 5000; // 5 second timeout
+	int elapsed_ms = 0;
+
+	while (*ptr != expected) {
+		usleep(1000); // 1ms
+		elapsed_ms++;
+
+		if (elapsed_ms > timeout_ms) {
+			igt_info("Timeout waiting for value 0x%08X, got 0x%08X\n",
+				 expected, *ptr);
+			return false;
+		}
+	}
+	return true;
+}
diff --git a/lib/amdgpu/amd_memory.h b/lib/amdgpu/amd_memory.h
index 9b0e3f392..e26c85bc4 100644
--- a/lib/amdgpu/amd_memory.h
+++ b/lib/amdgpu/amd_memory.h
@@ -29,7 +29,6 @@
 #include <amdgpu.h>
 #include <amdgpu_drm.h>
 
-
 amdgpu_bo_handle
 gpu_mem_alloc(amdgpu_device_handle device_handle,
 				      uint64_t size,
@@ -80,4 +79,32 @@ amdgpu_get_bo_list(amdgpu_device_handle dev, amdgpu_bo_handle bo1,
 void amdgpu_command_submission_multi_fence_wait_all(amdgpu_device_handle device,
 						    bool wait_all);
 
+uint64_t
+get_available_system_memory(amdgpu_device_handle dev);
+
+uint64_t
+get_available_vram(amdgpu_device_handle dev);
+
+int
+get_gpu_memory_info(amdgpu_device_handle device,
+                               uint64_t *vram_size,
+                               uint64_t *cpu_accessible_vram_size,
+                               uint64_t *gtt_size);
+int
+create_dmabuf(amdgpu_device_handle dev, void *sys_addr, size_t size);
+
+int virtual_mem_to_gpu_bo(amdgpu_device_handle device,
+                                 void *cpu_ptr,
+                                 size_t size,
+                                 amdgpu_bo_handle *out_bo,
+                                 uint64_t *out_gpu_va,
+                                 amdgpu_va_handle *out_va_handle);
+void
+*virtual_alloc_memory(void *address, unsigned int size, int memProtection);
+
+bool
+virtual_free_memory(void *address, unsigned int size);
+
+bool
+wait_on_value(unsigned int *ptr, unsigned int expected);
 #endif
-- 
2.49.0

