Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9713ECC6B00
	for <igt-dev@archiver.kernel.org>; Thu,  2 Apr 2026 04:47:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28AB910E322;
	Thu,  2 Apr 2026 04:47:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RN5l6ish";
	dkim-atps=neutral
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010071.outbound.protection.outlook.com [52.101.85.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1873E10E322
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Apr 2026 04:46:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NW/IXZNM2ed7hPMb8ZrqkQU8sqT3fBkjCxipyJLe/zSCrsM3MDSirrkaq1zP5uf24Clt6v1UUBEEjusrQMT3d5w3thtnYgeTQPPfg3h5onwwq5VyUHwHZWdsK+/2QVdpxi1WSrzDrKacADpOSUE3BgonRMdD369So1JX3mWX6UQZ71aa/uuocr2qryz/LrPQ2W2mIs3I2vAJ96sAtiuhtFmZWl5DkfOy1aUg/8OX/GxKmjLbI5hEYmV95JexQZ79SmMuTClRatFa9+rWL/SVNW6SJYTdNt/aAijJeS1OtDmowEtdQ5APv95O5PC1VqjHQ57DM2mFpllThkKY1CxhTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UJSlyWlpiUH6Fj/0j7TKrt/DZNftk0NDpSFb2F8IkhE=;
 b=nF0BNL97+CklKfoiuAF3ruGUfU8/9StplKxq3SjNSjHRb5hxaj8ECwr2D/7jNfOp7eCv3U0MthxHTmpj5YAbMgVuxue3myqzGt0GIm7UpXteK7UdE0E7cC3U2tlBgOusWk3qGRhFadihEJMG3P9fUJLeHTLBgalJFgRpMfm9adFvL9larZ35SFd+S6KPR0nX26zK5smWxsSpHqOrR8JhXnCFrKvXkl+FPocuQxtCYktjE0MXUvfq7DqgBfGsknmoBgng4GsEA0EUiyMJrhCTxEPHJAMkCinNfBd6k7SCt1uOk+KFlzGp6UW9HiCttSmGiy1HU62OFvioJlFC+oNaJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UJSlyWlpiUH6Fj/0j7TKrt/DZNftk0NDpSFb2F8IkhE=;
 b=RN5l6ishKd+zrD6gzuAl2am7fwFTBqSC7QdGtDgKVa8MnNHRrYOhqCuYVDx75jzFKa8/MP1eh4rtaw3tHrWNCjbJAcyqSiNQDuzFFKKGTFym/+ahLeUSMLCx5wtyMD/GnobZ3HpX4ntrZD53DiWU0Xjy9QnVpSD8F0QodNy+w5c=
Received: from BL1P221CA0034.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:5b5::18)
 by DS0PR12MB6558.namprd12.prod.outlook.com (2603:10b6:8:d2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.11; Thu, 2 Apr
 2026 04:46:44 +0000
Received: from BN2PEPF000044A7.namprd04.prod.outlook.com
 (2603:10b6:208:5b5:cafe::cd) by BL1P221CA0034.outlook.office365.com
 (2603:10b6:208:5b5::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.31 via Frontend Transport; Thu,
 2 Apr 2026 04:46:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000044A7.mail.protection.outlook.com (10.167.243.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 2 Apr 2026 04:46:43 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 1 Apr
 2026 23:46:43 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 1 Apr
 2026 23:46:42 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 1 Apr 2026 23:46:42 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH] tests/amdgpu: add KFD DMA-BUF fence-outlives-module unload
 test
Date: Thu, 2 Apr 2026 00:46:03 -0400
Message-ID: <20260402044637.74655-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: vitaly.prosyak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A7:EE_|DS0PR12MB6558:EE_
X-MS-Office365-Filtering-Correlation-Id: a2b32b6d-7c5d-4a2f-4a40-08de9072d698
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700016|82310400026|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: Om5d79aqLfQ4MZMaPktOIirjHOzvJ91hKbsqWCyk0xnq9q3/xQd2eQ2fuUrdNvru1vZHTjLyrcNWY+ionceo4PElwJeMTBgjtWFY+fxqeDCUztnoVWqoQf0gLI2HZUhPTkd07HotrreK1U7smLAR1iBe+X/mF+acTeb+SQ0u/Z1L7etxxcjgV/Nt+8X8R8z1gtVkiva6VUmdtDK0mYsF0RSXiQFsj/PYdqcM/yxP86yDW8T0pwnEpgdhBjYLP+x1502gbtGHWVlkkWQyZzzlI/EMLmiJlIYhFjWot4558wf89zlf+1s9WoNfj6fwE3HSh4vo48TYqzrnve78BEElRtayl7ZZwXd+rmQeHvzt+fHagUcwfF7wcVCtjN3icBOvyPmF+LNQClU1GiVkRxXsa+4f4+hqUCIveK0UTm1b75B4Mq954fZdjcvztonoyKlgp0DvC8PV55jQgLP/+dVqBpiOw4C9OnAFh5K1tMCxkVsh4uWmFUfGMjB45P5cgoAgZ7P2zMNvX7ZREZec80Y1+hRCNdNnjWMWOS8Cl/9N7Yp83AC5euAAGL9cgyZsQ73E1uXuD8TAtx76kRwm7DokrdmfTy+QDk4jP2plZoZxYzvNhJszWDW+b4a9yxXslIQf5BnjU0eKn/ncS7eeZ62ZdIT1WBl4A4RqL/m/+CFNz+K6beK3PwpYtja8oAxKC/npgjO55T108NaDiOSltjViMErb+1W2lraUikigUxL4j/h0CJjKKjy+5mY0yqyq9DsyS+Cl+XnuKhQCn5oVyk7ekw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: xERgiN3oKZalzdut2t6iLiyrfN14pMEjDUfr/6zUpNJ0xtTUmK1sqff5jrTaklZcNZJsaU1fkCrPPR3bfk6Rr7edtPeM2YbAdqBOP98i+w/npNqkHv/PQHNEL5xrExdcK3rt3EFmO5LH4ToAwzyfoaHa5rXhxZ1pAXdTiQWD0x3Z0HdM7g9TZUJUvWk2+RIysYFve63tymJh1m2FLMHOMBXVWXi0X1BtwtCHCdrzd0bJoXjHFMTOOy2TM/HGhsbnCvZZXTisBSyGjLC2hy9yajhqigSRAjhKgG6Jq6RQiL/2YMDbj6y/7lCdK12xcHCKWYDjeE8af2KFH/Vf1xMS81mEoaKchOEW9kMDxuCF6L3ROKw0+cHorbIno6pexESymaBXsGBUYRyE4tycdluuc7G/Ofaf23nBHcKGLcT/g25KwP151IWJL9OBgyQi81+L
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 04:46:43.3764 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2b32b6d-7c5d-4a2f-4a40-08de9072d698
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6558
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

v2: update header SPDX-License-Identifier: MIT
v3: remove some comments (Jesse)  and added HAVE_KFD_IOCTL_H

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Reviewed-by: Jesse Zhang <jesse.zhang@amd.com>
---
 meson.build                          |   3 +
 tests/amdgpu/amd_kfd_dmabuf_unload.c | 433 +++++++++++++++++++++++++++
 tests/amdgpu/meson.build             |   5 +
 3 files changed, 441 insertions(+)
 create mode 100644 tests/amdgpu/amd_kfd_dmabuf_unload.c

diff --git a/meson.build b/meson.build
index b28773444..79051be21 100644
--- a/meson.build
+++ b/meson.build
@@ -235,6 +235,9 @@ endif
 if cc.has_header('libgen.h')
 	config.set('HAVE_LIBGEN_H', 1)
 endif
+if cc.has_header('drm/drm.h') and cc.has_header('linux/kfd_ioctl.h')
+        config.set('HAVE_KFD_IOCTL_H', 1)
+endif
 if cc.has_header('sys/io.h') and cc.has_function('outb', prefix: '#include <sys/io.h>')
 	config.set('HAVE_SYS_IO_H', 1)
 endif
diff --git a/tests/amdgpu/amd_kfd_dmabuf_unload.c b/tests/amdgpu/amd_kfd_dmabuf_unload.c
new file mode 100644
index 000000000..24260b560
--- /dev/null
+++ b/tests/amdgpu/amd_kfd_dmabuf_unload.c
@@ -0,0 +1,433 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2026 Advanced Micro Devices, Inc.
+ */
+
+#include <amdgpu.h>
+#include <amdgpu_drm.h>
+#ifdef HAVE_KFD_IOCTL_H
+#include <linux/kfd_ioctl.h>
+#endif /* HAVE_KFD_IOCTL_H */
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
+
+#ifdef HAVE_KFD_IOCTL_H
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
+#endif /* HAVE_KFD_IOCTL_H */
+
+
+
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
+#ifndef HAVE_KFD_IOCTL_H
+		igt_skip("linux/kfd_ioctl.h not available at build time\n");
+#endif
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
+		amdgpu_device_deinitialize(device);
+		drm_close_driver(amd);
+		drm_close_driver(vgem);
+	}
+}
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index 6bbe5009d..af4997426 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -72,6 +72,11 @@ if libdrm_amdgpu.found()
 	else
 		warning('libdrm <= 2.4.104 found, amd_queue_reset test not applicable')
 	endif
+        if config.has('HAVE_KFD_IOCTL_H')
+                amdgpu_progs +=[ 'amd_kfd_dmabuf_unload', ]
+        else
+                warning('linux/kfd_ioctl.h not found, amd_kfd_dmabuf_unload test not applicable')
+        endif
 	amdgpu_deps += libdrm_amdgpu
 endif
 
-- 
2.53.0

