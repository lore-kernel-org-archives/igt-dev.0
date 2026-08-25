Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B7D2C61DB6
	for <igt-dev@archiver.kernel.org>; Tue, 25 Aug 2026 07:25:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C534410E817;
	Tue, 25 Aug 2026 07:25:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xQwIO/lx";
	dkim-atps=neutral
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010034.outbound.protection.outlook.com [52.101.85.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A3510E14D
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Aug 2026 07:23:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oKJ00GnpWZTRN2w1H/KfwwXM4nBbX+jJk55ZurZiWtwHY0p+vkfiy4Z8Hyab8doVanS7mwDUqRg7vLHY7FMfVkX6JDB76nZUXuw10jtixQ3Ov+e1iiJB8JMvXvLKwwzEYvOulVtZMNEKeUMtLzfYokHCNygcQ+8prHdi0DjZq27YrW2qJjx4qfkC+i8Vz1hzhlv0/MKOQsYOhL6BgoMDbUoLigC3jC6fUrqzxnLCPIJzUVUUiRmtwLenswKCyUfFZtbwMbIQbJxzC6nerhaimHexKkGnm9caq0ZaDHB7mUGweTZh9eTo/FsHQ5vdNWNW823fAo+/pZyNqrRawWQVFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DIcA8aJ70hDYjsz7eQhGYT7X/Jq0DQm/RXId989KgM0=;
 b=jKgKJyNH8kgt0Z6oNv9UgUdBnBdKwahMmmlebUJ9sAoPRNKQlcb56ZEgY1LBc8B7Icw2FtoWkRu6ob8qSquvzJ8XE4DX9H/OSvNZO+Du+cpIg9LOKxcycC/VJzEhJF/ToygMe+NJh086H+IMY+ydVLu0HzKeL0oq6T1yXPvazF0JJdPgY8jSe0YrMuTHP5vu7QfikEMsmWym6TF15CEb08QAiSxzlYwJaBJUojddiQq1W5t5nxPwpp17bsUGAeleR0NWno4s0lsonJ+JWn3MXzz5h7vMpeIz5CY/ix+3fbEE9neTUayXCWYDYNC7SRrMDwNpCSp+V/y8GrOWFsv2hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.90.133) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=amd.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DIcA8aJ70hDYjsz7eQhGYT7X/Jq0DQm/RXId989KgM0=;
 b=xQwIO/lxuYa7/hazpkOKKHpmSKCtVpbqrFa/uJ6QjqQwpH9RWaOl5mrOB5X6On+8/iJ0rP0pPcQpN/YDtTouaMHMte/xsO1CGbtf7Pa+jdzLw+IO134VVd9uRi1+qZaIfogz6U4Hoter6CHNABkR42eRLMttFoW1XihNQn+prK0=
Received: from MN2PR05CA0047.namprd05.prod.outlook.com (2603:10b6:208:236::16)
 by SA5PPFA403A61D8.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8da) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 07:23:16 +0000
Received: from BN1PEPF00018074.namprd04.prod.outlook.com
 (2603:10b6:208:236:cafe::17) by MN2PR05CA0047.outlook.office365.com
 (2603:10b6:208:236::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.6 via Frontend Transport; Tue, 25
 Aug 2026 07:23:15 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.90.133) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.90.133 as permitted sender)
Received: from satlexmb07.amd.com (149.199.90.133) by
 BN1PEPF00018074.mail.protection.outlook.com (10.167.245.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Tue, 25 Aug 2026 07:23:15 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 25 Aug
 2026 02:23:14 -0500
Received: from junhua-PC.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Tue, 25 Aug 2026 02:23:11 -0500
From: Junhua Shen <Junhua.Shen@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Huang Rui
 <ray.huang@amd.com>, Oak Zeng <Oak.Zeng@amd.com>, Xiaogang Chen
 <Xiaogang.Chen@amd.com>, Jenny Liu <Jenny-Jing.Liu@amd.com>, Honglei Huang
 <honglei1.huang@amd.com>, Zhu Lingshan <lingshan.zhu@amd.com>, Yiru Ma
 <yiru.ma@amd.com>, Junhua Shen <Junhua.Shen@amd.com>
Subject: [PATCH i-g-t v2 3/3] tests/amdgpu: add SVM test suite
Date: Tue, 25 Aug 2026 15:23:00 +0800
Message-ID: <20260825072300.16348-4-Junhua.Shen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260825072300.16348-1-Junhua.Shen@amd.com>
References: <20260825072300.16348-1-Junhua.Shen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018074:EE_|SA5PPFA403A61D8:EE_
X-MS-Office365-Filtering-Correlation-Id: 04027f94-dade-41bc-885d-08df0279bab8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|376014|1800799024|23010399003|82310400026|56012099006|3023799007|11063799006|6133799003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: 6SMz2AfZYeulWpAkJuktR/59B6F4JG1Z7Ke+AvIrPYV+I7on2Ujfq4elD1jOCNvNSDTn01tkqcQI5uLVoyhjHPkqOh34D5AaFVEe928BX8/yBgdQqXjvku9tmsZ+3GKuAnfmQ+8BoW5YtIdGaNyhAGs316tWBxmmy2OMYZLOVQSCIJGOeVltcHSe3zhbyTRciNdGcVpPXqvEUwOqeUe3mY+AkwysOgzdjb8ySZvXYEzPouljLGGXjjHxMYQXUlqbij9T8HgzvEJyuZR7lOKC5k9LUVZN1Qaa3jBqcnl2uq26/W8BpYSC6jYylFvSG4eVCUrX3w5MxEwlkrCgYDWdO6Vmp5KMOks4IRkThfnHV/RAWF27uO/5/fLuuxUdEwbGl04xSH678LvJkft3x/rqS3GHTXedk6+bcqIifGQ0Ku6be1IHkiZB8NNZXOszNpNk2w0SePr4dg9VBJVwh+/7iGXsqIJwHnDmnZIh7iFRx6iEW6bkiBfsuJGOF5DwPzB97EujKyX1Xvy/XDpvV6uxCkn5hmHd3sOk7hcZFyDHIXwZm2QZhZqKZYaoJK+PHzurddQDTGTBNIQdtpz4uqbDZH0Tb69f2SYyF7dHZiDdZNbe3ayJ7wvaYfxblLKes89hewaLkH5riwhpqq5uYPNRQSNiHuxg18fBvAHQIdazY0+MR48W/ca/d9cCA30rxlY9lgRmEaVO5P3cdqhKcDZf9Q==
X-Forefront-Antispam-Report: CIP:149.199.90.133; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:unknown-90-133.xilinx.com;
 CAT:NONE;
 SFS:(13230040)(36860700016)(376014)(1800799024)(23010399003)(82310400026)(56012099006)(3023799007)(11063799006)(6133799003)(18002099003)(22082099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: YsHESkcuBWNbt50IJfKXwP6AwldKpWnJvJ7VKnKQA9mGG6YnJj/WAf+hIDyncknNjYDNz/t3kd4cGwKQ9TuNbf1cQLi3QufvTYIhU2Z5kOaBsSeT+7KlIQ97k6dlIrV64pEd46NSp6nVDijcvblQ29X3PkOs/Pk4jgSiCwjQOrgsW1IjBj6R3GWyX/MJG+yI7AXDLd9mpImxg51NXxLwHXQp2ccnisAeGfYqsDgNrw4djXqHbHp49i4Z1WgM/pRJq2Hnxtmxofs5ZGz3WY+TmPb1PBpMrF2/SosJ8pSiXUpnxlBRbZ3a7CxamtT9kn7zLST6mr8ZcgGmB85acDNHEOB9HozHQa57EfNvgqH87/zsRRnnVFzAHWW25bDXWnF6xLMIsM5yVFFp7l+4gFq5/YYEAvmzqZqJjW1R0W5bOZNd0BfFyIC81h7uH2Zf75tB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 07:23:15.5065 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04027f94-dade-41bc-885d-08df0279bab8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[149.199.90.133];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00018074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFA403A61D8
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

Add the amd_svm IGT test suite exercising the amdgpu-drm-svm uapi
through the SVM helper library: system/VRAM allocation, prefetch and
migration, range split/merge, eviction and overcommit scenarios.

Most subtests are adapted from the KFD SVM test suite (KFDSVMRangeTest)
and ported to the amdgpu render-node CS path.

Signed-off-by: Junhua Shen <Junhua.Shen@amd.com>
---
 tests/amdgpu/amd_svm.c   | 1865 ++++++++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build |    1 +
 2 files changed, 1866 insertions(+)
 create mode 100644 tests/amdgpu/amd_svm.c

diff --git a/tests/amdgpu/amd_svm.c b/tests/amdgpu/amd_svm.c
new file mode 100644
index 000000000..64ba5ebad
--- /dev/null
+++ b/tests/amdgpu/amd_svm.c
@@ -0,0 +1,1865 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2026 Advanced Micro Devices, Inc.
+ */
+
+#include "lib/amdgpu/amd_memory.h"
+#include "lib/amdgpu/amd_svm.h"
+#include "lib/amdgpu/amd_PM4.h"
+#include "lib/amdgpu/amd_ip_blocks.h"
+#include "lib/amdgpu/amd_command_submission.h"
+#include "lib/amdgpu/compute_utils/amd_dispatch_helpers.h"
+#include "lib/amdgpu/amdgpu_asic_addr.h" /* FAMILY_* macros */
+
+#include <errno.h>
+#include <fcntl.h>
+#include <inttypes.h>
+#include <libdrm/amdgpu.h>
+#include <string.h>
+#include <unistd.h>
+#include <signal.h>
+#include <sys/mman.h>
+#include <sys/wait.h>
+#include <sys/ptrace.h>
+#include <sys/prctl.h>
+#include <pthread.h>
+
+static void sdma_fill_test(amdgpu_device_handle device);
+static void sdma_copy_test(amdgpu_device_handle device);
+
+/* Test cases adapted from KFDSVMRangeTest. */
+static void basic_system_mem_test(amdgpu_device_handle device);
+static void set_get_attributes_test(amdgpu_device_handle device);
+static void invalid_range_test(amdgpu_device_handle device);
+static void partial_unmap_sys_mem_test(amdgpu_device_handle device);
+static void basic_vram_test(amdgpu_device_handle device);
+static void prefetch_test(amdgpu_device_handle device);
+static void migrate_test(amdgpu_device_handle device);
+static void migrate_access_in_place_test(amdgpu_device_handle device);
+static void migrate_large_buf_test(amdgpu_device_handle device);
+static void migrate_policy_test(amdgpu_device_handle device);
+static void multi_thread_migration_test(amdgpu_device_handle device);
+static void migrate_file_backed_range_test(amdgpu_device_handle device);
+static void read_only_range_test(amdgpu_device_handle device);
+static void split_system_range_test(amdgpu_device_handle device);
+static void split_vram_range_test(amdgpu_device_handle device);
+static void prefault_partial_range_test(amdgpu_device_handle device);
+static void vram_overcommit_test(amdgpu_device_handle device);
+static void vram_overcommit_giant_range_test(amdgpu_device_handle device);
+static void evict_system_range_test(amdgpu_device_handle device);
+
+/**
+ * struct amdgpu_svm_buf - SVM buffer descriptor
+ *
+ * In SVM mode CPU VA == GPU VA.
+ *
+ * @ptr: CPU virtual address (== GPU VA, for dereferencing)
+ * @va: GPU virtual address as uint64_t (same value, cast-free)
+ * @size: buffer size in bytes
+ * @device: owning amdgpu device handle
+ * @flags: local SVM_FLAG_xxx bitmask currently applied
+ * @self_allocated: true if ptr was allocated internally (posix_memalign)
+ */
+struct amdgpu_svm_buf {
+	void *ptr;
+	uint64_t va;
+	uint64_t size;
+	amdgpu_device_handle device;
+	uint32_t flags;
+	bool self_allocated;
+};
+
+/* Local flag bits for amdgpu_svm_buf_alloc (mapped to boolean attrs). */
+#define SVM_FLAG_HOST_ACCESS  (1 << 0)
+#define SVM_FLAG_COHERENT     (1 << 1)
+#define SVM_FLAG_GPU_EXEC     (1 << 2)
+#define SVM_FLAGS_HOST_COHERENT (SVM_FLAG_HOST_ACCESS | SVM_FLAG_COHERENT)
+
+/*
+ * SVM location attributes (PREFETCH_LOC / PREFERRED_LOC) identify a GPU by
+ * its DRM render-node fd: the kernel resolves the fd to the corresponding
+ * GPU node id. A value of 0 means system memory. DEV_FD() makes that uAPI
+ * detail explicit at the call sites that pass a GPU location.
+ */
+#define DEV_FD(adev) (amdgpu_device_get_fd(adev))
+
+/*
+ * Build the SVM attribute array shared by the buffer allocator
+ * (amdgpu_svm_buf_alloc) and the lightweight range registrar (svm_register):
+ * ACCESS is always present with the caller-supplied @access value, the boolean
+ * attrs are added per @flags, and PREFETCH_LOC / PREFERRED_LOC are added when
+ * their location is >= 0 (a DRM fd for VRAM, 0 for system memory). @attrs must
+ * have room for 6 entries. Returns the number of attributes written.
+ */
+static uint32_t svm_build_attrs(struct drm_amdgpu_svm_attribute *attrs,
+				uint32_t access, uint32_t flags,
+				int prefetch_loc, int preferred_loc)
+{
+	uint32_t n = 0;
+
+	attrs[n].type  = AMDGPU_SVM_ATTR_ACCESS;
+	attrs[n].value = access;
+	n++;
+
+	if (flags & SVM_FLAG_HOST_ACCESS) {
+		attrs[n].type  = AMDGPU_SVM_ATTR_HOST_ACCESS;
+		attrs[n].value = 1;
+		n++;
+	}
+	if (flags & SVM_FLAG_COHERENT) {
+		attrs[n].type  = AMDGPU_SVM_ATTR_COHERENT;
+		attrs[n].value = 1;
+		n++;
+	}
+	if (flags & SVM_FLAG_GPU_EXEC) {
+		attrs[n].type  = AMDGPU_SVM_ATTR_GPU_EXEC;
+		attrs[n].value = 1;
+		n++;
+	}
+	if (prefetch_loc >= 0) {
+		attrs[n].type  = AMDGPU_SVM_ATTR_PREFETCH_LOC;
+		attrs[n].value = (__u32)prefetch_loc;
+		n++;
+	}
+	if (preferred_loc >= 0) {
+		attrs[n].type  = AMDGPU_SVM_ATTR_PREFERRED_LOC;
+		attrs[n].value = (__u32)preferred_loc;
+		n++;
+	}
+	return n;
+}
+
+static int amdgpu_svm_buf_alloc(struct amdgpu_svm_buf *buf,
+			 amdgpu_device_handle device,
+			 void *addr,
+			 uint64_t size,
+			 uint32_t access,
+			 uint32_t flags,
+			 int prefetch_loc,
+			 int preferred_loc)
+{
+	struct drm_amdgpu_svm_attribute svm_attrs[8];
+	size_t page_sz = sysconf(_SC_PAGE_SIZE);
+	uint32_t nattr;
+	int r;
+
+	memset(buf, 0, sizeof(*buf));
+	buf->device = device;
+	buf->size   = size;
+	buf->flags  = flags;
+
+	/* Allocate memory if caller did not provide an address */
+	if (!addr) {
+		r = posix_memalign(&buf->ptr, page_sz, size);
+		if (r)
+			return -r;
+		buf->self_allocated = true;
+	} else {
+		buf->ptr = addr;
+		buf->self_allocated = false;
+	}
+
+	buf->va = (uint64_t)(uintptr_t)buf->ptr;
+	/*
+	 * Only zero memory we allocated ourselves. Caller-provided ranges
+	 * (e.g. file-backed MAP_SHARED mappings) must not be clobbered here.
+	 */
+	if (buf->self_allocated)
+		memset(buf->ptr, 0, size);
+
+	/* Register the range with the GPU via SVM attributes */
+	nattr = svm_build_attrs(svm_attrs, access, flags,
+				prefetch_loc, preferred_loc);
+
+	r = amdgpu_svm_set_attr(device, buf->va, size, nattr, svm_attrs);
+	if (r) {
+		if (buf->self_allocated)
+			free(buf->ptr);
+		memset(buf, 0, sizeof(*buf));
+		return r;
+	}
+
+	return 0;
+}
+
+static void amdgpu_svm_buf_free(struct amdgpu_svm_buf *buf)
+{
+	if (!buf || !buf->ptr)
+		return;
+
+	/* Free backing memory if we allocated it */
+	if (buf->self_allocated)
+		free(buf->ptr);
+
+	memset(buf, 0, sizeof(*buf));
+}
+
+static int amdgpu_svm_buf_prefetch(struct amdgpu_svm_buf *buf, uint32_t location)
+{
+	if (!buf || !buf->ptr)
+		return -1;
+
+	return amdgpu_svm_set_prefetch_loc(buf->device, buf->ptr, buf->size, location);
+}
+/*
+ * amdgpu_svm_buf_fill_u32 - Fill buffer with a 32-bit pattern (u32 memset)
+ */
+static void amdgpu_svm_buf_fill_u32(struct amdgpu_svm_buf *buf, uint32_t value)
+{
+	uint32_t *p;
+	size_t i, count;
+
+	if (!buf || !buf->ptr)
+		return;
+
+	p = (uint32_t *)buf->ptr;
+	count = buf->size / sizeof(uint32_t);
+
+	for (i = 0; i < count; i++)
+		p[i] = value;
+}
+
+/*
+ * Lightweight SVM range registrar for the "range-semantics" tests that
+ * manage their own memory (mmap'd, stack, or deliberately unmapped).
+ * Unlike amdgpu_svm_buf it neither allocates nor touches the memory; it
+ * only registers @addr..+@size using the same flags/location model (see
+ * svm_build_attrs). Returns the raw amdgpu_svm_register_range() result so
+ * callers can assert success or deliberately expect failure.
+ */
+static int svm_register(amdgpu_device_handle dev, void *addr, uint64_t size,
+			uint32_t access, uint32_t flags,
+			int prefetch_loc, int preferred_loc)
+{
+	struct drm_amdgpu_svm_attribute attrs[8];
+	uint32_t nattr = svm_build_attrs(attrs, access, flags,
+					 prefetch_loc, preferred_loc);
+
+	return amdgpu_svm_register_range(dev, addr, size, nattr, attrs);
+}
+
+#define assert_eq_u32(actual, expected, fmt, ...) do {			\
+	uint32_t __a = (actual), __e = (expected);			\
+	igt_assert_f(__a == __e, fmt ": got 0x%08x, expected 0x%08x\n",	\
+		     ##__VA_ARGS__, __a, __e);				\
+} while (0)
+
+#define assert_eq_u64(actual, expected, fmt, ...) do {			\
+	uint64_t __a = (actual), __e = (expected);			\
+	igt_assert_f(__a == __e, fmt ": got 0x%lx, expected 0x%lx\n",	\
+		     ##__VA_ARGS__, (unsigned long)__a,			\
+		     (unsigned long)__e);				\
+} while (0)
+
+/* Skip test if GPU family_id < required minimum. */
+static void require_gpu_family(amdgpu_device_handle device, uint32_t family_id)
+{
+	struct amdgpu_gpu_info ginfo = {0};
+	int r;
+
+	r = amdgpu_query_gpu_info(device, &ginfo);
+	igt_assert_eq(r, 0);
+	igt_require_f(ginfo.family_id >= family_id,
+		      "Test requires GPU family >= 0x%x (got 0x%x)\n",
+		      family_id, ginfo.family_id);
+}
+
+/* Asserting wrappers for common SVM operations (defined here so they can
+ * reference the sdma_*_svm and svm_register helpers declared above).
+ */
+static void svm_buf_alloc_assert(struct amdgpu_svm_buf *buf,
+				 amdgpu_device_handle dev, void *addr,
+				 uint64_t size, uint32_t access,
+				 uint32_t flags, int prefetch, int preferred)
+{
+	int r = amdgpu_svm_buf_alloc(buf, dev, addr, size, access, flags,
+				     prefetch, preferred);
+	igt_assert_f(r == 0, "svm_buf_alloc failed: %d\n", r);
+}
+
+static void svm_buf_prefetch_assert(struct amdgpu_svm_buf *buf, uint32_t loc)
+{
+	int r = amdgpu_svm_buf_prefetch(buf, loc);
+
+	igt_assert_f(r == 0, "svm_buf_prefetch (loc=%u) failed: %d\n", loc, r);
+}
+
+static void sdma_copy_assert(amdgpu_device_handle dev, uint64_t dst,
+			     uint64_t src, uint32_t size)
+{
+	int r = amdgpu_svm_sdma_copy(dev, dst, src, size);
+
+	igt_assert_f(r == 0, "amdgpu_svm_sdma_copy failed: %d\n", r);
+}
+
+static void sdma_fill_assert(amdgpu_device_handle dev, uint64_t dst,
+			     uint32_t val, uint32_t size)
+{
+	int r = amdgpu_svm_sdma_fill(dev, dst, val, size);
+
+	igt_assert_f(r == 0, "amdgpu_svm_sdma_fill failed: %d\n", r);
+}
+
+static void compute_copy_assert(amdgpu_device_handle dev,
+				uint64_t src_va, uint64_t dst_va)
+{
+	int r;
+
+	igt_info("GPU SVM copy: src VA=0x%llx -> dst VA=0x%llx\n",
+		 (unsigned long long)src_va, (unsigned long long)dst_va);
+	r = amdgpu_compute_copy_dword(dev, src_va, dst_va);
+	igt_assert_f(r == 0, "amdgpu_compute_copy_dword failed: %d\n", r);
+}
+
+static void *svm_mmap_anon(size_t size)
+{
+	void *ptr = mmap(NULL, size, PROT_READ | PROT_WRITE,
+			 MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
+
+	igt_assert_f(ptr != MAP_FAILED, "mmap(%zu) failed: %s\n",
+		     size, strerror(errno));
+	return ptr;
+}
+
+static void munmap_assert(void *ptr, size_t size)
+{
+	igt_assert_eq(munmap(ptr, size), 0);
+}
+
+/*
+ * Isolated test for amdgpu_svm_sdma_fill: NO prefetch, NO migration.
+ *
+ * Allocates a plain system-memory SVM range and fills it via SDMA at a
+ * series of increasing sizes (single page up to 256 MB).
+ */
+static void sdma_fill_test(amdgpu_device_handle device)
+{
+	static const uint32_t sizes[] = {
+		4096,			/* single page   */
+		2U << 20,		/* 2 MB          */
+		4U << 20,		/* 4 MB          */
+		16U << 20,		/* 16 MB         */
+		64U << 20,		/* 64 MB         */
+		256U << 20,		/* 256 MB        */
+	};
+	uint32_t svm_flags = SVM_FLAGS_HOST_COHERENT;
+	struct amdgpu_dma_limits limits;
+	uint64_t chunk_bytes;
+	uint64_t vram_size;
+	size_t n;
+
+	require_gpu_family(device, FAMILY_AI);
+
+	vram_size = get_available_vram(device);
+	igt_require_f(vram_size > 0, "No VRAM found, skipping test\n");
+
+	amdgpu_dma_limits_query(device, &limits);
+	chunk_bytes = amdgpu_dma_max_bytes(&limits, AMDGPU_HW_IP_DMA);
+
+	for (n = 0; n < ARRAY_SIZE(sizes); n++) {
+		struct amdgpu_svm_buf buf = {0};
+		uint32_t size = sizes[n];
+		uint32_t *p;
+		uint32_t i;
+
+		igt_info("sdma-fill: size %u bytes (%.1f MB), %u chunk(s)\n",
+			 size, size / (1024.0 * 1024.0),
+			 (unsigned int)((size + chunk_bytes - 1) / chunk_bytes));
+
+		svm_buf_alloc_assert(&buf, device, NULL, size,
+				     AMDGPU_SVM_ACCESS_ALLOW_MIGRATE, svm_flags,
+				     -1, -1);
+		p = (uint32_t *)buf.ptr;
+
+		/* Fill via SDMA only -- the range is first-touch system memory. */
+		sdma_fill_assert(device, buf.va, 0x55AAAA55, size);
+
+		/* CPU verify one dword per page. */
+		for (i = 0; i < size / sizeof(uint32_t); i += 1024)
+			assert_eq_u32(p[i], 0x55AAAA55,
+				      "sdma-fill size=%u p[%u]", size, i);
+
+		igt_info("sdma-fill: size %u OK\n", size);
+		amdgpu_svm_buf_free(&buf);
+	}
+
+	igt_info("sdma-fill-isolated: PASSED\n");
+}
+
+/*
+ * Isolated test for amdgpu_svm_sdma_copy: NO prefetch, NO migration.
+ *
+ * Allocates two plain system-memory SVM ranges (src, dst), fills src via
+ * CPU with a sequential pattern, then copies src -> dst via SDMA at a
+ * series of increasing sizes (single page up to 256 MB) and verifies dst.
+ */
+static void sdma_copy_test(amdgpu_device_handle device)
+{
+	static const uint32_t sizes[] = {
+		4096,			/* single page   */
+		2U << 20,		/* 2 MB          */
+		4U << 20,		/* 4 MB          */
+		16U << 20,		/* 16 MB         */
+		64U << 20,		/* 64 MB         */
+		256U << 20,		/* 256 MB        */
+	};
+	uint32_t svm_flags = SVM_FLAGS_HOST_COHERENT;
+	struct amdgpu_dma_limits limits;
+	uint64_t chunk_bytes;
+	uint64_t vram_size;
+	size_t n;
+
+	require_gpu_family(device, FAMILY_AI);
+
+	vram_size = get_available_vram(device);
+	igt_require_f(vram_size > 0, "No VRAM found, skipping test\n");
+
+	amdgpu_dma_limits_query(device, &limits);
+	chunk_bytes = amdgpu_dma_max_bytes(&limits, AMDGPU_HW_IP_DMA);
+
+	for (n = 0; n < ARRAY_SIZE(sizes); n++) {
+		struct amdgpu_svm_buf src = {0}, dst = {0};
+		uint32_t size = sizes[n];
+		uint32_t *ps, *pd;
+		uint32_t i;
+
+		igt_info("sdma-copy: size %u bytes (%.1f MB), %u chunk(s)\n",
+			 size, size / (1024.0 * 1024.0),
+			 (unsigned int)((size + chunk_bytes - 1) / chunk_bytes));
+
+		svm_buf_alloc_assert(&src, device, NULL, size,
+				     AMDGPU_SVM_ACCESS_ALLOW_MIGRATE, svm_flags,
+				     -1, -1);
+		svm_buf_alloc_assert(&dst, device, NULL, size,
+				     AMDGPU_SVM_ACCESS_ALLOW_MIGRATE, svm_flags,
+				     -1, -1);
+		igt_info("sdma-copy: src.va=0x%lx dst.va=0x%lx\n",
+			 (unsigned long)src.va, (unsigned long)dst.va);
+		ps = (uint32_t *)src.ptr;
+		pd = (uint32_t *)dst.ptr;
+
+		/* CPU fill src with a sequential pattern (one dword per page). */
+		for (i = 0; i < size / sizeof(uint32_t); i += 1024)
+			ps[i] = i;
+
+		/* Copy src -> dst via SDMA; dst is first-touch system memory. */
+		sdma_copy_assert(device, dst.va, src.va, size);
+
+		/* CPU verify one dword per page. */
+		for (i = 0; i < size / sizeof(uint32_t); i += 1024)
+			assert_eq_u32(pd[i], i,
+				      "sdma-copy size=%u dst[%u]", size, i);
+
+		igt_info("sdma-copy: size %u OK\n", size);
+		amdgpu_svm_buf_free(&src);
+		amdgpu_svm_buf_free(&dst);
+	}
+
+	igt_info("sdma-copy-isolated: PASSED\n");
+}
+
+/* Copy one dword src->dst via compute shader using SVM system memory. */
+static void basic_system_mem_test(amdgpu_device_handle device)
+{
+	size_t page_sz = sysconf(_SC_PAGE_SIZE);
+	struct amdgpu_svm_buf src = {0}, dst = {0};
+	uint32_t svm_flags = SVM_FLAGS_HOST_COHERENT;
+
+	svm_buf_alloc_assert(&src, device, NULL, page_sz,
+			     AMDGPU_SVM_ACCESS_ALLOW_MIGRATE, svm_flags, -1, -1);
+	svm_buf_alloc_assert(&dst, device, NULL, page_sz,
+			     AMDGPU_SVM_ACCESS_ALLOW_MIGRATE, svm_flags, -1, -1);
+
+	/* Fill src with test pattern */
+	amdgpu_svm_buf_fill_u32(&src, 0x01010101);
+
+	/* Dispatch: copy src[0] -> dst[0] via SVM VAs */
+	compute_copy_assert(device, src.va, dst.va);
+
+	assert_eq_u32(((uint32_t *)dst.ptr)[0], 0x01010101, "basic-system-mem dst[0]");
+	igt_info("basic-system-mem: PASSED\n");
+
+	amdgpu_svm_buf_free(&src);
+	amdgpu_svm_buf_free(&dst);
+}
+
+/* Verify SVM attribute set/get round-trip and defaults. */
+static void set_get_attributes_test(amdgpu_device_handle device)
+{
+	size_t buf_size = sysconf(_SC_PAGE_SIZE);
+	int fd = DEV_FD(device);
+	const __u32 n_attrs = 7;
+	char *buf;
+	int r, i;
+
+	struct drm_amdgpu_svm_attribute output_attrs[7];
+	struct drm_amdgpu_svm_attribute input_attrs[7] = {
+		{ AMDGPU_SVM_ATTR_PREFETCH_LOC,  (uint32_t)fd },
+		{ AMDGPU_SVM_ATTR_PREFERRED_LOC, (uint32_t)fd },
+		{ AMDGPU_SVM_ATTR_HOST_ACCESS,   1 },
+		{ AMDGPU_SVM_ATTR_GPU_EXEC,      1 },
+		{ AMDGPU_SVM_ATTR_COHERENT,      1 },
+		{ AMDGPU_SVM_ATTR_GRANULARITY,   0x3F },
+		{ AMDGPU_SVM_ATTR_ACCESS,        AMDGPU_SVM_ACCESS_ALLOW_MIGRATE },
+	};
+
+	/*
+	 * Expected defaults:
+	 *   PREFETCH_LOC  -> UNDEFINED
+	 *   PREFERRED_LOC -> UNDEFINED
+	 *   HOST_ACCESS   -> 0
+	 *   GPU_EXEC      -> 0
+	 *   COHERENT      -> 0
+	 *   GRANULARITY   -> 9 (may vary)
+	 *   ACCESS        -> INACCESSIBLE (depends on XNACK mode)
+	 */
+	const __u32 expected_defaults[7] = {
+		0xffffffff,	/* PREFETCH_LOC:  UNDEFINED */
+		0xffffffff,	/* PREFERRED_LOC: UNDEFINED */
+		0,		/* HOST_ACCESS:   default off */
+		0,		/* GPU_EXEC:      default off */
+		0,		/* COHERENT:      default off */
+		9,		/* GRANULARITY:   default */
+		AMDGPU_SVM_ACCESS_INACCESSIBLE,	/* ACCESS: default */
+	};
+
+	/* Allocate buffer */
+	buf = svm_mmap_anon(buf_size);
+
+	/* Phase 1: query default attributes */
+	memcpy(output_attrs, input_attrs,
+	       n_attrs * sizeof(struct drm_amdgpu_svm_attribute));
+	r = amdgpu_svm_get_attr(device, (uint64_t)(uintptr_t)buf, buf_size,
+				n_attrs, output_attrs);
+	igt_assert_eq(r, 0);
+
+	for (i = 0; i < (int)n_attrs; i++) {
+		/* Granularity default can vary, skip the check */
+		if (output_attrs[i].type == AMDGPU_SVM_ATTR_GRANULARITY)
+			continue;
+
+		igt_info("  attr[%d] type=0x%x  value=0x%x  "
+			 "expected=0x%x\n",
+			 i, output_attrs[i].type,
+			 output_attrs[i].value,
+			 expected_defaults[i]);
+
+		if (output_attrs[i].type == AMDGPU_SVM_ATTR_ACCESS) {
+			/* Default depends on XNACK: INACCESSIBLE or ALLOW_MIGRATE */
+			igt_assert_f(
+			    output_attrs[i].value == AMDGPU_SVM_ACCESS_INACCESSIBLE ||
+			    output_attrs[i].value == AMDGPU_SVM_ACCESS_ALLOW_MIGRATE,
+			    "attr[%d] default ACCESS value 0x%x unexpected\n",
+			    i, output_attrs[i].value);
+		} else {
+			igt_assert_f(
+			    output_attrs[i].value == expected_defaults[i],
+			    "attr[%d] type=0x%x default value 0x%x != "
+			    "expected 0x%x\n",
+			    i, output_attrs[i].type,
+			    output_attrs[i].value,
+			    expected_defaults[i]);
+		}
+	}
+	igt_info("set-get-attributes: Phase 1 PASSED (defaults verified)\n");
+
+	/* Phase 2: set attributes, then read back and verify */
+	r = amdgpu_svm_set_attr(device, (uint64_t)(uintptr_t)buf, buf_size, n_attrs, input_attrs);
+	igt_assert_f(r == 0, "amdgpu_svm_set_attr failed: %d\n", r);
+
+	/* Read them back */
+	memcpy(output_attrs, input_attrs,
+	       n_attrs * sizeof(struct drm_amdgpu_svm_attribute));
+	r = amdgpu_svm_get_attr(device, (uint64_t)(uintptr_t)buf, buf_size,
+				n_attrs, output_attrs);
+	igt_assert_eq(r, 0);
+
+	for (i = 0; i < (int)n_attrs; i++) {
+		igt_info("  attr[%d] type=0x%x  input.value=0x%x  "
+			 "output.value=0x%x\n",
+			 i, output_attrs[i].type,
+			 input_attrs[i].value,
+			 output_attrs[i].value);
+
+		if (output_attrs[i].type == AMDGPU_SVM_ATTR_PREFETCH_LOC ||
+		    output_attrs[i].type == AMDGPU_SVM_ATTR_PREFERRED_LOC) {
+			/* Kernel maps fd -> gpuid; accept any valid GPU location */
+			igt_assert_f(
+			    output_attrs[i].value != 0 &&
+			    output_attrs[i].value != 0xffffffff,
+			    "attr[%d] type=0x%x location 0x%x is "
+			    "SYSMEM or UNDEFINED after setting to GPU\n",
+			    i, output_attrs[i].type,
+			    output_attrs[i].value);
+		} else {
+			/* Boolean attrs, GRANULARITY, ACCESS: exact match */
+			igt_assert_f(
+			    input_attrs[i].value ==
+			    output_attrs[i].value,
+			    "attr[%d] type=0x%x value mismatch: "
+			    "set 0x%x, got 0x%x\n",
+			    i, output_attrs[i].type,
+			    input_attrs[i].value,
+			    output_attrs[i].value);
+		}
+	}
+	igt_info("set-get-attributes: Phase 2 PASSED (set/get verified)\n");
+
+	munmap_assert(buf, buf_size);
+
+	igt_info("set-get-attributes: PASSED\n");
+}
+
+/* Copy one dword sys->VRAM->sys via two compute dispatches using SVM. */
+static void basic_vram_test(amdgpu_device_handle device)
+{
+	size_t page_sz = sysconf(_SC_PAGE_SIZE);
+	struct amdgpu_svm_buf src = {0}, loc = {0}, dst = {0};
+	uint32_t svm_flags = SVM_FLAGS_HOST_COHERENT;
+
+	svm_buf_alloc_assert(&src, device, NULL, page_sz,
+			     AMDGPU_SVM_ACCESS_ALLOW_MIGRATE, svm_flags, -1, -1);
+	svm_buf_alloc_assert(&dst, device, NULL, page_sz,
+			     AMDGPU_SVM_ACCESS_ALLOW_MIGRATE, svm_flags, -1, -1);
+
+	/* Allocate loc with PREFETCH_LOC + PREFERRED_LOC = GPU (VRAM) */
+	svm_buf_alloc_assert(&loc, device, NULL, page_sz,
+			     AMDGPU_SVM_ACCESS_ALLOW_MIGRATE, svm_flags,
+			     DEV_FD(device), DEV_FD(device));
+
+	amdgpu_svm_buf_fill_u32(&src, 0x01010101);
+
+	/* Dispatch 1: src (SVM sys) -> loc (SVM VRAM) */
+	compute_copy_assert(device, src.va, loc.va);
+
+	/* Dispatch 2: loc (SVM VRAM) -> dst (SVM sys) */
+	compute_copy_assert(device, loc.va, dst.va);
+
+	/* Verify: dst[0] must equal 0x01010101 */
+	assert_eq_u32(((uint32_t *)dst.ptr)[0], 0x01010101, "basic-vram dst[0]");
+	igt_info("basic-vram: PASSED \n");
+
+	amdgpu_svm_buf_free(&src);
+	amdgpu_svm_buf_free(&loc);
+	amdgpu_svm_buf_free(&dst);
+}
+
+/* Verify that setting SVM attributes on an unmapped VA fails. */
+static void invalid_range_test(amdgpu_device_handle device)
+{
+	int r;
+
+	/* Try to grant GPU access to a hard-coded, never-mmap'd address */
+	r = svm_register(device, (void *)0x10000, 0x1000,
+			 AMDGPU_SVM_ACCESS_ALLOW_MIGRATE,
+			 SVM_FLAGS_HOST_COHERENT, -1, -1);
+
+	igt_assert_f(r != 0,
+		     "invalid-range: expected failure setting SVM attrs on unmapped VA 0x10000, "
+		     "but amdgpu_svm_set_attr() returned 0 (success)\n");
+
+	igt_info("invalid-range: PASSED (amdgpu_svm_set_attr returned %d as expected)\n", r);
+}
+
+/**
+ * partial_unmap_sys_mem_test - Verify GPU access after partial munmap
+ * Layout (16 pages total):
+ *
+ *   pBuf --------------------------------------------------- pBuf+BufSize
+ *   |  2 pages MAPPED  |  4 pages UNMAPPED  | 10 pages MAPPED |
+ *   |     (region A)   |     (hole)         |    (region B)   |
+ *   pBuf              pBuf2                pBuf3
+ *
+ * Steps:
+ *  1. mmap 16 pages, register full range via SVM, fill with 0x01010101.
+ *  2. munmap the middle 4 pages to create a hole in the VMA.
+ *  3. Allocate a destination SVM buffer.
+ *  4. Dispatch GPU copy: pBuf3[0] (region B) -> dest. Verify 0x01010101.
+ *  5. Dispatch GPU copy: pBuf[0]  (region A) -> dest. Verify 0x01010101.
+ *  6. Cleanup: munmap the two remaining mapped regions.
+ */
+static void partial_unmap_sys_mem_test(amdgpu_device_handle device)
+{
+	const size_t page_sz = sysconf(_SC_PAGE_SIZE);
+	const unsigned int buf_size = 16 * page_sz;
+	const unsigned int buf2_size = 4 * page_sz;
+	struct amdgpu_svm_buf dest = {0};
+	char *pBuf, *pBuf2, *pBuf3;
+
+	pBuf = svm_mmap_anon(buf_size);
+	igt_assert_eq(svm_register(device, pBuf, buf_size,
+				   AMDGPU_SVM_ACCESS_ALLOW_MIGRATE,
+				   SVM_FLAGS_HOST_COHERENT, -1, -1), 0);
+	for (size_t i = 0; i < buf_size / sizeof(uint32_t); i++)
+		((uint32_t *)pBuf)[i] = 0x01010101;
+
+	/* Punch a hole: munmap the middle 4 pages. */
+	pBuf2 = pBuf + 2 * page_sz;
+	munmap_assert(pBuf2, buf2_size);
+	igt_info("partial-unmap: hole punched at %p..%p (%u bytes)\n",
+		 pBuf2, pBuf2 + buf2_size, buf2_size);
+
+	svm_buf_alloc_assert(&dest, device, NULL, buf_size,
+			     AMDGPU_SVM_ACCESS_ALLOW_MIGRATE,
+			     SVM_FLAGS_HOST_COHERENT, -1, -1);
+
+	/* Dispatch 1: copy from region B (pBuf3, after hole) -> dest */
+	pBuf3 = pBuf2 + buf2_size;
+	igt_info("Dispatch 1: pBuf3=%p (region B) -> dest=%p\n", pBuf3, dest.ptr);
+	compute_copy_assert(device, (uint64_t)(uintptr_t)pBuf3, dest.va);
+	assert_eq_u32(((uint32_t *)dest.ptr)[0], 0x01010101, "partial-unmap dispatch 1 dest[0]");
+	igt_info("Dispatch 1: dest[0]=0x%08x (OK)\n", ((uint32_t *)dest.ptr)[0]);
+
+	/* Dispatch 2: copy from region A (pBuf, before hole) -> dest */
+	((uint32_t *)dest.ptr)[0] = 0;  /* reset dest */
+	igt_info("Dispatch 2: pBuf=%p (region A) -> dest=%p\n", pBuf, dest.ptr);
+	compute_copy_assert(device, (uint64_t)(uintptr_t)pBuf, dest.va);
+	assert_eq_u32(((uint32_t *)dest.ptr)[0], 0x01010101, "partial-unmap dispatch 2 dest[0]");
+	igt_info("Dispatch 2: dest[0]=0x%08x (OK)\n", ((uint32_t *)dest.ptr)[0]);
+
+	igt_info("partial-unmap-sys-mem: PASSED\n");
+
+	amdgpu_svm_buf_free(&dest);
+
+	munmap_assert(pBuf, 2 * page_sz);
+	munmap_assert(pBuf3, buf_size - 2 * page_sz - buf2_size);
+}
+
+/* Test SVM prefetch semantics: freed-buffer check and location tracking. */
+static void prefetch_test(amdgpu_device_handle device)
+{
+	const unsigned int buf_size = 16 << 10;
+	struct amdgpu_svm_buf buf = {0};
+	int fd = DEV_FD(device);
+	uint32_t svm_flags = SVM_FLAGS_HOST_COHERENT;
+	uint32_t prefetch_val;
+	int r;
+
+	/* Part 1: register, free, verify re-registration fails */
+	svm_buf_alloc_assert(&buf, device, NULL, buf_size,
+			     AMDGPU_SVM_ACCESS_ALLOW_MIGRATE, svm_flags, -1, -1);
+	amdgpu_svm_buf_free(&buf);
+
+	/* svm_set_attr on freed (NULL) pointer must fail */
+	r = svm_register(device, NULL, buf_size,
+			 AMDGPU_SVM_ACCESS_ALLOW_MIGRATE,
+			 SVM_FLAGS_HOST_COHERENT, -1, -1);
+	igt_assert_f(r != 0,
+		     "prefetch-test part-1 FAILED: svm_set_attr on freed VA succeeded "
+		     "(expected failure)\n");
+	igt_info("prefetch-test part-1: freed pointer correctly rejected (ret=%d)\n", r);
+
+	/* Part 2: prefetch-location tracking */
+	svm_buf_alloc_assert(&buf, device, NULL, buf_size,
+			     AMDGPU_SVM_ACCESS_ALLOW_MIGRATE, svm_flags, -1, -1);
+
+	/* Query PREFETCH_LOC on first half: accept 0 or 0xffffffff */
+	r = amdgpu_svm_get_prefetch_loc(device,
+		(void *)(uintptr_t)buf.va, buf_size / 2, &prefetch_val);
+	igt_assert_eq(r, 0);
+
+	igt_assert_f(prefetch_val == 0 ||
+		     prefetch_val == 0xffffffff,
+		     "prefetch-test part-2a FAILED: first-half prefetch_loc=0x%x, "
+		     "expected 0 (system memory) or 0xffffffff (undefined)\n",
+		     prefetch_val);
+	igt_info("prefetch-test part-2a: first half prefetch_loc=0x%x "
+		 "(no explicit prefetch) as expected\n",
+		 prefetch_val);
+
+	/* Prefetch second half to GPU VRAM (only half, to create mixed range) */
+	igt_assert_eq(amdgpu_svm_set_prefetch_loc(device,
+		(void *)(uintptr_t)(buf.va + buf_size / 2), buf_size / 2, fd), 0);
+	igt_info("prefetch-test part-2b: second half prefetched to GPU (fd=%d)\n", fd);
+
+	/* Verify second half's prefetch_loc is a valid GPU node */
+	r = amdgpu_svm_get_prefetch_loc(device,
+		(void *)(uintptr_t)(buf.va + buf_size / 2),
+		buf_size / 2, &prefetch_val);
+	igt_assert_f(prefetch_val != 0 &&
+		     prefetch_val != 0xffffffff,
+		     "prefetch-test part-2b-verify FAILED: second half "
+		     "prefetch_loc=0x%x, expected valid GPU node\n",
+		     prefetch_val);
+	igt_info("prefetch-test part-2b-verify: second half prefetch_loc=0x%x "
+		 "(valid GPU node)\n", prefetch_val);
+
+	/* Full range spans sys + VRAM -> expect 0xffffffff (mixed) */
+	r = amdgpu_svm_get_prefetch_loc(device,
+		(void *)(uintptr_t)buf.va, buf_size, &prefetch_val);
+	assert_eq_u32(prefetch_val, 0xffffffff, "prefetch-test part-2c full range");
+	igt_info("prefetch-test part-2c: full range prefetch_loc=0x%x (mixed)\n",
+		 prefetch_val);
+
+	igt_info("prefetch-test: PASSED\n");
+
+	amdgpu_svm_buf_free(&buf);
+}
+
+/*
+ * Test repeated RAM<->VRAM migration round-trips and verify data integrity.
+ */
+static void migrate_test(amdgpu_device_handle device)
+{
+	const unsigned int migrateRepeat = 8;
+	const unsigned int buffer_size = 16 << 20;	/* 16 MB */
+	struct amdgpu_svm_buf data_buf = {0};
+	struct amdgpu_svm_buf sys_buf = {0};
+	struct amdgpu_svm_buf sys_buf2 = {0};
+	uint32_t *pData, *pBuf, *pBuf2;
+	int fd = DEV_FD(device);
+	uint32_t svm_flags = SVM_FLAGS_HOST_COHERENT;
+	unsigned int rep;
+	uint32_t i;
+
+	/* Allocate 3 SVM buffers */
+	svm_buf_alloc_assert(&data_buf, device, NULL, buffer_size,
+			     AMDGPU_SVM_ACCESS_ALLOW_MIGRATE, svm_flags, -1, -1);
+	svm_buf_alloc_assert(&sys_buf, device, NULL, buffer_size,
+			     AMDGPU_SVM_ACCESS_ALLOW_MIGRATE, svm_flags, 0, -1);
+	svm_buf_alloc_assert(&sys_buf2, device, NULL, buffer_size,
+			     AMDGPU_SVM_ACCESS_ALLOW_MIGRATE, svm_flags, 0, -1);
+
+	pData = (uint32_t *)data_buf.ptr;
+	pBuf  = (uint32_t *)sys_buf.ptr;
+	pBuf2 = (uint32_t *)sys_buf2.ptr;
+
+	/* Fill data buffer with sequential pattern */
+	for (i = 0; i < buffer_size / 4; i++)
+		pData[i] = i;
+
+	igt_info("migrate-test: data=%p sys=%p sys2=%p (size=%u, rounds=%u)\n",
+		 data_buf.ptr, sys_buf.ptr, sys_buf2.ptr,
+		 buffer_size, migrateRepeat);
+
+	/* Migration loop: RAM->VRAM->RAM round-trip */
+	for (rep = 0; rep < migrateRepeat; rep++) {
+		igt_info("migrate-test: cycle %u/%u\n", rep + 1, migrateRepeat);
+
+		/* Migrate sys_buf and sys_buf2 from RAM to VRAM */
+		svm_buf_prefetch_assert(&sys_buf, fd);
+		svm_buf_prefetch_assert(&sys_buf2, fd);
+
+		/* SDMA copy DataBuffer -> SysBuffer / SysBuffer2 */
+		sdma_copy_assert(device, sys_buf.va, data_buf.va, buffer_size);
+		sdma_copy_assert(device, sys_buf2.va, data_buf.va, buffer_size);
+
+		/* CPU read triggers VRAM->RAM migration; verify data */
+		for (i = 0; i < buffer_size / 4; i++) {
+			assert_eq_u32(pBuf[i], i, "cycle %u: sys_buf[%u]", rep, i);
+			assert_eq_u32(pBuf2[i], i, "cycle %u: sys_buf2[%u]", rep, i);
+		}
+	}
+
+	/* Final check: GPU mapping still correct after migration back to RAM */
+	sdma_copy_assert(device, sys_buf.va, data_buf.va, buffer_size);
+	for (i = 0; i < buffer_size / 4; i++)
+		assert_eq_u32(pBuf[i], i, "final: sys_buf[%u]", i);
+
+	igt_info("migrate-test: PASSED\n");
+
+	amdgpu_svm_buf_free(&data_buf);
+	amdgpu_svm_buf_free(&sys_buf);
+	amdgpu_svm_buf_free(&sys_buf2);
+}
+
+/*
+ * Test GPU mapping update after range split + migrate back to sysmem.
+ */
+static void migrate_access_in_place_test(amdgpu_device_handle device)
+{
+	uint32_t svm_flags = SVM_FLAGS_HOST_COHERENT;
+	struct amdgpu_svm_buf data_buf = {0};
+	unsigned int BufferSize;
+	uint64_t vram_size;
+	uint32_t *pData;
+	unsigned int i;
+
+	/* Determine buffer size: MIN(256 MB, VRAM / 2) */
+	vram_size = get_available_vram(device);
+	igt_require_f(vram_size > 0, "No VRAM found, skipping test\n");
+	BufferSize = (unsigned int)MIN(256ULL << 20, vram_size / 2);
+	igt_require_f(BufferSize >= (1U << 20),
+		      "VRAM too small (%" PRIu64 " bytes), need >= 2 MB\n",
+		      vram_size);
+
+	/* Allocate SVM buffer, then upgrade to ACCESS_IN_PLACE */
+	svm_buf_alloc_assert(&data_buf, device, NULL, BufferSize,
+			     AMDGPU_SVM_ACCESS_IN_PLACE, svm_flags, -1, -1);
+	pData = (uint32_t *)data_buf.ptr;
+
+	igt_info("migrate-access-in-place: data=%p size=%u (%.1f MB)\n",
+		 data_buf.ptr, BufferSize, BufferSize / (1024.0 * 1024.0));
+
+	/* Prefetch to VRAM */
+	svm_buf_prefetch_assert(&data_buf, DEV_FD(device));
+
+	/* CPU write triggers VRAM->RAM migration */
+	for (i = 0; i < BufferSize / sizeof(uint32_t); i += 1024)
+		pData[i] = i;
+	igt_info("CPU write complete - VRAM->RAM migration triggered\n");
+
+	/* GPU SDMA fill: verifies GPU mapping was updated after migration */
+	sdma_fill_assert(device, data_buf.va, 0x55AAAA55, BufferSize);
+
+	/* CPU verify */
+	for (i = 0; i < BufferSize / sizeof(uint32_t); i += 1024) {
+		assert_eq_u32(pData[i], 0x55AAAA55, "migrate-access-in-place pData[%u]", i);
+	}
+	igt_info("migrate-access-in-place: PASSED (verified %u positions)\n",
+		 BufferSize / (unsigned int)sizeof(uint32_t) / 1024);
+
+	amdgpu_svm_buf_free(&data_buf);
+}
+
+static void migrate_large_buf_test(amdgpu_device_handle device)
+{
+	uint32_t BufferSize = 1U << 30;		/* 1 GB cap */
+	const uint32_t maxSDMASize = 128U << 20;	/* 128 MB chunks */
+	struct amdgpu_svm_buf sys_buf = {0};
+	struct amdgpu_svm_buf sys_buf2 = {0};
+	uint32_t svm_flags = SVM_FLAGS_HOST_COHERENT;
+	uint32_t chunk, offset;
+	uint32_t *pBuf, *pBuf2;
+	uint64_t sys_mem_size;
+	uint64_t vram_size;
+	uint32_t i;
+
+	/* Determine buffer size: MIN(1 GB, vramSize * 3/4) */
+	vram_size = get_available_vram(device);
+	igt_skip_on_f(!vram_size, "No VRAM found\n");
+	if (vram_size * 3 / 4 < BufferSize)
+		BufferSize = (uint32_t)(vram_size * 3 / 4);
+
+	/* Round down to page boundary */
+	BufferSize &= ~((uint32_t)sysconf(_SC_PAGE_SIZE) - 1);
+	igt_skip_on_f(!BufferSize, "VRAM too small for large-buf test\n");
+
+	/* Check system memory is sufficient (need 2 x BufferSize) */
+	sys_mem_size = (uint64_t)sysconf(_SC_PHYS_PAGES) *
+		       (uint64_t)sysconf(_SC_PAGE_SIZE);
+	igt_skip_on_f((uint64_t)BufferSize * 2 > sys_mem_size / 2,
+		      "Not enough system memory for large-buf test\n");
+
+	igt_info("migrate-large-buf: BufferSize=%u MB, VRAM=%lu MB, "
+		 "maxSDMASize=%u MB\n",
+		 BufferSize >> 20, (unsigned long)(vram_size >> 20),
+		 maxSDMASize >> 20);
+
+	svm_buf_alloc_assert(&sys_buf, device, NULL, BufferSize,
+			     AMDGPU_SVM_ACCESS_ALLOW_MIGRATE, svm_flags, -1, -1);
+	svm_buf_alloc_assert(&sys_buf2, device, NULL, BufferSize,
+			     AMDGPU_SVM_ACCESS_ALLOW_MIGRATE, svm_flags, -1, -1);
+
+	pBuf  = (uint32_t *)sys_buf.ptr;
+	pBuf2 = (uint32_t *)sys_buf2.ptr;
+
+	amdgpu_svm_buf_fill_u32(&sys_buf, 0x1);
+	amdgpu_svm_buf_fill_u32(&sys_buf2, 0x2);
+
+	/* Migrate sys_buf to VRAM */
+	{
+		struct drm_amdgpu_svm_attribute a = {
+			AMDGPU_SVM_ATTR_PREFERRED_LOC, (uint32_t)DEV_FD(device)
+		};
+		igt_assert_eq(amdgpu_svm_set_attr(device,
+			(uint64_t)(uintptr_t)sys_buf.ptr, BufferSize, 1, &a), 0);
+	}
+
+	svm_buf_prefetch_assert(&sys_buf, DEV_FD(device));
+
+	/* Phase 1: SDMA copy sys_buf (VRAM) -> sys_buf2, chunked */
+	igt_info("migrate-large-buf: Phase 1 -- VRAM->sys_buf2 copy\n");
+	for (offset = 0; offset < BufferSize; offset += chunk) {
+		chunk = (BufferSize - offset) > maxSDMASize ?
+			maxSDMASize : (BufferSize - offset);
+		sdma_copy_assert(device, sys_buf2.va + offset, sys_buf.va + offset, chunk);
+	}
+	for (i = 0; i < BufferSize / 4; i += 1024)
+		assert_eq_u32(pBuf2[i], 0x1, "Phase1: sys_buf2[%u]", i);
+
+	/* Phase 2: update VRAM, fault-back to RAM */
+	igt_info("migrate-large-buf: Phase 2 -- update VRAM, fault-back to RAM\n");
+	amdgpu_svm_buf_fill_u32(&sys_buf2, 0x3);
+
+	for (offset = 0; offset < BufferSize; offset += chunk) {
+		chunk = (BufferSize - offset) > maxSDMASize ?
+			maxSDMASize : (BufferSize - offset);
+		sdma_copy_assert(device, sys_buf.va + offset, sys_buf2.va + offset, chunk);
+	}
+
+	/* CPU read triggers page fault -> VRAM->RAM migration */
+	for (i = 0; i < BufferSize / 4; i += 1024)
+		assert_eq_u32(pBuf[i], 0x3, "Phase2: sys_buf[%u]", i);
+
+	/* Phase 3: verify GPU mapping after migration back to RAM */
+	igt_info("migrate-large-buf: Phase 3 -- GPU mapping after migration\n");
+	amdgpu_svm_buf_fill_u32(&sys_buf, 0x4);
+
+	for (offset = 0; offset < BufferSize; offset += chunk) {
+		chunk = (BufferSize - offset) > maxSDMASize ?
+			maxSDMASize : (BufferSize - offset);
+		sdma_copy_assert(device, sys_buf2.va + offset, sys_buf.va + offset, chunk);
+	}
+
+	for (i = 0; i < BufferSize / 4; i += 1024)
+		assert_eq_u32(pBuf2[i], 0x4, "Phase3: sys_buf2[%u]", i);
+
+	igt_info("migrate-large-buf: PASSED\n");
+
+	amdgpu_svm_buf_free(&sys_buf);
+	amdgpu_svm_buf_free(&sys_buf2);
+}
+
+/* Test migration policy with 1 MB buffer using 64-bit sequential data. */
+static void migrate_policy_test(amdgpu_device_handle device)
+{
+	const uint32_t BufferSize = 1U << 20;	/* 1 MB */
+	struct amdgpu_svm_buf data_buf = {0};
+	struct amdgpu_svm_buf sys_buf = {0};
+	uint32_t svm_flags = SVM_FLAGS_HOST_COHERENT;
+	uint64_t *pData, *pBuf;
+	uint32_t i;
+
+	svm_buf_alloc_assert(&data_buf, device, NULL, BufferSize,
+			     AMDGPU_SVM_ACCESS_ALLOW_MIGRATE, svm_flags,
+			     0, 0);
+	svm_buf_alloc_assert(&sys_buf, device, NULL, BufferSize,
+			     AMDGPU_SVM_ACCESS_ALLOW_MIGRATE, svm_flags,
+			     0, 0);
+
+	pData = (uint64_t *)data_buf.ptr;
+	pBuf  = (uint64_t *)sys_buf.ptr;
+
+	/* Fill DataBuffer with sequential 64-bit values */
+	for (i = 0; i < BufferSize / 8; i++)
+		pData[i] = i;
+
+	igt_info("migrate-policy: data=%p sys=%p (size=%u)\n",
+		 data_buf.ptr, sys_buf.ptr, BufferSize);
+
+	svm_buf_prefetch_assert(&sys_buf, DEV_FD(device));
+
+	/* SDMA copy pData -> pBuf (pBuf is in VRAM) */
+	sdma_copy_assert(device, sys_buf.va, data_buf.va, BufferSize);
+
+	/* CPU read triggers VRAM->RAM migration; verify and modify */
+	for (i = 0; i < BufferSize / 8; i++) {
+		assert_eq_u64(pBuf[i], i, "Phase1: pBuf[%u]", i);
+		pBuf[i] = i + 1;
+	}
+
+	/* SDMA copy pBuf (RAM, modified) -> pData */
+	sdma_copy_assert(device, data_buf.va, sys_buf.va, BufferSize);
+
+	for (i = 0; i < BufferSize / 8; i += 512)
+		assert_eq_u64(pData[i], i + 1, "Phase2: pData[%u]", i);
+
+	igt_info("migrate-policy: PASSED\n");
+
+	amdgpu_svm_buf_free(&data_buf);
+	amdgpu_svm_buf_free(&sys_buf);
+}
+
+/* Shared state for migration threads. */
+struct migration_thread_params {
+	struct amdgpu_svm_buf *svm_buf;	/* SVM buffer to operate on */
+	int       prefetch_loc;	/* DRM fd = GPU VRAM, 0 = CPU */
+	int       result;	/* 0 = success, non-zero = failure */
+};
+
+/* CPU-read thread: read every 512th uint64, verify sequential pattern. */
+static void *cpu_read_thread_fn(void *arg)
+{
+	struct migration_thread_params *p = arg;
+	uint64_t *buf = (uint64_t *)p->svm_buf->ptr;
+	uint32_t size = p->svm_buf->size;
+	uint32_t i;
+
+	p->result = 0;
+	for (i = 0; i < size / 8; i += 512) {
+		if (buf[i] != i) {
+			p->result = -1;
+			return NULL;
+		}
+	}
+	return NULL;
+}
+
+/* Prefetch SVM range to GPU or CPU. */
+static void *gpu_prefetch_thread_fn(void *arg)
+{
+	struct migration_thread_params *p = arg;
+
+	p->result = amdgpu_svm_buf_prefetch(p->svm_buf, p->prefetch_loc);
+	return NULL;
+}
+
+/* Two threads race migration to stress kernel's range migration locking. */
+static void multi_thread_migration_test(amdgpu_device_handle device)
+{
+	const unsigned long test_loops = 2;
+	const uint32_t BufferSize = 1U << 27;	/* 128 MB -- stress engine separation under load */
+	struct amdgpu_svm_buf svm_buf = {0};
+	struct amdgpu_svm_buf data_buf = {0};
+	uint32_t svm_flags = SVM_FLAGS_HOST_COHERENT;
+	struct migration_thread_params params;
+	uint64_t *pBuf;
+	pthread_t thread;
+	unsigned long loop;
+	uint32_t i;
+	int r;
+
+	require_gpu_family(device, FAMILY_AI);
+
+	/* 1. Allocate two 128 MB SVM buffers on system memory, mapped to GPU */
+	svm_buf_alloc_assert(&svm_buf, device, NULL, BufferSize,
+			     AMDGPU_SVM_ACCESS_ALLOW_MIGRATE, svm_flags, -1, -1);
+	pBuf = (uint64_t *)svm_buf.ptr;
+
+	svm_buf_alloc_assert(&data_buf, device, NULL, BufferSize,
+			     AMDGPU_SVM_ACCESS_ALLOW_MIGRATE, svm_flags, -1, -1);
+
+	/* CPU fill pBuf with sequential 64-bit pattern */
+	for (i = 0; i < BufferSize / 8; i++)
+		pBuf[i] = i;
+
+	params.svm_buf = &svm_buf;
+
+	for (loop = 0; loop < test_loops; loop++) {
+		igt_info("multi-thread-migration: loop %lu/%lu\n",
+			 loop + 1, test_loops);
+
+		/* Phase A: worker thread prefetches to GPU while main thread SDMA-copies */
+		params.prefetch_loc = DEV_FD(device);
+		params.result = -1;
+		r = pthread_create(&thread, NULL,
+				   gpu_prefetch_thread_fn, &params);
+		igt_assert_eq(r, 0);
+
+		sdma_copy_assert(device, data_buf.va,
+			 svm_buf.va, BufferSize);
+
+		r = pthread_join(thread, NULL);
+		igt_assert_eq(r, 0);
+		igt_assert_f(params.result == 0,
+			     "GPU prefetch thread failed: %d\n",
+			     params.result);
+
+		/* Phase B: worker thread CPU-reads while main thread prefetches to CPU */
+		params.result = -1;
+		r = pthread_create(&thread, NULL,
+				   cpu_read_thread_fn, &params);
+		igt_assert_eq(r, 0);
+
+		svm_buf_prefetch_assert(&svm_buf, 0);
+
+		r = pthread_join(thread, NULL);
+		igt_assert_eq(r, 0);
+		igt_assert_f(params.result == 0,
+			     "CPU read thread data mismatch in loop %lu\n",
+			     loop);
+	}
+
+	igt_info("multi-thread-migration: PASSED\n");
+
+	amdgpu_svm_buf_free(&svm_buf);
+	amdgpu_svm_buf_free(&data_buf);
+}
+
+/* Verify SVM works with file-backed (MAP_SHARED) memory via SDMA fill. */
+static void migrate_file_backed_range_test(amdgpu_device_handle device)
+{
+	char tmpfname[] = "/tmp/igt-svm-XXXXXX";
+	struct amdgpu_svm_buf svm_buf = {0};
+	const uint32_t size = PAGE_SIZE;
+	uint32_t svm_flags = SVM_FLAGS_HOST_COHERENT;
+	char *verify_buf;
+	void *mmapped;
+	ssize_t nread;
+	int tmp_fd;
+
+	require_gpu_family(device, FAMILY_AI);
+
+	/* Create temp file and write PAGE_SIZE bytes of 0x30 */
+	tmp_fd = mkostemp(tmpfname, 0);
+	igt_assert_f(tmp_fd >= 0, "mkostemp failed: %s\n", strerror(errno));
+
+	verify_buf = alloca(size);
+	memset(verify_buf, 0x30, size);
+
+	igt_assert_eq(write(tmp_fd, verify_buf, size), (ssize_t)size);
+
+	/* mmap the file MAP_SHARED */
+	mmapped = mmap(NULL, size, PROT_READ | PROT_WRITE,
+		       MAP_SHARED, tmp_fd, 0);
+	igt_assert_f(mmapped != MAP_FAILED,
+		     "mmap failed: %s\n", strerror(errno));
+
+	/* Register the mmap'd address as SVM range */
+	svm_buf_alloc_assert(&svm_buf, device, mmapped, size,
+			     AMDGPU_SVM_ACCESS_ALLOW_MIGRATE, svm_flags,
+			     -1, -1);
+
+	amdgpu_svm_sdma_fill(device, svm_buf.va, 0x33333333, size);
+
+	amdgpu_svm_buf_free(&svm_buf);
+	munmap_assert(mmapped, size);
+	close(tmp_fd);
+
+	/* Re-open file read-only, verify GPU write persisted */
+	tmp_fd = open(tmpfname, O_RDONLY);
+	igt_assert_f(tmp_fd >= 0, "re-open failed: %s\n", strerror(errno));
+
+	nread = read(tmp_fd, verify_buf, size);
+	igt_assert_eq(nread, (ssize_t)size);
+	assert_eq_u32((unsigned char)verify_buf[0], 0x33, "File byte[0]");
+
+	close(tmp_fd);
+	remove(tmpfname);
+
+	igt_info("migrate-file-backed-range: PASSED\n");
+}
+
+/* Verify GPU honors mprotect(PROT_READ); write triggers a VM fault. */
+static void read_only_range_test(amdgpu_device_handle device)
+{
+	const uint64_t size = PAGE_SIZE * 2;
+	struct amdgpu_svm_buf in_buf = {0};
+	struct amdgpu_svm_buf out_buf = {0};
+	uint32_t svm_flags = SVM_FLAGS_HOST_COHERENT;
+	uint8_t *pinBuf, *pBuf;
+	int child_status;
+	pid_t pid;
+	int r;
+
+	require_gpu_family(device, FAMILY_AI);
+
+	/*
+	 * Phase 2 deliberately issues an SDMA write to an mprotect(PROT_READ)
+	 * SVM page to confirm the GPU rejects it. On the current render-node
+	 * SVM backend the resulting VM fault takes an unsupported handling
+	 * path (amdgpu_vm_handle_fault installs a NORETRY PTE through the SDMA
+	 * update funcs without a prepared job, NULL-dereferencing p->job) and
+	 * destabilizes the whole system rather than failing gracefully.
+	 *
+	 * Skip here until the kernel write-fault fallback is fixed.
+	 */
+	igt_skip("write-to-read-only VM fault path unsupported on this SVM "
+		 "backend; excluded from kfdtest as "
+		 "KFDSVMRangeTest.ReadOnlyRangeTest\n");
+
+	/* Runs in child process because GPU VM fault may kill the process */
+	pid = fork();
+	igt_assert_f(pid >= 0, "fork failed: %s\n", strerror(errno));
+
+	if (pid > 0) {
+		/* parent: wait for child and check exit status */
+		waitpid(pid, &child_status, 0);
+
+		if (WIFEXITED(child_status)) {
+			igt_assert_f(WEXITSTATUS(child_status) == 0,
+				     "Child exited with code %d\n",
+				     WEXITSTATUS(child_status));
+		} else if (WIFSIGNALED(child_status)) {
+			/* SIGSEGV expected on APU for unrecoverable fault */
+			igt_info("read-only-range: child killed by signal %d "
+				 "(expected on APU)\n",
+				 WTERMSIG(child_status));
+		} else {
+			igt_assert_f(0, "Unexpected child status 0x%x\n",
+				     child_status);
+		}
+
+		igt_info("read-only-range: PASSED\n");
+		return;
+	}
+
+	/* child process: Re-open DRM in child so VM fault only affects this process */
+	{
+		int child_fd;
+		amdgpu_device_handle child_dev;
+		uint32_t major, minor;
+
+		amdgpu_device_deinitialize(device);
+
+		child_fd = drm_open_driver(DRIVER_AMDGPU);
+		if (child_fd < 0)
+			_exit(1);
+		if (amdgpu_device_initialize(child_fd, &major, &minor,
+					     &child_dev))
+			_exit(1);
+
+		/* Allocate input buffer, fill with 0x55, mprotect read-only */
+		r = amdgpu_svm_buf_alloc(&in_buf, child_dev, NULL, size,
+					 AMDGPU_SVM_ACCESS_ALLOW_MIGRATE,
+					 svm_flags, -1, -1);
+		if (r)
+			_exit(1);
+		pinBuf = (uint8_t *)in_buf.ptr;
+		memset(pinBuf, 0x55, PAGE_SIZE);
+
+		r = mprotect(pinBuf, PAGE_SIZE, PROT_READ);
+		if (r) {
+			amdgpu_svm_buf_free(&in_buf);
+			_exit(1);
+		}
+
+		/* Allocate output buffer */
+		r = amdgpu_svm_buf_alloc(&out_buf, child_dev, NULL, PAGE_SIZE,
+					 AMDGPU_SVM_ACCESS_ALLOW_MIGRATE,
+					 svm_flags, -1, -1);
+		if (r) {
+			amdgpu_svm_buf_free(&in_buf);
+			_exit(1);
+		}
+		pBuf = (uint8_t *)out_buf.ptr;
+		memset(pBuf, 0, PAGE_SIZE);
+
+		/* Phase 1: SDMA READ from read-only page must succeed */
+		r = amdgpu_svm_sdma_copy(child_dev,
+				  (uint64_t)(uintptr_t)pBuf,
+				  (uint64_t)(uintptr_t)pinBuf,
+				  (uint32_t)PAGE_SIZE);
+		if (r || pBuf[0] != 0x55) {
+			amdgpu_svm_buf_free(&out_buf);
+			amdgpu_svm_buf_free(&in_buf);
+			_exit(1);
+		}
+
+		/* Phase 2: SDMA WRITE to read-only page must trigger VM fault */
+		signal(SIGSEGV, SIG_DFL);
+		memset(pBuf, 0xAA, PAGE_SIZE);
+		r = amdgpu_svm_sdma_copy(child_dev,
+				  (uint64_t)(uintptr_t)pinBuf,
+				  (uint64_t)(uintptr_t)pBuf,
+				  (uint32_t)PAGE_SIZE);
+		/* If we get here the fault was handled (dGPU) */
+		(void)r;
+
+		amdgpu_svm_buf_free(&out_buf);
+		amdgpu_svm_buf_free(&in_buf);
+		amdgpu_device_deinitialize(child_dev);
+		drm_close_driver(child_fd);
+		_exit(0);
+	}
+}
+
+/*
+ * Test kernel's ability to split/merge overlapping SVM ranges (6 sub-cases).
+ * @prefetch_loc selects where each range is prefetched: 0 for system memory,
+ * the DRM fd for VRAM.
+ */
+static void split_range_test(amdgpu_device_handle device, int prefetch_loc)
+{
+	const uint32_t pg = sysconf(_SC_PAGE_SIZE);
+	const uint32_t buf_size = 16 * pg;	/* 16 pages */
+	const uint32_t pg2  = 2 * pg;		/* 2 pages  (offset / sub-range) */
+	const uint32_t pg8  = 8 * pg;		/* 8 pages  (offset / sub-range) */
+	const uint32_t pg16 = 16 * pg;		/* 16 pages (extra region)       */
+	void *pBuf;
+
+	/*
+	 * Register each range fine-grained; @prefetch_loc places the ranges in
+	 * system memory (0) or VRAM (DRM fd) while split/merge is exercised.
+	 */
+#define svm_reg(addr, sz) \
+	igt_assert_eq(svm_register(device, (addr), (sz), \
+				   AMDGPU_SVM_ACCESS_ALLOW_MIGRATE, \
+				   SVM_FLAGS_HOST_COHERENT, prefetch_loc, -1), 0)
+
+	/* Case 1: full range, then sub-range in middle */
+	igt_info("split-range: case 1 - sub-range in middle\n");
+	pBuf = svm_mmap_anon(buf_size);
+	svm_reg(pBuf, buf_size);
+	svm_reg((char *)pBuf + pg2, pg);
+
+	munmap_assert(pBuf, buf_size);
+
+	/* Case 2.1: full range, then tail */
+	igt_info("split-range: case 2.1 - tail overlap\n");
+	pBuf = svm_mmap_anon(buf_size);
+	svm_reg(pBuf, buf_size);
+	svm_reg((char *)pBuf + pg, buf_size - pg);
+	munmap_assert(pBuf, buf_size);
+
+
+	/* Case 2.2: range at offset 0, then overlapping range at offset 2 pages */
+	igt_info("split-range: case 2.2 - overlapping extension\n");
+	pBuf = svm_mmap_anon(buf_size + pg2);
+	svm_reg(pBuf, buf_size);
+	svm_reg((char *)pBuf + pg2, buf_size);
+	munmap_assert(pBuf, buf_size + pg2);
+
+	/* Case 3: full range, then head */
+	igt_info("split-range: case 3 - head overlap\n");
+	pBuf = svm_mmap_anon(buf_size);
+	svm_reg(pBuf, buf_size);
+	svm_reg(pBuf, buf_size - pg2);
+	munmap_assert(pBuf, buf_size);
+
+	/* Case 4.1: exact same range twice */
+	igt_info("split-range: case 4.1 - exact overlap\n");
+	pBuf = svm_mmap_anon(buf_size);
+	svm_reg(pBuf, buf_size);
+	svm_reg(pBuf, buf_size);
+	munmap_assert(pBuf, buf_size);
+
+	/* Case 4.2: range, then superset */
+	igt_info("split-range: case 4.2 - superset overlap\n");
+	pBuf = svm_mmap_anon(buf_size + pg2);
+	svm_reg(pBuf, buf_size);
+	munmap_assert(pBuf, buf_size + pg2);
+
+	/* Case 5: two small sub-ranges, then one big range covering both */
+	igt_info("split-range: case 5 - merge two into one\n");
+	pBuf = svm_mmap_anon(buf_size + pg16);
+	svm_reg((char *)pBuf + pg2, pg2);
+	svm_reg((char *)pBuf + pg8, pg2);
+	svm_reg(pBuf, buf_size + pg16);
+	munmap_assert(pBuf, buf_size + pg16);
+
+	/* Case 6: register sub-range, munmap backing, then unregister */
+	igt_info("split-range: case 6 - unregister after free\n");
+	pBuf = svm_mmap_anon(buf_size);
+	svm_reg((char *)pBuf + pg2, pg2);
+	munmap_assert(pBuf, buf_size);
+
+#undef svm_reg
+}
+
+/* Overlapping SVM range split with ranges prefetched to system memory. */
+static void split_system_range_test(amdgpu_device_handle device)
+{
+	split_range_test(device, 0);
+	igt_info("split-system-range: PASSED\n");
+}
+
+/* Overlapping SVM range split with ranges prefetched to VRAM. */
+static void split_vram_range_test(amdgpu_device_handle device)
+{
+	split_range_test(device, DEV_FD(device));
+	igt_info("split-vram-range: PASSED\n");
+}
+
+/* Partial prefault: touch 2 of 4 pages, SDMA fill the rest, verify all. */
+static void prefault_partial_range_test(amdgpu_device_handle device)
+{
+	uint32_t page_size = sysconf(_SC_PAGE_SIZE);
+	uint32_t buf_size = 4 * page_size;
+	char *pBuf;
+	int i;
+
+	pBuf = svm_mmap_anon(buf_size);
+
+	/* Prefault only middle 2 pages; pages 0 and 3 remain unfaulted */
+	memset(pBuf + page_size, 0x02, page_size);
+	memset(pBuf + 2 * page_size, 0x03, page_size);
+
+	igt_assert_eq(svm_register(device, pBuf, buf_size,
+				   AMDGPU_SVM_ACCESS_ALLOW_MIGRATE, 0, 0, 0), 0);
+	igt_assert_eq(amdgpu_svm_set_prefetch_loc(device, pBuf, buf_size,
+						  DEV_FD(device)), 0);
+
+	/* SDMA fill page 0 with 0x01010101, page 3 with 0x04040404 */
+	sdma_fill_assert(device, (uint64_t)(uintptr_t)pBuf, 0x01010101, page_size);
+	sdma_fill_assert(device, (uint64_t)(uintptr_t)(pBuf + 3 * page_size), 0x04040404, page_size);
+
+	for (i = 0; i < 4; i++) {
+		unsigned char expected = (unsigned char)(i + 1);
+		unsigned char actual   = (unsigned char)pBuf[i * page_size];
+
+		igt_assert_f(actual == expected,
+			     "prefault-partial-range: page %d mismatch: "
+			     "expected 0x%02x, got 0x%02x\n",
+			     i, expected, actual);
+	}
+
+	munmap_assert(pBuf, buf_size);
+
+	igt_info("prefault-partial-range: PASSED\n");
+}
+
+/*
+ * VRAM overcommit test.
+ *
+ * Register (vramSize + 1 GB) of SVM ranges in 512 MB chunks and prefetch
+ * each to VRAM. The total exceeds physical VRAM, so the kernel must evict
+ * earlier ranges back to system memory to make room; every range must
+ * register and prefetch successfully.
+ */
+static void vram_overcommit_test(amdgpu_device_handle device)
+{
+	const uint64_t over_commit_size = 1ULL << 30;	/* 1 GB overcommit  */
+	const uint64_t buf_size = 512ULL << 20;		/* 512 MB per range  */
+	uint64_t vram_size, sys_mem_size;
+	uint64_t num_bufs, allocated, i;
+	void **bufs;
+
+	require_gpu_family(device, FAMILY_AI);
+
+	vram_size = get_available_vram(device);
+	igt_require_f(vram_size > 0, "No VRAM found, skipping test\n");
+
+	/*
+	 * Every prefetched range keeps a system-memory backing store, so all
+	 * SVM memory must also fit in RAM. Require it to stay under half of
+	 * system memory to leave headroom for the rest of the system.
+	 */
+	sys_mem_size = (uint64_t)sysconf(_SC_PHYS_PAGES) *
+		       (uint64_t)sysconf(_SC_PAGE_SIZE);
+	igt_require_f(vram_size + over_commit_size <= sys_mem_size / 2,
+		      "Not enough system memory for VRAM overcommit test\n");
+
+	num_bufs = (vram_size + over_commit_size) / buf_size;
+	igt_require_f(num_bufs > 0, "VRAM too small for overcommit test\n");
+
+	igt_info("vram-overcommit: VRAM=%lu MB, overcommit=%lu MB, "
+		 "%lu x %lu MB ranges\n",
+		 (unsigned long)(vram_size >> 20),
+		 (unsigned long)(over_commit_size >> 20),
+		 (unsigned long)num_bufs,
+		 (unsigned long)(buf_size >> 20));
+
+	bufs = calloc(num_bufs, sizeof(*bufs));
+	igt_assert_f(bufs, "calloc(%lu bufs) failed\n",
+		     (unsigned long)num_bufs);
+
+	for (allocated = 0; allocated < num_bufs; allocated++) {
+		void *p;
+		int r;
+
+		/* Fresh anonymous range; do NOT touch it (pages stay unfaulted). */
+		p = mmap(NULL, buf_size, PROT_READ | PROT_WRITE,
+			 MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
+		if (p == MAP_FAILED) {
+			igt_warn("range %lu mmap(%lu MB) failed: %s\n",
+				 (unsigned long)allocated,
+				 (unsigned long)(buf_size >> 20),
+				 strerror(errno));
+			break;
+		}
+		bufs[allocated] = p;
+
+		/* Coarse-grained (no HOST_ACCESS/COHERENT), prefetch+prefer VRAM. */
+		r = svm_register(device, p, buf_size,
+				 AMDGPU_SVM_ACCESS_ALLOW_MIGRATE, 0,
+				 DEV_FD(device), DEV_FD(device));
+		if (r) {
+			igt_warn("range %lu register/prefetch failed: %d\n",
+				 (unsigned long)allocated, r);
+			munmap(p, buf_size);
+			bufs[allocated] = NULL;
+			break;
+		}
+	}
+
+	igt_info("vram-overcommit: registered %lu / %lu ranges\n",
+		 (unsigned long)allocated, (unsigned long)num_bufs);
+
+	/* Free everything before asserting so a failure does not leak ranges. */
+	for (i = 0; i < allocated; i++)
+		if (bufs[i])
+			munmap(bufs[i], buf_size);
+	free(bufs);
+
+	igt_assert_f(allocated == num_bufs,
+		     "VRAM overcommit failed: only %lu of %lu ranges "
+		     "registered/prefetched\n",
+		     (unsigned long)allocated, (unsigned long)num_bufs);
+
+	igt_info("vram-overcommit: PASSED\n");
+}
+
+/*
+ * VRAM overcommit via a single giant range. Prefetch one range of
+ * (vramSize + 1 GB) to VRAM; the kernel must split it and evict SVM ranges
+ * to system memory to fit the overcommitted portion.
+ *
+ * Same rationale as vram_overcommit_test: the range is never touched
+ * (un-faulted) and registered coarse-grained so migrations stay bulk/fast.
+ */
+static void vram_overcommit_giant_range_test(amdgpu_device_handle device)
+{
+	const uint64_t over_commit_size = 1ULL << 30;	/* 1 GB overcommit */
+	uint64_t vram_size, sys_mem_size, buf_size;
+	void *buf;
+	int r;
+
+	require_gpu_family(device, FAMILY_AI);
+
+	vram_size = get_available_vram(device);
+	igt_require_f(vram_size > 0, "No VRAM found, skipping test\n");
+
+	/*
+	 * The giant range keeps a system-memory backing store, so all SVM
+	 * memory must also fit in RAM. Require it to stay under half of system
+	 * memory to leave headroom for the rest of the system.
+	 */
+	sys_mem_size = (uint64_t)sysconf(_SC_PHYS_PAGES) *
+		       (uint64_t)sysconf(_SC_PAGE_SIZE);
+	igt_require_f(vram_size + over_commit_size <= sys_mem_size / 2,
+		      "Not enough system memory for VRAM overcommit test\n");
+
+	buf_size = vram_size + over_commit_size;
+
+	igt_info("vram-overcommit-giant: VRAM=%lu MB, overcommit=%lu MB, "
+		 "giant range=%lu MB\n",
+		 (unsigned long)(vram_size >> 20),
+		 (unsigned long)(over_commit_size >> 20),
+		 (unsigned long)(buf_size >> 20));
+
+	/* Fresh anonymous range; do NOT touch it (pages stay unfaulted). */
+	buf = mmap(NULL, buf_size, PROT_READ | PROT_WRITE,
+		   MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
+	igt_assert_f(buf != MAP_FAILED, "mmap(%lu MB) failed: %s\n",
+		     (unsigned long)(buf_size >> 20), strerror(errno));
+
+	/* Coarse-grained (no HOST_ACCESS/COHERENT), prefetch+prefer VRAM. */
+	r = svm_register(device, buf, buf_size,
+			 AMDGPU_SVM_ACCESS_ALLOW_MIGRATE, 0,
+			 DEV_FD(device), DEV_FD(device));
+
+	munmap(buf, buf_size);
+
+	igt_assert_f(r == 0,
+		     "VRAM overcommit giant range failed: register/prefetch "
+		     "of %lu MB returned %d\n",
+		     (unsigned long)(buf_size >> 20), r);
+
+	igt_info("vram-overcommit-giant: PASSED\n");
+}
+
+/* Test SVM on stack memory with fork+COW. */
+static void evict_system_range_test(amdgpu_device_handle device)
+{
+	const size_t page_sz = sysconf(_SC_PAGE_SIZE);
+	/*
+	 * Stack array: 2 * page_sz uint32_t elements (= 8 * page_sz bytes).
+	 * Page-align a pointer within it, then carve out three consecutive
+	 * PAGE_SIZE regions for src (globalData), dst, and sdma buffers.
+	 */
+	uint32_t stackData[2 * page_sz];
+	uint32_t *globalData;
+	uint32_t dstOffset;
+	uint32_t sdmaOffset;
+	pid_t pid;
+	char *pBuf;
+	int status;
+
+	require_gpu_family(device, FAMILY_AI);
+
+	memset(stackData, 0, sizeof(stackData));
+
+	pBuf = (char *)(((uint64_t)stackData + page_sz) & ~(page_sz - 1));
+	globalData = (uint32_t *)pBuf;
+	/*
+	 * dst and sdma are the next two pages after globalData. Both offsets
+	 * are computed as byte distances from stackData and converted to
+	 * uint32_t element indices, so the units stay consistent.
+	 */
+	dstOffset  = ((uint64_t)pBuf + page_sz     - (uint64_t)stackData) /
+		     sizeof(uint32_t);
+	sdmaOffset = ((uint64_t)pBuf + 2 * page_sz - (uint64_t)stackData) /
+		     sizeof(uint32_t);
+
+	*globalData = 0xdeadbeef;
+
+	/* Register three SVM ranges within the stack array */
+	igt_assert_eq(svm_register(device, globalData, page_sz,
+				   AMDGPU_SVM_ACCESS_ALLOW_MIGRATE,
+				   SVM_FLAGS_HOST_COHERENT, -1, -1), 0);
+	igt_assert_eq(svm_register(device, &stackData[dstOffset], page_sz,
+				   AMDGPU_SVM_ACCESS_ALLOW_MIGRATE,
+				   SVM_FLAGS_HOST_COHERENT, -1, -1), 0);
+	igt_assert_eq(svm_register(device, &stackData[sdmaOffset], page_sz,
+				   AMDGPU_SVM_ACCESS_ALLOW_MIGRATE,
+				   SVM_FLAGS_HOST_COHERENT, -1, -1), 0);
+
+	/* Pre-fork: GPU compute copy globalData -> dst */
+	compute_copy_assert(device,
+			    (uint64_t)(uintptr_t)globalData,
+			    (uint64_t)(uintptr_t)&stackData[dstOffset]);
+
+	/* Pre-fork: SDMA fill sdma region with 0x12345678 */
+	sdma_fill_assert(device,
+			 (uint64_t)(uintptr_t)&stackData[sdmaOffset],
+			 0x12345678, (uint32_t)page_sz);
+	assert_eq_u32(stackData[sdmaOffset], 0x12345678,
+		      "pre-fork SDMA stackData[sdmaOffset]");
+
+	/* Fork a child process to mark all pages as COW */
+	pid = fork();
+	igt_assert_f(pid >= 0, "fork failed: %s\n", strerror(errno));
+
+	if (pid == 0) {
+		/* Child: busy-loop without writing to stack/SVM pages.
+		 * No function calls (e.g. sleep) -- they'd write to
+		 * the stack and we want the parent to COW first.
+		 */
+		while (1)
+			;
+		/* NOTREACHED */
+		_exit(0);
+	}
+
+	/* Parent: write to COW page(s) to get new copies.
+	 * MMU notifier needs to update GPU mapping(s) for the test to pass.
+	 */
+	*globalData = 0xD00BED00;
+	stackData[dstOffset] = 0xdeadbeef;
+	stackData[sdmaOffset] = 0xdeadbeef;
+
+	/* Terminate child before possible test failure that would leave
+	 * it spinning in the background indefinitely.
+	 */
+	igt_assert_eq(kill(pid, SIGTERM), 0);
+	igt_assert_eq(waitpid(pid, &status, 0), pid);
+	igt_assert_f(WIFSIGNALED(status) && WTERMSIG(status) == SIGTERM,
+		     "Child did not die from SIGTERM (status=0x%x)\n",
+		     status);
+
+	/* Now check that the GPU is accessing the correct (parent's) page */
+	compute_copy_assert(device,
+			    (uint64_t)(uintptr_t)globalData,
+			    (uint64_t)(uintptr_t)&stackData[dstOffset]);
+
+	sdma_fill_assert(device,
+			 (uint64_t)(uintptr_t)&stackData[sdmaOffset],
+			 0xD0BED0BE, (uint32_t)page_sz);
+
+	/* Verify GPU sees parent's COW'd pages */
+	assert_eq_u32(*globalData, 0xD00BED00, "globalData");
+	assert_eq_u32(stackData[dstOffset], 0xD00BED00, "stackData[dstOffset]");
+	assert_eq_u32(stackData[sdmaOffset], 0xD0BED0BE,
+		      "stackData[sdmaOffset]");
+
+	igt_info("evict-system-range: PASSED (stack memory COW test)\n");
+}
+
+int igt_main()
+{
+	amdgpu_device_handle device;
+	struct amdgpu_gpu_info gpu_info = {0};
+	struct drm_amdgpu_info_hw_ip info = {0};
+	bool arr_cap[AMD_IP_MAX] = {0};
+	bool userq_arr_cap[AMD_IP_MAX] = {0};
+	int fd = -1;
+	int r;
+
+	igt_fixture() {
+		uint32_t major, minor;
+		int err;
+
+		fd = drm_open_driver_another(0, DRIVER_AMDGPU);
+
+		err = amdgpu_device_initialize(fd, &major, &minor, &device);
+		igt_require(err == 0);
+
+		igt_info("Initialized amdgpu, driver version %d.%d\n",
+			 major, minor);
+
+		r = amdgpu_query_gpu_info(device, &gpu_info);
+		igt_assert_eq(r, 0);
+		igt_require_f(!is_apu(&gpu_info),
+			      "SVM tests require dGPU (skipping on APU)\n");
+		r = amdgpu_query_hw_ip_info(device, AMDGPU_HW_IP_GFX, 0, &info);
+		igt_assert_eq(r, 0);
+		r = setup_amdgpu_ip_blocks(major, minor,  &gpu_info, device);
+		igt_assert_eq(r, 0);
+		asic_rings_readness(device, 1, arr_cap);
+		asic_userq_readiness(device, userq_arr_cap);
+	}
+
+	igt_describe("Isolated amdgpu_svm_sdma_fill at increasing sizes, no prefetch/migration");
+	igt_subtest("sdma-fill")
+		sdma_fill_test(device);
+
+	igt_describe("Isolated amdgpu_svm_sdma_copy at increasing sizes, no prefetch/migration");
+	igt_subtest("sdma-copy")
+		sdma_copy_test(device);
+
+	igt_describe("Copy one dword src->dst via GPU compute shader using SVM system memory");
+	igt_subtest("basic-system-mem") {
+		basic_system_mem_test(device);
+	}
+
+	igt_describe("Set and get SVM attributes, verify defaults and round-trip");
+	igt_subtest("set-get-attributes")
+		set_get_attributes_test(device);
+
+	igt_describe("Copy one dword sys->VRAM->sys via two GPU compute dispatches");
+	igt_subtest("basic-vram") {
+		basic_vram_test(device);
+	}
+
+	igt_describe("Set SVM attributes on an unmapped VA and expect failure");
+	igt_subtest("invalid-range")
+		invalid_range_test(device);
+
+	igt_describe("Partial munmap of SVM range, verify GPU can still access remaining regions");
+	igt_subtest("partial-unmap-sys-mem") {
+		partial_unmap_sys_mem_test(device);
+	}
+
+	igt_describe("Test SVM prefetch-location semantics and freed-buffer rejection");
+	igt_subtest("prefetch")
+		prefetch_test(device);
+
+	igt_describe("Repeated RAM<->VRAM migration, verify data integrity across round-trips");
+	igt_subtest("migrate")
+		migrate_test(device);
+
+	igt_describe("ACCESS_IN_PLACE + prefetch to VRAM + CPU fault-back, verify GPU mapping");
+	igt_subtest("migrate-access-in-place")
+		migrate_access_in_place_test(device);
+
+	igt_describe("Large buffer (up to 1 GB) migration with chunked SDMA copies");
+	igt_subtest("migrate-large-buf")
+		migrate_large_buf_test(device);
+
+	igt_describe("Migration policy test with 64-bit sequential data");
+	igt_subtest("migrate-policy")
+		migrate_policy_test(device);
+
+	igt_describe("Two threads race migration to stress kernel locking");
+	igt_subtest("multi-thread-migration")
+		multi_thread_migration_test(device);
+
+	igt_describe("File-backed SVM: SDMA fill MAP_SHARED mmap, verify write persists to file");
+	igt_subtest("migrate-file-backed-range")
+		migrate_file_backed_range_test(device);
+
+	igt_describe("Read-only SVM range: verify SDMA read succeeds, write triggers VM fault");
+	igt_subtest("read-only-range")
+		read_only_range_test(device);
+
+	igt_describe("Overlapping SVM range split/merge with system memory");
+	igt_subtest("split-system-range")
+		split_system_range_test(device);
+
+	igt_describe("Overlapping SVM range split/merge with VRAM");
+	igt_subtest("split-vram-range")
+		split_vram_range_test(device);
+
+	igt_describe("Partial prefault: touch middle pages, SDMA fill unfaulted pages, verify");
+	igt_subtest("prefault-partial-range")
+		prefault_partial_range_test(device);
+
+	igt_describe("Overcommit VRAM: prefetch (VRAM + 1 GB) of SVM ranges, kernel evicts to fit");
+	igt_subtest("vram-overcommit")
+		vram_overcommit_test(device);
+
+	igt_describe("Overcommit VRAM with one giant (VRAM + 1 GB) range, kernel splits and evicts to fit");
+	igt_subtest("vram-overcommit-giant")
+		vram_overcommit_giant_range_test(device);
+
+	igt_describe("COW eviction: fork + parent write triggers re-mapping, verify GPU access");
+	igt_subtest("evict-system-range")
+		evict_system_range_test(device);
+
+	igt_fixture() {
+		amdgpu_device_deinitialize(device);
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index 08206f8c8..5c3b96c42 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -41,6 +41,7 @@ if libdrm_amdgpu.found()
 			  'amd_ras',
 			  'amd_replay',
 			  'amd_security',
+			  'amd_svm',
 			  'amd_uvd_dec',
 			  'amd_uvd_enc',
 			  'amd_vce_enc',
-- 
2.34.1

