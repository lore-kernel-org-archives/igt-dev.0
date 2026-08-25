Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CDCC61DB6
	for <igt-dev@archiver.kernel.org>; Tue, 25 Aug 2026 07:26:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D3DC10E577;
	Tue, 25 Aug 2026 07:26:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RwDcVRMr";
	dkim-atps=neutral
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011061.outbound.protection.outlook.com [52.101.57.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9AE110E14D
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Aug 2026 07:23:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kzFog90bHuPC9N3UwLGADn3itGv5YL4iutEQZIfM+Nwua3OcSQgxKf+da1t/59D1UI63XycHBTMGxzL2inXfVK2LmKbwiYzeQ+4fUmpiJnIS6c0l1M8uGafFjBfi+hFcIRcTDQWlXTv5tn8Q/g2iJOH59gZUGE3IHT8YGU/VS39gnmiY2ba5nO/MKh2TWoZanqfhLeVSG1JDxtyajtVHjYKzmet5x51s7lagthOCjSIatufhhf7lDDaHruweOfX99oCda3IhR8YmcjxTiUFzwzBdQXGhJfYWx1m8J+bgM/+tVqoBAzrbRBf+9kDIdK9EOTPlXw6xeD3ZBo9O99vCpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DsBDwbIyW4udcq/Lh4R22wK84w76q/J79LEMZ7q1WQ0=;
 b=uqMze5SRU//J9fY1DcOoQtlJ6Xo5hIU7wJF5AbnMcG1pg0Hjs8tj8HCBZL3K2F3WQtAoH2fGVrfGHJcCu6cOzeUB7mewVgKpDFK3Gek79WU1SFv7RD9aAovApGBfPnIUE8UI+6eNSJ8/SAwSvbHSqxtU669/k087swL7mbmvk4/uUIgExJNUSSEUMNvdjgJbhfg4fZ9xlqpOxe5FLyMTuI4gDh07ZismZeLutBGWdV9MasDblxz4GvynqGpdbS0Jfs+DO6WfcDKvhJGk6ksRM7PXAzfRrMhRdSeHWKHcN6dyVWUE6T4GeSBqmiQtGRoOlKaHzMpApjiVrOuBDsIVTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.90.133) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=amd.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DsBDwbIyW4udcq/Lh4R22wK84w76q/J79LEMZ7q1WQ0=;
 b=RwDcVRMrTZir9bmabVo1tNtVHnrQ+CBRYFkuD/wEZW14W79aN3LorBquSW22PhpyIZrSLUXxz32LIyKWtXsthrC5DdWn6AwlxDWgH6QK5IR7C3ms94F+BGDKse6vc0kAncr8EMyqTP3H3F6oa2NqEr+2DltTxbuMSl45GkIQjEk=
Received: from PH0P220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:d3::20)
 by CH2PR12MB4136.namprd12.prod.outlook.com (2603:10b6:610:a4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 07:23:15 +0000
Received: from MW1PEPF0001615E.namprd21.prod.outlook.com
 (2603:10b6:510:d3:cafe::26) by PH0P220CA0010.outlook.office365.com
 (2603:10b6:510:d3::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.12 via Frontend Transport; Tue,
 25 Aug 2026 07:23:14 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.90.133) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.90.133 as permitted sender)
Received: from satlexmb08.amd.com (149.199.90.133) by
 MW1PEPF0001615E.mail.protection.outlook.com (10.167.249.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.0 via Frontend Transport; Tue, 25 Aug 2026 07:23:14 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 25 Aug
 2026 02:23:10 -0500
Received: from junhua-PC.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Tue, 25 Aug 2026 02:23:08 -0500
From: Junhua Shen <Junhua.Shen@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Huang Rui
 <ray.huang@amd.com>, Oak Zeng <Oak.Zeng@amd.com>, Xiaogang Chen
 <Xiaogang.Chen@amd.com>, Jenny Liu <Jenny-Jing.Liu@amd.com>, Honglei Huang
 <honglei1.huang@amd.com>, Zhu Lingshan <lingshan.zhu@amd.com>, Yiru Ma
 <yiru.ma@amd.com>, Junhua Shen <Junhua.Shen@amd.com>
Subject: [PATCH i-g-t v2 2/3] lib/amdgpu: add SVM helper library (amd_svm.{c,
 h})
Date: Tue, 25 Aug 2026 15:22:59 +0800
Message-ID: <20260825072300.16348-3-Junhua.Shen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260825072300.16348-1-Junhua.Shen@amd.com>
References: <20260825072300.16348-1-Junhua.Shen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615E:EE_|CH2PR12MB4136:EE_
X-MS-Office365-Filtering-Correlation-Id: 546d5649-7d96-42bf-d808-08df0279ba17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|376014|1800799024|23010399003|82310400026|6133799003|3023799007|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: KGPSdP+gHEhLyhlLmFxQ1BvQv7stJd/Fc7LBTQk+AGYM2lHM1E77V2/0IL0KbqXrdNgizB0nxJw5hY+yk3Cta87aSx+m5AWXiln3p+gSCDcNK8iJiRTNsgf6stTQYad8C+wrNbsVzp8J/TsucGG8raVJOHlzzU+ToIbkSjjGp7XE+jQTxNijzsIDn6Vo1sNpVWKwSFOmsYHu9PFccBy5oo1E0QbSkP8jvW+6TeMOU6KVvTWHzkdw/CoeZSjcpjF6aejo3xjRouE4D11Jqn8cqC6ZyBo58dN+vLn/+k9MKMTSltexJUPNT2EFMqLG1ZM9rFuAJPYs+TyER1rx0QoVLzQ/tMLV3T/i3UBwmCA2FMAZ57h89RC9xMoHY+5EzLJeUfMM5nDHObgBWioIka7jp3ex3QircruE6t8qp4r5Mj0ChiP6KnwKRlulByNiRqXT4JQO8dQkeRp6cavdPverpUAi42i2kwUQ75Ml2OiicNLqK2PqwOULrU66aTSR04d8nxOSfhMEzmDf+tc0S9D9FXCE369+i1Ds/ou0JjySae0jLomL5NlVqB5A80GnAg5HIaZaYC8vfmf/94aYaQSlqAo6uhtFhIh4VcOWxmpdtJdV69ojE5zcqLLBzc9nfNd/ybdwTRG6r5wDQ+z8ucxKh0HDyFv9WPsY9KOC/it7tENZcelMsNo/AmmU0BRG20VY5IXcCImg8SA66EEyJ9Qqlw==
X-Forefront-Antispam-Report: CIP:149.199.90.133; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:unknown-90-133.xilinx.com;
 CAT:NONE;
 SFS:(13230040)(36860700016)(376014)(1800799024)(23010399003)(82310400026)(6133799003)(3023799007)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ffmhQBeLQXi/DsvdLdntwI2lC0ouAdIn19M65/zVSolpmnI/9jGXLXR4uosKGDcHSNpBS6631G8k3OPl44n35hdit+zfg7niM/N1KYqNB9RGVLaBST+1pw/1afmrAGPRDvr9Adl/fy6TVtdREUGz66ZGr5ZH05WNAH7MSCILRkuaAXXGb9x43jcGQjA0cUaRuAR/wXJmIC3w9BLH3GKe1inhb6oRksvW1YVn3QUKLLKSq3hsl7lU5rRhKJw1nkEwWNOz3+rtz7KmE0xurMn9aeFLLTqHjdOPn0e5y/Gf+/Y/3kV8GInanMI4XQYNBKsNYPUigrhc1mnscNxJ3Fx2xfx5J17JYvnMLmIVRVhDCcQYELo/M4xZxneiPqgEJ6RdCdkG36LgRoRGCsZ/aWzL8wSYl40NCxohWtOWrKTXL/jFJfiu6KeYZU3NgxzNP/Oo
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 07:23:14.5522 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 546d5649-7d96-42bf-d808-08df0279ba17
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[149.199.90.133];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MW1PEPF0001615E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4136
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

Add a reusable SVM helper library (lib/amdgpu/amd_svm.{c,h}) wrapping the
amdgpu-drm-svm uapi (DRM_IOCTL_AMDGPU_GEM_SVM) via the render-node CS
path, along with the corresponding meson wiring.

Signed-off-by: Junhua Shen <Junhua.Shen@amd.com>
---
 lib/amdgpu/amd_svm.c | 151 +++++++++++++++++++++++++++++++++++++++++++
 lib/amdgpu/amd_svm.h |  41 ++++++++++++
 lib/meson.build      |   1 +
 3 files changed, 193 insertions(+)
 create mode 100644 lib/amdgpu/amd_svm.c
 create mode 100644 lib/amdgpu/amd_svm.h

diff --git a/lib/amdgpu/amd_svm.c b/lib/amdgpu/amd_svm.c
new file mode 100644
index 000000000..b31cfe33f
--- /dev/null
+++ b/lib/amdgpu/amd_svm.c
@@ -0,0 +1,151 @@
+/* SPDX-License-Identifier: MIT
+ * Copyright 2026 Advanced Micro Devices, Inc.
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
+ *
+ *
+ */
+
+#include "amd_svm.h"
+
+#include "amd_memory.h"
+#include "amd_PM4.h"
+#include "amd_ip_blocks.h"
+#include "amd_sdma.h"
+#include "amd_command_submission.h"
+#include "igt.h"
+
+#include <errno.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <sys/mman.h>
+#include <sys/user.h>
+#include <inttypes.h>
+
+
+int amdgpu_svm_register_range(amdgpu_device_handle dev,
+			      void *addr, uint64_t size, uint32_t nattr,
+			      struct drm_amdgpu_svm_attribute *attrs)
+{
+	return amdgpu_svm_set_attr(dev, (uint64_t)(uintptr_t)addr,
+				    size, nattr, attrs);
+}
+
+int amdgpu_svm_unregister_range(amdgpu_device_handle dev,
+				void *addr, uint64_t size)
+{
+	return amdgpu_svm_reset_attr(dev, (uint64_t)(uintptr_t)addr, size);
+}
+
+int amdgpu_svm_set_prefetch_loc(amdgpu_device_handle dev,
+				void *addr, uint64_t size, uint32_t location)
+{
+	struct drm_amdgpu_svm_attribute attr = {
+		AMDGPU_SVM_ATTR_PREFETCH_LOC, location
+	};
+
+	return amdgpu_svm_set_attr(dev, (uint64_t)(uintptr_t)addr,
+				   size, 1, &attr);
+}
+
+int amdgpu_svm_get_prefetch_loc(amdgpu_device_handle dev,
+				void *addr, uint64_t size,
+				uint32_t *out)
+{
+	struct drm_amdgpu_svm_attribute attr = {
+		AMDGPU_SVM_ATTR_PREFETCH_LOC, 0
+	};
+	int r;
+
+	r = amdgpu_svm_get_attr(dev, (uint64_t)(uintptr_t)addr,
+				size, 1, &attr);
+	if (r == 0)
+		*out = attr.value;
+	return r;
+}
+
+int amdgpu_svm_sdma_fill(amdgpu_device_handle device, uint64_t dst_va,
+			 uint32_t fill_value, uint32_t fill_size)
+{
+	cmd_context_t *ctx;
+	struct amdgpu_dma_limits limits;
+	uint64_t max_bytes;
+	uint64_t dst = dst_va;
+	uint32_t remaining = fill_size;
+	int r = 0;
+
+	amdgpu_dma_limits_query(device, &limits);
+	max_bytes = amdgpu_dma_max_bytes(&limits, AMDGPU_HW_IP_DMA);
+
+	ctx = cmd_context_create(device, AMD_IP_DMA, 0, false);
+	if (!ctx)
+		return -ENODEV;
+
+	while (remaining > 0) {
+		uint32_t chunk = remaining > max_bytes ?
+				 (uint32_t)max_bytes : remaining;
+
+		r = cmd_submit_const_fill(ctx, dst, chunk, fill_value);
+		if (r)
+			break;
+
+		dst += chunk;
+		remaining -= chunk;
+	}
+
+	cmd_context_destroy(ctx);
+	return r;
+}
+
+int amdgpu_svm_sdma_copy(amdgpu_device_handle device, uint64_t dst_va,
+			 uint64_t src_va, uint32_t copy_size)
+{
+	cmd_context_t *ctx;
+	struct amdgpu_dma_limits limits;
+	uint64_t max_bytes;
+	uint64_t dst = dst_va;
+	uint64_t src = src_va;
+	uint32_t remaining = copy_size;
+	int r = 0;
+
+	amdgpu_dma_limits_query(device, &limits);
+	max_bytes = amdgpu_dma_max_bytes(&limits, AMDGPU_HW_IP_DMA);
+
+	ctx = cmd_context_create(device, AMD_IP_DMA, 0, false);
+	if (!ctx)
+		return -ENODEV;
+
+	while (remaining > 0) {
+		uint32_t chunk = remaining > max_bytes ?
+				 (uint32_t)max_bytes : remaining;
+
+		r = cmd_submit_copy_linear(ctx, src, dst, chunk);
+		if (r)
+			break;
+
+		src += chunk;
+		dst += chunk;
+		remaining -= chunk;
+	}
+
+	cmd_context_destroy(ctx);
+	return r;
+}
diff --git a/lib/amdgpu/amd_svm.h b/lib/amdgpu/amd_svm.h
new file mode 100644
index 000000000..588feb3da
--- /dev/null
+++ b/lib/amdgpu/amd_svm.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: MIT
+ * Copyright 2026 Advanced Micro Devices, Inc.
+ */
+
+#ifndef AMD_SVM_H
+#define AMD_SVM_H
+
+#include "drmtest.h"
+#include <amdgpu.h>
+#include <amdgpu_drm.h>
+
+/*
+ * The IGT-specific convenience helpers below are thin wrappers around that
+ * core libdrm svm set/get/reset APIs.
+ */
+
+int amdgpu_svm_register_range(amdgpu_device_handle dev,
+			      void *addr, uint64_t size, uint32_t nattr,
+			      struct drm_amdgpu_svm_attribute *attrs);
+
+int amdgpu_svm_unregister_range(amdgpu_device_handle dev,
+				void *addr, uint64_t size);
+
+int amdgpu_svm_set_prefetch_loc(amdgpu_device_handle dev,
+				void *addr, uint64_t size, uint32_t location);
+int amdgpu_svm_get_prefetch_loc(amdgpu_device_handle dev,
+				void *addr, uint64_t size,
+				uint32_t *out);
+
+/*
+ * Fill / copy an SVM range from the GPU's SDMA engine. @dst_va (and @src_va
+ * for copy) are raw SVM virtual addresses, so they may be SVM VAs with no
+ * backing amdgpu BO.
+ * Returns 0 on success, non-zero on failure.
+ */
+int amdgpu_svm_sdma_fill(amdgpu_device_handle device, uint64_t dst_va,
+			 uint32_t fill_value, uint32_t fill_size);
+int amdgpu_svm_sdma_copy(amdgpu_device_handle device, uint64_t dst_va,
+			 uint64_t src_va, uint32_t copy_size);
+
+#endif /* AMD_SVM_H */
diff --git a/lib/meson.build b/lib/meson.build
index 3001b473e..6e1d6634c 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -180,6 +180,7 @@ if libdrm_amdgpu.found()
 	lib_deps += libdrm_amdgpu
 	lib_sources += [
 		'amdgpu/amd_memory.c',
+		'amdgpu/amd_svm.c',
 		'amdgpu/amd_command_submission.c',
 		'amdgpu/amd_compute.c',
 		'amdgpu/amd_cs_radv.c',
-- 
2.34.1

