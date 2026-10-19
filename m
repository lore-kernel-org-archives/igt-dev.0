Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2499BCCA490
	for <igt-dev@archiver.kernel.org>; Mon, 19 Oct 2026 02:48:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE76310E196;
	Mon, 19 Oct 2026 02:48:23 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011022.outbound.protection.outlook.com [40.107.208.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FED910E196
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Oct 2026 02:46:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ea0+HCEi4HBOlf0NPHLcDoTzibXFWbIZwl/Nczs0QyLgkEeWTZjrpoz7aBx02WFx54lXk71szbspkb0MvsJZK+LxWydE5bvZu2HfWR1bIDUYKSOx/CkFE9ikThQGBjEu4VDLYmfF6Jx94J8cf7t1fN2oEeuSB1LgvfC4YT27nHwXV5t5totnH04WaLat+3x2Dr2/HRsUhWtcbP2UoX9mxfxLbF3iMeTIptLCn1BTaN33vppfwzeKpN1d3aHylGyIvCE6RhqfW0FeuL7jx38WyHE1ZyvbeAPGGO/cfDmnGdrFZBj89UCGgvz80Tmjef2/T1VII8r0XXiAFUUvKptJ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RSdKdj5AwcXW+rur0cPJ7Mfrl1egEXhGkNNbEclxMrk=;
 b=W0NarAFq/kEyyktIY/afXVteXRerIvNTKPoEQf6TSWJeLpIgOceJPIWRgvotaFVsk/X8BvVXkC14WI7HBIoU8LPKYnniZKqjTWDmC+4RuvhNlnc3W+pSJUQSlhowDc2hcsAGrXdfWFKGY4nCmFrijE2hvKET9Vo8yIGDK5qx9h+2Tz5dIv2yk3CHIHQkDPYv34B7oehJcRiBC9jMRKCVRGZS1JpcL9fJggy2KG7YMO5Mbx+1O0tXeK/WBVOh5LJ+NP+f1PipAcqfzOTlwy+j2e/M2Pudsi+GGCJfw4daWUhdIGmOmm3u9QwaRXrmcwOy5kEG5s+a1V3jh+xHLopC0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RSdKdj5AwcXW+rur0cPJ7Mfrl1egEXhGkNNbEclxMrk=;
 b=ZDx/VBvWznl/YyR5pgQ0RuqxXHfUB0a7o0XIK58T6pomAjSZhr05dTsurMyxDnl7yjerwZPkq7/KEFboGBtU7FYOITZFN61nkab+fl9rY92vBwKs7377QOrgKJnamCBGk2I1SHfLL9gJ4A2S6rFqpRxQqRBgpe4a6zXy5UzI3Oc=
Received: from PH7PR02CA0014.namprd02.prod.outlook.com (2603:10b6:510:33d::34)
 by BY5PR12MB4307.namprd12.prod.outlook.com (2603:10b6:a03:20c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 02:46:34 +0000
Received: from PH5PEPF0000002B.namprd04.prod.outlook.com
 (2603:10b6:510:33d:cafe::88) by PH7PR02CA0014.outlook.office365.com
 (2603:10b6:510:33d::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 19
 Oct 2026 02:46:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 PH5PEPF0000002B.mail.protection.outlook.com (10.167.243.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 19 Oct 2026 02:46:34 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 18 Oct
 2026 21:46:26 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 18 Oct
 2026 21:46:26 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Sun, 18 Oct 2026 21:46:25 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH 1/3] lib/amdgpu: add MES reset test helpers
Date: Sun, 18 Oct 2026 22:45:47 -0400
Message-ID: <20261019024626.17647-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH5PEPF0000002B:EE_|BY5PR12MB4307:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e7141ac-662c-4c6e-abd1-08df2d8b3041
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|1800799024|376014|23010399003|82310400026|56012099006|11063799006|261009223027099003|261009221227099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: XMAByuQYiGefvYnIKq6EcgTqM5jeN421zfpJmvXs56Ad5VwhzFjUQDenCZeNdIjTFpfVwB0lzKNaxx08UkkNu0JiNAsR1E9z0LnMEu0bu1bJAj1Ku4baT3feQxugAuK4g/M7pjahGJ3Enzv1wuXSZGSXW+JQp9+VjyxpETQE2ELmL662MP+NbptdGJxQ74oAGZsEUtSlpJxf0QrnUaJqckX5ssQSf9RaoKKzfvTLnWQJA44xasoJhfjwGHA6qRpMTzyNbdIiFrdy8qU1q9afg3DMIWKgxxi+CPam2LZJKCyXww1q3/k4Mysz6q3D+93GMkpmYCAFXzR59hO57kh/PkKKVrMHKoj3UxCpCGQCFTyMcR7DFdPgFdX3x9gvEgNdJ+3mmjHldBFWjy6ITMdWFdBSE7xCt3RGhjfTLsoKSWAoxKW5tWkFgDyaq/weBGALLeNsXz1AyFMfbQ7wQ09KOw+HuhToDYFJK9bAubwjgrenU8IDht2TBJkU1iBENSdoCiZHqf5E1Yxj7KxDEfSbztu9ELtY8BKMFZJhuFXCz0bcx0Nedb1cFEAnb/xoZhOtwWIYkTuR+vUrxDwXNOJeqOUcbBAr2HFOWWhhQopw7lrBNtYvMDxu75kvyHSxNmYfdA/HmUA0OlI/hK2+eGb3ki2XxTmmCxUXaC7imn17UQ6KIdoVMhG/Pd6IQm5t5p360c/LuFQG5GH5DR3qTLrtYw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(1800799024)(376014)(23010399003)(82310400026)(56012099006)(11063799006)(261009223027099003)(261009221227099003)(10067099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: gmjnyq/HrxPOz+eqrpQfqJCJTHfThCPdfRQfIKjW4qvIlAO2yzAqhgcgWgHWO8LZUsQEuYIndnZqDAv3zx6fCQ02tgT0SAbSx/stKjv+B6RcBEIsCuZj8YWpD9IZu6FIjRjE7vor3+RDOUICzOPuhuL9POEPLCGla/sui6algA/X/QwZeAEm6JXmf8RDb/6dxHGFF+JsBT2yLyVvYkJAb2rCmqMVhhNpnnFsBOQfoysv29B2ISle2RFrwdhunrmCXCbyZcUvOlHQQ/RsytBpvf71skTb39HZFSSHRHode37RfbKb7vqkFRT+HsqFR/jnLmw1fD+Ficy/FBArlis2+yT/ynDD2K4T7Zj/l2FcaDk+MPznl0acyz48J+0q6bHdjwris/XB1pywDsIHuskuBzZLdWUH7UWE07vzxxplHtakXyAvri+n1uEmKomssIHM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 02:46:34.2104 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e7141ac-662c-4c6e-abd1-08df2d8b3041
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: PH5PEPF0000002B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4307
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

Provide reusable helpers for allocating and mapping indirect-buffer and
destination BOs, releasing their resources, submitting command streams,
and unmapping a BO VA. Keep MES resource ownership and submission details
out of IGT scenario code.

Build the helpers with the AMDGPU library when libdrm-amdgpu is available.
The native MES reset IGT subtests use these routines to prepare workloads
and exercise teardown while GPU work is in flight.

Originally designed by Jatin Kataria <jkataria@netflix.com>; ported to i
IGT and redesigned to fit IGT architecture.

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_mes_reset.c | 205 +++++++++++++++++++++++++++++++++++++
 lib/amdgpu/amd_mes_reset.h |  45 ++++++++
 lib/meson.build            |   1 +
 3 files changed, 251 insertions(+)
 create mode 100644 lib/amdgpu/amd_mes_reset.c
 create mode 100644 lib/amdgpu/amd_mes_reset.h

diff --git a/lib/amdgpu/amd_mes_reset.c b/lib/amdgpu/amd_mes_reset.c
new file mode 100644
index 000000000..013e2dbc4
--- /dev/null
+++ b/lib/amdgpu/amd_mes_reset.c
@@ -0,0 +1,205 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Originally developed by Jatin Kataria at Netflix.
+ * Copyright (c) 2026 Netflix, Inc.
+ *
+ * Adapted for IGT by Advanced Micro Devices, Inc., 2026.
+ */
+
+#include <amdgpu_drm.h>
+#include "igt.h"
+#include "amd_mes_reset.h"
+#include "amd_PM4.h"
+#include <string.h>
+#include <errno.h>
+
+#define MES_NOP_PACKET PACKET3(PACKET3_NOP, 0)
+
+/* ========================================================================
+ * Buffer Object Management
+ * ======================================================================== */
+
+int mes_create_ib_bo(amdgpu_device_handle device, uint32_t size, uint64_t va,
+		     struct mes_ib_node *node)
+{
+	struct amdgpu_bo_alloc_request req = {0};
+	amdgpu_bo_handle buf_handle;
+	void *cpu_ptr;
+	int r;
+
+	if (!node)
+		return -1;
+
+	memset(node, 0, sizeof(*node));
+
+	req.alloc_size = size;
+	req.phys_alignment = 4096;
+	req.preferred_heap = AMDGPU_GEM_DOMAIN_GTT;
+	req.flags = 0;
+
+	r = amdgpu_bo_alloc(device, &req, &buf_handle);
+	if (r)
+		return r;
+
+	r = amdgpu_va_range_alloc(device, amdgpu_gpu_va_range_general,
+				  size, 4096, 0, &node->va, &node->va_handle,
+				  0);
+	if (r) {
+		amdgpu_bo_free(buf_handle);
+		return r;
+	}
+
+	r = amdgpu_bo_va_op_raw(device, buf_handle, 0, size, node->va,
+				AMDGPU_VM_PAGE_READABLE |
+				AMDGPU_VM_PAGE_WRITEABLE |
+				AMDGPU_VM_PAGE_EXECUTABLE,
+				AMDGPU_VA_OP_MAP);
+	if (r) {
+		amdgpu_va_range_free(node->va_handle);
+		amdgpu_bo_free(buf_handle);
+		return r;
+	}
+
+	r = amdgpu_bo_cpu_map(buf_handle, &cpu_ptr);
+	if (r) {
+		amdgpu_bo_va_op(buf_handle, 0, size, node->va, 0, AMDGPU_VA_OP_CLEAR);
+		amdgpu_va_range_free(node->va_handle);
+		amdgpu_bo_free(buf_handle);
+		return r;
+	}
+
+	node->bo_handle = buf_handle;
+	node->cpu_ptr = (uint32_t *)cpu_ptr;
+	node->size_bytes = size;
+
+	return 0;
+}
+
+int mes_create_dst_bo(amdgpu_device_handle device, uint32_t size, uint64_t va,
+		      uint32_t flags, struct mes_ib_node *node)
+{
+	struct amdgpu_bo_alloc_request req = {0};
+	amdgpu_bo_handle buf_handle;
+	void *cpu_ptr = NULL;
+	int r;
+
+	if (!node)
+		return -1;
+
+	memset(node, 0, sizeof(*node));
+
+	req.alloc_size = size;
+	req.phys_alignment = 4096;
+	req.preferred_heap = AMDGPU_GEM_DOMAIN_GTT;
+	req.flags = 0;
+
+	r = amdgpu_bo_alloc(device, &req, &buf_handle);
+	if (r)
+		return r;
+
+	r = amdgpu_va_range_alloc(device, amdgpu_gpu_va_range_general,
+				  size, 4096, 0, &node->va, &node->va_handle,
+				  0);
+	if (r) {
+		amdgpu_bo_free(buf_handle);
+		return r;
+	}
+
+	r = amdgpu_bo_va_op_raw(device, buf_handle, 0, size, node->va, flags,
+				AMDGPU_VA_OP_MAP);
+	if (r) {
+		amdgpu_va_range_free(node->va_handle);
+		amdgpu_bo_free(buf_handle);
+		return r;
+	}
+
+	if (flags & AMDGPU_VM_PAGE_READABLE) {
+		r = amdgpu_bo_cpu_map(buf_handle, &cpu_ptr);
+		if (r) {
+			amdgpu_bo_va_op(buf_handle, 0, size, node->va, 0,
+					AMDGPU_VA_OP_CLEAR);
+			amdgpu_va_range_free(node->va_handle);
+			amdgpu_bo_free(buf_handle);
+			return r;
+		}
+	}
+
+	node->bo_handle = buf_handle;
+	node->cpu_ptr = (uint32_t *)cpu_ptr;
+	node->size_bytes = size;
+
+	return 0;
+}
+
+void mes_free_bo(struct mes_ib_node *node)
+{
+	if (!node || !node->bo_handle)
+		return;
+
+	if (node->cpu_ptr)
+		amdgpu_bo_cpu_unmap(node->bo_handle);
+
+	if (node->va)
+		amdgpu_bo_va_op(node->bo_handle, 0, node->size_bytes,
+				node->va, 0, AMDGPU_VA_OP_CLEAR);
+
+	if (node->va_handle)
+		amdgpu_va_range_free(node->va_handle);
+
+	amdgpu_bo_free(node->bo_handle);
+	memset(node, 0, sizeof(*node));
+}
+
+/* ========================================================================
+ * IB Filling Functions
+ * ======================================================================== */
+
+int mes_submit_ib(amdgpu_device_handle device, amdgpu_context_handle context,
+		  amdgpu_bo_handle *bo_handles, int num_handles,
+		  uint64_t ib_va, uint32_t ib_bytes, int ip_type)
+{
+	struct amdgpu_cs_ib_info ib_info = {0};
+	struct amdgpu_cs_request cs_req = {0};
+	amdgpu_bo_list_handle bo_list = NULL;
+	int r;
+
+	/* Create BO list */
+	r = amdgpu_bo_list_create(device, num_handles, bo_handles, NULL,
+				  &bo_list);
+	if (r)
+		return r;
+
+	/* Setup IB */
+	ib_info.ib_mc_address = ib_va;
+	ib_info.size = ib_bytes / 4;
+
+	/* Setup CS request */
+	cs_req.ip_type = ip_type;
+	cs_req.ring = 0;
+	cs_req.number_of_ibs = 1;
+	cs_req.ibs = &ib_info;
+	cs_req.resources = bo_list;
+
+	/* Submit */
+	r = amdgpu_cs_submit(context, 0, &cs_req, 1);
+
+	/* Cleanup */
+	amdgpu_bo_list_destroy(bo_list);
+
+	return r;
+}
+
+int mes_unmap_bo_va(struct mes_ib_node *node)
+{
+	int r;
+
+	if (!node || !node->bo_handle || !node->va)
+		return -EINVAL;
+
+	r = amdgpu_bo_va_op(node->bo_handle, 0, node->size_bytes,
+			    node->va, 0, AMDGPU_VA_OP_UNMAP);
+	if (!r)
+		node->va = 0;
+
+	return r;
+}
diff --git a/lib/amdgpu/amd_mes_reset.h b/lib/amdgpu/amd_mes_reset.h
new file mode 100644
index 000000000..7cb426f31
--- /dev/null
+++ b/lib/amdgpu/amd_mes_reset.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Originally developed by Jatin Kataria at Netflix.
+ * Copyright (c) 2026 Netflix, Inc.
+ *
+ * Adapted for IGT by Advanced Micro Devices, Inc., 2026.
+ */
+
+#ifndef AMD_MES_RESET_H
+#define AMD_MES_RESET_H
+
+#include <stdint.h>
+#include "amdgpu.h"
+
+#define MES_HW_IP_GFX       0
+#define MES_HW_IP_COMPUTE   1
+
+#define MES_DEFAULT_IB_SIZE     (64 * 1024)
+#define MES_DEFAULT_CHAIN_LEN   512
+#define MES_VA_BASE             0x40000000ULL
+#define MES_VA_GAP              0x20000ULL
+#define MES_DST_BO_SIZE         (4 * 1024 * 1024)
+
+struct mes_ib_node {
+	amdgpu_bo_handle bo_handle;
+	amdgpu_va_handle va_handle;
+	uint64_t va;
+	uint32_t *cpu_ptr;
+	uint32_t size_bytes;
+};
+
+/* Buffer management */
+int mes_create_ib_bo(amdgpu_device_handle device, uint32_t size, uint64_t va, struct mes_ib_node *node);
+int mes_create_dst_bo(amdgpu_device_handle device, uint32_t size, uint64_t va, uint32_t flags, struct mes_ib_node *node);
+void mes_free_bo(struct mes_ib_node *node);
+
+/* Submission */
+int mes_submit_ib(amdgpu_device_handle device, amdgpu_context_handle context,
+                  amdgpu_bo_handle *bo_handles, int num_handles,
+                  uint64_t ib_va, uint32_t ib_bytes, int ip_type);
+
+/* VA management */
+int mes_unmap_bo_va(struct mes_ib_node *node);
+
+#endif /* AMD_MES_RESET_H */
diff --git a/lib/meson.build b/lib/meson.build
index d15d25f15..911bf3550 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -186,6 +186,7 @@ if libdrm_amdgpu.found()
 	lib_sources += [
 		'amdgpu/amd_memory.c',
 		'amdgpu/amd_platform.c',
+		'amdgpu/amd_mes_reset.c',
 		'amdgpu/amd_command_submission.c',
 		'amdgpu/amd_compute.c',
 		'amdgpu/amd_cs_radv.c',
-- 
2.55.0

