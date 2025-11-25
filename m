Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB466CFD36C
	for <igt-dev@archiver.kernel.org>; Tue, 25 Nov 2025 02:03:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E26510E339;
	Tue, 25 Nov 2025 02:03:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fXUjlM4H";
	dkim-atps=neutral
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012047.outbound.protection.outlook.com [52.101.53.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D85710E339
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Nov 2025 02:03:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X7mAWKYolodiOLMI9JpPbZBQTYHgomS0EHs4XUC+aU600z/oDAaYb+Z/Svr+SMUvKB+ftjHhchcS6lSiGY0f/jcQZBoXOyfMVE1jlmew9+gGJHdYk+4SGvwEtV7fLpOAf6LsQBNpqMb4FYzrLoyNMu7+0f61lTGErgjxMQ03GT8jP10benf8YWBAQU4hs88VhTUMbJeWgZe+eAQIcyB5Wle/rHhB07woovA8m7xfG1bRPTK+BRC/qI0LfskdUdIGK0vqvgQH+G/Grh1K5w/l20L6lyWIHLHejdCQxBUdjOdDjXciMuwgfhjbhFi02gQyDVSR6xXVz1xh5zzUPFZp2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K2YBptPM2wkMfavhl3QIZXHnKL4rd5N6slipVPag5TI=;
 b=o62at5igu2J10LJHUVyjcN0F4vx8J0mhaWBT0UXPMsDtMyas1EviFfGBa1yVIodrNWdQh3Jt7KWuydBurO48WHsOuX6hr5aanOyqHyvUN07jbjX6ZbNRs4kB/b2VKfQMG3tiHh8i0wg2Y74Vr0BPzyv+jLqi2T734bgW7LBC3CvABGhgu6NL5U+qPdNhQLORSPpltEDVjw7GSRuxuLSqLk4L1mqC43RYsYHVWv5bTdqQSlcRvaAqrTUDBBXBUQGQ1zlkLyW1HxaqCuJ1m1G3HlfVkzS7Q11DebwgKXN5KVEFE8hRggiGCKqbC8piliKLtkNjMPDWD5fci0fbiQq7Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2YBptPM2wkMfavhl3QIZXHnKL4rd5N6slipVPag5TI=;
 b=fXUjlM4HJW8Hx11seudCzoFjLSfHMA5TrQCuGzF4zRw/HpBtsC/FkNjYPTJlcF8sSU59s57cnK3UTiHKbkeoSXKbumZNmhhMTTVF2b9G91ym0S2nEDDoLKysFb0dj2E3Uk5WkwTHBtN5Xvi3ApRHgFK1zHDLEJh6w6ho+DcJg7Q=
Received: from CY5PR22CA0049.namprd22.prod.outlook.com (2603:10b6:930:1d::14)
 by DM4PR12MB6181.namprd12.prod.outlook.com (2603:10b6:8:a9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 02:03:21 +0000
Received: from CY4PEPF0000EE34.namprd05.prod.outlook.com
 (2603:10b6:930:1d:cafe::8f) by CY5PR22CA0049.outlook.office365.com
 (2603:10b6:930:1d::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.17 via Frontend Transport; Tue,
 25 Nov 2025 02:03:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000EE34.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Tue, 25 Nov 2025 02:03:21 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 24 Nov
 2025 20:03:21 -0600
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Mon, 24 Nov 2025 18:03:19 -0800
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse.Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t 3/6] lib/amdgpu: add GPU memory utilities and GCA config
 validation
Date: Tue, 25 Nov 2025 09:59:48 +0800
Message-ID: <20251125020304.2898626-3-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251125020304.2898626-1-Jesse.Zhang@amd.com>
References: <20251125020304.2898626-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE34:EE_|DM4PR12MB6181:EE_
X-MS-Office365-Filtering-Correlation-Id: cf844833-b4fb-473f-f971-08de2bc6cf5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yD//0iTXm7c0QYQr3QQincs+rOLUf0XxzcD6x9W9aWjvHDg9i7ARZp3bvBFC?=
 =?us-ascii?Q?rUCL3KENIqgACuxfmJ1U6UUDkknTp4dZr4ToJjYtLl94sqkd9rEwX0QNRcO+?=
 =?us-ascii?Q?NguTo9rJBPOJHJVLwqBqkaH7ikUMz8IWoSElDNrDTGIJH9SY05/ik/HeT56s?=
 =?us-ascii?Q?BrtVsxsqncD9O2xTo650KG1fxfiTYjYZp489PtsXmR8R9xtLTIexyxbPGXTd?=
 =?us-ascii?Q?pjnSIwhuOOMgCOMOWNNlmettRl/STK3bpLaLXXJrPNNhxkKIagMOhzQJbs6O?=
 =?us-ascii?Q?BV3jbdUC6XZ0k4FDw6QR3Y1WGLOAu/AcRmS4b2OAALvL2EArd3CByuOkXfGt?=
 =?us-ascii?Q?teA9pS4LkRsGgWwCLcjc+aUUB8aK3SDdxF6Il7OllmJAlGX7KImryzVD8Nq/?=
 =?us-ascii?Q?Pfyggz5HI3bO1Wnwg9P48430KC4Sy3+Ch4nCH5Zze09HIMH+0sspCD4mnLjC?=
 =?us-ascii?Q?MArUHi8DHWysvx+cqQb/uETVwCcAFshpwBHCJLd3jarWP7kXFqueP+pWWFsM?=
 =?us-ascii?Q?frOAw8B1sf4WtNvVvIs4h9j3uCNBwhp+j07iTgWBA2mNXaP0r4tHW9+CSrpI?=
 =?us-ascii?Q?ohT1RItGUmP4Gm1mmQ5OH+aslDZpBuc71pCRdIZdHcG/QFTp2dDGGq4GazjP?=
 =?us-ascii?Q?l/a17TwAswQtxr7L/Yt71TeOfAw3PUkn9eD1s9sSxSPzAgvPXaFyQoaN/Vz1?=
 =?us-ascii?Q?/feG3uYJt6wA7XFgf4Pd/HGAsSxtGBY/fPrmXkSkG2WlyLqMSwJwQlUog7g5?=
 =?us-ascii?Q?6OpKu70Thr8jNDE+PSj7EgslqehhETy1nUDC7iYssZSKCJtGNSyG5pR04w53?=
 =?us-ascii?Q?y6kCK9TY4yZDyrY8298jlYpQCyQm2hE0Zd8zzmoY2qdg4zllaEbW6aCI5k4w?=
 =?us-ascii?Q?+KzGdri9w+crAFjri+U4PHGhWD731u7IHay9vs0Lm/1qKuAwlH4m3NfMpFpp?=
 =?us-ascii?Q?SOUktjtGXw1bs9Dj8Wsx69QybhePej4WnPooMR0ivsLcaJ2BTFpHqXlezjzb?=
 =?us-ascii?Q?i+5+m6JX76Z6UnKkahCKB6bdNJMu3E6N9hcRN3LVhLFmiPBfa4g53aaq6rW7?=
 =?us-ascii?Q?D55Ip5zZgK3llx1W9Rfx0ZpK3nnk5IYnQOlAjvUrxlBK/dhjwotkIyAdzdIg?=
 =?us-ascii?Q?MOCsu6ABCKheQmNKL0wlW7VE5soqfBGZsOGE5CdA+8X79f/OtKoOmTsDForj?=
 =?us-ascii?Q?kdhdJ/UT6YF1+hpuyvuA2DMqKvAG3/Jdadp09vSpisaLlUtZaaMtTyTG6GXs?=
 =?us-ascii?Q?8Li2ZWOOkdjUlAMQ3CQ3s/TyObjNhJQkwljxZl55jNS+ksQXBuk7wHYHkhsd?=
 =?us-ascii?Q?Bd4rUXkd87Hjx4vbQrAcdHqtJOqQ7fqOJ4BCIxWw6eQgDTGyDMRmYA5cRd0N?=
 =?us-ascii?Q?iSTHaxU3fYtBerpRKJvP2Als9djad8ePUHEWwH0T7WIZr7zTJVK16qb8C/s5?=
 =?us-ascii?Q?b40OpvBloZJ85SNNWsHZY1XGeoB9YIHLldLHZ+hbURWcghT+39kcuij0HxZ6?=
 =?us-ascii?Q?ZllXUH/hn4UgmPrztnYIymmyE3JI7jCe/7ujphgcC5pSVaJoKX3uZzoNeVY2?=
 =?us-ascii?Q?+qonY10jit3DREewwF0=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 02:03:21.4842 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf844833-b4fb-473f-f971-08de2bc6cf5e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE34.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6181
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

Extend amd_memory.c with a suite of reusable memory management utilities
and GCA (GPU Configuration Architecture) config validation, enabling
low-level memory operations and hardware configuration checks for tests.

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

3. GCA config validation:
   - read_gca_config_debugfs(): Read GCA config from debugfs
   - validate_gca_config_basic(): Sanity check GCA config fields (version, architecture,
     shader/memory/tile config) with version-specific validation for v1-v5

 Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 lib/amdgpu/amd_memory.c | 479 ++++++++++++++++++++++++++++++++++++++++
 lib/amdgpu/amd_memory.h |  75 +++++++
 2 files changed, 554 insertions(+)

diff --git a/lib/amdgpu/amd_memory.c b/lib/amdgpu/amd_memory.c
index 72ea3db6c..f040001c4 100644
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
@@ -398,4 +406,475 @@ void amdgpu_command_submission_multi_fence_wait_all(amdgpu_device_handle device,
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
+
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
+
+int read_gca_config_debugfs(int dri_index, uint32_t *config, size_t size)
+{
+	int fd;
+	char path[128];
+	ssize_t bytes_read;
+
+	snprintf(path, sizeof(path), GCA_CONFIG_DEBUGFS_PATH, dri_index);
+
+	fd = open(path, O_RDONLY);
+	if (fd < 0) {
+		igt_info("Failed to open debugfs file: %s\n", path);
+		return -1;
+	}
+
+	bytes_read = read(fd, config, size);
+	close(fd);
+
+	if (bytes_read < 0) {
+		igt_info("Failed to read from debugfs file: %s\n", path);
+		return -1;
+	}
+
+	return bytes_read;
+}
+
+void validate_gca_config_basic(const uint32_t *config, size_t size)
+{
+	struct gca_config *gca = (struct gca_config *)config;
+	uint64_t full_cg_flags;
+
+	igt_assert_f(size >= sizeof(uint32_t), "Config size too small: %zu\n", size);
+	igt_assert_f(size >= sizeof(struct gca_config),
+		     "Config size too small for full structure: %zu, need %zu\n",
+		     size, sizeof(struct gca_config));
+
+	/* Check version field */
+	igt_info("GCA Config version: %u\n", gca->version);
+	igt_assert_f(gca->version >= 1 && gca->version <= 5,
+		     "Invalid GCA config version: %u\n", gca->version);
+
+	/* GPU Architecture Configuration */
+	igt_info("=== GPU Architecture Configuration ===\n");
+	igt_info("Max shader engines: %u\n", gca->max_shader_engines);
+	igt_info("Max tile pipes: %u\n", gca->max_tile_pipes);
+	igt_info("Max CU per SH: %u\n", gca->max_cu_per_sh);
+	igt_info("Max SH per SE: %u\n", gca->max_sh_per_se);
+	igt_info("Max backends per SE: %u\n", gca->max_backends_per_se);
+	igt_info("Max texture channel caches: %u\n", gca->max_texture_channel_caches);
+
+	/* Shader Configuration */
+	igt_info("=== Shader Configuration ===\n");
+	igt_info("Max GPRs: %u\n", gca->max_gprs);
+	igt_info("Max GS threads: %u\n", gca->max_gs_threads);
+	igt_info("Max HW contexts: %u\n", gca->max_hw_contexts);
+
+	/* Shader Controller FIFO Sizes */
+	igt_info("=== Shader Controller FIFO Sizes ===\n");
+	igt_info("SC prim fifo size frontend: %u\n", gca->sc_prim_fifo_size_frontend);
+	igt_info("SC prim fifo size backend: %u\n", gca->sc_prim_fifo_size_backend);
+	igt_info("SC HIZ tile fifo size: %u\n", gca->sc_hiz_tile_fifo_size);
+	igt_info("SC earlyZ tile fifo size: %u\n", gca->sc_earlyz_tile_fifo_size);
+
+	/* Tile Configuration */
+	igt_info("=== Tile Configuration ===\n");
+	igt_info("Number of tile pipes: %u\n", gca->num_tile_pipes);
+	igt_info("Backend enable mask: 0x%x\n", gca->backend_enable_mask);
+	igt_info("Shader engine tile size: %u\n", gca->shader_engine_tile_size);
+
+	/* Memory Configuration */
+	igt_info("=== Memory Configuration ===\n");
+	igt_info("Memory max burst length: %u bytes\n", gca->mem_max_burst_length_bytes);
+	igt_info("Memory row size: %u KB\n", gca->mem_row_size_in_kb);
+	igt_info("GB address config: 0x%x\n", gca->gb_addr_config);
+	igt_info("MC arb ramcfg: 0x%x\n", gca->mc_arb_ramcfg);
+	igt_info("Number of RBs: %u\n", gca->num_rbs);
+
+	/* Multi-GPU Configuration */
+	igt_info("=== Multi-GPU Configuration ===\n");
+	igt_info("Number of GPUs: %u\n", gca->num_gpus);
+	igt_info("Multi-GPU tile size: %u\n", gca->multi_gpu_tile_size);
+
+	/* Version 1 Fields - Basic Device Info */
+	if (gca->version >= 1) {
+		igt_info("=== Version 1 Fields ===\n");
+		igt_info("Revision ID: %u\n", gca->rev_id);
+		igt_info("Power Gating (PG) flags: 0x%x\n", gca->pg_flags);
+		igt_info("Clock Gating (CG) flags lower: 0x%x\n", gca->cg_flags_lower);
+
+		/* Sanity checks for version 1 fields */
+		igt_assert(gca->rev_id != 0xFFFFFFFF); /* Should be valid revision */
+	}
+
+	/* Version 2 Fields - Family Info */
+	if (gca->version >= 2) {
+		igt_info("=== Version 2 Fields ===\n");
+		igt_info("GPU family: %u\n", gca->family);
+		igt_info("External revision ID: %u\n", gca->external_rev_id);
+
+		/* Sanity checks for version 2 fields */
+		igt_assert(gca->family != 0); /* Should be valid family ID */
+		igt_assert(gca->external_rev_id != 0xFFFFFFFF);
+	}
+
+	/* Version 3 Fields - PCI Info */
+	if (gca->version >= 3) {
+		igt_info("=== Version 3 Fields ===\n");
+		igt_info("PCI device: 0x%x\n", gca->pci_device);
+		igt_info("PCI revision: 0x%x\n", gca->pci_revision);
+		igt_info("PCI subsystem device: 0x%x\n", gca->pci_subsystem_device);
+		igt_info("PCI subsystem vendor: 0x%x\n", gca->pci_subsystem_vendor);
+
+		/* Sanity checks for version 3 fields */
+		igt_assert(gca->pci_device != 0); /* Should be valid PCI device ID */
+		igt_assert(gca->pci_revision < 0xFF); /* PCI revision is 8-bit */
+		igt_assert(gca->pci_subsystem_vendor < 0xFFFF); /* Valid vendor ID range */
+	}
+
+	/* Version 4 Fields - APU Flag */
+	if (gca->version >= 4) {
+		igt_info("=== Version 4 Fields ===\n");
+		igt_info("Is APU: %s\n", gca->is_apu ? "yes" : "no");
+
+		/* Sanity check for version 4 field */
+		igt_assert(gca->is_apu == 0 || gca->is_apu == 1); /* Should be boolean */
+	}
+
+	/* Version 5 Fields - Extended CG Flags */
+	if (gca->version >= 5) {
+		igt_info("=== Version 5 Fields ===\n");
+		igt_info("Reserved field: 0x%x\n", gca->reserved);
+		igt_info("Clock Gating (CG) flags upper: 0x%x\n", gca->cg_flags_upper);
+
+		/* Combined CG flags for versions >= 5 */
+		full_cg_flags = ((uint64_t)gca->cg_flags_upper << 32) | gca->cg_flags_lower;
+		igt_info("Full CG flags: 0x%016llx\n", (unsigned long long)full_cg_flags);
+	}
+
+	/* Architecture-specific validation */
+	igt_info("=== Architecture Validation ===\n");
+
+	/* Validate shader engine configuration */
+	if (gca->max_shader_engines > 0) {
+		igt_assert(gca->max_shader_engines <= 8); /* Reasonable maximum */
+		igt_assert(gca->max_sh_per_se <= gca->max_shader_engines);
+	}
+
+	/* Validate CU configuration */
+	if (gca->max_cu_per_sh > 0) {
+		igt_assert(gca->max_cu_per_sh <= 32); /* Reasonable maximum per SH */
+	}
+
+	/* Validate memory configuration */
+	if (gca->mem_row_size_in_kb > 0) {
+		igt_assert(gca->mem_row_size_in_kb <= 32768); /* 32MB maximum row size */
+	}
+
+	/* Validate backend configuration */
+	if (gca->max_backends_per_se > 0) {
+		igt_assert(gca->max_backends_per_se <= 16); /* Reasonable maximum */
+	}
+
+	/* Validate tile pipe configuration */
+	if (gca->num_tile_pipes > 0) {
+		igt_assert(gca->num_tile_pipes <= gca->max_tile_pipes);
+	}
+
+	/* Multi-GPU validation */
+	if (gca->num_gpus > 0) {
+		igt_assert(gca->num_gpus <= 8); /* Reasonable maximum for multi-GPU */
+	}
+
+	/* Print summary */
+	igt_info("=== GCA Config Summary ===\n");
+	igt_info("Total configuration size: %zu bytes\n", size);
+	igt_info("Expected structure size: %zu bytes\n", sizeof(struct gca_config));
+	igt_info("Configuration version: %u\n", gca->version);
+}
 
diff --git a/lib/amdgpu/amd_memory.h b/lib/amdgpu/amd_memory.h
index 9b0e3f392..b1d2b3859 100644
--- a/lib/amdgpu/amd_memory.h
+++ b/lib/amdgpu/amd_memory.h
@@ -29,6 +29,47 @@
 #include <amdgpu.h>
 #include <amdgpu_drm.h>
 
+#define GCA_CONFIG_DEBUGFS_PATH "/sys/kernel/debug/dri/%d/amdgpu_gca_config"
+#define MAX_CONFIG_SIZE 256
+
+struct gca_config {
+    uint32_t version;
+    uint32_t max_shader_engines;
+    uint32_t max_tile_pipes;
+    uint32_t max_cu_per_sh;
+    uint32_t max_sh_per_se;
+    uint32_t max_backends_per_se;
+    uint32_t max_texture_channel_caches;
+    uint32_t max_gprs;
+    uint32_t max_gs_threads;
+    uint32_t max_hw_contexts;
+    uint32_t sc_prim_fifo_size_frontend;
+    uint32_t sc_prim_fifo_size_backend;
+    uint32_t sc_hiz_tile_fifo_size;
+    uint32_t sc_earlyz_tile_fifo_size;
+    uint32_t num_tile_pipes;
+    uint32_t backend_enable_mask;
+    uint32_t mem_max_burst_length_bytes;
+    uint32_t mem_row_size_in_kb;
+    uint32_t shader_engine_tile_size;
+    uint32_t num_gpus;
+    uint32_t multi_gpu_tile_size;
+    uint32_t mc_arb_ramcfg;
+    uint32_t gb_addr_config;
+    uint32_t num_rbs;
+    uint32_t rev_id;
+    uint32_t pg_flags;
+    uint32_t cg_flags_lower;
+    uint32_t family;
+    uint32_t external_rev_id;
+    uint32_t pci_device;
+    uint32_t pci_revision;
+    uint32_t pci_subsystem_device;
+    uint32_t pci_subsystem_vendor;
+    uint32_t is_apu;
+    uint32_t reserved; /* was cg_flags_upper in newer versions */
+    uint32_t cg_flags_upper;
+};
 
 amdgpu_bo_handle
 gpu_mem_alloc(amdgpu_device_handle device_handle,
@@ -80,4 +121,38 @@ amdgpu_get_bo_list(amdgpu_device_handle dev, amdgpu_bo_handle bo1,
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
+
+int
+read_gca_config_debugfs(int dri_index, uint32_t *config, size_t size);
+
+void
+validate_gca_config_basic(const uint32_t *config, size_t size);
 #endif
-- 
2.49.0

