Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7ECB1088E66
	for <igt-dev@archiver.kernel.org>; Thu, 19 Mar 2026 02:41:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 376C710E80A;
	Thu, 19 Mar 2026 02:41:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5Y61tgMn";
	dkim-atps=neutral
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011027.outbound.protection.outlook.com [52.101.52.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC28F10E80A
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Mar 2026 02:41:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WVr1RA5ZiQ+ShSN8UatASMdSqyJ9tMM1ropAuGQVFM8lqzVNOTB0GoBSx0C+yLanGUWIw+Wz87LfDOzPczCvMNmzVm7K5oRpbHVZUQ/iYXOR272rku8/SnP9nXrPsmWDn0hQEzwZixTMlmnNn9IAFcKSE7vmyl37XlXunBeqSxnAGENuQk34jv2HvvkqRqBhyy0EAIwQlKRRRdCxNq85zuNVZGAbQihUTZSKm2Rv+NtZLs6m9KO3MEhgdfetWvQc98gwrjtjrW1zrKCYVHhfUY2GsD/EKwEccasyqWM/XnaW8WjSpcyIAr1ferMFNoiwfidWj8Ep2ooEdch0BDd+OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LANLuTRlv6aZrsWa8amFynZMR7v26dObkaiYiVQWPyU=;
 b=heAgiwVdcnuFhUFNw/fiV0NuOhFAK854lrPjz8vb/Jg1KfkNAiiRYkSShVqUqfAy+dvajCpTmE4rU+boao1m+0FuySz18ZrNgBndVhlg16kcK/uvsHielbF8eQ59O3lOvtAzNl21PHmOjDf+/wLdscFHKqc18Cl6cw4IMNNIi0s+uw7Iin1to4DWuLhvjPE2sCnhKCcv/IPiq5aozTyYc2KudGPGmLQt2roYoORQU9CZj9TZHfKYNhq2i/t3tc/zRLOz0pOv1anaAgOw+V52qsiPYlxfkZtKLjD/3gNJBH5VY21z7M3EQlBgVunCiXMtUkPcaLqgn/m6MTqqxWJHMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LANLuTRlv6aZrsWa8amFynZMR7v26dObkaiYiVQWPyU=;
 b=5Y61tgMnretsyY1Y3O8udgmKbAimb7JPV6KSFCx3aqDzJ2gR8PchQzmyorLgUFU10ODc87Z1hN1JMaxQ21rb3mPUSn48ctt+7BV8KuSmSsbplWaPMXaBVFertPctJNfVgWBjpmj4cPh0YGafNVpmsjIornjf44Bc3eCjrgqUBTU=
Received: from BL1P222CA0010.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::15)
 by DS5PPF5FAA0E762.namprd12.prod.outlook.com (2603:10b6:f:fc00::651)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.7; Thu, 19 Mar
 2026 02:41:18 +0000
Received: from BL6PEPF00020E63.namprd04.prod.outlook.com
 (2603:10b6:208:2c7:cafe::43) by BL1P222CA0010.outlook.office365.com
 (2603:10b6:208:2c7::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Thu,
 19 Mar 2026 02:40:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF00020E63.mail.protection.outlook.com (10.167.249.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 02:41:17 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 18 Mar
 2026 21:41:16 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Mar
 2026 21:41:15 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 18 Mar 2026 21:41:15 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH] tests/amdgpu: add KFD DMA-BUF fence-outlives-module unload
 test
Date: Wed, 18 Mar 2026 22:38:38 -0400
Message-ID: <20260319024110.178730-2-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260319024110.178730-1-vitaly.prosyak@amd.com>
References: <20260319024110.178730-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: vitaly.prosyak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E63:EE_|DS5PPF5FAA0E762:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aecd38a-b982-46c4-3084-08de8560ff22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|376014|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: B0QDs+H8xMdohjQc7i+56f5ukGx7qWGR/AxhtJTMBp+NF2UoieVASQYn5b8dl1/ak+s3xCWqpMKP4nkkug2K+tcJzGWReRCYlrVRCpgMwolzNY9X9rHXuoQrO5ybvu9IiWY/fnh3rXekKzfT8bKJeZQHu1CBQpGMbI9G8/rEnScy2DCDbQYQLwGnbXju03T+wc1nbUCOtxHGcizbLD+ANRIqyjEqHUsDr+ON5PUivGJ48l6VAB27L9Tqj0ttZmGwxMNcIpNJz55A5LjH6VDnM2OAo35LwG+y2xVRlnW8MjEy1pxR5amOj7CI0Hmvx9L+gN9NrVRteTOYuqlGY3YMlgGcig8jtjPKLTGlaH6Sbs9NdoPQQktizxsKgd5uWIEV9uhgGdd98+JiScwmRP5IPa68g/4MWueVcJmQalO70nn2yho8Nlcu7RF8v4r/31AaQsbC109sKly/hh+ShXBv8V/ZPTRAvuNefMJnwZDMAxtFvXoUatQTZ0xeyMZ8+iMESkni6EcP7qGdNotxzqqMgAqOsCaLeokT2Nr2OityjCQ3khQ7u+aPHO/ykzu3q5NxS97G3mBNkU9fkED5nErcBN+5lU583VhQLfyzscKIhI4wEofSohQ4jdPyH7SGfBAG3g4BpitFYBLI6xQA/s/ASwXB/7HhmeaefsFxM24qwcfNhrTxKfEuOF3UHTsvGNClsgwvWo+yLju5xfsJX8z1IjOcCZCBUlnJp0m3hBdAgLsNIPR7lgqtBmqzgUDu/A6nYRRKaFWxMRbPNEJBwrRtAQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ez8SQhKp4kLe53hZrBaChEgd4N3ndfADqAuvGpdESawA/EEX7pV9mMjwB2n7LkYOxhBPNwmswcDlAW+ykh+lj8rC3ig4XfkBQOXMjtewT8EnTymmzTdQ4DuQNTTk5bnfNJEn+WVLU9gJBwtQRmzcfsZzwQtSnFdh85Pk3+k/SlgQumMSOKlDelpc13pbEsQVu3D3ApL8AMP2ctwRCEu9KO2unumD1nxM/jZKu0lkR2vKtxDji0odZBiUxez6Y1a1d8f3KaNo5HR4GeaI7DrazxB3YnzEzw/n0m9jYMOiX8nnYoapYTJiTHse3lmJy3fX4m+B+ztx1oh3MbQa5xoJZw06TTyhuR5SRhHNxWu+YwE6qgCLx0DVelbTykY4SKCP4CzTpnVAQOp2v/pTjB8GNuabKujGcfbtl3WslXAyqEUKRaJVdpb/gpUJvfrKxfsO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 02:41:17.6533 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aecd38a-b982-46c4-3084-08de8560ff22
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00020E63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF5FAA0E762
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

Add amd_kfd_dmabuf_unload, the KFD counterpart of
amd_dmabuf_unload.  It exercises the same fence-outlives-module
unload scenario but with KFD/HSA style buffer management:

  1. Creates a VGEM BO and exports it as a DMA-BUF.
  2. Opens a KFD device with kfd_open / kfd_get_gpu_id /
     kfd_acquire_vm so the KFD and amdgpu contexts share
     the same GPU page table.
  3. Imports the DMA-BUF into amdgpu, then calls
     kfd_import_dmabuf + kfd_map_memory_to_gpu so the buffer
     is mapped through KFD's shared VM -- no separate
     amdgpu VA mapping is needed.
  4. Submits one SDMA copy_linear IB that references the
     imported BO (via bo_list), attaching a fence to the
     VGEM BO's dma_resv.
  5. Tears down KFD mappings, closes all amdgpu/KFD fds
     WITHOUT waiting, rmmods amdgpu.
  6. poll()s the DMA-BUF fd to exercise the orphaned fences.

This test verifies that KFD-acquired VM contexts and
KFD-imported DMA-BUF handles do not create a use-after-free
when the module is removed before fences complete.

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_kfd_dmabuf_unload.c | 481 +++++++++++++++++++++++++++
 tests/amdgpu/meson.build             |   1 +
 2 files changed, 482 insertions(+)
 create mode 100644 tests/amdgpu/amd_kfd_dmabuf_unload.c

diff --git a/tests/amdgpu/amd_kfd_dmabuf_unload.c b/tests/amdgpu/amd_kfd_dmabuf_unload.c
new file mode 100644
index 000000000..8078d5bdb
--- /dev/null
+++ b/tests/amdgpu/amd_kfd_dmabuf_unload.c
@@ -0,0 +1,481 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2025 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#include <amdgpu.h>
+#include <amdgpu_drm.h>
+#include <linux/kfd_ioctl.h>
+#include <poll.h>
+#include <sys/ioctl.h>
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
+ * TEST: amd kfd dmabuf unload
+ * Description: Test KFD fence independence with DMA-BUF cross-driver
+ *              references from VGEM.  Exercises the KFD ioctl path
+ *              (AMDKFD_IOC_IMPORT_DMABUF, AMDKFD_IOC_MAP_MEMORY_TO_GPU)
+ *              for module unload safety, plus a fence-outlives-module
+ *              subtest that unloads amdgpu while KFD-path fences are
+ *              still referenced by a VGEM BO dma_resv.
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: DRM
+ * Functionality: prime
+ * Test category: GEM_Legacy
+ * Feature: prime, vgem, kfd
+ *
+ * SUBTEST: kfd-fence-outlives-module
+ * Description: Validates fence independence patches for KFD.  Opens
+ *              /dev/kfd + amdgpu, imports a VGEM DMA-BUF into KFD
+ *              (attaching KFD eviction fences to dma_resv), submits
+ *              SDMA copies with the imported BO in the bo_list
+ *              (attaching SDMA fences), then closes everything without
+ *              waiting.  rmmods amdgpu, then poll()s the DMA-BUF fd
+ *              to exercise fence->ops and fence->lock after module
+ *              unload.  Without the patches this is a use-after-free;
+ *              with them fences are self-contained.
+ *              Best run with KASAN enabled.
+ */
+
+IGT_TEST_DESCRIPTION("Test KFD DMA-BUF import (AMDKFD_IOC_IMPORT_DMABUF) "
+		      "module unload safety with imported VGEM references, "
+		      "including fence-outlives-module validation for KFD "
+		      "eviction fences.");
+
+/*
+ * ============================================================
+ *  KFD ioctl helpers  (direct ioctls, no libhsakmt dependency)
+ * ============================================================
+ */
+
+/**
+ * kfd_open - open the /dev/kfd device node
+ *
+ * Returns the file descriptor, or -1 on failure.
+ */
+static int kfd_open(void)
+{
+	return open("/dev/kfd", O_RDWR);
+}
+
+/**
+ * kfd_get_gpu_id - retrieve the first non-zero GPU id from KFD
+ * @fd: KFD file descriptor
+ * @gpu_id: output GPU id
+ *
+ * Iterates the process apertures returned by KFD and picks the
+ * first node whose gpu_id is non-zero.
+ *
+ * Returns 0 on success or -errno.
+ */
+static int kfd_get_gpu_id(int fd, uint32_t *gpu_id)
+{
+	struct kfd_ioctl_get_process_apertures_args args = {};
+	int i;
+
+	if (ioctl(fd, AMDKFD_IOC_GET_PROCESS_APERTURES, &args))
+		return -errno;
+
+	for (i = 0; i < (int)args.num_of_nodes; i++) {
+		if (args.process_apertures[i].gpu_id != 0) {
+			*gpu_id = args.process_apertures[i].gpu_id;
+			return 0;
+		}
+	}
+	return -ENODEV;
+}
+
+/**
+ * kfd_acquire_vm - bind a KFD device to the amdgpu VM
+ * @fd: KFD file descriptor
+ * @gpu_id: target GPU id
+ * @drm_fd: amdgpu DRM file descriptor whose VM should be shared
+ *
+ * After this call KFD VA mappings and amdgpu VA mappings share the
+ * same page table.
+ *
+ * Returns 0 on success or -errno.
+ */
+static int kfd_acquire_vm(int fd, uint32_t gpu_id, int drm_fd)
+{
+	struct kfd_ioctl_acquire_vm_args args = {};
+
+	args.gpu_id = gpu_id;
+	args.drm_fd = drm_fd;
+	return ioctl(fd, AMDKFD_IOC_ACQUIRE_VM, &args) ? -errno : 0;
+}
+
+/**
+ * kfd_get_gpuvm_base - query the GPUVM aperture base for @gpu_id
+ * @fd: KFD file descriptor
+ * @gpu_id: target GPU id
+ * @gpuvm_base: output aperture base address
+ *
+ * kfd_import_dmabuf requires a VA within this aperture; passing 0
+ * causes "amdgpu: Invalid VA when adding BO to VM" (-EINVAL).
+ *
+ * Returns 0 on success or -errno.
+ */
+static int kfd_get_gpuvm_base(int fd, uint32_t gpu_id,
+			      uint64_t *gpuvm_base)
+{
+	struct kfd_process_device_apertures aps[NUM_OF_SUPPORTED_GPUS];
+	struct kfd_ioctl_get_process_apertures_new_args args = {};
+	uint32_t i;
+
+	args.kfd_process_device_apertures_ptr =
+		(uint64_t)(uintptr_t)aps;
+	args.num_of_nodes = NUM_OF_SUPPORTED_GPUS;
+	if (ioctl(fd, AMDKFD_IOC_GET_PROCESS_APERTURES_NEW, &args))
+		return -errno;
+
+	for (i = 0; i < args.num_of_nodes; i++) {
+		if (aps[i].gpu_id == gpu_id) {
+			*gpuvm_base = aps[i].gpuvm_base;
+			return 0;
+		}
+	}
+	return -ENODEV;
+}
+
+/**
+ * kfd_import_dmabuf - import a DMA-BUF fd into KFD
+ * @fd: KFD file descriptor
+ * @gpu_id: target GPU id
+ * @dmabuf_fd: DMA-BUF file descriptor to import
+ * @va_addr: GPU virtual address (must be within the GPUVM aperture)
+ * @handle: output KFD memory handle
+ *
+ * Returns 0 on success or -errno.
+ */
+static int kfd_import_dmabuf(int fd, uint32_t gpu_id, int dmabuf_fd,
+			     uint64_t va_addr, uint64_t *handle)
+{
+	struct kfd_ioctl_import_dmabuf_args args = {};
+
+	args.gpu_id = gpu_id;
+	args.dmabuf_fd = dmabuf_fd;
+	args.va_addr = va_addr;
+	if (ioctl(fd, AMDKFD_IOC_IMPORT_DMABUF, &args))
+		return -errno;
+	*handle = args.handle;
+	return 0;
+}
+
+/**
+ * kfd_map_memory_to_gpu - map a KFD memory object on the given GPU
+ * @fd: KFD file descriptor
+ * @handle: KFD memory handle (from kfd_import_dmabuf)
+ * @gpu_id: target GPU id
+ *
+ * Returns 0 on success or -errno.
+ */
+static int kfd_map_memory_to_gpu(int fd, uint64_t handle, uint32_t gpu_id)
+{
+	struct kfd_ioctl_map_memory_to_gpu_args args = {};
+	uint32_t dev_id = gpu_id;
+
+	args.handle = handle;
+	args.device_ids_array_ptr = (uint64_t)(uintptr_t)&dev_id;
+	args.n_devices = 1;
+	return ioctl(fd, AMDKFD_IOC_MAP_MEMORY_TO_GPU, &args) ? -errno : 0;
+}
+
+/**
+ * kfd_unmap_memory_from_gpu - unmap a KFD memory object from the GPU
+ * @fd: KFD file descriptor
+ * @handle: KFD memory handle
+ * @gpu_id: target GPU id
+ *
+ * Returns 0 on success or -errno.
+ */
+static int kfd_unmap_memory_from_gpu(int fd, uint64_t handle,
+				     uint32_t gpu_id)
+{
+	struct kfd_ioctl_unmap_memory_from_gpu_args args = {};
+	uint32_t dev_id = gpu_id;
+
+	args.handle = handle;
+	args.device_ids_array_ptr = (uint64_t)(uintptr_t)&dev_id;
+	args.n_devices = 1;
+	return ioctl(fd, AMDKFD_IOC_UNMAP_MEMORY_FROM_GPU, &args) ? -errno : 0;
+}
+
+/**
+ * kfd_free_memory - free a KFD memory object
+ * @fd: KFD file descriptor
+ * @handle: KFD memory handle
+ *
+ * Returns 0 on success or -errno.
+ */
+static int kfd_free_memory(int fd, uint64_t handle)
+{
+	struct kfd_ioctl_free_memory_of_gpu_args args = {};
+
+	args.handle = handle;
+	return ioctl(fd, AMDKFD_IOC_FREE_MEMORY_OF_GPU, &args) ? -errno : 0;
+}
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
+#define NUM_SDMA_COPIES 1
+
+/**
+ * test_kfd_fence_outlives_module - KFD fence independence validation
+ * @vgem: VGEM device fd
+ * @amd_fd: amdgpu device fd
+ * @dev: amdgpu device handle
+ *
+ * The key KFD test for fence independence patches:
+ *
+ *   1. Open /dev/kfd + amdgpu, bind KFD to the amdgpu VM
+ *      (kfd_acquire_vm -- shared page table).
+ *   2. Import VGEM DMA-BUF into KFD via AMDKFD_IOC_IMPORT_DMABUF
+ *      and map it (AMDKFD_IOC_MAP_MEMORY_TO_GPU).  This attaches
+ *      KFD eviction fences to dma_resv AND creates a GPU VA mapping
+ *      in the shared VM.
+ *   3. Also import via amdgpu_bo_import() for SDMA submission.
+ *      Note: NO separate amdgpu VA mapping is needed for the imported
+ *      BO because KFD already mapped it in step 2 (shared VM).
+ *   4. Submit SDMA copies with the imported BO in bo_list, attaching
+ *      SDMA fences to dma_resv.
+ *   5. Close everything WITHOUT waiting.
+ *
+ * After close: zero amdgpu fds, but VGEM BO dma_resv still holds
+ * amdgpu SDMA fences + KFD eviction fences.
+ *
+ * rmmod amdgpu, then poll() the DMA-BUF fd.
+ *
+ * Without patches: use-after-free (crash / KASAN splat).
+ * With patches: self-contained fences, safe poll().
+ */
+static void test_kfd_fence_outlives_module(int vgem, int amd_fd,
+					   amdgpu_device_handle dev)
+{
+	struct amdgpu_bo_import_result import;
+	amdgpu_bo_handle src_bo, dst_bo;
+	amdgpu_va_handle src_va, dst_va;
+	void *src_cpu, *dst_cpu;
+	uint64_t src_mc, dst_mc;
+	cmd_context_t *cmd_ctx;
+	struct amdgpu_dma_limits limits = {0};
+	struct vgem_bo bo;
+	uint32_t gpu_id;
+	uint64_t kfd_handle, gpuvm_base, copy_size;
+	int kfd, dmabuf, r, i;
+
+	/* Create VGEM BO and export as DMA-BUF */
+	bo.width = 1024;
+	bo.height = 1;
+	bo.bpp = 32;
+	vgem_create(vgem, &bo);
+	dmabuf = prime_handle_to_fd(vgem, bo.handle);
+
+	/* Open KFD and bind it to the amdgpu VM (shared page table) */
+	kfd = kfd_open();
+	igt_assert(kfd >= 0);
+	r = kfd_get_gpu_id(kfd, &gpu_id);
+	igt_assert_eq(r, 0);
+	r = kfd_acquire_vm(kfd, gpu_id, amd_fd);
+	igt_assert_eq(r, 0);
+	r = kfd_get_gpuvm_base(kfd, gpu_id, &gpuvm_base);
+	igt_assert_eq(r, 0);
+
+	/*
+	 * Import DMA-BUF into KFD and map it on the GPU.
+	 * This creates a VA mapping in the shared VM at @gpuvm_base and
+	 * attaches KFD eviction fences to the BO dma_resv.
+	 */
+	r = kfd_import_dmabuf(kfd, gpu_id, dmabuf,
+			      gpuvm_base, &kfd_handle);
+	igt_assert_eq(r, 0);
+	r = kfd_map_memory_to_gpu(kfd, kfd_handle, gpu_id);
+	igt_assert_eq(r, 0);
+
+	/*
+	 * Also import via amdgpu for SDMA submission.
+	 * No separate amdgpu VA mapping is needed -- KFD already
+	 * mapped this BO in the shared VM via kfd_acquire_vm +
+	 * kfd_map_memory_to_gpu.  Adding a second mapping would
+	 * conflict and cause a GPU page fault.
+	 */
+	r = amdgpu_bo_import(dev, amdgpu_bo_handle_type_dma_buf_fd,
+			     dmabuf, &import);
+	igt_assert_eq(r, 0);
+
+	/* Query HW DMA transfer limits */
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
+	/* Set up bo_list: IB (src), dst, imported VGEM BO */
+	cmd_ctx->ring_ctx->bo2 = dst_bo;
+	cmd_ctx->ring_ctx->bo_mc2 = dst_mc;
+	cmd_ctx->ring_ctx->resources[1] = dst_bo;
+	cmd_ctx->ring_ctx->resources[2] = import.buf_handle;
+	cmd_ctx->ring_ctx->res_cnt = 3;
+
+	igt_info("Submitting %d SDMA copies "
+		 "(KFD amdgpu fences on dma_resv, no wait)...",
+		 NUM_SDMA_COPIES);
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
+	close(kfd);
+
+	igt_info("All amdgpu/KFD fds closed -- attempting rmmod...\n");
+	r = igt_kmod_unload("amdgpu");
+	igt_info("igt_kmod_unload returned %d\n", r);
+
+	if (r == 0) {
+		bool busy_r, busy_w;
+
+		/*
+		 * Module unloaded.  Exercise dma_resv fences via poll()
+		 * -- KFD eviction fences + SDMA fences are still in
+		 * the VGEM BO dma_resv.
+		 */
+		igt_info("Module unloaded -- exercising KFD fences via "
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
+		igt_info("KFD fences survived module unload -- "
+			 "reloading...\n");
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
+	amdgpu_device_handle device = NULL;
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
+		/* Verify PRIME and KFD support */
+		igt_require(drmGetCap(vgem, DRM_CAP_PRIME, &cap) == 0 &&
+			    (cap & DRM_PRIME_CAP_EXPORT));
+		igt_require(drmGetCap(amd, DRM_CAP_PRIME, &cap) == 0 &&
+			    (cap & DRM_PRIME_CAP_IMPORT));
+		igt_require_f(access("/dev/kfd", R_OK | W_OK) == 0,
+			      "/dev/kfd not available\n");
+	}
+
+	igt_subtest("kfd-fence-outlives-module") {
+		test_kfd_fence_outlives_module(vgem, amd, device);
+
+		/* Re-open for fixture teardown (module may have reloaded) */
+		amd = drm_open_driver(DRIVER_AMDGPU);
+		err = amdgpu_device_initialize(amd, &major, &minor, &device);
+		igt_assert_eq(err, 0);
+	}
+
+	igt_fixture() {
+		if (device)
+			amdgpu_device_deinitialize(device);
+		if (amd >= 0)
+			drm_close_driver(amd);
+		if (vgem >= 0)
+			drm_close_driver(vgem);
+	}
+}
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index 6bbe5009d..6b0ef1b10 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -16,6 +16,7 @@ if libdrm_amdgpu.found()
 			  'amd_cursor_overlay',
 			  'amd_deadlock',
                           'amd_dmabuf_unload',
+                          'amd_kfd_dmabuf_unload',
 			  'amd_dp_dsc',
 			  'amd_freesync_video_mode',
 			  'amd_fuzzing',
-- 
2.52.0

