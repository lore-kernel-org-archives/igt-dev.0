Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50E8C83038
	for <igt-dev@archiver.kernel.org>; Wed,  2 Jul 2025 05:47:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A12F10E2FC;
	Wed,  2 Jul 2025 05:47:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GU8P4xAY";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2078.outbound.protection.outlook.com [40.107.93.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CD7510E2FC
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 05:47:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=egSpkFbDPvf/dDT7/P878jlU3rhKA3LyyaWqTagNhKbq5kSNJ0Pv0TTdKy+1Hnuu0h/knZRoBHZ4QxSHIOL9E8+l7vfKpogrpw2KV6UhLml5ikjVqoU+u9fFANgwDURfrTIR9O7wXXj3G/G4Qa7rtTTqhq1z/QnLPqefklCSzGhpScLd600UGAOtIyfHl+vRmCRpjuXn1a52Lfb9KGlk+Xmw2TUPfrN4HFnugo1QWxAHtZIM55diCy7VZxiTs+34YL7XMp6RarpNdG4GZamT3WVNSV+ye40rNsF2AcybsbX01L/9K43IIzkATsl4e7Ih3Xlcm3aIN91jhJbpLksRxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7MN2Gvx5iYAsAPMdxWrVjIQrJBPdtEfifkDqeASN2oQ=;
 b=XvlapolE5uvkMv7qpEqVKG9pCy9n/nTIv5h9k3QMIodwVS6MypWJTM1pBSLC8UJyNNpI9eo8yeBHmqluyaNqMUh/otW50HzpFdFKVoUV1wTVwo6uIaRqJNEQJefFaR5/4q3M5bANy4wDTndGaYUgM0DpuJjmJPXrFeLtLCB1Th7+U0MfAjUYqwtUtKNIIN20SFKzzDDo8O11YFwVKBZT3Any5O/EOpGqGnpN5QzmviyBEQv7FXx71QrHieDwG6H8x5HI15yX6Ryra02He1hYt0cX7DR4NqRKwC8qPSYhvrpl8PcH3xrP5EgaJZrzNpvO8Occ8jFV6JpC2v3oO/SyXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7MN2Gvx5iYAsAPMdxWrVjIQrJBPdtEfifkDqeASN2oQ=;
 b=GU8P4xAYDCAuHUgVrOKkimXYmbSzsoNIBB+Onbg7k2OZeHHroXXTqG8GqfdGYBDTd3ImWuKUy5z3rKLScnxUjEDOiJbIGEYehbfSajf3Xfm1w7OzuChqIhr0AWRz38r6y+ZR9lMSNYza9orMMOCoz01+3qBeDIrKB66MVvf8Ymw=
Received: from PH7PR17CA0005.namprd17.prod.outlook.com (2603:10b6:510:324::14)
 by BY5PR12MB4146.namprd12.prod.outlook.com (2603:10b6:a03:20d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Wed, 2 Jul
 2025 05:47:35 +0000
Received: from CY4PEPF0000E9D6.namprd05.prod.outlook.com
 (2603:10b6:510:324:cafe::51) by PH7PR17CA0005.outlook.office365.com
 (2603:10b6:510:324::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20 via Frontend Transport; Wed,
 2 Jul 2025 05:47:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Wed, 2 Jul 2025 05:47:34 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 00:47:33 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 00:47:33 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 2 Jul 2025 00:47:31 -0500
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Jesse.Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t v3 1/5] lib/amdgpu: Add SDMA support for user queues
Date: Wed, 2 Jul 2025 13:47:09 +0800
Message-ID: <20250702054730.366888-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: Jesse.Zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D6:EE_|BY5PR12MB4146:EE_
X-MS-Office365-Filtering-Correlation-Id: 81e11c9f-c0e7-4a61-b806-08ddb92bf16d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?E+VHml/S384gAqZZZKjKmX4bMw+pUu7MRf2j7/HVcUfubXafVVHwLI+GMYks?=
 =?us-ascii?Q?Q4z5Uqok7b8y7+zeXgqWcbztW4sT+6BfOogGxPA5grzwKRgvi82sBmj4Gnfu?=
 =?us-ascii?Q?f0T2xKOA7SuBe8An2FHuf284QXBHdQebWYlyzkPID1oQOFhbjcA9ReXMX89Y?=
 =?us-ascii?Q?e/My/cnzzszrj75BffvfxQdF7GojJkDh2RrH0g/Cw/d9WHaOzqX1U+eBMC89?=
 =?us-ascii?Q?GVLceN5TXqzaEMnrNycPXrUXlQ+Udp2vdyqLS8V6lOevC62ou754gsY82x9U?=
 =?us-ascii?Q?TtQoH0lUaQv2zXxdNFh1dFp9YcsVctDVeozDVY52PpBaZBOqXM0FOkGghur4?=
 =?us-ascii?Q?Zt2iw2IUKtwdP/l8PGS3oyaszCyysCtoJAF7D5zO3HhQUlkWoA6eRUZFc7VF?=
 =?us-ascii?Q?iHjFXONTVVmC/RDBXQ0mEBmH2fb35NURl7SsiXbEbjba7aX36uo+xjw8IJng?=
 =?us-ascii?Q?e+58JpiTBAYdI0kmhd0h1MXneGTOdZ+5wDbJiYbavgbzOyxXA/QntBpHPAxo?=
 =?us-ascii?Q?7wDxCDiOWNpEH2vpDw29HSG+mnsVn73/j3OiM3SlNlYzzp3sci1vgcAV9y4t?=
 =?us-ascii?Q?ftmJ4frkT56CXjDmudTG7AyQmvylgsxPSO3c/qgZDFtgmrXfbJ+kHXElfoJN?=
 =?us-ascii?Q?DJ3cdaVhJHsqhgF6MhperhA+/YE4UEaGehPMDCUG+lrIvKCIYmMPW1BVT4V2?=
 =?us-ascii?Q?WS9SwroibHNDWjZvJrmPUyFVvKXB4qc3nD3NqPpXDHO0dwAUS7qSMriB67UF?=
 =?us-ascii?Q?pqbrWb5FKinoBqQP4jiF8hLd8pBQyk6TbBaQRqliBmLNTjoXsN8O01pRxmub?=
 =?us-ascii?Q?CQ3uBfLM6XOckyS0Nf3yccxQx86UokN+gFSijRhYROr0HhJBsisczBXh9k7g?=
 =?us-ascii?Q?M22ZfnZTH392RvIvvaWx/mxRDQQw1v2D3ua9JF7bIDTSlC+BHar2e/f7OUjR?=
 =?us-ascii?Q?wKsi3DO5ud7gHDP3av86lfOs7l2361Q5Q/TpqMUNRwYVwd/xuex9BSw2gwmN?=
 =?us-ascii?Q?7YH5yeRtTcETCA1Kte3tJmm8oN5flAa9t4/Yx/qaf+oqMe+popj9ZCeXML4T?=
 =?us-ascii?Q?QoUm/ev7C3/YiW5QTa1mLnIW7oJgpD3XgseRjtzmZzKh1IiEeMEg78USuwB9?=
 =?us-ascii?Q?YnmEFUMBmRDTymDkYS7CL/tpTmtwi6MNLjYotl4gszyWK9QTTa6YxH5m2Kl6?=
 =?us-ascii?Q?B9g48aHtkAt0JDAnQKGhAtyI7vnRxRphj1QYocJXB69RoJ2/EcXCoFKcAOeg?=
 =?us-ascii?Q?kOgCFkzUuHTJLZVzuSIBS0LW2TSNnBRthM87lQiq8hIoQSFKpqIBQZlLj92Z?=
 =?us-ascii?Q?qJq2Tk0QpJM3pJuFH5NUTjgnJUgUc7ARQI8vNCS3AOu7i8RtaiE+xWxTDZb8?=
 =?us-ascii?Q?udzwL2lgLmH2tHANUT/ipoYJbWGCzaRy0+Iyk+umR4+WSHCZN7ekcB6krQ8o?=
 =?us-ascii?Q?6W6oaKRpGYAroB6IKIhQqfOgraVNEHqwvK5FllKfxUKUgK5B87MDotMkluMa?=
 =?us-ascii?Q?qOrDkTiVcoFhpQp7gS4JYqb1EcZvecRvx9Jc?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 05:47:34.0821 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81e11c9f-c0e7-4a61-b806-08ddb92bf16d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4146
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

 This commit adds support for submitting SDMA work to user queues.
    The changes include:

    1. Added SDMA-specific packet definitions in amd_sdma.h for indirect buffer
       operations and protected fence signaling.

    2. Modified amdgpu_user_queue_submit() to handle SDMA-specific requirements:
       - Added alignment padding with NOP packets to ensure 8-DWORD alignment
       - Implemented SDMA-specific indirect buffer submission format
       - Added proper handling of CSA (Context Save Area) addresses
       - Included SDMA-specific fence signaling
       - Adjusted wptr handling for SDMA queues

    The changes ensure proper synchronization and alignment requirements are met
    for SDMA operations while maintaining backward compatibility with existing
    queue types.

    Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/amd_sdma.h  |  4 ++++
 lib/amdgpu/amd_userq.c | 50 +++++++++++++++++++++++++++++-------------
 2 files changed, 39 insertions(+), 15 deletions(-)

diff --git a/lib/amdgpu/amd_sdma.h b/lib/amdgpu/amd_sdma.h
index 3e568e47a..2a9339cfb 100644
--- a/lib/amdgpu/amd_sdma.h
+++ b/lib/amdgpu/amd_sdma.h
@@ -103,5 +103,9 @@
 #              define PACKET3_DMA_DATA_SI_CP_SYNC     (1 << 31)
 
 #define SDMA_NOP  0x0
+#define SDMA_OP_INDIRECT                                0x4
+#define SDMA_OP_PROTECTED_FENCE             0x5
+#define SDMA6_SUB_OP_PROTECTED_FENCE             0x1
+#define SDMA7_SUB_OP_PROTECTED_FENCE             0x3
 
 #endif
diff --git a/lib/amdgpu/amd_userq.c b/lib/amdgpu/amd_userq.c
index f8e1a4b45..10e82a5a4 100644
--- a/lib/amdgpu/amd_userq.c
+++ b/lib/amdgpu/amd_userq.c
@@ -6,6 +6,7 @@
 #include "amd_userq.h"
 #include "amd_memory.h"
 #include "amd_PM4.h"
+#include "amd_sdma.h"
 #include "ioctl_wrappers.h"
 
 #ifdef AMDGPU_USERQ_ENABLED
@@ -136,22 +137,39 @@ void amdgpu_user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_co
 	uint64_t timeout = ring_context->time_out ? ring_context->time_out : INT64_MAX;
 
 	amdgpu_pkt_begin();
-	/* Prepare the Indirect IB to submit the IB to user queue */
-	amdgpu_pkt_add_dw(PACKET3(PACKET3_INDIRECT_BUFFER, 2));
-	amdgpu_pkt_add_dw(lower_32_bits(mc_address));
-	amdgpu_pkt_add_dw(upper_32_bits(mc_address));
-
-	if (ip_type == AMD_IP_GFX)
-		amdgpu_pkt_add_dw(control | S_3F3_INHERIT_VMID_MQD_GFX(1));
-	else
-		amdgpu_pkt_add_dw(control | S_3F3_VALID_COMPUTE(1)
-					       | S_3F3_INHERIT_VMID_MQD_COMPUTE(1));
-
-	amdgpu_pkt_add_dw(PACKET3(PACKET3_PROTECTED_FENCE_SIGNAL, 0));
-
-	/* empty dword is needed for fence signal pm4 */
-	amdgpu_pkt_add_dw(0);
 
+	if (ip_type == AMD_IP_DMA) {
+		/* For SDMA, we need to align the IB to 8 DW boundary */
+		unsigned int nop_count = (2 - lower_32_bits(*ring_context->wptr_cpu)) & 7;
+		for (unsigned int i = 0; i < nop_count; i++)
+			amdgpu_pkt_add_dw(SDMA_PKT_HEADER_OP(SDMA_NOP));
+		amdgpu_pkt_add_dw(SDMA_PKT_HEADER_OP(SDMA_OP_INDIRECT));
+		amdgpu_pkt_add_dw(lower_32_bits(mc_address) & 0xffffffe0); // 32-byte aligned
+		amdgpu_pkt_add_dw(upper_32_bits(mc_address));
+		amdgpu_pkt_add_dw(control); // IB length in DWORDS
+		amdgpu_pkt_add_dw(lower_32_bits(ring_context->csa.mc_addr)); // CSA MC address low
+		amdgpu_pkt_add_dw(upper_32_bits(ring_context->csa.mc_addr)); // CSA MC address high
+		if (ring_context->hw_ip_info.hw_ip_version_major <= 6)
+			amdgpu_pkt_add_dw(SDMA_PACKET(SDMA_OP_PROTECTED_FENCE, SDMA6_SUB_OP_PROTECTED_FENCE, 0));
+		else
+			amdgpu_pkt_add_dw(SDMA_PACKET(SDMA_OP_PROTECTED_FENCE, SDMA7_SUB_OP_PROTECTED_FENCE, 0));
+	} else {
+		/* Prepare the Indirect IB to submit the IB to user queue */
+		amdgpu_pkt_add_dw(PACKET3(PACKET3_INDIRECT_BUFFER, 2));
+		amdgpu_pkt_add_dw(lower_32_bits(mc_address));
+		amdgpu_pkt_add_dw(upper_32_bits(mc_address));
+
+		if (ip_type == AMD_IP_GFX)
+			amdgpu_pkt_add_dw(control | S_3F3_INHERIT_VMID_MQD_GFX(1));
+		else
+			amdgpu_pkt_add_dw(control | S_3F3_VALID_COMPUTE(1)
+						| S_3F3_INHERIT_VMID_MQD_COMPUTE(1));
+
+		amdgpu_pkt_add_dw(PACKET3(PACKET3_PROTECTED_FENCE_SIGNAL, 0));
+
+		/* empty dword is needed for fence signal pm4 */
+		amdgpu_pkt_add_dw(0);
+	}
 #if DETECT_CC_GCC && (DETECT_ARCH_X86 || DETECT_ARCH_X86_64)
 	asm volatile ("mfence" : : : "memory");
 #endif
@@ -163,6 +181,8 @@ void amdgpu_user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_co
 	asm volatile ("mfence" : : : "memory");
 #endif
 
+	if (ip_type == AMD_IP_DMA)
+		*ring_context->wptr_cpu = *ring_context->wptr_cpu <<2;
 	/* Update the door bell */
 	ring_context->doorbell_cpu[DOORBELL_INDEX] = *ring_context->wptr_cpu;
 
-- 
2.49.0

