Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15FD0CC6B1C
	for <igt-dev@archiver.kernel.org>; Thu, 15 Oct 2026 04:03:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A4C910EB6D;
	Thu, 15 Oct 2026 04:03:48 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013010.outbound.protection.outlook.com
 [40.93.201.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14E5410EB63
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2026 04:02:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vq+iL+VXbDlOkjPKdf4ZbInyP6hqIW5stKEKKkHqKU/irNdBz1BjBrxxU1sWhskGOgvU1JRmvPUlDVNGQ+qlxeCXPrwzrab92sjm4Q2y4X/FX9C1UeyqdgTcCLhxGLwy4czY5cnS8JA7076AS+tL71QAm4RTA9JTjbcgtbB5mniejkMBje12N/KwP5abwAte/JpP0xYJt56869mnwJYlW59eEq4xrFBLdpgNXMODLuH1VAtGu+UVyjllxybtXk9a4xknDSwVREKjdrbNMUo92h6oeS0V/jZwEt9c+faR2wCseAPS5iyyq5WNbYjMaxcozc3bG1b/TUr7PWv5kcv8zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EuoyGNjyvotAD9Fk2l2gikzBvG2L/SfPXbzF2EJ77BM=;
 b=qjPckp7hrK4g1m4mh8glDymzvvcxOjjPcpBlahY4L7qPgQ4WbkrFzeLl/KIlI1oE5Gov/mxu+b/H/E4eSpt9kiSrHq4YWuq4rvlniBMqO0PuRDmzm1nKaeUcFkXMJ9VM0xDBUJQBN88MwJjccdzmVnZ5bVZXKA0289P2IeSmpD+PJxO6ySQydedtB2bEVge1WXSuVNf+7UyRdZVS2Hz1A6l/D/0aB26wRWpy6e/oJTr4ef/b3v6FDSRT98bQp1i9DjwyhNWAmQww/u7GwMKtGMACmLN5TsARXk6PRniR2ILNWEUn0iDQl0kPJcjve6LJqi9P93VRMU4pnfgIoQ613Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EuoyGNjyvotAD9Fk2l2gikzBvG2L/SfPXbzF2EJ77BM=;
 b=eqGSZsX/nhSRKCYUu7ngGyb964uaqJpeu5qGGiZA3mY5/NQ46KypnKaaxxyJYyHmeLjxbQK3eUqESPENQuHRwV+jxgjskHlolKNQJ8BcfP6XYSjSOSAH/HxCmsdDedKY+CSyAASa3sAr7mYQZDPgkgcr/AgUQt7mYqcNe2RxcdM=
Received: from CH0P221CA0004.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11c::14)
 by SA3PR12MB9177.namprd12.prod.outlook.com (2603:10b6:806:39d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 04:02:47 +0000
Received: from CH1PEPF0000AD7F.namprd04.prod.outlook.com
 (2603:10b6:610:11c:cafe::52) by CH0P221CA0004.outlook.office365.com
 (2603:10b6:610:11c::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Thu,
 15 Oct 2026 04:02:45 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD7F.mail.protection.outlook.com (10.167.244.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Thu, 15 Oct 2026 04:02:44 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 14 Oct
 2026 23:02:38 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Wed, 14 Oct 2026 23:02:37 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Jatin Kataria
 <jkataria@netflix.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, "Jesse
 Zhang" <jesse.zhang@amd.com>
Subject: [PATCH 1/3] lib/amdgpu: add MES reset test helpers
Date: Thu, 15 Oct 2026 00:00:49 -0400
Message-ID: <20261015040236.112017-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7F:EE_|SA3PR12MB9177:EE_
X-MS-Office365-Filtering-Correlation-Id: 9391723e-5b77-4b1f-002d-08df2a712a9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|56012099006|11063799006|261009223027099003|261009221227099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: w2r+TYVAgXlGdOnuR8dFGkppTjKXjh+r8HU+AZyp+z2XL+GbfGshYxiWi2yusMwVvcKJS7wxQee+r+8IWBXN9OLiycUehrVV7FoxP/g2z6taDfF8tknFrJrhKSxALBc5W7XVOSbUCWbfTPWh3ET/cYGwDolMeULKkFcbGeFZZ9Qpvw1/Z6yaWCN9nfPPokio8vZZFF7+7Y7BqP61pXWlw649tCh9COlGFET37xQ9TbKP7j5F/9yNWmdH1nM/tdZAisXQw70WVUntA1fp7bLACo0NP4YIOMQFjqHB6tsG5J+YVtBzE5WblYVOey5fP1HZL+0vTgFoGMRY+Ro/O7MGpZqRpLIGZQtUotwtxYC2HfPHupc2+eikuVNLqLEidK9pjhqSyzXJns4pTDalcImDD3VNlGyEBCdujDXULQV9yqwsyzhc83sAvIjsxXnyXAB7dZqiyS+gRu+7xOCTkfSQS3gLF+Xgg3AVXJon7kL+i+4vVLAXs5Ogs10zMa/+FM+PgJGzpOcPzFob3zA4cPDqHtd4js6HipP3jIbypB0UZuI64sdmXhT2S4k7jwjIn4ymrNhm0xbpS7Kx29X5pOZpI4qt42YVTeXgFJ1aKga7HnvpHGeUXLJ5O6qSyQ/yF8Amzdl9crMmoxGfqbm2xC6RabXSlmQ3vbGHpx+FZEz/VcPWDuPTQLHjblCslCLkk+oyLN1Oi31I3SoGWCq387s7jQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(56012099006)(11063799006)(261009223027099003)(261009221227099003)(10067099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: /TYqd26rR5Y4FVhkoMNgGdxORLL1cmRbuAnw1XDRs0zYWUZFmBAs/j4V8umMY8DZdjPrpFdonKzkUjE4uZR+Bw3oO6o8xLqImY7Jwc5fcSbvSyj8vbgLQmOzjmD62BptGAQtwwh+DkUz/+zMg3HxBj5o59tpY5bB4wDLwc26E2MwFc+uLbmyFeMdVzCaRMORabX0OBlBwRGGRi6psuZxTmlDb2n6hKAIYDc1UZJXm+OlSdkYc41ECVgrXmkWIhTZn/dA07bVzwO+72Bk4TwntK8qzNRsxlMG5/6JxxhYVogMuSjoY3ktlFxOwaxKecVClpnQ0XMMabcd5TOYVaJtV4+wfxIMaT8w6VpPMstcXvsPwOQTftWINJ5dn/3TaGqOvH6zokNeyqSZxLPoMjIXaXkEFl1Gx8NuHfM/YMK873P+2Z5BShEUvTlCdxtXNGMB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 04:02:44.4330 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9391723e-5b77-4b1f-002d-08df2a712a9f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9177
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

Originally designed by Jatin Kataria <jkataria@netflix.com>; ported to 
IGT and redesigned to fit IGT architecture.

Cc: Jatin Kataria <jkataria@netflix.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Change-Id: Ib6be27f4ccd4d22e3b370ce1026ad503fff996de
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

