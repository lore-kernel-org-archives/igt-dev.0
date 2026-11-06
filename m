Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058B9606A335
	for <igt-dev@archiver.kernel.org>; Fri,  6 Nov 2026 13:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=XHDooPdx
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E54010F68E;
	Fri,  6 Nov 2026 13:16:28 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010049.outbound.protection.outlook.com [52.101.56.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CFE710E3BC
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Nov 2026 13:14:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bpm3OifQW519iQ/tOdfFxKUzFHtlvekLuQu+0jRC9C824e7KQF9Fhn/4MqF7BxVAtWx+oDKwCZehBzzyy8iURTsFAhcsVD8Cd6sS2doQvrIuwGh2VKTWu7edLgz/rqZxAVZXUmqjgArLhu/XHlSrJIlbcirWW38F0brXmqNFKDR2h3y8rJbPKxRRiFlSK++TYYPQiyeuObuo7/etJ751btyEgGyLISMPFWcF0KD08QMmVvH3ozOlLekB2/RdXiDyHOKDmR3rMZVmxA+BhM8KULuYyGRYMQOTPIZkWzhkQUFX57X4XbOE5e0yEbic0Pe8A/oQQgu11FWibigekv1iMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tE78taxBlC+3EvTBT0Dsws4iUd+cVRP69/p94tH1gfg=;
 b=cX7Hx79vyEBQLWbd7iCaa71ao7jWfHYx0u2rUpc47BQyTJ3G5gU9wry/Or2xqgy3IzzfEUDcsgHPiHj2Sa3A8BBabNuTgeLOwnvE5qi9iSL2x7dM9KrTrfW2dVfF1T1cxDtatQ2MOImO5btrlvAoVDR1aZ5cvFwgRIntM1y3Gl+CMUBnBYtm+v9jsZgGrAqxPLxWexJ2xi28aKCGqDKnE7WonbVw/mSZ2vi1Y6qyVlJsErH1jcwTYPoCFyOuZFYuxHJNUYgRcDczF4Wx+r2gvxpM65kK3fT17UuTOiQLUfOAgL71s0X/vJ3M2bpGsdx7k6nj4kxL9P6UxdDX86FV/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tE78taxBlC+3EvTBT0Dsws4iUd+cVRP69/p94tH1gfg=;
 b=XHDooPdxiB/AuTPo183yDyDXCR5AR1FcDUdEpDEtHMSz0+hXw3gkEUKWeuI3CLbYKgaKxqeYqvUrM3trlzfc7UDuc+vcehqriVzclaQdrdZFx3vgdE1JBGjyuElB/zGdOAa0pB6JFErYUsRu8EzrZz/Smqncw+qoKz31szAQN20=
Received: from MW4PR04CA0074.namprd04.prod.outlook.com (2603:10b6:303:6b::19)
 by PH7PR12MB5808.namprd12.prod.outlook.com (2603:10b6:510:1d4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Fri, 6 Nov 2026
 13:13:50 +0000
Received: from SJ5PEPF00000205.namprd05.prod.outlook.com
 (2603:10b6:303:6b:cafe::44) by MW4PR04CA0074.outlook.office365.com
 (2603:10b6:303:6b::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 13:13:49 +0000
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
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 13:13:49 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 07:13:48 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 07:13:47 -0600
Received: from junhua-PC.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Fri, 6 Nov 2026 07:13:44 -0600
From: Junhua Shen <Junhua.Shen@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Vitaly Prosyak
 <vitaly.prosyak@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Christian
 Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>, Oak Zeng
 <Oak.Zeng@amd.com>, Xiaogang Chen <Xiaogang.Chen@amd.com>, Jenny Liu
 <Jenny-Jing.Liu@amd.com>, Honglei Huang <honglei1.huang@amd.com>, "Zhu
 Lingshan" <lingshan.zhu@amd.com>, Yiru Ma <yiru.ma@amd.com>, Junhua Shen
 <Junhua.Shen@amd.com>
Subject: [PATCH i-g-t v3 3/3] tests/amdgpu: add SVM test suite
Date: Fri, 6 Nov 2026 21:13:29 +0800
Message-ID: <20261106131329.73236-4-Junhua.Shen@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000205:EE_|PH7PR12MB5808:EE_
X-MS-Office365-Filtering-Correlation-Id: fa6bbd17-727f-4d1e-d029-08df3c07cbf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700016|82310400026|376014|23010399003|56012099006|4143699003|11063799006|261009223327099003|261009221727099003|261009221227099003|261009220027099003|261009223027099003|261102123227099003|261022105027099003|261021121427099003|261021130227099003|261026140227099003|261022113327099003|261021133027099003|261021123027099003|261028144727099003|261026121527099003|261021135927099003|261022075727099003|261026130827099003|261026135527099003|10067099003|261022115727099003|22082099003|18002099003|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info: nZoMtHl+JlyUesQY+D0mNv99IhzLE3+SsROnxjqhaqvIMN6p0baYSq1EeDAWxm59VCFMdlB2zNaEAkTgIKSJYQ5u+MK/FAqIewyNGCMFbNMMJ2WBDHYFnniqPUWeawJKW4GTTj8/ff6oZqEFUSlP/tUbGI54SHjfo+iRAM1Xlu44iHAPgxJNWB8hHIRjuCkPztKiC+PPNtHefn9+V173SYZ5VHQ6WyW67i+dG8PzwzyVwAbyNsipYyL9W4WKwnI+Fa/PqYeM5TZX11w3hZojo354Z3JcGE5J+PQZMS57ryOiCwFMjl4JHrTinhtB3sfjMYOBOjs8m1+1xcV57Uf5DlednBg9GQfzHPEqiHfMzDhUPM+6Bu8NUKRiUKHtQwyHmOQpsbKjQabQYLj4hEQ6JRbgedGNsyjtbZKuyVRG2LqVB8PjUxsQ6XZqHsWfniht8TdKCRs7CYhmTnv1Ny+LF5BhnpHXcr3lMnTpoqBteKB2gV7n8pHDwA9gjKsa8/fIt4HGwOR4cjxYTchs2ZMWikt5auk8Hf5cLw/vMrrDrSJKmKRliv0sbFylCMcU3TZXMFGMgbnBCusEAfsthxk4O5VDbZLkZ5W5dX1GEWRQcG7P8UnzP3Y7y/JSw1opahVas9Taw2HfXUxstHQkzumXzP9/8100MWwUq3JifC0cq7I2Cg+NlpJNRjnyU4WuP818YYwLRHOhstsyKCnbB+qumg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(23010399003)(56012099006)(4143699003)(11063799006)(261009223327099003)(261009221727099003)(261009221227099003)(261009220027099003)(261009223027099003)(261102123227099003)(261022105027099003)(261021121427099003)(261021130227099003)(261026140227099003)(261022113327099003)(261021133027099003)(261021123027099003)(261028144727099003)(261026121527099003)(261021135927099003)(261022075727099003)(261026130827099003)(261026135527099003)(10067099003)(261022115727099003)(22082099003)(18002099003)(3023799007)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3+WvH7tLYwXrtJoyeAlL1BfoXkIYjOerh/TVD7eB9BMAh7CH1n5+XHDIIDOAN41fKJPtzeYyayJ8wH8kILvx/4rf/msfveX8oL4SFW3r0QBA/2teo+5wOH0BWK+pPAPvB9B9aC5jJbcHWQPjx1Bdy9LjSC58pCMYilP17CcxpXb1ZVGtF/DYeD0OZBD9v1abFCNHO3qfjTjuxY3eutBgEYQ2BTWD1nXC0I+YXYVVSJ0gcWmDjGSChxrBSKaXH+YK5CBizDHbVbh7uMBkRnuws+9aH5BxmlSOSWPzvPy6nKHLWM5MjOSezfRUZ88WzcdHLB9yWQtJxhV1KAKPClBtPytODQQAHy+l5SL3Ii60SBmRS/9jPEmQlw9DWmXHNR9KMf0CBFZg/X1ykoqe02p01/MNoz1W1GHuS8f2Vbn/uae2UHdq26dv+9B4f9/gVLW2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 13:13:49.3405 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa6bbd17-727f-4d1e-d029-08df3c07cbf4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000205.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5808
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

Add the amd_svm IGT test suite exercising the amdgpu-drm-svm uapi
through the SVM helper library: system/VRAM allocation, prefetch and
migration, range split/merge, eviction and overcommit scenarios.

Most subtests are adapted from the KFD SVM test suite (KFDSVMRangeTest)
and ported to the amdgpu render-node CS path.

Signed-off-by: Junhua Shen <Junhua.Shen@amd.com>
---
 tests/amdgpu/amd_svm.c   | 1828 ++++++++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build |    5 +
 2 files changed, 1833 insertions(+)
 create mode 100644 tests/amdgpu/amd_svm.c

diff --git a/tests/amdgpu/amd_svm.c b/tests/amdgpu/amd_svm.c
new file mode 100644
index 000000000..82bf7a3d5
--- /dev/null
+++ b/tests/amdgpu/amd_svm.c
@@ -0,0 +1,1828 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2026 Advanced Micro Devices, Inc.
+ */
+
+#include <errno.h>
+#include <fcntl.h>
+#include <inttypes.h>
+#include <pthread.h>
+#include <signal.h>
+#include <string.h>
+#include <unistd.h>
+#include <sys/ioctl.h>
+#include <sys/mman.h>
+#include <sys/stat.h>
+#include <sys/sysmacros.h>
+#include <sys/wait.h>
+#include <amdgpu.h>
+#ifdef HAVE_KFD_IOCTL_H
+#include <linux/kfd_ioctl.h>
+#endif
+
+#include "igt.h"
+
+#include "lib/amdgpu/amd_memory.h"
+#include "lib/amdgpu/amd_svm.h"
+#include "lib/amdgpu/amd_PM4.h"
+#include "lib/amdgpu/amd_ip_blocks.h"
+#include "lib/amdgpu/amd_command_submission.h"
+#include "lib/amdgpu/compute_utils/amd_dispatch_helpers.h"
+#include "lib/amdgpu/amdgpu_asic_addr.h" /* FAMILY_* macros */
+
+static void sdma_fill_test(amdgpu_device_handle device);
+static void sdma_copy_test(amdgpu_device_handle device);
+
+/* SVM (Shared Virtual Memory) test cases adapted from KFDSVMRangeTest. */
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
+ * struct svm_buf - SVM buffer descriptor
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
+struct svm_buf {
+	void *ptr;
+	uint64_t va;
+	uint64_t size;
+	amdgpu_device_handle device;
+	uint32_t flags;
+	bool self_allocated;
+};
+
+/* Local flag bits for svm_buf_alloc (mapped to boolean attrs). */
+#define SVM_FLAG_HOST_ACCESS  (1 << 0)
+#define SVM_FLAG_COHERENT     (1 << 1)
+#define SVM_FLAG_GPU_EXEC     (1 << 2)
+#define SVM_FLAGS_HOST_COHERENT (SVM_FLAG_HOST_ACCESS | SVM_FLAG_COHERENT)
+
+/* kfdtest's HsaSVMRange default: prefetch to and prefer system memory. */
+#define SVM_LOC_SYS AMDGPU_SVM_LOCATION_SYSMEM
+
+/* ACCESS + 3 boolean flags + PREFETCH_LOC + PREFERRED_LOC */
+#define SVM_MAX_ATTRS 6
+
+/*
+ * Fill @attrs with ACCESS, the boolean attrs selected by @flags, and
+ * PREFETCH_LOC/PREFERRED_LOC when >= 0. Returns the number written.
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
+static int svm_buf_alloc(struct svm_buf *buf,
+			 amdgpu_device_handle device,
+			 void *addr,
+			 uint64_t size,
+			 uint32_t access,
+			 uint32_t flags,
+			 int prefetch_loc,
+			 int preferred_loc)
+{
+	struct drm_amdgpu_svm_attribute svm_attrs[SVM_MAX_ATTRS];
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
+	/* Don't clobber caller-provided ranges (e.g. file-backed mappings). */
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
+static void svm_buf_free(struct svm_buf *buf)
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
+static int svm_buf_prefetch(struct svm_buf *buf, uint32_t location)
+{
+	if (!buf || !buf->ptr)
+		return -1;
+
+	return amdgpu_svm_set_prefetch_loc(buf->device, buf->ptr, buf->size, location);
+}
+
+/* Fill buffer with a 32-bit pattern. */
+static void svm_buf_fill_u32(struct svm_buf *buf, uint32_t value)
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
+/* Register an existing range without touching it; returns the raw result. */
+static int svm_register(amdgpu_device_handle dev, void *addr, uint64_t size,
+			uint32_t access, uint32_t flags,
+			int prefetch_loc, int preferred_loc)
+{
+	struct drm_amdgpu_svm_attribute attrs[SVM_MAX_ATTRS];
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
+/* Asserting wrappers for common SVM operations. */
+static void svm_buf_alloc_assert(struct svm_buf *buf,
+				 amdgpu_device_handle dev, void *addr,
+				 uint64_t size, uint32_t access,
+				 uint32_t flags, int prefetch, int preferred)
+{
+	int r = svm_buf_alloc(buf, dev, addr, size, access, flags,
+			      prefetch, preferred);
+	igt_assert_f(r == 0, "svm_buf_alloc failed: %d\n", r);
+}
+
+static void svm_buf_prefetch_assert(struct svm_buf *buf, uint32_t loc)
+{
+	int r = svm_buf_prefetch(buf, loc);
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
+/* Sizes exercised by the isolated sdma-fill / sdma-copy tests. */
+static const uint32_t sdma_test_sizes[] = {
+	4096,		/* single page */
+	2U << 20,	/* 2 MB */
+	4U << 20,	/* 4 MB */
+	16U << 20,	/* 16 MB */
+	64U << 20,	/* 64 MB */
+	256U << 20,	/* 256 MB */
+};
+
+/* SDMA fill system-memory ranges of increasing size; no prefetch/migration. */
+static void sdma_fill_test(amdgpu_device_handle device)
+{
+	uint32_t svm_flags = SVM_FLAGS_HOST_COHERENT;
+	struct amdgpu_dma_limits limits;
+	uint64_t chunk_bytes;
+	size_t n;
+
+	require_gpu_family(device, FAMILY_AI);
+
+	amdgpu_dma_limits_query(device, &limits);
+	chunk_bytes = amdgpu_dma_max_bytes(&limits, AMDGPU_HW_IP_DMA);
+
+	for (n = 0; n < ARRAY_SIZE(sdma_test_sizes); n++) {
+		struct svm_buf buf = {0};
+		uint32_t size = sdma_test_sizes[n];
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
+		svm_buf_free(&buf);
+	}
+
+	igt_info("sdma-fill-isolated: PASSED\n");
+}
+
+/* SDMA copy between system-memory ranges of increasing size; no prefetch/migration. */
+static void sdma_copy_test(amdgpu_device_handle device)
+{
+	uint32_t svm_flags = SVM_FLAGS_HOST_COHERENT;
+	struct amdgpu_dma_limits limits;
+	uint64_t chunk_bytes;
+	size_t n;
+
+	require_gpu_family(device, FAMILY_AI);
+
+	amdgpu_dma_limits_query(device, &limits);
+	chunk_bytes = amdgpu_dma_max_bytes(&limits, AMDGPU_HW_IP_DMA);
+
+	for (n = 0; n < ARRAY_SIZE(sdma_test_sizes); n++) {
+		struct svm_buf src = {0}, dst = {0};
+		uint32_t size = sdma_test_sizes[n];
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
+		svm_buf_free(&src);
+		svm_buf_free(&dst);
+	}
+
+	igt_info("sdma-copy-isolated: PASSED\n");
+}
+
+/* Copy one dword src->dst via compute shader using SVM system memory. */
+static void basic_system_mem_test(amdgpu_device_handle device)
+{
+	size_t page_sz = sysconf(_SC_PAGE_SIZE);
+	struct svm_buf src = {0}, dst = {0};
+	uint32_t svm_flags = SVM_FLAGS_HOST_COHERENT;
+
+	svm_buf_alloc_assert(&src, device, NULL, page_sz,
+			     AMDGPU_SVM_ACCESS_ALLOW_MIGRATE, svm_flags,
+			     SVM_LOC_SYS, SVM_LOC_SYS);
+	svm_buf_alloc_assert(&dst, device, NULL, page_sz,
+			     AMDGPU_SVM_ACCESS_ALLOW_MIGRATE, svm_flags,
+			     SVM_LOC_SYS, SVM_LOC_SYS);
+
+	/* Fill src with test pattern */
+	svm_buf_fill_u32(&src, 0x01010101);
+
+	/* Dispatch: copy src[0] -> dst[0] via SVM VAs */
+	compute_copy_assert(device, src.va, dst.va);
+
+	assert_eq_u32(((uint32_t *)dst.ptr)[0], 0x01010101, "basic-system-mem dst[0]");
+	igt_info("basic-system-mem: PASSED\n");
+
+	svm_buf_free(&src);
+	svm_buf_free(&dst);
+}
+
+/* Verify SVM attribute set/get round-trip and defaults. */
+static void set_get_attributes_test(amdgpu_device_handle device)
+{
+	static const struct {
+		uint32_t type;
+		uint32_t def;	/* kernel default */
+		uint32_t set;	/* value written in phase 2 */
+	} tab[] = {
+		{ AMDGPU_SVM_ATTR_PREFETCH_LOC,
+		  AMDGPU_SVM_LOCATION_UNDEFINED, AMDGPU_SVM_LOCATION_LOCAL },
+		{ AMDGPU_SVM_ATTR_PREFERRED_LOC,
+		  AMDGPU_SVM_LOCATION_UNDEFINED, AMDGPU_SVM_LOCATION_LOCAL },
+		{ AMDGPU_SVM_ATTR_HOST_ACCESS, 1, 1 },
+		{ AMDGPU_SVM_ATTR_GPU_EXEC, 0, 1 },
+		{ AMDGPU_SVM_ATTR_COHERENT, 1, 1 },
+		{ AMDGPU_SVM_ATTR_GRANULARITY, 9, 0x3F },
+		{ AMDGPU_SVM_ATTR_ACCESS,
+		  AMDGPU_SVM_ACCESS_INACCESSIBLE, AMDGPU_SVM_ACCESS_ALLOW_MIGRATE },
+	};
+	struct drm_amdgpu_svm_attribute in[ARRAY_SIZE(tab)];
+	struct drm_amdgpu_svm_attribute out[ARRAY_SIZE(tab)];
+	const uint32_t n_attrs = ARRAY_SIZE(tab);
+	size_t buf_size = sysconf(_SC_PAGE_SIZE);
+	void *buf;
+	uint64_t va;
+	uint32_t i;
+	int r;
+
+	for (i = 0; i < n_attrs; i++) {
+		in[i].type = tab[i].type;
+		in[i].value = tab[i].set;
+	}
+
+	buf = svm_mmap_anon(buf_size);
+	va = (uint64_t)(uintptr_t)buf;
+
+	/* Phase 1: query default attributes */
+	memcpy(out, in, sizeof(out));
+	r = amdgpu_svm_get_attr(device, va, buf_size, n_attrs, out, NULL);
+	igt_assert_eq(r, 0);
+
+	for (i = 0; i < n_attrs; i++) {
+		/* Granularity default can vary, skip the check */
+		if (out[i].type == AMDGPU_SVM_ATTR_GRANULARITY)
+			continue;
+
+		igt_info("  attr[%u] type=0x%x  value=0x%x  expected=0x%x\n",
+			 i, out[i].type, out[i].value, tab[i].def);
+
+		if (out[i].type == AMDGPU_SVM_ATTR_ACCESS) {
+			/* Default depends on XNACK: INACCESSIBLE or ALLOW_MIGRATE */
+			igt_assert_f(out[i].value == AMDGPU_SVM_ACCESS_INACCESSIBLE ||
+				     out[i].value == AMDGPU_SVM_ACCESS_ALLOW_MIGRATE,
+				     "attr[%u] default ACCESS value 0x%x unexpected\n",
+				     i, out[i].value);
+		} else {
+			igt_assert_f(out[i].value == tab[i].def,
+				     "attr[%u] type=0x%x default value 0x%x != expected 0x%x\n",
+				     i, out[i].type, out[i].value, tab[i].def);
+		}
+	}
+	igt_info("set-get-attributes: Phase 1 PASSED (defaults verified)\n");
+
+	/* Phase 2: set attributes, then read back and verify */
+	r = amdgpu_svm_set_attr(device, va, buf_size, n_attrs, in);
+	igt_assert_f(r == 0, "amdgpu_svm_set_attr failed: %d\n", r);
+
+	memcpy(out, in, sizeof(out));
+	r = amdgpu_svm_get_attr(device, va, buf_size, n_attrs, out, NULL);
+	igt_assert_eq(r, 0);
+
+	for (i = 0; i < n_attrs; i++) {
+		igt_info("  attr[%u] type=0x%x  set=0x%x  got=0x%x\n",
+			 i, out[i].type, tab[i].set, out[i].value);
+
+		igt_assert_f(out[i].value == tab[i].set,
+			     "attr[%u] type=0x%x value mismatch: set 0x%x, got 0x%x\n",
+			     i, out[i].type, tab[i].set, out[i].value);
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
+	struct svm_buf src = {0}, loc = {0}, dst = {0};
+	uint32_t svm_flags = SVM_FLAGS_HOST_COHERENT;
+
+	svm_buf_alloc_assert(&src, device, NULL, page_sz,
+			     AMDGPU_SVM_ACCESS_ALLOW_MIGRATE, svm_flags,
+			     SVM_LOC_SYS, SVM_LOC_SYS);
+	svm_buf_alloc_assert(&dst, device, NULL, page_sz,
+			     AMDGPU_SVM_ACCESS_ALLOW_MIGRATE, svm_flags,
+			     SVM_LOC_SYS, SVM_LOC_SYS);
+
+	/* Allocate loc with PREFETCH_LOC + PREFERRED_LOC = GPU (VRAM) */
+	svm_buf_alloc_assert(&loc, device, NULL, page_sz,
+			     AMDGPU_SVM_ACCESS_ALLOW_MIGRATE, svm_flags,
+			     AMDGPU_SVM_LOCATION_LOCAL,
+			     AMDGPU_SVM_LOCATION_LOCAL);
+
+	svm_buf_fill_u32(&src, 0x01010101);
+
+	/* Dispatch 1: src (SVM sys) -> loc (SVM VRAM) */
+	compute_copy_assert(device, src.va, loc.va);
+
+	/* Dispatch 2: loc (SVM VRAM) -> dst (SVM sys) */
+	compute_copy_assert(device, loc.va, dst.va);
+
+	/* Verify: dst[0] must equal 0x01010101 */
+	assert_eq_u32(((uint32_t *)dst.ptr)[0], 0x01010101, "basic-vram dst[0]");
+	igt_info("basic-vram: PASSED\n");
+
+	svm_buf_free(&src);
+	svm_buf_free(&loc);
+	svm_buf_free(&dst);
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
+			 SVM_FLAGS_HOST_COHERENT, SVM_LOC_SYS, SVM_LOC_SYS);
+
+	igt_assert_f(r != 0,
+		     "invalid-range: expected failure setting SVM attrs on unmapped VA 0x10000, "
+		     "but amdgpu_svm_set_attr() returned 0 (success)\n");
+
+	igt_info("invalid-range: PASSED (amdgpu_svm_set_attr returned %d as expected)\n", r);
+}
+
+/*
+ * Verify GPU access on both sides of a hole punched into a registered range:
+ *
+ *   | 2 pages (A) | 4 pages unmapped | 10 pages (B) |
+ *   pBuf          pBuf2              pBuf3
+ */
+static void partial_unmap_sys_mem_test(amdgpu_device_handle device)
+{
+	const size_t page_sz = sysconf(_SC_PAGE_SIZE);
+	const unsigned int buf_size = 16 * page_sz;
+	const unsigned int buf2_size = 4 * page_sz;
+	struct svm_buf dest = {0};
+	char *pBuf, *pBuf2, *pBuf3;
+
+	pBuf = svm_mmap_anon(buf_size);
+	igt_assert_eq(svm_register(device, pBuf, buf_size,
+				   AMDGPU_SVM_ACCESS_ALLOW_MIGRATE,
+				   SVM_FLAGS_HOST_COHERENT,
+				   SVM_LOC_SYS, SVM_LOC_SYS), 0);
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
+			     SVM_FLAGS_HOST_COHERENT, SVM_LOC_SYS, SVM_LOC_SYS);
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
+	svm_buf_free(&dest);
+
+	munmap_assert(pBuf, 2 * page_sz);
+	munmap_assert(pBuf3, buf_size - 2 * page_sz - buf2_size);
+}
+
+/* Test SVM prefetch semantics: freed-buffer check and location tracking. */
+static void prefetch_test(amdgpu_device_handle device)
+{
+	const unsigned int buf_size = 16 << 10;
+	struct svm_buf buf = {0};
+	struct drm_amdgpu_svm_attribute attr = {
+		AMDGPU_SVM_ATTR_PREFETCH_LOC, 0
+	};
+	uint32_t svm_flags = SVM_FLAGS_HOST_COHERENT;
+	uint32_t prefetch_val, first_half_val;
+	uint64_t out_size;
+	int r;
+
+	/* Part 1: register, free, verify re-registration fails */
+	svm_buf_alloc_assert(&buf, device, NULL, buf_size,
+			     AMDGPU_SVM_ACCESS_ALLOW_MIGRATE, svm_flags,
+			     SVM_LOC_SYS, SVM_LOC_SYS);
+	svm_buf_free(&buf);
+
+	/* svm_set_attr on freed (NULL) pointer must fail */
+	r = svm_register(device, NULL, buf_size,
+			 AMDGPU_SVM_ACCESS_ALLOW_MIGRATE,
+			 SVM_FLAGS_HOST_COHERENT, SVM_LOC_SYS, SVM_LOC_SYS);
+	igt_assert_f(r != 0,
+		     "prefetch-test part-1 FAILED: svm_set_attr on freed VA succeeded "
+		     "(expected failure)\n");
+	igt_info("prefetch-test part-1: freed pointer correctly rejected (ret=%d)\n", r);
+
+	/* Part 2: prefetch-location tracking */
+	svm_buf_alloc_assert(&buf, device, NULL, buf_size,
+			     AMDGPU_SVM_ACCESS_ALLOW_MIGRATE, svm_flags,
+			     SVM_LOC_SYS, SVM_LOC_SYS);
+
+	/* Range was registered with PREFETCH_LOC = SYSMEM */
+	r = amdgpu_svm_get_prefetch_loc(device, (void *)(uintptr_t)buf.va,
+					buf_size / 2, &first_half_val);
+	igt_assert_eq(r, 0);
+	assert_eq_u32(first_half_val, AMDGPU_SVM_LOCATION_SYSMEM,
+		      "prefetch-test part-2a first half");
+	igt_info("prefetch-test part-2a: first half prefetch_loc=0x%x\n",
+		 first_half_val);
+
+	/* Prefetch second half to GPU VRAM (only half, to create mixed range) */
+	r = amdgpu_svm_set_prefetch_loc(device,
+					(void *)(uintptr_t)(buf.va + buf_size / 2),
+					buf_size / 2, AMDGPU_SVM_LOCATION_LOCAL);
+	igt_assert_eq(r, 0);
+	igt_info("prefetch-test part-2b: second half prefetched to local VRAM\n");
+
+	r = amdgpu_svm_get_prefetch_loc(device,
+					(void *)(uintptr_t)(buf.va + buf_size / 2),
+					buf_size / 2, &prefetch_val);
+	igt_assert_eq(r, 0);
+	assert_eq_u32(prefetch_val, AMDGPU_SVM_LOCATION_LOCAL,
+		      "prefetch-test part-2b-verify second half");
+	igt_info("prefetch-test part-2b-verify: second half prefetch_loc=0x%x\n",
+		 prefetch_val);
+
+	/*
+	 * Full range is not uniform: GET_ATTR reports the first half's value
+	 * and clips the returned size to that uniform first half.
+	 */
+	r = amdgpu_svm_get_attr(device, buf.va, buf_size, 1, &attr, &out_size);
+	igt_assert_eq(r, 0);
+	assert_eq_u32(attr.value, first_half_val,
+		      "prefetch-test part-2c full range value");
+	assert_eq_u64(out_size, buf_size / 2,
+		      "prefetch-test part-2c full range size");
+	igt_info("prefetch-test part-2c: full range prefetch_loc=0x%x, "
+		 "uniform size=0x%lx\n", attr.value, (unsigned long)out_size);
+
+	igt_info("prefetch-test: PASSED\n");
+
+	svm_buf_free(&buf);
+}
+
+/*
+ * Test repeated RAM<->VRAM migration round-trips and verify data integrity.
+ */
+static void migrate_test(amdgpu_device_handle device)
+{
+	const unsigned int migrateRepeat = 8;
+	const unsigned int buffer_size = 16 << 20;	/* 16 MB */
+	struct svm_buf data_buf = {0};
+	struct svm_buf sys_buf = {0};
+	struct svm_buf sys_buf2 = {0};
+	uint32_t *pData, *pBuf, *pBuf2;
+	uint32_t svm_flags = SVM_FLAGS_HOST_COHERENT;
+	unsigned int rep;
+	uint32_t i;
+
+	/* Allocate 3 SVM buffers */
+	svm_buf_alloc_assert(&data_buf, device, NULL, buffer_size,
+			     AMDGPU_SVM_ACCESS_ALLOW_MIGRATE, svm_flags,
+			     SVM_LOC_SYS, SVM_LOC_SYS);
+	svm_buf_alloc_assert(&sys_buf, device, NULL, buffer_size,
+			     AMDGPU_SVM_ACCESS_ALLOW_MIGRATE, svm_flags,
+			     SVM_LOC_SYS, SVM_LOC_SYS);
+	svm_buf_alloc_assert(&sys_buf2, device, NULL, buffer_size,
+			     AMDGPU_SVM_ACCESS_ALLOW_MIGRATE, svm_flags,
+			     SVM_LOC_SYS, SVM_LOC_SYS);
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
+		svm_buf_prefetch_assert(&sys_buf, AMDGPU_SVM_LOCATION_LOCAL);
+		svm_buf_prefetch_assert(&sys_buf2, AMDGPU_SVM_LOCATION_LOCAL);
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
+	svm_buf_free(&data_buf);
+	svm_buf_free(&sys_buf);
+	svm_buf_free(&sys_buf2);
+}
+
+/*
+ * Test GPU mapping update after range split + migrate back to sysmem.
+ */
+static void migrate_access_in_place_test(amdgpu_device_handle device)
+{
+	uint32_t svm_flags = SVM_FLAGS_HOST_COHERENT;
+	struct svm_buf data_buf = {0};
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
+		      "VRAM too small (%" PRIu64 " bytes), need >= 2 MB VRAM\n",
+		      vram_size);
+
+	svm_buf_alloc_assert(&data_buf, device, NULL, BufferSize,
+			     AMDGPU_SVM_ACCESS_IN_PLACE, svm_flags,
+			     SVM_LOC_SYS, SVM_LOC_SYS);
+	pData = (uint32_t *)data_buf.ptr;
+
+	igt_info("migrate-access-in-place: data=%p size=%u (%.1f MB)\n",
+		 data_buf.ptr, BufferSize, BufferSize / (1024.0 * 1024.0));
+
+	/* Prefetch to VRAM */
+	svm_buf_prefetch_assert(&data_buf, AMDGPU_SVM_LOCATION_LOCAL);
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
+	for (i = 0; i < BufferSize / sizeof(uint32_t); i += 1024)
+		assert_eq_u32(pData[i], 0x55AAAA55, "migrate-access-in-place pData[%u]", i);
+	igt_info("migrate-access-in-place: PASSED (verified %u positions)\n",
+		 BufferSize / (unsigned int)sizeof(uint32_t) / 1024);
+
+	svm_buf_free(&data_buf);
+}
+
+/* SDMA copy @size bytes in chunks of at most @max_chunk bytes. */
+static void sdma_copy_chunked(amdgpu_device_handle dev, uint64_t dst,
+			      uint64_t src, uint32_t size, uint32_t max_chunk)
+{
+	uint32_t offset, chunk;
+
+	for (offset = 0; offset < size; offset += chunk) {
+		chunk = MIN(size - offset, max_chunk);
+		sdma_copy_assert(dev, dst + offset, src + offset, chunk);
+	}
+}
+
+static void migrate_large_buf_test(amdgpu_device_handle device)
+{
+	uint32_t BufferSize = 1U << 30;		/* 1 GB cap */
+	const uint32_t maxSDMASize = 128U << 20;	/* 128 MB chunks */
+	struct svm_buf sys_buf = {0};
+	struct svm_buf sys_buf2 = {0};
+	uint32_t svm_flags = SVM_FLAGS_HOST_COHERENT;
+	uint32_t *pBuf, *pBuf2;
+	uint64_t sys_mem_size;
+	uint64_t vram_size;
+	uint32_t i;
+
+	/* Determine buffer size: MIN(1 GB, vramSize * 3/4) */
+	vram_size = get_available_vram(device);
+	igt_require_f(vram_size > 0, "No VRAM found\n");
+	if (vram_size * 3 / 4 < BufferSize)
+		BufferSize = (uint32_t)(vram_size * 3 / 4);
+
+	/* Round down to page boundary */
+	BufferSize &= ~((uint32_t)sysconf(_SC_PAGE_SIZE) - 1);
+	igt_require_f(BufferSize > 0, "VRAM too small for large-buf test\n");
+
+	/* Check system memory is sufficient (need 2 x BufferSize) */
+	sys_mem_size = (uint64_t)sysconf(_SC_PHYS_PAGES) *
+		       (uint64_t)sysconf(_SC_PAGE_SIZE);
+	igt_require_f((uint64_t)BufferSize * 2 <= sys_mem_size / 2,
+		      "Not enough system memory for large-buf test\n");
+
+	igt_info("migrate-large-buf: BufferSize=%u MB, VRAM=%lu MB, "
+		 "maxSDMASize=%u MB\n",
+		 BufferSize >> 20, (unsigned long)(vram_size >> 20),
+		 maxSDMASize >> 20);
+
+	svm_buf_alloc_assert(&sys_buf, device, NULL, BufferSize,
+			     AMDGPU_SVM_ACCESS_ALLOW_MIGRATE, svm_flags,
+			     SVM_LOC_SYS, SVM_LOC_SYS);
+	svm_buf_alloc_assert(&sys_buf2, device, NULL, BufferSize,
+			     AMDGPU_SVM_ACCESS_ALLOW_MIGRATE, svm_flags,
+			     SVM_LOC_SYS, SVM_LOC_SYS);
+
+	pBuf  = (uint32_t *)sys_buf.ptr;
+	pBuf2 = (uint32_t *)sys_buf2.ptr;
+
+	svm_buf_fill_u32(&sys_buf, 0x1);
+	svm_buf_fill_u32(&sys_buf2, 0x2);
+
+	/* Re-register sys_buf with VRAM prefetch/preferred to migrate it */
+	igt_assert_eq(svm_register(device, sys_buf.ptr, BufferSize,
+				   AMDGPU_SVM_ACCESS_ALLOW_MIGRATE, svm_flags,
+				   AMDGPU_SVM_LOCATION_LOCAL,
+				   AMDGPU_SVM_LOCATION_LOCAL), 0);
+
+	/* Phase 1: SDMA copy sys_buf (VRAM) -> sys_buf2, chunked */
+	igt_info("migrate-large-buf: Phase 1 -- VRAM->sys_buf2 copy\n");
+	sdma_copy_chunked(device, sys_buf2.va, sys_buf.va, BufferSize, maxSDMASize);
+	for (i = 0; i < BufferSize / 4; i += 1024)
+		assert_eq_u32(pBuf2[i], 0x1, "Phase1: sys_buf2[%u]", i);
+
+	/* Phase 2: update VRAM, fault-back to RAM */
+	igt_info("migrate-large-buf: Phase 2 -- update VRAM, fault-back to RAM\n");
+	svm_buf_fill_u32(&sys_buf2, 0x3);
+	sdma_copy_chunked(device, sys_buf.va, sys_buf2.va, BufferSize, maxSDMASize);
+
+	/* CPU read triggers page fault -> VRAM->RAM migration */
+	for (i = 0; i < BufferSize / 4; i += 1024)
+		assert_eq_u32(pBuf[i], 0x3, "Phase2: sys_buf[%u]", i);
+
+	/* Phase 3: verify GPU mapping after migration back to RAM */
+	igt_info("migrate-large-buf: Phase 3 -- GPU mapping after migration\n");
+	svm_buf_fill_u32(&sys_buf, 0x4);
+	sdma_copy_chunked(device, sys_buf2.va, sys_buf.va, BufferSize, maxSDMASize);
+
+	for (i = 0; i < BufferSize / 4; i += 1024)
+		assert_eq_u32(pBuf2[i], 0x4, "Phase3: sys_buf2[%u]", i);
+
+	igt_info("migrate-large-buf: PASSED\n");
+
+	svm_buf_free(&sys_buf);
+	svm_buf_free(&sys_buf2);
+}
+
+/* Test migration policy with 1 MB buffer using 64-bit sequential data. */
+static void migrate_policy_test(amdgpu_device_handle device)
+{
+	const uint32_t BufferSize = 1U << 20;	/* 1 MB */
+	struct svm_buf data_buf = {0};
+	struct svm_buf sys_buf = {0};
+	uint32_t svm_flags = SVM_FLAGS_HOST_COHERENT;
+	uint64_t *pData, *pBuf;
+	uint32_t i;
+
+	svm_buf_alloc_assert(&data_buf, device, NULL, BufferSize,
+			     AMDGPU_SVM_ACCESS_ALLOW_MIGRATE, svm_flags,
+			     SVM_LOC_SYS, SVM_LOC_SYS);
+	svm_buf_alloc_assert(&sys_buf, device, NULL, BufferSize,
+			     AMDGPU_SVM_ACCESS_ALLOW_MIGRATE, svm_flags,
+			     SVM_LOC_SYS, SVM_LOC_SYS);
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
+	svm_buf_prefetch_assert(&sys_buf, AMDGPU_SVM_LOCATION_LOCAL);
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
+	svm_buf_free(&data_buf);
+	svm_buf_free(&sys_buf);
+}
+
+/* Shared state for migration threads. */
+struct migration_thread_params {
+	struct svm_buf *svm_buf;	/* SVM buffer to operate on */
+	int       prefetch_loc;	/* AMDGPU_SVM_LOCATION_* */
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
+	p->result = svm_buf_prefetch(p->svm_buf, p->prefetch_loc);
+	return NULL;
+}
+
+/* Two threads race migration to stress kernel's range migration locking. */
+static void multi_thread_migration_test(amdgpu_device_handle device)
+{
+	const unsigned long test_loops = 2;
+	const uint32_t BufferSize = 1U << 27;	/* 128 MB -- stress engine separation under load */
+	struct svm_buf svm_buf = {0};
+	struct svm_buf data_buf = {0};
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
+			     AMDGPU_SVM_ACCESS_ALLOW_MIGRATE, svm_flags,
+			     SVM_LOC_SYS, SVM_LOC_SYS);
+	pBuf = (uint64_t *)svm_buf.ptr;
+
+	svm_buf_alloc_assert(&data_buf, device, NULL, BufferSize,
+			     AMDGPU_SVM_ACCESS_ALLOW_MIGRATE, svm_flags,
+			     SVM_LOC_SYS, SVM_LOC_SYS);
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
+		params.prefetch_loc = AMDGPU_SVM_LOCATION_LOCAL;
+		params.result = -1;
+		r = pthread_create(&thread, NULL,
+				   gpu_prefetch_thread_fn, &params);
+		igt_assert_eq(r, 0);
+
+		sdma_copy_assert(device, data_buf.va, svm_buf.va, BufferSize);
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
+		svm_buf_prefetch_assert(&svm_buf, AMDGPU_SVM_LOCATION_SYSMEM);
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
+	svm_buf_free(&svm_buf);
+	svm_buf_free(&data_buf);
+}
+
+/* Verify SVM works with file-backed (MAP_SHARED) memory via SDMA fill. */
+static void migrate_file_backed_range_test(amdgpu_device_handle device)
+{
+	char tmpfname[] = "/tmp/igt-svm-XXXXXX";
+	struct svm_buf svm_buf = {0};
+	const uint32_t size = PAGE_SIZE;
+	uint32_t svm_flags = SVM_FLAGS_HOST_COHERENT;
+	char verify_buf[PAGE_SIZE];
+	void *mmapped;
+	ssize_t nread;
+	int tmp_fd;
+
+	require_gpu_family(device, FAMILY_AI);
+
+	/* Create temp file and write PAGE_SIZE bytes of 0x30 */
+	tmp_fd = mkstemp(tmpfname);
+	igt_assert_f(tmp_fd >= 0, "mkstemp failed: %s\n", strerror(errno));
+
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
+			     AMDGPU_SVM_LOCATION_LOCAL,
+			     AMDGPU_SVM_LOCATION_LOCAL);
+
+	sdma_fill_assert(device, svm_buf.va, 0x33333333, size);
+
+	svm_buf_free(&svm_buf);
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
+	struct svm_buf in_buf = {0};
+	struct svm_buf out_buf = {0};
+	uint32_t svm_flags = SVM_FLAGS_HOST_COHERENT;
+	uint8_t *pinBuf, *pBuf;
+	int child_status;
+	pid_t pid;
+	int r;
+
+	require_gpu_family(device, FAMILY_AI);
+
+	/*
+	 * The phase-2 SDMA write to the read-only page NULL-derefs in
+	 * amdgpu_vm_handle_fault() on this backend; skip until fixed.
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
+		r = svm_buf_alloc(&in_buf, child_dev, NULL, size,
+				  AMDGPU_SVM_ACCESS_ALLOW_MIGRATE,
+				  svm_flags, SVM_LOC_SYS, SVM_LOC_SYS);
+		if (r)
+			_exit(1);
+		pinBuf = (uint8_t *)in_buf.ptr;
+		memset(pinBuf, 0x55, PAGE_SIZE);
+
+		r = mprotect(pinBuf, PAGE_SIZE, PROT_READ);
+		if (r) {
+			svm_buf_free(&in_buf);
+			_exit(1);
+		}
+
+		/* Allocate output buffer */
+		r = svm_buf_alloc(&out_buf, child_dev, NULL, PAGE_SIZE,
+				  AMDGPU_SVM_ACCESS_ALLOW_MIGRATE,
+				  svm_flags, SVM_LOC_SYS, SVM_LOC_SYS);
+		if (r) {
+			svm_buf_free(&in_buf);
+			_exit(1);
+		}
+		pBuf = (uint8_t *)out_buf.ptr;
+		memset(pBuf, 0, PAGE_SIZE);
+
+		/* Phase 1: SDMA READ from read-only page must succeed */
+		r = amdgpu_svm_sdma_copy(child_dev,
+					 (uint64_t)(uintptr_t)pBuf,
+					 (uint64_t)(uintptr_t)pinBuf,
+					 (uint32_t)PAGE_SIZE);
+		if (r || pBuf[0] != 0x55) {
+			svm_buf_free(&out_buf);
+			svm_buf_free(&in_buf);
+			_exit(1);
+		}
+
+		/* Phase 2: SDMA WRITE to read-only page must trigger VM fault */
+		signal(SIGSEGV, SIG_DFL);
+		memset(pBuf, 0xAA, PAGE_SIZE);
+		r = amdgpu_svm_sdma_copy(child_dev,
+					 (uint64_t)(uintptr_t)pinBuf,
+					 (uint64_t)(uintptr_t)pBuf,
+					 (uint32_t)PAGE_SIZE);
+		/* If we get here the fault was handled (dGPU) */
+		(void)r;
+
+		svm_buf_free(&out_buf);
+		svm_buf_free(&in_buf);
+		amdgpu_device_deinitialize(child_dev);
+		drm_close_driver(child_fd);
+		_exit(0);
+	}
+}
+
+/*
+ * Test kernel's ability to split/merge overlapping SVM ranges (6 sub-cases).
+ * @prefetch_loc selects where each range is prefetched (AMDGPU_SVM_LOCATION_*).
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
+#define svm_reg(addr, sz) \
+	igt_assert_eq(svm_register(device, (addr), (sz), \
+				   AMDGPU_SVM_ACCESS_ALLOW_MIGRATE, \
+				   SVM_FLAGS_HOST_COHERENT, prefetch_loc, prefetch_loc), 0)
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
+	svm_reg(pBuf, buf_size + pg2);
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
+	/* Case 6: register sub-range, then munmap its backing */
+	igt_info("split-range: case 6 - munmap after register\n");
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
+	split_range_test(device, AMDGPU_SVM_LOCATION_SYSMEM);
+	igt_info("split-system-range: PASSED\n");
+}
+
+/* Overlapping SVM range split with ranges prefetched to VRAM. */
+static void split_vram_range_test(amdgpu_device_handle device)
+{
+	split_range_test(device, AMDGPU_SVM_LOCATION_LOCAL);
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
+				   AMDGPU_SVM_ACCESS_ALLOW_MIGRATE, 0,
+				   SVM_LOC_SYS, SVM_LOC_SYS), 0);
+	igt_assert_eq(amdgpu_svm_set_prefetch_loc(device, pBuf, buf_size,
+						  AMDGPU_SVM_LOCATION_LOCAL), 0);
+
+	/* SDMA fill page 0 with 0x01010101, page 3 with 0x04040404 */
+	sdma_fill_assert(device, (uint64_t)(uintptr_t)pBuf, 0x01010101, page_size);
+	sdma_fill_assert(device, (uint64_t)(uintptr_t)(pBuf + 3 * page_size),
+			 0x04040404, page_size);
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
+ * Register and prefetch (VRAM + 1 GB) in 512 MB ranges; the kernel must
+ * evict earlier ranges so that every one succeeds.
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
+	/* Prefetched ranges keep a sysmem backing store; stay under half of RAM. */
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
+				 AMDGPU_SVM_LOCATION_LOCAL,
+				 AMDGPU_SVM_LOCATION_LOCAL);
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
+/* Prefetch one (VRAM + 1 GB) range; the kernel must split it and evict to fit. */
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
+	/* The range keeps a sysmem backing store; stay under half of RAM. */
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
+			 AMDGPU_SVM_LOCATION_LOCAL,
+			 AMDGPU_SVM_LOCATION_LOCAL);
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
+	/* Holds three consecutive page-aligned pages: src, dst, sdma. */
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
+	/* Element indices of the two pages following globalData */
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
+				   SVM_FLAGS_HOST_COHERENT,
+				   SVM_LOC_SYS, SVM_LOC_SYS), 0);
+	igt_assert_eq(svm_register(device, &stackData[dstOffset], page_sz,
+				   AMDGPU_SVM_ACCESS_ALLOW_MIGRATE,
+				   SVM_FLAGS_HOST_COHERENT,
+				   SVM_LOC_SYS, SVM_LOC_SYS), 0);
+	igt_assert_eq(svm_register(device, &stackData[sdmaOffset], page_sz,
+				   AMDGPU_SVM_ACCESS_ALLOW_MIGRATE,
+				   SVM_FLAGS_HOST_COHERENT,
+				   SVM_LOC_SYS, SVM_LOC_SYS), 0);
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
+		/* Spin without touching the stack so the parent COWs first. */
+		while (1)
+			;
+		_exit(0);
+	}
+
+	/* Parent writes break COW; the MMU notifier must update GPU mappings. */
+	*globalData = 0xD00BED00;
+	stackData[dstOffset] = 0xdeadbeef;
+	stackData[sdmaOffset] = 0xdeadbeef;
+
+	/* Kill the child first so a failed assert does not leave it spinning. */
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
+#ifdef HAVE_KFD_IOCTL_H
+#define KFD_TOPOLOGY_NODES "/sys/class/kfd/kfd/topology/nodes"
+
+/*
+ * Find the KFD gpu_id of the GPU behind @drm_fd by matching its render minor
+ * against the KFD topology. ACQUIRE_VM does not check that drm_fd and gpu_id
+ * refer to the same device, so the caller must get this right.
+ */
+static int kfd_gpu_id_from_drm_fd(int drm_fd, uint32_t *gpu_id)
+{
+	char path[128], line[128];
+	unsigned int render_minor;
+	struct stat st;
+	char *name;
+	int node;
+
+	name = drmGetRenderDeviceNameFromFd(drm_fd);
+	if (!name)
+		return -ENODEV;
+	if (stat(name, &st)) {
+		free(name);
+		return -errno;
+	}
+	free(name);
+	render_minor = minor(st.st_rdev);
+
+	for (node = 0; ; node++) {
+		unsigned int val;
+		bool match = false;
+		FILE *f;
+
+		snprintf(path, sizeof(path), KFD_TOPOLOGY_NODES "/%d/properties", node);
+		f = fopen(path, "r");
+		if (!f)
+			return -ENODEV;
+		while (fgets(line, sizeof(line), f)) {
+			if (sscanf(line, "drm_render_minor %u", &val) == 1) {
+				match = val == render_minor;
+				break;
+			}
+		}
+		fclose(f);
+		if (!match)
+			continue;
+
+		snprintf(path, sizeof(path), KFD_TOPOLOGY_NODES "/%d/gpu_id", node);
+		f = fopen(path, "r");
+		if (!f)
+			return -errno;
+		if (fscanf(f, "%u", gpu_id) != 1)
+			*gpu_id = 0;
+		fclose(f);
+		return *gpu_id ? 0 : -ENODEV;
+	}
+}
+
+/*
+ * Make the VM of @drm_fd a compute VM via KFD; the kernel enables SVM on the
+ * VM as part of this. Returns the KFD fd.
+ */
+static int kfd_init_compute_vm(int drm_fd)
+{
+	struct kfd_ioctl_acquire_vm_args args = { .drm_fd = drm_fd };
+	int kfd_fd, r;
+
+	kfd_fd = open("/dev/kfd", O_RDWR);
+	igt_require_f(kfd_fd >= 0, "/dev/kfd not available: %s\n",
+		      strerror(errno));
+
+	r = kfd_gpu_id_from_drm_fd(drm_fd, &args.gpu_id);
+	igt_assert_f(r == 0, "no KFD node for drm fd: %d\n", r);
+
+	r = ioctl(kfd_fd, AMDKFD_IOC_ACQUIRE_VM, &args);
+	igt_assert_f(r == 0, "AMDKFD_IOC_ACQUIRE_VM failed: %s\n",
+		     strerror(errno));
+
+	igt_info("KFD acquired VM on gpu_id 0x%x\n", args.gpu_id);
+	return kfd_fd;
+}
+#endif /* HAVE_KFD_IOCTL_H */
+
+int igt_main()
+{
+	amdgpu_device_handle device;
+	struct amdgpu_gpu_info gpu_info = {0};
+	int kfd_fd = -1;
+	int fd = -1;
+	int r;
+
+	igt_fixture() {
+		uint32_t major, minor;
+		int err;
+
+#ifndef HAVE_KFD_IOCTL_H
+		igt_skip("linux/kfd_ioctl.h not available at build time\n");
+#endif
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
+		r = setup_amdgpu_ip_blocks(major, minor,  &gpu_info, device);
+		igt_assert_eq(r, 0);
+
+#ifdef HAVE_KFD_IOCTL_H
+		kfd_fd = kfd_init_compute_vm(fd);
+#endif
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
+		if (kfd_fd >= 0)
+			close(kfd_fd);
+		amdgpu_device_deinitialize(device);
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index 08206f8c8..722951017 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -76,6 +76,11 @@ if libdrm_amdgpu.found()
 	else
 		warning('libdrm <= 2.4.104 found, amd_queue_reset test not applicable')
 	endif
+	if have_amdgpu_svm
+		amdgpu_progs +=[ 'amd_svm',]
+	else
+		warning('libdrm_amdgpu without SVM support found, amd_svm test not applicable')
+	endif
         if config.has('HAVE_KFD_IOCTL_H') and host_machine.cpu_family() in ['x86', 'x86_64']
                 amdgpu_progs +=[ 'amd_kfd_dmabuf_unload',
 			  'amd_fuzzing_kfd', ]
-- 
2.34.1

