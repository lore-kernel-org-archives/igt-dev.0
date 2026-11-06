Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F200606A326
	for <igt-dev@archiver.kernel.org>; Fri,  6 Nov 2026 13:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=EemkeZTp
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1E3110FFD7;
	Fri,  6 Nov 2026 13:17:21 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011028.outbound.protection.outlook.com [52.101.57.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 141F510E4FE
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Nov 2026 13:13:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K/Kmc2SggQDwmgN3xYBUP0rjQ04sfmjKrkc3jpJIfAE1eq3Ylg2gjbqWWEPKSFezBAuIlOp/G5uvl1CwGSbkdtwf+A/Am1oHJObYDT15Pguwo0nFId0YT+JETvcCbl06jJf1eqeej3kP0eUysGK28Qu6+L46o1Iij2NWrOBFa0MdDouaJH+liDRhwwBQEEikK7nUPu0XY/Nys8d/F9+6HT75yHj7FtzDpAaYDw9/JA1Od0MDyORqCNzpCxEcMoZZpoRwIe0ue4VCOXd88zdM2fIx85tSfQXht0OAUUf74jKKH+F7qO0J8uUBxzLuVAM7XKIAksOPVXjVp7tzBzBJLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yzVW29LhU2BEpO3eNhIl9baLN75RcfIGm/Px6UJFDaE=;
 b=qOmtEzVfidruDUbujTST4P8X3SzaO60irVo229gj0st7c02bcJZ9T4TUiiQwouUdnqOW2Ckvq4SmRYU+lhHdUxUTmjMXlex7wlXOPbj7zfScjHA80rvvgYGTrbsqZ0JVW3gZPEL7U34GmX69DWU++mBXz83OUEyqVFuzRydL5xPyUVVpBWa5RpE3IBt3Gv4qpADNF4I0cVGry2qH8m8s4eyfC3Va9ed9s5vf2Unc1JBQU6sGnGsqG4yXm2GSTYsY7sUjFTJ3Li5atJ0wbPMoBGHIb0DB/mo8XMhUvBWnBOr1RVT90fGWgJByOnYMxL+orq/1CxBTxRu0/167i9iztw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yzVW29LhU2BEpO3eNhIl9baLN75RcfIGm/Px6UJFDaE=;
 b=EemkeZTpDks9wG+SCejwpAW3v5WJpkgVjhbTo8e6s7K/7S5ublTKsT9R0J3ZNGP84VY8oQ7UWGx8dkp24+7exQl7KN/TFUxZY6NVyCehICBJ/UItYY5LdxFK0+WMEG13h9se0Mr8McFXWh1nB1S8QXUVAZkLDoVBQ9+jgYhMEmI=
Received: from MW4PR04CA0061.namprd04.prod.outlook.com (2603:10b6:303:6b::6)
 by CY5PR12MB6298.namprd12.prod.outlook.com (2603:10b6:930:21::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 13:13:45 +0000
Received: from SJ5PEPF00000205.namprd05.prod.outlook.com
 (2603:10b6:303:6b:cafe::17) by MW4PR04CA0061.outlook.office365.com
 (2603:10b6:303:6b::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 13:13:45 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF00000205.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 13:13:45 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 07:13:44 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 07:13:44 -0600
Received: from junhua-PC.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Fri, 6 Nov 2026 07:13:41 -0600
From: Junhua Shen <Junhua.Shen@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Vitaly Prosyak
 <vitaly.prosyak@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Christian
 Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>, Oak Zeng
 <Oak.Zeng@amd.com>, Xiaogang Chen <Xiaogang.Chen@amd.com>, Jenny Liu
 <Jenny-Jing.Liu@amd.com>, Honglei Huang <honglei1.huang@amd.com>, "Zhu
 Lingshan" <lingshan.zhu@amd.com>, Yiru Ma <yiru.ma@amd.com>, Junhua Shen
 <Junhua.Shen@amd.com>
Subject: [PATCH i-g-t v3 2/3] lib/amdgpu: add SVM helper library
Date: Fri, 6 Nov 2026 21:13:28 +0800
Message-ID: <20261106131329.73236-3-Junhua.Shen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106131329.73236-1-Junhua.Shen@amd.com>
References: <20260825072300.16348-1-Junhua.Shen@amd.com>
 <20261106131329.73236-1-Junhua.Shen@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000205:EE_|CY5PR12MB6298:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c1696c2-5e59-412c-187a-08df3c07c962
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|11063799006|4143699003|56012099006|261021130227099003|261022115727099003|261021135927099003|261022113327099003|261021123027099003|261022105027099003|261021121427099003|261022075727099003|261009223027099003|261009221227099003|261009223327099003|261009221727099003|261009220027099003|261102123227099003|261026140227099003|261026130827099003|261026121527099003|261028144727099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: JaWLAXyC/dBrPHlBS0/6ZDmzFOljPHZlpCvubcl4q1SjtVsJOtxf4Jm9NQOalWFZc90m+TmN/MMc/XrIoGIOSPbDqZPDRIxbAeEvro89Dcwl1JxMnq90ZeTyWDW+P/4JsCyr5pUkUKOr5PpEF4WxAKDLor7n2r1iWeDwzUVe9lYMKQlxZoywrfnsPiOwlQ/RZvlw/gPYNFl1wV+o2iuWkOKf8aAeFS+PJ4/RQcrYBch7n7k+cG0Zrkg9LGtRFN22L9lHbzlH5kE1ANPn9eAxgdJ1xmATZxQTB4rsgygutpi3vfg+8k+ylDfGJ5sfXLT1VOS9xOYB+hPSm1HTCViX/jtfQVordoTcgzaqpHndt/baw598RUaJyJpRnnw/WJxULeLOfZQb/3wt+mkJWcux/GVranNuUFQMnTYxRs2PjEm+lJFHgJgwOVCrddU5VOHGbrmt9M7mu4OcxU7qaSPxmn5SBtkjoq29IPT3yY8YNtghtwDF0h8kvdnATu5+WCV1uhLSvtn35lzQbThFpebaPs2FSUhXGSQNAkeQtbEp4fApQBZeV3HFAstnKh0xakDpRJVOIEAvpsZJlPZvE7M/1gno7UlsSrJf0TVI2qBPA6lITQR84dWZQYAc0EsPz9P2f5u61V/bCeHEbMcia9ARhMb7gU1Owdw0wmu92xpJZes+7aY7iBdpv8qX0LnctiovRrhRLnQT5fM+nJIVEJrJ9g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(11063799006)(4143699003)(56012099006)(261021130227099003)(261022115727099003)(261021135927099003)(261022113327099003)(261021123027099003)(261022105027099003)(261021121427099003)(261022075727099003)(261009223027099003)(261009221227099003)(261009223327099003)(261009221727099003)(261009220027099003)(261102123227099003)(261026140227099003)(261026130827099003)(261026121527099003)(261028144727099003)(10067099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: xWl+XqPUGiIYGsW22TBunPW/n5iaRV22yCkr/eltxd7w6/BNVkzUaZeI/Jluryst6qj7fkd80geUV0kvTyu6YtDwkr0mmJPSj/O11aETHOUVPcVr3k1wfPm9OPqkq49ZRc1SETTbLrO4F4m0U+2W68/dDUbelt38yZ4H0DAvP+zGhDUIsfLlgba9Uy0rhoxnJfT0cSr1/nHQhUIylfEGSwSz/fvQgJ9VgllMVJu5/EfrHRZ+u+/O60MqRFDVOy5hCbZHlfnMYKwQPExUmHaEbOcSbG1JPaKxRULOQG9C2jKhqD8EMjlh/UB80CEwcOJEuIEYiMRLnCyPe0XjoRUtQ2LqWe611pnEac5gtbgEMMJ6u8IEa3ty7AoCzPnTaG1UpnpxWeg9RQhL6vXbbnE4YpkUrtW82gsbqAg2xdzFhhxbXSuYicDzXtnzMYuGwzjR
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 13:13:45.0191 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c1696c2-5e59-412c-187a-08df3c07c962
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000205.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6298
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add SVM (Shared Virtual Memory) helpers on top of the libdrm
amdgpu_svm_* wrappers: register/unregister a range, set/get its
prefetch location, and SDMA fill/copy on SVM addresses.

Also sort the amdgpu lib_sources list in lib/meson.build alphabetically.

Signed-off-by: Junhua Shen <Junhua.Shen@amd.com>
---
 lib/amdgpu/amd_svm.c | 197 +++++++++++++++++++++++++++++++++++++++++++
 lib/amdgpu/amd_svm.h |  34 ++++++++
 lib/meson.build      |  32 ++++---
 3 files changed, 251 insertions(+), 12 deletions(-)
 create mode 100644 lib/amdgpu/amd_svm.c
 create mode 100644 lib/amdgpu/amd_svm.h

diff --git a/lib/amdgpu/amd_svm.c b/lib/amdgpu/amd_svm.c
new file mode 100644
index 000000000..15800ffea
--- /dev/null
+++ b/lib/amdgpu/amd_svm.c
@@ -0,0 +1,197 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2026 Advanced Micro Devices, Inc.
+ */
+
+#include <errno.h>
+
+#include "igt.h"
+#include "amd_command_submission.h"
+#include "amd_ip_blocks.h"
+#include "amd_memory.h"
+#include "amd_PM4.h"
+#include "amd_sdma.h"
+#include "amd_svm.h"
+
+/**
+ * amdgpu_svm_register_range:
+ * @dev: amdgpu device handle
+ * @addr: CPU virtual address of the range, used as the SVM (Shared Virtual
+ *        Memory) GPU virtual address
+ * @size: size of the range in bytes
+ * @nattr: number of entries in @attrs
+ * @attrs: attributes to apply to the range
+ *
+ * Register [@addr, @addr + @size) with SVM and apply @attrs to it.
+ *
+ * Returns: 0 on success, negative errno on failure.
+ */
+int amdgpu_svm_register_range(amdgpu_device_handle dev,
+			      void *addr, uint64_t size, uint32_t nattr,
+			      struct drm_amdgpu_svm_attribute *attrs)
+{
+	return amdgpu_svm_set_attr(dev, (uint64_t)(uintptr_t)addr,
+				    size, nattr, attrs);
+}
+
+/**
+ * amdgpu_svm_unregister_range:
+ * @dev: amdgpu device handle
+ * @addr: start address of the range
+ * @size: size of the range in bytes
+ *
+ * Reset all SVM attributes of [@addr, @addr + @size) to their defaults.
+ *
+ * Returns: 0 on success, negative errno on failure.
+ */
+int amdgpu_svm_unregister_range(amdgpu_device_handle dev,
+				void *addr, uint64_t size)
+{
+	return amdgpu_svm_reset_attr(dev, (uint64_t)(uintptr_t)addr, size);
+}
+
+/**
+ * amdgpu_svm_set_prefetch_loc:
+ * @dev: amdgpu device handle
+ * @addr: start address of the range
+ * @size: size of the range in bytes
+ * @location: one of AMDGPU_SVM_LOCATION_*
+ *
+ * Set AMDGPU_SVM_ATTR_PREFETCH_LOC of the range to @location, which migrates
+ * the range to that location.
+ *
+ * Returns: 0 on success, negative errno on failure.
+ */
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
+/**
+ * amdgpu_svm_get_prefetch_loc:
+ * @dev: amdgpu device handle
+ * @addr: start address of the range
+ * @size: size of the range in bytes
+ * @out: returns the current AMDGPU_SVM_LOCATION_* of the range
+ *
+ * Query AMDGPU_SVM_ATTR_PREFETCH_LOC of the range. @out is only written on
+ * success.
+ *
+ * Returns: 0 on success, negative errno on failure.
+ */
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
+				size, 1, &attr, NULL);
+	if (r == 0)
+		*out = attr.value;
+	return r;
+}
+
+/**
+ * amdgpu_svm_sdma_fill:
+ * @device: amdgpu device handle
+ * @dst_va: destination GPU virtual address, may be an SVM address with no
+ *          backing amdgpu BO
+ * @fill_value: 32-bit value to fill with
+ * @fill_size: number of bytes to fill
+ *
+ * Fill @fill_size bytes at @dst_va with @fill_value using SDMA, splitting the
+ * request into chunks no larger than the SDMA per-packet limit.
+ *
+ * Returns: 0 on success, negative errno on failure.
+ */
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
+/**
+ * amdgpu_svm_sdma_copy:
+ * @device: amdgpu device handle
+ * @dst_va: destination GPU virtual address, may be an SVM address with no
+ *          backing amdgpu BO
+ * @src_va: source GPU virtual address, may be an SVM address with no
+ *          backing amdgpu BO
+ * @copy_size: number of bytes to copy
+ *
+ * Copy @copy_size bytes from @src_va to @dst_va using SDMA, splitting the
+ * request into chunks no larger than the SDMA per-packet limit.
+ *
+ * Returns: 0 on success, negative errno on failure.
+ */
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
index 000000000..13a7c28b7
--- /dev/null
+++ b/lib/amdgpu/amd_svm.h
@@ -0,0 +1,34 @@
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
+ * Convenience helpers for SVM (Shared Virtual Memory) on top of the core
+ * libdrm SVM set/get/reset APIs.
+ */
+
+int amdgpu_svm_register_range(amdgpu_device_handle dev,
+			      void *addr, uint64_t size, uint32_t nattr,
+			      struct drm_amdgpu_svm_attribute *attrs);
+int amdgpu_svm_unregister_range(amdgpu_device_handle dev,
+				void *addr, uint64_t size);
+
+int amdgpu_svm_set_prefetch_loc(amdgpu_device_handle dev,
+				void *addr, uint64_t size, uint32_t location);
+int amdgpu_svm_get_prefetch_loc(amdgpu_device_handle dev,
+				void *addr, uint64_t size,
+				uint32_t *out);
+
+int amdgpu_svm_sdma_fill(amdgpu_device_handle device, uint64_t dst_va,
+			 uint32_t fill_value, uint32_t fill_size);
+int amdgpu_svm_sdma_copy(amdgpu_device_handle device, uint64_t dst_va,
+			 uint64_t src_va, uint32_t copy_size);
+
+#endif /* AMD_SVM_H */
diff --git a/lib/meson.build b/lib/meson.build
index 3001b473e..3a747088f 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -179,27 +179,27 @@ endif
 if libdrm_amdgpu.found()
 	lib_deps += libdrm_amdgpu
 	lib_sources += [
-		'amdgpu/amd_memory.c',
 		'amdgpu/amd_command_submission.c',
 		'amdgpu/amd_compute.c',
+		'amdgpu/amd_cp_dma.c',
 		'amdgpu/amd_cs_radv.c',
+		'amdgpu/amd_deadlock_helpers.c',
 		'amdgpu/amd_gfx.c',
+		'amdgpu/amd_gfx_v8_0.c',
 		'amdgpu/amd_ip_blocks.c',
 		'amdgpu/amd_ip_blocks_ex.c',
-		'amdgpu/shaders/amd_shaders.c',
-		'amdgpu/amd_gfx_v8_0.c',
-		'amdgpu/compute_utils/amd_gca.c',
-		'amdgpu/compute_utils/amd_dispatch_helpers.c',
-		'amdgpu/amd_deadlock_helpers.c',
-		'amdgpu/amd_pci_unplug.c',
-		'amdgpu/amd_shared_process.c',
-		'amdgpu/xalloc.h',
-		'amdgpu/amd_cp_dma.c',
+		'amdgpu/amd_jpeg_shared.c',
 		'amdgpu/amd_mem_leak.c',
+		'amdgpu/amd_memory.c',
 		'amdgpu/amd_mmd_shared.c',
-		'amdgpu/amd_jpeg_shared.c',
+		'amdgpu/amd_pci_unplug.c',
+		'amdgpu/amd_shared_process.c',
 		'amdgpu/amd_utils.c',
-		'amdgpu/amd_vcn_shared.c'
+		'amdgpu/amd_vcn_shared.c',
+		'amdgpu/compute_utils/amd_dispatch_helpers.c',
+		'amdgpu/compute_utils/amd_gca.c',
+		'amdgpu/shaders/amd_shaders.c',
+		'amdgpu/xalloc.h'
 	]
 	if libdrm_amdgpu.version().version_compare('> 2.4.99')
 		lib_sources +=[ 'amdgpu/compute_utils/amd_dispatch.c',]
@@ -207,6 +207,14 @@ if libdrm_amdgpu.found()
 		warning('libdrm <= 2.4.99 found, amdgpu_cs_query_reset_state2 not applicable')
 	endif
 
+	have_amdgpu_svm = cc.has_function('amdgpu_svm_set_attr',
+					  dependencies : libdrm_amdgpu)
+	if have_amdgpu_svm
+		lib_sources += [ 'amdgpu/amd_svm.c' ]
+	else
+		warning('libdrm_amdgpu without SVM support found, amd_svm not applicable')
+	endif
+
 	# Optional runtime ISA assembly via external llvm-mc tool (no lib dependency needed)
 	llvm_mc_prog = find_program(['llvm-mc-20','llvm-mc-19','llvm-mc-18','llvm-mc'], required : false)
 	if llvm_mc_prog.found()
-- 
2.34.1

