Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D669CD4F2C
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 01:17:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F4810E04E;
	Thu, 13 Nov 2025 01:17:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xRorQoC+";
	dkim-atps=neutral
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013068.outbound.protection.outlook.com
 [40.107.201.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8547510E04E
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Nov 2025 01:17:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AZhn/T7yQXBqPxEsrwdnBy4s6Elfj7vBrYawufzC+YtyiL2FEDN33qmDDlOdEWu38wth6tus2l4c+8Ni3P7P3QIuyTbuLotKXcJigvksgBvtqiuZkviGADG30pUhFuuI2zgcIlfdaTNV7rjzVRhhH6gaOra0k+eTG7FcdeDW4MFje43+VaH178KuoyAqL2EMsIFXMVO49CqDv0PMhDDOaVtHhNh3OK0pVwksPFqGSp6X4C7xOrDVkHlZPGvFd9KOGls1a0X346NyqPlontAOhc4yvbmf8WsaNtSZuquimGKC1groDb+sgPJIE4d6g5QOWD+62m1DcgYEMgqOsczSmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x4fa/vpzJAg5bqc9S6w8bl3+2KLqnxKsn3AD4W9cNs4=;
 b=hGCaqexiLbBR4eTrgDK8SD1Q4Tppy4TVzzm/aa+Y913akVW1PiNN3c++Og3PnMN1RAWDVoEEtWm8eZSMxM0AXOfQpsODRikLOVbxeg4xQUT+Ux6dmAJ3qelr+M7e4wfMePumjjj3HrXlPnYNbk+IQepejjDtLfE+8pp0UcfYId8/IVfl5+z5GkxDBbh17FXLBILEYiAwrlVy7BMGYL2lzdvF1G6MkJU901PIf5LlGP9UgzdsY7wdK8HdSR5bvRm95APu1+8dDnx318/YGX9hoINWhQNrUto7xojstnJGqOzafncOhrwPmQFoPZEVCUpmlRKU7Q9xs6eqZ/+zGhs3KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x4fa/vpzJAg5bqc9S6w8bl3+2KLqnxKsn3AD4W9cNs4=;
 b=xRorQoC+JxHM3Sxtc3DooBC66zgvq6Ra4V+xxdTJOrivnJ+b8zU/ibibP7/n+D/gd2/IwO8YbDIGwtaPPMfN0SS28foXc/uha+pTIyQp/dPiVcEOfrz0UrxhApuiM9yx/PEZawKTreBJjCHs9pdr1+XAcv2HiGcz0s3SZMuB3+0=
Received: from BN0PR04CA0163.namprd04.prod.outlook.com (2603:10b6:408:eb::18)
 by CH3PR12MB9314.namprd12.prod.outlook.com (2603:10b6:610:1c5::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Thu, 13 Nov
 2025 01:16:55 +0000
Received: from BN2PEPF000044AC.namprd04.prod.outlook.com
 (2603:10b6:408:eb:cafe::44) by BN0PR04CA0163.outlook.office365.com
 (2603:10b6:408:eb::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.15 via Frontend Transport; Thu,
 13 Nov 2025 01:16:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000044AC.mail.protection.outlook.com (10.167.243.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 01:16:55 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 12 Nov
 2025 17:16:55 -0800
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 12 Nov
 2025 19:16:54 -0600
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Wed, 12 Nov 2025 17:16:48 -0800
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse.Zhang <Jesse.Zhang@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH i-g-t] lib/amdgpu: Fix SDMA packet handling and memory ordering
Date: Thu, 13 Nov 2025 09:16:33 +0800
Message-ID: <20251113011647.197209-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: Jesse.Zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AC:EE_|CH3PR12MB9314:EE_
X-MS-Office365-Filtering-Correlation-Id: 006afaa2-616e-4784-cb45-08de225255d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oF3UO+zcPDZhF8GvW5R/mZGr3ihvnmaaqYAwn1yTyw4r5E8K6Wz5cGR0oAgv?=
 =?us-ascii?Q?/RdbQPmhDxjVzMfLsETyYeeSczLYGZgQWcDm19BYhcQEdqdl2H3W8t+zfgAs?=
 =?us-ascii?Q?AuEM++b0DPAbQHBZG3DC4M9E5tTRliEuLvaUH2rrlj79bGiUWJy/ESg379s4?=
 =?us-ascii?Q?JYO1wpbLAxmBXnrG2cuN1+dulelLFD+WKg/OZytUE/ybyYxyllHMXbFfrZP7?=
 =?us-ascii?Q?7MMCKRJkP2KtByGCXtL6wUKGfaOPRCn6VxuxtyB822j8ltUj6p03DZ3E+Iv3?=
 =?us-ascii?Q?DAgVJmJISt3+26UIm077qBao9vtSlJzLtUqs5MT6EtHXQp5k8A3iLFF3xW7l?=
 =?us-ascii?Q?dbEN/w+hcQiSd4OFmYHjvRX5q91C6J85RBUEVfuA22u+5KGQGs5FTJLCksiz?=
 =?us-ascii?Q?4v9mNXn4C2XewI4jaOyyA889L1NsdjceBfMzmeaGI/QKliH/h3H9d0GPpode?=
 =?us-ascii?Q?weq6KFfz4wLZ12bEFEgjaWzQUErvBuoMGjTkCbfQXDxxN7pqxy4wtEBd2aAN?=
 =?us-ascii?Q?biYIaglFoZEYuxBO63pNwyNE3BWpWCjK58PWwk9UEQNNPit85XE5ZPZmHxB6?=
 =?us-ascii?Q?2T8MKJ/cvGVF4cCoIKMW9ODXBUakk3+fGf3kIxcj21IYCSdYRtW9d+/z+09S?=
 =?us-ascii?Q?mNVF91OlPS7VUSTyiWbERr8BYuoGrJdA0c2Ufghdi0yWC6hxOczyp66gO2KC?=
 =?us-ascii?Q?iJLE3F95UlRE6TNsVXzWXkv28p1xslawSivtbtA6iXwofYkzZ7QLshedzejY?=
 =?us-ascii?Q?srPiUZX6qk8V+zk3iRIAuIHjD5HvO73sXQpiyB99EFHuHQhepAj49HQD+sNV?=
 =?us-ascii?Q?ns7GxdmkM/ZpicTsGTDnu2bKvOVhjoyjRJzWO3TPzeYOlXTKojcuJ6l3PduU?=
 =?us-ascii?Q?bchY8Ik6zXWWFZrHkVD+8HkGy025xLaVdSgRokpx86+7Zo7cA/bwIprCwFdF?=
 =?us-ascii?Q?6VBEI0EX09FpK4mUA38IuBgk2NSQztoHqrCrvvZcF3fMMhQyCbAiFvGmymXZ?=
 =?us-ascii?Q?5xVY8jzMbWhNNTkuQ6kRn57Bo5fUBkNri92CrJYVofUH4p2C4vVnODIfWoBB?=
 =?us-ascii?Q?RvQvundHN2qhVEHsdn4m9tpJRFJsOu5BuLLSrkDI3D4180ewLxENxkkNYJgU?=
 =?us-ascii?Q?gMRejBnQrBlV3EtZMqEnNOq/zbwMUbtKdaVpFgn50pk/nLWF/0WF7k4u0cVZ?=
 =?us-ascii?Q?2glQ/9l+jdad4pQI30GPPhtlQAg4vXuHLEehUZmdwizo+haGUTzMp7Qn9jCb?=
 =?us-ascii?Q?k1xJ0SRQSIeJm6wmE6bQTOAcA2pQJWOtLIClPniU8+GnqSDIFLXYlczeUF55?=
 =?us-ascii?Q?YYlH3o7FxIvM6fNKwT4I/bdMscz7eF1UHx8OdfI0YUh7ovJTNPNUVISVmwqA?=
 =?us-ascii?Q?oUeUyf2ovoR5D4l0UuaAIj2Uux/efBAn3xAJWtPqm9untmkFRnN6PUUxeUt9?=
 =?us-ascii?Q?dTMfCYdIxolSo70PkR2bxIq+4++Yl38/Wp3NRjve2ZlZD2q00bPE95MgicCN?=
 =?us-ascii?Q?9NRKrenfM+h+lt7EVxa9DPRzekcR8oQP+LkWg/1uryM+2GZMNjQ0VVQdZr5k?=
 =?us-ascii?Q?a2Z++Q2Klzbcgruifvw=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 01:16:55.5296 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 006afaa2-616e-4784-cb45-08de225255d2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044AC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9314
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

This commit addresses several critical issues in the user queue
submission path:

1. SDMA-specific pointer arithmetic:
   - SDMA hardware requires wptr pointers to be scaled differently
     (shifted by 2) compared to other IP blocks
   - Added dedicated amdgpu_sdma_pkt_begin() and amdgpu_sdma_pkt_end()
     macros that handle the proper pointer conversion
   - Fixed the SDMA submission path to use these new macros

2. Memory ordering and synchronization:
   - Added mfence barriers for x86/x86_64 architectures to ensure
     proper ordering of memory operations before hardware register updates
   - Restructured the submission flow to place barriers at appropriate
     points in both SDMA and non-SDMA paths
   - Ensures all command buffer writes are visible to hardware before
     updating the wptr and doorbell registers

3. Code organization:
   - Separated SDMA and non-SDMA code paths more clearly
   - Moved packet begin/end calls inside the IP type conditionals
   - Fixed volatile qualifier for doorbell_cpu to prevent compiler
     optimizations on hardware registers

These fixes resolve stability issues with SDMA operations and ensure
reliable command submission across all AMD IP blocks.

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 lib/amdgpu/amd_ip_blocks.c | 25 ++++++++++++-------------
 lib/amdgpu/amd_ip_blocks.h | 13 +++++++++++--
 2 files changed, 23 insertions(+), 15 deletions(-)

diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 51503f59d..ba0a2b358 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -591,12 +591,12 @@ user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_
 	uint32_t syncarray[1];
 	struct drm_amdgpu_userq_signal signal_data;
 	uint64_t timeout = ring_context->time_out ? ring_context->time_out : INT64_MAX;
-
-	amdgpu_pkt_begin();
+	unsigned int nop_count;
 
 	if (ip_type == AMD_IP_DMA) {
+		amdgpu_sdma_pkt_begin();
 		/* For SDMA, we need to align the IB to 8 DW boundary */
-		unsigned int nop_count = (2 - lower_32_bits(*ring_context->wptr_cpu)) & 7;
+		nop_count = (2 - lower_32_bits(*ring_context->wptr_cpu)) & 7;
 		for (unsigned int i = 0; i < nop_count; i++)
 			amdgpu_pkt_add_dw(SDMA_PKT_HEADER_OP(SDMA_NOP));
 		amdgpu_pkt_add_dw(SDMA_PKT_HEADER_OP(SDMA_OP_INDIRECT));
@@ -606,7 +606,13 @@ user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_
 		amdgpu_pkt_add_dw(lower_32_bits(ring_context->csa.mc_addr)); // CSA MC address low
 		amdgpu_pkt_add_dw(upper_32_bits(ring_context->csa.mc_addr)); // CSA MC address high
 		amdgpu_pkt_add_dw(SDMA_PACKET(SDMA_OP_PROTECTED_FENCE, SDMA_SUB_OP_PROTECTED_FENCE, 0));
+#if DETECT_CC_GCC && (DETECT_ARCH_X86 || DETECT_ARCH_X86_64)
+		asm volatile ("mfence" : : : "memory");
+#endif
+		/* Below call update the wptr address so will wait till all writes are completed */
+		amdgpu_sdma_pkt_end();
 	} else {
+		amdgpu_pkt_begin();
 		/* Prepare the Indirect IB to submit the IB to user queue */
 		amdgpu_pkt_add_dw(PACKET3(PACKET3_INDIRECT_BUFFER, 2));
 		amdgpu_pkt_add_dw(lower_32_bits(mc_address));
@@ -622,23 +628,17 @@ user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_
 
 		/* empty dword is needed for fence signal pm4 */
 		amdgpu_pkt_add_dw(0);
-	}
 #if DETECT_CC_GCC && (DETECT_ARCH_X86 || DETECT_ARCH_X86_64)
 	asm volatile ("mfence" : : : "memory");
 #endif
-
-	/* Below call update the wptr address so will wait till all writes are completed */
-	amdgpu_pkt_end();
-
+		/* Below call update the wptr address so will wait till all writes are completed */
+		amdgpu_pkt_end();
+	}
 #if DETECT_CC_GCC && (DETECT_ARCH_X86 || DETECT_ARCH_X86_64)
 	asm volatile ("mfence" : : : "memory");
 #endif
 
-	if (ip_type == AMD_IP_DMA)
-		*ring_context->wptr_cpu = *ring_context->wptr_cpu <<2;
-	/* Update the door bell */
 	ring_context->doorbell_cpu[DOORBELL_INDEX] = *ring_context->wptr_cpu;
-
 	/* Add a fence packet for signal */
 	syncarray[0] = ring_context->timeline_syncobj_handle;
 	signal_data.queue_id = ring_context->queue_id;
@@ -869,7 +869,6 @@ user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_ring_context
 			      AMDGPU_GEM_DOMAIN_DOORBELL);
 
 	ctxt->doorbell_cpu = (uint64_t *)ctxt->doorbell.ptr;
-
 	ctxt->wptr_cpu = (uint64_t *)ctxt->wptr.ptr;
 	ctxt->rptr_cpu = (uint64_t *)ctxt->rptr.ptr;
 
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 67891ded6..c28fc4769 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -47,6 +47,12 @@
 #define amdgpu_pkt_begin() uint32_t __num_dw_written = 0; \
 	uint32_t __ring_start = *ring_context->wptr_cpu & USERMODE_QUEUE_SIZE_DW_MASK;
 
+#define amdgpu_sdma_pkt_begin() \
+    uint32_t __num_dw_written = 0, __ring_start = 0; \
+    if (ring_context->wptr_cpu) \
+        *ring_context->wptr_cpu = (*ring_context->wptr_cpu & USERMODE_QUEUE_SIZE_DW_MASK) >> 2; \
+    __ring_start = *ring_context->wptr_cpu;
+
 #define amdgpu_pkt_add_dw(value) do { \
 	*(ring_context->queue_cpu + \
 	((__ring_start + __num_dw_written) & USERMODE_QUEUE_SIZE_DW_MASK)) \
@@ -55,7 +61,10 @@
 } while (0)
 
 #define amdgpu_pkt_end() \
-	*ring_context->wptr_cpu += __num_dw_written
+	*ring_context->wptr_cpu = (*ring_context->wptr_cpu + __num_dw_written) & USERMODE_QUEUE_SIZE_DW_MASK
+
+#define amdgpu_sdma_pkt_end() \
+	*ring_context->wptr_cpu = (((*ring_context->wptr_cpu + __num_dw_written ) & USERMODE_QUEUE_SIZE_DW_MASK) << 2)
 
 enum amd_ip_block_type {
 	AMD_IP_GFX = 0,
@@ -193,7 +202,7 @@ struct amdgpu_ring_context {
 	uint32_t *queue_cpu;
 	volatile uint64_t *wptr_cpu;
 	volatile uint64_t *rptr_cpu;
-	uint64_t *doorbell_cpu;
+	volatile uint64_t *doorbell_cpu;
 
 	uint32_t db_handle;
 	uint32_t queue_id;
-- 
2.49.0

