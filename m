Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF13AC79F9E
	for <igt-dev@archiver.kernel.org>; Tue,  8 Sep 2026 05:10:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7764110EA02;
	Tue,  8 Sep 2026 05:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OTrgAX8O";
	dkim-atps=neutral
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010005.outbound.protection.outlook.com [52.101.201.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6D3A10E9EA
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Sep 2026 05:09:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZuNMMZBPUzWLhX3wm5rUJ8e3mLXTlHslVxaaWDLNtjSyxwJmil/44pkKSQlLwPJeiO/vLFhXV4yNbr6wqCRInHJiMqvro4kgszuZIjAOutqXwMgQ/yJQZHU1sUCt2S7mOyrrfCEDeeDDQf38stXT31JqC52AFZS8jV5T2ILUHoWbegeK+hhuTHH4tr6JP4BUO9vKMj5KOIkqaot14TfnzTXf/Oa2GumT1Nt75/w6tqALvsnNzFE8TqFmO3jE5Z9du0NUf4ESMxxxLH3Xt9sQuP21dbRLgEmm6JBFLWqad/MMxgUobr/o3dzwlLiWhkqKHEsHcse4Gp9YTGHE15KNEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qTjDIkIrl/fAcDru3/15uqMb/Mc7j0+F7Aki6qSLNg4=;
 b=rQb4OAF74Slx12YaJHFjR66JI5OtYtJ5z7e6+iWPXBGLTY6hsPyzdWSgLncyyGiGnrV3XSBkX/bCISxNwCMNC/eSHbvvRjl2vOCWLVNYvbPFGKNtJYTyIX9XzanTLRUFVeAXa+7Btuh8yCnzPDkhzyOf17VQ6XHFFGJzrofk+NyXi2tFKCvC/ct1MhlYvnipEIz4XgNV6pBMfv5rZCv+OBPAICVhhJAamZ9wnJk3dE1aGp6gG6iHRvG8qHDx8DpASqFX98jA+wRS+62uDSR/Dy0pLz7Ufov6csJUBmB9H18ooPA2X4O3KvUM66AHF4Nl+6mEu6RApAtAwOdiWZPcnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qTjDIkIrl/fAcDru3/15uqMb/Mc7j0+F7Aki6qSLNg4=;
 b=OTrgAX8O3ItkM2BnKAYRorEJ2lNr0wJfUe1oibMaIsndzEaQ9g59df6Fn1K4drFk7Gd8/Wmbr9V2uPFQ9BuBIbJ71RINHYLFsZgwq3waArx/JUeuf7rHI8SB9quPSXPj6YJCcr+8BJ6sIDyEQBTrOkiMuvTWm2WPpaULlcBM8o0=
Received: from BN0PR04CA0113.namprd04.prod.outlook.com (2603:10b6:408:ec::28)
 by SN7PR12MB6957.namprd12.prod.outlook.com (2603:10b6:806:263::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 05:09:30 +0000
Received: from BN6PEPF00000073.namprd03.prod.outlook.com
 (2603:10b6:408:ec:cafe::35) by BN0PR04CA0113.outlook.office365.com
 (2603:10b6:408:ec::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Tue, 8
 Sep 2026 05:09:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN6PEPF00000073.mail.protection.outlook.com (10.167.248.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Tue, 8 Sep 2026 05:09:30 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 8 Sep
 2026 00:09:30 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 8 Sep
 2026 00:09:29 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Tue, 8 Sep 2026 00:09:28 -0500
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t 2/3] tests/amdgpu: add sdma corrupted-header user queue
 reset subtest
Date: Tue, 8 Sep 2026 13:09:04 +0800
Message-ID: <20260908050926.3042193-2-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260908050926.3042193-1-Jesse.Zhang@amd.com>
References: <20260908050926.3042193-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PEPF00000073:EE_|SN7PR12MB6957:EE_
X-MS-Office365-Filtering-Correlation-Id: 51c8e5eb-9327-47d6-a965-08df0d675d23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|10067099003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: t0kDGNcvt2mYpg7BsW2Qo8VANjh8sEq4pPg8lHw26cxCJJy0y7pgGG1ZaqzX70WRamy+RiAdZeHf/PRIh/7ePzu01B3bipkW91G71QLstF9vWMXF7Dco2FYTfc9HUHUC5HCBpU5/0itpdxiHVZP+rc1R5wNnFTcZ+fnYysfklZlXhdIG0gclOf2bEEPPV3HqnooKoJ6n2C7pPl71AUnryL5xnIyfAh7AOV20//ra0T9keUylYU2lCTgn1o4tmlCf7LyH89OBuFpef5rIIpR0FwLtr3hNume0+rGdBvz7Ma/WcEcPavvKNk3NHbXWCisgZcqx3XB5YyvtjKxwjvYtdCYqh3DVKk+1NI5dpVeKJW5nG7tSlhw5neWd1iQuWTKvg/XV+Ds6Jhrtu6Pxi/LBFpM4ND5zyIVAuRDRX3hEk4HAFC64wAXnJ0uALSZC2bTfcLMlOe8ZYIhqxzcCJyWKt8me3+fqFga5zZjxxKOygy5l6q5mjxczGaHiNu3ZSJ7eM9ZD7drjGmu+Tja0Sg6fWuiOHxahBX9je+HGGWD19jtV7O3G9d9CQ2Tev7/vd06JfuFZ4duQ73o14rU38rCqM4NdhyGbHv3HoifO9AsOxzm5bQR0ADK/xdkoxYWfF2Xnznr85EGpFCyX0hiyjjRYC0xrxmiTpFUyx6rzNWHCVh+5KDCZEUiXPi2suuhljJDR
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: h9cB2L5UH4Mnv/acueA7aK1a8d3dTqO6ArzKhWdtmsmGAPBi61NEaRGaG6itQvVsjwTOlRDAa0uoSDGktPdfW+1rcTf5XBosog9mHh9WkAZwLIp8tBNSoX9u963ZkFOj0usIZpAh6nQ9LfE7Atbr7rK1eXnEUXfkjR53ZI+qzck7HHgu2S4KGI4x1u+UCyxK6ZTbkJrj1QJLwMa+3GHqfoG+mtOctkQod8pq+SlMOz3/zUZPCanYrdJBu3OeHHB6+LUMt1vCx3n/GfQ7kzdaZ+CZdLu4AxT+rQ092TDSyknimbzACbo+S8msBKKahFtbEumUjVkGGC/UBIKia7YOI2uU/ybyh5TsYONbM3Y88GMuXZlTui8RdR4TPg4f6YMJGxzZ2VIStvxyiBFpK8tQM/b1896sZdfae+hkNNMSjWpYH8CL7bW+T/MKv2i0GcEN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 05:09:30.4876 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51c8e5eb-9327-47d6-a965-08df0d675d23
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN6PEPF00000073.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6957
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

Add amdgpu-deadlock-sdma-corrupted-header-umq: hang an SDMA user queue
with a corrupted copy-linear packet header and let the driver recover it
with a per-queue reset. Unlike the POLL_REGMEM based flood/clean-hang
cases (where the queue stays resident on its HW slot and is reset over
MMIO), a corrupted header takes the queue off its slot, so the driver
falls back to the MES reset path - exercising a different reset route.

Extend amdgpu_hang_sdma_ring_helper()/amdgpu_hang_sdma_helper() with a
user_queue path (userq create/submit/destroy). For user queues call
amdgpu_test_exec_cs_helper() with expect_failure=0 so the submit waits
on the fence (UQ_SUBMIT_NORMAL); the hanging bad packet then blocks
until the per-queue reset force-completes it, instead of returning right
after packet consumption.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/amd_deadlock_helpers.c | 75 +++++++++++++++++++++++--------
 lib/amdgpu/amd_deadlock_helpers.h |  2 +-
 tests/amdgpu/amd_deadlock.c       | 13 +++++-
 3 files changed, 68 insertions(+), 22 deletions(-)

diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
index 7574e8cc6..3020be46e 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -776,7 +776,8 @@ void amdgpu_priv_inst_ring_helper(amdgpu_device_handle device_handle, unsigned i
 #define MAX_DWORD_COUNT 256
 
 static void
-amdgpu_hang_sdma_helper(amdgpu_device_handle device_handle, uint8_t hang_type)
+amdgpu_hang_sdma_helper(amdgpu_device_handle device_handle, uint8_t hang_type,
+			bool user_queue)
 {
 	int j, r;
 	uint32_t *ptr, offset;
@@ -797,26 +798,45 @@ amdgpu_hang_sdma_helper(amdgpu_device_handle device_handle, uint8_t hang_type)
 	ring_context->secure = false;
 	ring_context->res_cnt = 2;
 	ring_context->ring_id = 0;
+	ring_context->user_queue = user_queue;
 	igt_assert(ring_context->pm4);
 
-	r = amdgpu_cs_ctx_create(device_handle, &ring_context->context_handle);
-	igt_assert_eq(r, 0);
+	if (user_queue) {
+		ip_block->funcs->userq_create(device_handle, ring_context, ip_block->type);
+	} else {
+		r = amdgpu_cs_ctx_create(device_handle, &ring_context->context_handle);
+		igt_assert_eq(r, 0);
+	}
 
-	r = amdgpu_bo_alloc_and_map(device_handle, ring_context->write_length, 4096,
-					AMDGPU_GEM_DOMAIN_GTT, 0,
-					&ring_context->bo, (void **)&ring_context->bo_cpu,
-					&ring_context->bo_mc, &ring_context->va_handle);
+	r = amdgpu_bo_alloc_and_map_sync(device_handle, ring_context->write_length, 4096,
+					 AMDGPU_GEM_DOMAIN_GTT, 0, AMDGPU_VM_MTYPE_UC,
+					 &ring_context->bo, (void **)&ring_context->bo_cpu,
+					 &ring_context->bo_mc, &ring_context->va_handle,
+					 ring_context->timeline_syncobj_handle,
+					 ++ring_context->point, user_queue);
 	igt_assert_eq(r, 0);
+	if (user_queue) {
+		r = amdgpu_timeline_syncobj_wait(device_handle,
+						 ring_context->timeline_syncobj_handle,
+						 ring_context->point);
+		igt_assert_eq(r, 0);
+	}
 
 	/* set bo */
 	memset((void *)ring_context->bo_cpu, 0, ring_context->write_length);
-	r = amdgpu_bo_alloc_and_map(device_handle,
-				    ring_context->write_length, 4096,
-				    AMDGPU_GEM_DOMAIN_GTT,
-				    0, &ring_context->bo2,
-				    (void **)&ring_context->bo2_cpu, &ring_context->bo_mc2,
-				    &ring_context->va_handle2);
+	r = amdgpu_bo_alloc_and_map_sync(device_handle, ring_context->write_length, 4096,
+					 AMDGPU_GEM_DOMAIN_GTT, 0, AMDGPU_VM_MTYPE_UC,
+					 &ring_context->bo2, (void **)&ring_context->bo2_cpu,
+					 &ring_context->bo_mc2, &ring_context->va_handle2,
+					 ring_context->timeline_syncobj_handle,
+					 ++ring_context->point, user_queue);
 	igt_assert_eq(r, 0);
+	if (user_queue) {
+		r = amdgpu_timeline_syncobj_wait(device_handle,
+						 ring_context->timeline_syncobj_handle,
+						 ring_context->point);
+		igt_assert_eq(r, 0);
+	}
 
 	/* set bo2 */
 	memset((void *)ring_context->bo2_cpu, 0, ring_context->write_length);
@@ -853,7 +873,14 @@ amdgpu_hang_sdma_helper(amdgpu_device_handle device_handle, uint8_t hang_type)
 		ring_context->pm4_dw = ring_context->pm4_dw * 2 * j;
 	}
 
-	amdgpu_test_exec_cs_helper(device_handle, ip_block->type, ring_context, 1);
+	/*
+	 * For user queues pass expect_failure=0 so the submit waits on the fence
+	 * (UQ_SUBMIT_NORMAL); the hang is then recovered by the driver's per-queue
+	 * reset. Kernel queues keep expect_failure=1 (they already wait on the
+	 * fence via amdgpu_cs_query_fence_status).
+	 */
+	amdgpu_test_exec_cs_helper(device_handle, ip_block->type, ring_context,
+				   user_queue ? 0 : 1);
 	amdgpu_bo_unmap_and_free(ring_context->bo, ring_context->va_handle, ring_context->bo_mc,
 						 ring_context->write_length);
 	amdgpu_bo_unmap_and_free(ring_context->bo2, ring_context->va_handle2, ring_context->bo_mc2,
@@ -861,9 +888,12 @@ amdgpu_hang_sdma_helper(amdgpu_device_handle device_handle, uint8_t hang_type)
 	/* clean resources */
 	free(ring_context->pm4);
 	/* end of test */
-	//r = amdgpu_cs_ctx_free(context_handle);
-	r = amdgpu_cs_ctx_free(ring_context->context_handle);
-	igt_assert_eq(r, 0);
+	if (user_queue) {
+		ip_block->funcs->userq_destroy(device_handle, ring_context, ip_block->type);
+	} else {
+		r = amdgpu_cs_ctx_free(ring_context->context_handle);
+		igt_assert_eq(r, 0);
+	}
 	free_cmd_base(base_cmd);
 }
 
@@ -960,7 +990,8 @@ void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd
 
 }
 
-void amdgpu_hang_sdma_ring_helper(amdgpu_device_handle device_handle, uint8_t hang_type, struct pci_addr *pci)
+void amdgpu_hang_sdma_ring_helper(amdgpu_device_handle device_handle, uint8_t hang_type,
+				  struct pci_addr *pci, bool user_queue)
 {
 	int r;
 	FILE *fp;
@@ -976,6 +1007,12 @@ void amdgpu_hang_sdma_ring_helper(amdgpu_device_handle device_handle, uint8_t ha
 	if (!info.available_rings)
 		igt_info("SKIP ... as there's no ring for the sdma\n");
 
+	if (user_queue) {
+		/* user queues are scheduled by hardware, no sched mask to iterate */
+		amdgpu_hang_sdma_helper(device_handle, hang_type, true);
+		return;
+	}
+
 	support_page = is_support_page_queue(AMDGPU_HW_IP_DMA, pci);
 	snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_sdma_sched_mask",
 			pci->domain, pci->bus, pci->device, pci->function);
@@ -1020,7 +1057,7 @@ void amdgpu_hang_sdma_ring_helper(amdgpu_device_handle device_handle, uint8_t ha
 			igt_assert_eq(r, 0);
 		}
 
-		amdgpu_hang_sdma_helper(device_handle, hang_type);
+		amdgpu_hang_sdma_helper(device_handle, hang_type, false);
 	}
 
 	/* recover the sched mask */
diff --git a/lib/amdgpu/amd_deadlock_helpers.h b/lib/amdgpu/amd_deadlock_helpers.h
index 1f2de61d5..c89496cc6 100644
--- a/lib/amdgpu/amd_deadlock_helpers.h
+++ b/lib/amdgpu/amd_deadlock_helpers.h
@@ -34,7 +34,7 @@ void
 bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd_error, unsigned int ip_type, struct pci_addr *pci, bool user_queue);
 
 void
-amdgpu_hang_sdma_ring_helper(amdgpu_device_handle device_handle, uint8_t hang_type, struct pci_addr *pci);
+amdgpu_hang_sdma_ring_helper(amdgpu_device_handle device_handle, uint8_t hang_type, struct pci_addr *pci, bool user_queue);
 
 void
 amdgpu_hang_ring_helper(amdgpu_device_handle device_handle, unsigned int ip_type,
diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index 6822617e5..399b0decf 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -135,7 +135,7 @@ int igt_main()
 		if (arr_cap[AMD_IP_DMA] &&
 			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-corrupted-header-test")
-			amdgpu_hang_sdma_ring_helper(device, DMA_CORRUPTED_HEADER_HANG, &pci);
+			amdgpu_hang_sdma_ring_helper(device, DMA_CORRUPTED_HEADER_HANG, &pci, false);
 		}
 	}
 
@@ -144,7 +144,7 @@ int igt_main()
 		if (arr_cap[AMD_IP_DMA] &&
 			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
 			igt_dynamic_f("amdgpu-deadlock-sdma-slow-linear-copy")
-			amdgpu_hang_sdma_ring_helper(device, DMA_SLOW_LINEARCOPY_HANG, &pci);
+			amdgpu_hang_sdma_ring_helper(device, DMA_SLOW_LINEARCOPY_HANG, &pci, false);
 		}
 	}
 
@@ -256,6 +256,15 @@ int igt_main()
 		}
 	}
 
+	igt_describe("Test-per-queue-reset-by-sdma-corrupted-header-user-queue");
+	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-corrupted-header-umq") {
+		if (enable_test && userq_arr_cap[AMD_IP_DMA] &&
+			is_reset_enable(AMD_IP_DMA, AMDGPU_RESET_TYPE_PER_QUEUE, &pci)) {
+			igt_dynamic_f("amdgpu-deadlock-sdma-corrupted-header-umq")
+			amdgpu_hang_sdma_ring_helper(device, DMA_CORRUPTED_HEADER_HANG, &pci, true);
+		}
+	}
+
 	igt_describe("Test-per-queue-reset-of-a-cleanly-hung-gfx-user-queue");
 	igt_subtest_with_dynamic("amdgpu-deadlock-gfx-umq") {
 		if (enable_test && userq_arr_cap[AMD_IP_GFX] &&
-- 
2.49.0

