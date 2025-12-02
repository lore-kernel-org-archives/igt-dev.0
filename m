Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6DFD116F3
	for <igt-dev@archiver.kernel.org>; Tue,  2 Dec 2025 02:18:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4357F10E507;
	Tue,  2 Dec 2025 02:18:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EHDp9JIQ";
	dkim-atps=neutral
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011000.outbound.protection.outlook.com [52.101.52.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A77110E03F
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Dec 2025 02:18:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ct+YKYKNeSVvP5vJWfOvdFDNAE/MkIy+B2V+5huJRUmu+ymeJ67tCynlXaK7cai0JJmqxUOPojdzy9h6Aqm+EURdR3o9YWlQAd58SLPVJJRf6+xsMs2txcXya/oGz8uHlNG0Gifgzus3CEdB7qqv3V6IqYTMKFX0Lv8AdBTcKDQWCZgFfrLkwSLkG7oro40NImPyWyVxuylrw9DW68IGwAT7pPS5XY5SIbpdO5P/6x3Hc2QmuB4E4W20czBufL/xJGPx8GfUJKkxYJA8l29nyjSmH5ouXURrN3QIZ95uD25VIZbN5Ufz4MwoztSfENzd0eEBsNbbvEKbcL8W7sN4rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=votITRdyW/Teuli584izts7K5enJ5NTyqx6eQCh1Z5o=;
 b=jrbfNRxXFa9fg80KDzsnBYGOkgmSMR234bWsZ31zNpoiZuYhqD+xZd7CZsvd5Z4xx737cor/L4d8y0Pht2fNJu6bFvZsxo7ceLae+4u++r+TAp2GjyICZJFSg5Asjk1XI1XUha0zOhYrWaoYbRcuH2RwLjM8QGFiSQvn7eATjJWha0sTx9vzYhHKlRqupUic9FgDKEI4Az5R7GALRncGYAYnRIO7z2iJpu1WJpKpBbVNb+b3QrzAx5LixTQicl3Wl4QpolxCs8YnwOGLlzZxVLMtycDzxyjzlwW9o/oGcUoYQZti02gkXd8RSZBvXx60hdQZ2Z86lwRXLU+XuKlyUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=votITRdyW/Teuli584izts7K5enJ5NTyqx6eQCh1Z5o=;
 b=EHDp9JIQ2eL65MAlvHThE5RrK4UGyQqeCFneec2SeX6KvqXJhopKCedGSkrZCZgzX+DjppYzDGVb/H5yqxi6g8TEl3y9yAn6dwV+wtvjimUA0WDg2ppyiPJ4ZDIvWckLTU2msWdgLIua/Q+UDzidDIx6R4IZCn8RS+N61pyW/aE=
Received: from BLAPR03CA0104.namprd03.prod.outlook.com (2603:10b6:208:32a::19)
 by DM6PR12MB4313.namprd12.prod.outlook.com (2603:10b6:5:21e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 02:18:20 +0000
Received: from MN1PEPF0000ECD5.namprd02.prod.outlook.com
 (2603:10b6:208:32a:cafe::7b) by BLAPR03CA0104.outlook.office365.com
 (2603:10b6:208:32a::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Tue,
 2 Dec 2025 02:17:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECD5.mail.protection.outlook.com (10.167.242.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 02:18:19 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 1 Dec
 2025 20:18:18 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 1 Dec
 2025 20:18:18 -0600
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Mon, 1 Dec 2025 18:18:11 -0800
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse.Zhang <Jesse.Zhang@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH i-g-t v3 3/6] lib/amdgpu: add GPU memory utilities
Date: Tue, 2 Dec 2025 10:17:26 +0800
Message-ID: <20251202021751.3824352-3-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251202021751.3824352-1-Jesse.Zhang@amd.com>
References: <20251202021751.3824352-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: Jesse.Zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD5:EE_|DM6PR12MB4313:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c572a73-2250-4809-134b-08de31490fa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hilRTTntxwPUs6OaWFHEvun/sCE1dnYcAkdHdeHYDpGugfYeXyCwrVjIfmSG?=
 =?us-ascii?Q?8+3TyOrMC0xKPxFHdiBz5cDO7pAba2RdstnaRrxMrg7RTjGz34xKhkYkTy1v?=
 =?us-ascii?Q?X9iIXuYI5dlxxUEKe6PJ9Lbq7daKhWgWSG/QMJaU5HnC1vrcLuY54dM4sSJF?=
 =?us-ascii?Q?OcF0fgByA1nSCZvp4cYdxYVKRjzGOKE7aRSX5BQaM2I1+nT1HWh2+NYk93nY?=
 =?us-ascii?Q?Qr2tonA8cB9FZhrYdcoRfNq21EQTWkHlIFCnph6qp/nk8LaK8QvN5+KVcEZB?=
 =?us-ascii?Q?wDoaKr8NFOsl60xOS+YzH3/fG4YDQpoZWbEs30jRPyp2QmQU2hXZ68znhmuO?=
 =?us-ascii?Q?G4S2DTbihkxzCad1NVGw4JzUhs0S9HkMJoZqaY4gWkf4YhNzLTBCiUG/iaky?=
 =?us-ascii?Q?eJVZ4gX9X35mXWj+X+uW+GdeBvIpGj5iCzVUcIVik+dhhXszr9Rz/4QeUiSu?=
 =?us-ascii?Q?i7pw2Na69o9EwaSiS4eCaIeMJnwxL0RdgWZ2VmwwD3rnLdB+O1TdkmINY7ij?=
 =?us-ascii?Q?OwMHeAH2bhuHKz/vRgscL1pH4n3aRa7HWIC8eT50+bUzouo0w72ZLo5V1STQ?=
 =?us-ascii?Q?R16aOVoGf9rRYIUwuS050zWkeyRCcJQnVlr9W4jzfNucRmD6GMTO8+mSmQFB?=
 =?us-ascii?Q?2Vy5f7orGgSm81E3nANo35mLFv0vZThZ5/oyxNboaD11WzVQ9XnjaVGrqGDh?=
 =?us-ascii?Q?VwkmQDiFlOiZo6ut2mYTMfxYYYPU5bQwub15HPdZwKvcenM0lfMpRw6yDAGY?=
 =?us-ascii?Q?FDr9uj9+P4Cd3y/UzuQ3QNwys7GYmg4nPJtR0EmWWKYipTSNrNAIHzzxcWKC?=
 =?us-ascii?Q?6O2HrrDJQ7T1eI8hI3BMiIhBJzMsMdpquSBLmDUNuwxSHXpN3/ZixccSpdfj?=
 =?us-ascii?Q?hPWtVZWCqRinFagXLJvPFQH6br0AjCCsxvrfpgnhinH0d3DfdZccMALgZmEf?=
 =?us-ascii?Q?EoE17jkB873o5BsLftB4KdViZxlcZV5VX/v0VQDMP4OhS2zwB6DZ+NZIqZzj?=
 =?us-ascii?Q?H/OcpExDtCUzT3gfOmsl1Yf2iDDNeGtJ2mrEIRcgkUls64WjvN/U2RBNdWel?=
 =?us-ascii?Q?qJkWpTwFlf/EGv+yxg2i49IZu2TNJI0EQHQSVxprKDiwmBrqH5+zQYbs3sMS?=
 =?us-ascii?Q?EumrhfQJrjjOKDzLhtryMTfeSZCzVv2SMo/lWh9uCuzhTxzZj3PODfLmEg+y?=
 =?us-ascii?Q?zmeK8FsSOGXAh4zlaC3ylaboGMxwzSVHGjXfuIpE4sKmg1GIIiW+GcloODfW?=
 =?us-ascii?Q?pJYrBcahPKAVYn5bEpQgCWlErYlgMCDrpwCmr8oQkyXS6qlDxv+OI6AriDmq?=
 =?us-ascii?Q?JE+BUlbbCI/iFisBf4NcCdt94LU7MVoeNlfujao+R8t5nalV/N9UzT2ZOeDa?=
 =?us-ascii?Q?zRy+KJeS2mlRe0ZLNhBRMJrz8cNUJKmD92xiM+6T2cIYwM4hiOrzLvYYWIdI?=
 =?us-ascii?Q?Sdkbg/sUN9Yr7oHCz9MDjUWjkTVLm9CTyfZxnLUua/ZFCE3w4XH0A8jW7lXb?=
 =?us-ascii?Q?V46RWY0i4Mf/N1gO4HVsF1cYW6sc7odRLr7AJuDR5B9HoNYxTfxMv9Y2O7/H?=
 =?us-ascii?Q?gf+ErjNd51uRPswJlf8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 02:18:19.7809 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c572a73-2250-4809-134b-08de31490fa8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4313
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

