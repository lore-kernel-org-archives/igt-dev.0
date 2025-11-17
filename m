Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 019CBCCD19A
	for <igt-dev@archiver.kernel.org>; Mon, 17 Nov 2025 03:01:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C57D10E0D9;
	Mon, 17 Nov 2025 03:01:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mKn5VaQD";
	dkim-atps=neutral
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011049.outbound.protection.outlook.com [40.107.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A3F610E0D9
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Nov 2025 03:01:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bf3DSn/BiwvCpxOUpGZgS06q28C10Tso3DtL6bQIAI/8XpQG93JxiLWOXA8fJba8X44XWBpP+WZ54EHrqTPxSge4kDI+NztEoFxuR8CO90sqWXN2sn3UBkfErGTe1I+/qKkfWXb19UppR4+TGLLecd8d8Nwy7zIYmp0gehPmfk1LtdXt2GJrz8qM8fXzOGKy9+eVW6nzz69U6goibywYp0LT6K3KZx4b7kuWEXYB5p2Q9Ou7lqhIjNa/YF5yFMOGOsIlkkPIsGQLVsql9uthBHRhiC73FabKN4Skur9KsrJDIHe+p/BNzZncUUFm7KM2gQeufNBuF4YAUw4VKwC5vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LT9osHWSg+aIejhtvU0KPLk2B2ZmmzsTsVHaQn/XiOY=;
 b=tO2OYkSFU03xiiO5Z9hBIApxsSCYJyDvF2GucS/5sNWaNrV+4pAZOnjjtl34x7tmL0XvJsPD569IEcSRaF7E1BUkKKd9rrlpqEIxwtwyEeeoMSvZOzYpjMoxeIfBxFWxBmqyzGETT8jF2z6zHrjhhu+CUkZdcYsCSHeHeHYuRAEFJuNTYCVvsHAv3GCl9I+wby8dC53yMKnlxOCKKSiUhABobrlvKcVtiQJnEb4NhMQIWSDMqJAxXvFNd0tUXUBT4UDUnSbJkXnpo3dsvl6VDZeevUFTg1Hbb6kZ1db7Fwf/5OA/Nl07SB8Lf1O3SacATgv8E7V1+5KNTQu6zfqkUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LT9osHWSg+aIejhtvU0KPLk2B2ZmmzsTsVHaQn/XiOY=;
 b=mKn5VaQDdbGyZOnvfpDUdy+pVzJResIci+Ii1lBMD2/mKZ7P/ZlZBfk4pHPKcsHyfm2LheHP+JifwBuCWyvTeMYYciinB/br9VusoMFM157/stCRD+2zEujHLqvhCmprNtOxmL3TPltRYgfBuVvtlJMGqTazEPPvffwcUyIly4E=
Received: from SA9PR13CA0036.namprd13.prod.outlook.com (2603:10b6:806:22::11)
 by IA4PR12MB9762.namprd12.prod.outlook.com (2603:10b6:208:5d3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 03:01:04 +0000
Received: from SA2PEPF00001504.namprd04.prod.outlook.com
 (2603:10b6:806:22:cafe::e9) by SA9PR13CA0036.outlook.office365.com
 (2603:10b6:806:22::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.7 via Frontend Transport; Mon,
 17 Nov 2025 03:01:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00001504.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 03:01:03 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Sun, 16 Nov
 2025 19:01:03 -0800
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 16 Nov
 2025 21:01:03 -0600
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Sun, 16 Nov 2025 19:00:56 -0800
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse.Zhang <Jesse.Zhang@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH i-g-t v2] lib/amdgpu: Fix SDMA packet handling and memory
 ordering
Date: Mon, 17 Nov 2025 11:00:28 +0800
Message-ID: <20251117030050.552497-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="Y"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001504:EE_|IA4PR12MB9762:EE_
X-MS-Office365-Filtering-Correlation-Id: 46b58495-931c-4535-362c-08de25858bbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8XbPueets0f63Rq0Drs08Gag+W8BcbHtrfZXoe8dsBACrKCyI4BtqVBoelgI?=
 =?us-ascii?Q?IhUPCVm8176b3G5H6vb+ipr+h3pU8Uj/5NH7E1jD39bqWLc/u2f2nt1POFLh?=
 =?us-ascii?Q?PGaCOk8d/kkgjNv12pRBp4Bv9+8TsDBuHAnICM5D5GPOKY2svo1H1tyow/BK?=
 =?us-ascii?Q?qcuT2BjAVTy35D0KevCctERLZgOTr8HmQQNFJj7LPGfpkwjTCKhUmEYtrGLP?=
 =?us-ascii?Q?OG3qoaRXnqNGn8rlw9QMuSDQdfSZQ9iP35NwE84oiGkOEuq/r4x4M9bh6ohO?=
 =?us-ascii?Q?nWKpOIHdqHN25uuiX9NBjVnyq+nbZCFTdJnQChkeuq0B2JAc5fXl2ktZ4TWB?=
 =?us-ascii?Q?AGVOm318dlDPyKx1Ab9ULWZJPf0nrqDqrxf0rZkLEFOkbApHoVD2v89m20Bx?=
 =?us-ascii?Q?UWLFtGjFYY/WEPOPFnSRFjSViL+zKj38U2Jwn9GwOLgTDUQ0y2bQ0sbkNJNR?=
 =?us-ascii?Q?HIqcNvtmY3koLlrjqJfUFIOsyDD+jBZ/mHcLrNDygIB3Pb8tIxlc34iJ2lVI?=
 =?us-ascii?Q?j6frXTw/EQWnI7idQKv78qtvtPcv67mOuZB60RnNPnUp9pQg8yJcNm6Z5Oij?=
 =?us-ascii?Q?38Ha9GupRJwzCRdzdwGVE6ICmrSt/VW/XZYHTymWNpn7XS6V/Z/xX/I6nCF9?=
 =?us-ascii?Q?QytY/EuCk3GjBucypAEwgZ61SkuVwnuBIc90TduFyOOOdn/4FSSZGgHN+Htg?=
 =?us-ascii?Q?nTv2Bv+ueGDxfXNbdR0BlEQRRQi3gOp7Xxs0GQWUXdY/llyLP7a0mF/E1Mn2?=
 =?us-ascii?Q?fX1fHeeFeZYZLvmZLR4LRES87aicbHH7eDORLOkVgFLRQoO0EBrVSJ55Dr+p?=
 =?us-ascii?Q?uQ4P2rfdFepO+RSgltGESfNh7NIigYhbgF6B3FuzDqFsWP+2OAcDHM3ZDEUs?=
 =?us-ascii?Q?t+UEXrF0e7YkWqz1n0y94C1e8kIoVCSMAsmUqyCaWMsv0T1bANyGfuwEaocy?=
 =?us-ascii?Q?ooBGfhGOfhlrdaUS6KSnUoPwPw+XczBbdS+58LNAhHL36slnRPa88FV+frYe?=
 =?us-ascii?Q?2GdVilSF/v9lgbaogPxMhWfEVLu7lme0ozf9DLHc/cN0NdUZm72veKa6m6rd?=
 =?us-ascii?Q?/KEl2fij79C6B2N/aOAHKfmFdkb+X95icPHjckmik3G1uYORPI+NdekDfdCO?=
 =?us-ascii?Q?GXrcsLfLD1SytKUXEedADts4+lRn3vxRJdkV10UR+veGBG+wU5O/GtJ08zPW?=
 =?us-ascii?Q?hetH2d7hP+j3aEo0P/xRY+tL8BfqmInlvdRTIRI/sYaiJPN4W95T4iJVzE7n?=
 =?us-ascii?Q?cCiLL0m/B4yO/jKWgRldoHuVxOUK9+QE5J+Mka3LM0oneyPRdVovC0dmA7Nj?=
 =?us-ascii?Q?p3wcMOYwZqK6sAVYfkQCM417dcwwy4iNWrSjeln1dFy3JBNNns5lkv67/99d?=
 =?us-ascii?Q?dVqlbaeszsr4g3Wejo67N67ZAMHEkSnQugpTdnoLbRKcjH1Ku5uddhQOnPKw?=
 =?us-ascii?Q?UpDRYc1UPUi2SufV+L3uIG1sVgQFqOS517sibbAi1oHvVt9sHSIGoHBRP3db?=
 =?us-ascii?Q?XF2AS/6Dvxy8B6/os8ipnmAMsmwef0uO8qsrgHNMlaaT35sYCpQ5PfRZl2D9?=
 =?us-ascii?Q?S9Br4CyluyompmimV+I=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 03:01:03.7717 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46b58495-931c-4535-362c-08de25858bbb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001504.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9762
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

v2: add brief comments explaining the purpose of the macros (Vitaly)

Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 lib/amdgpu/amd_ip_blocks.c | 24 ++++++-------
 lib/amdgpu/amd_ip_blocks.h | 70 ++++++++++++++++++++++++++++++++++++--
 2 files changed, 80 insertions(+), 14 deletions(-)

diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 51503f59d..b44c29819 100644
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
@@ -622,21 +628,16 @@ user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_
 
 		/* empty dword is needed for fence signal pm4 */
 		amdgpu_pkt_add_dw(0);
-	}
 #if DETECT_CC_GCC && (DETECT_ARCH_X86 || DETECT_ARCH_X86_64)
 	asm volatile ("mfence" : : : "memory");
 #endif
-
-	/* Below call update the wptr address so will wait till all writes are completed */
-	amdgpu_pkt_end();
+		/* Below call update the wptr address so will wait till all writes are completed */
+		amdgpu_pkt_end();
+	}
 
 #if DETECT_CC_GCC && (DETECT_ARCH_X86 || DETECT_ARCH_X86_64)
 	asm volatile ("mfence" : : : "memory");
 #endif
-
-	if (ip_type == AMD_IP_DMA)
-		*ring_context->wptr_cpu = *ring_context->wptr_cpu <<2;
-	/* Update the door bell */
 	ring_context->doorbell_cpu[DOORBELL_INDEX] = *ring_context->wptr_cpu;
 
 	/* Add a fence packet for signal */
@@ -869,7 +870,6 @@ user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_ring_context
 			      AMDGPU_GEM_DOMAIN_DOORBELL);
 
 	ctxt->doorbell_cpu = (uint64_t *)ctxt->doorbell.ptr;
-
 	ctxt->wptr_cpu = (uint64_t *)ctxt->wptr.ptr;
 	ctxt->rptr_cpu = (uint64_t *)ctxt->rptr.ptr;
 
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 67891ded6..c319ded6e 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -38,15 +38,61 @@
 #define PAGE_SIZE 4096
 #endif
 
+/*
+* USERMODE_QUEUE_SIZE
+* USERMODE_QUEUE_SIZE_DW
+* USERMODE_QUEUE_SIZE_DW_MASK
+* --------------------------------------------------------------
+* USERMODE_QUEUE_SIZE        : Total size of the usermode command queue (1 MB).
+* USERMODE_QUEUE_SIZE_DW     : Same size expressed in DWORDs (size / 4).
+* USERMODE_QUEUE_SIZE_DW_MASK: Bitmask used for fast ring wrap-around.
+*
+* The ring size is a power of two, so the mask (DW_size - 1) enables:
+*
+*      index % queue_size  →  index & USERMODE_QUEUE_SIZE_DW_MASK
+*
+* This provides fast modulo arithmetic and prevents buffer overruns.
+*/
 #define USERMODE_QUEUE_SIZE		(PAGE_SIZE * 256)   //In bytes with total size as 1 Mbyte
 #define ALIGNMENT			4096
 #define DOORBELL_INDEX			4
 #define USERMODE_QUEUE_SIZE_DW		(USERMODE_QUEUE_SIZE >> 2)
 #define USERMODE_QUEUE_SIZE_DW_MASK	(USERMODE_QUEUE_SIZE_DW - 1)
 
+/*
+* amdgpu_pkt_begin()
+* ---------------------------------------------------------------
+* Begins building a packet in the usermode queue.
+* - __num_dw_written tracks DWORDs written in the current packet.
+* - __ring_start is the starting write pointer for this packet,
+*   wrapped by the ring mask to ensure it is within bounds.
+*/
 #define amdgpu_pkt_begin() uint32_t __num_dw_written = 0; \
 	uint32_t __ring_start = *ring_context->wptr_cpu & USERMODE_QUEUE_SIZE_DW_MASK;
 
+/*
+* amdgpu_sdma_pkt_begin()
+* ---------------------------------------------------------------
+* Same as amdgpu_pkt_begin, but SDMA rings use a byte-based wptr.
+* - Convert byte-based wptr → DWORD index (>> 2)
+* - Wrap with mask to stay within the ring
+* - __ring_start holds DWORD index of the write pointer
+*/
+#define amdgpu_sdma_pkt_begin() \
+    uint32_t __num_dw_written = 0, __ring_start = 0; \
+    if (ring_context->wptr_cpu) \
+        *ring_context->wptr_cpu = (*ring_context->wptr_cpu & USERMODE_QUEUE_SIZE_DW_MASK) >> 2; \
+    __ring_start = *ring_context->wptr_cpu;
+
+/*
+* amdgpu_pkt_add_dw(value)
+* ---------------------------------------------------------------
+* Writes a single DWORD into the queue at:
+*
+*    queue_cpu[(ring_start + num_dw_written) & mask]
+*
+* Masking handles ring wrap-around. Increments __num_dw_written.
+*/
 #define amdgpu_pkt_add_dw(value) do { \
 	*(ring_context->queue_cpu + \
 	((__ring_start + __num_dw_written) & USERMODE_QUEUE_SIZE_DW_MASK)) \
@@ -54,8 +100,28 @@
 	__num_dw_written++;\
 } while (0)
 
+/*
+* amdgpu_pkt_end()
+* ---------------------------------------------------------------
+* Finalizes the packet:
+* - Advances the write pointer by the number of DWORDs written.
+* - Wrap-around handled by mask.
+*
+* The wptr remains in DWORD units (unlike SDMA).
+*/
 #define amdgpu_pkt_end() \
-	*ring_context->wptr_cpu += __num_dw_written
+	*ring_context->wptr_cpu = (*ring_context->wptr_cpu + __num_dw_written) & USERMODE_QUEUE_SIZE_DW_MASK
+
+/*
+* amdgpu_sdma_pkt_end()
+* ---------------------------------------------------------------
+* Finalizes SDMA packet:
+* - Advance DWORD wptr
+* - Wrap with mask
+* - Convert back to a byte offset (<< 2) because SDMA uses byte-based wptrs.
+*/
+#define amdgpu_sdma_pkt_end() \
+	*ring_context->wptr_cpu = (((*ring_context->wptr_cpu + __num_dw_written ) & USERMODE_QUEUE_SIZE_DW_MASK) << 2)
 
 enum amd_ip_block_type {
 	AMD_IP_GFX = 0,
@@ -193,7 +259,7 @@ struct amdgpu_ring_context {
 	uint32_t *queue_cpu;
 	volatile uint64_t *wptr_cpu;
 	volatile uint64_t *rptr_cpu;
-	uint64_t *doorbell_cpu;
+	volatile uint64_t *doorbell_cpu;
 
 	uint32_t db_handle;
 	uint32_t queue_id;
-- 
2.49.0

