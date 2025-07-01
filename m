Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C84C7EE30
	for <igt-dev@archiver.kernel.org>; Tue,  1 Jul 2025 07:17:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C053C10E50F;
	Tue,  1 Jul 2025 07:17:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="h4yEZina";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33BD210E50F
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Jul 2025 07:17:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nlPJlaMllRREni/ptsEtlyjtpKvEpfcvxLaPhCjf5xYaotJ0wBXlwpNPWd9i3gTz9YTmMSAhPHdzFznL4Emc1cAsnrrZRLundXO6x+Lamdwm+UV3SmSqaZ08i0EyerXmg1SWi6wIb/zy6huu4mNNCRSkWziA/tplFUj2Yo49dkziUnrnh/QUKfU5gOVmtNAMUXrE606ElfIn6vVFAt60aUYmr6RAQUTqbEvW3DvgEndHzQV4hi+yFK1DBXc5C+8ftWFU5y8PUq6f+1KFX+TB2uSYD5F/PgHeIIlxhBE097RmPnE0G+oESL7lWAsBTWIsLgrWrbR0QL1qwdSBFEeZOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7MN2Gvx5iYAsAPMdxWrVjIQrJBPdtEfifkDqeASN2oQ=;
 b=SdV34EqRl/h3IcnvyKa+RKbf8IrC7UuQJ23VJHkiIXseonWBoYVBtmLPNipQgom2RIx2OC/Ey8X+guyYaojBlWa290s6YHfBU4k3ZmJI8e3dJzTwr7cz9Kwqb+V3QLDflSgWbRyVkmEwvbVimwGNKdKHyTHxq/cEv+CV5Mca+KTNC7v7eG8LASY4b6Yx90ArBNopg/Zng9LGva+dTHU/FRGzebimMIvR8Iz+NwDufGWR1feGW5f1gecRQFolAqRJrA1SdVznPOa+jImcN0nARyBwp3v6zDS5nJ0KuVfdVzBEFUZmn4cfvF6gtLnR3tZ+Bbhon6kceLQa66a/G3zhnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7MN2Gvx5iYAsAPMdxWrVjIQrJBPdtEfifkDqeASN2oQ=;
 b=h4yEZinabjigVjAskKfWofN1xMk+qgj5okfOhp/UcNl8VUkCqeN2+A9Z6elUNZFDMYZO6jNy7kb6QnU0y9v/53wm63JPeY7H6/abh0+6x3g1hOTFn7lk0ojtCYX1sgciGn1uIektiygkHQ5yDupz6NxuHeJRGMGzq8aydf/p+HM=
Received: from BN9PR03CA0478.namprd03.prod.outlook.com (2603:10b6:408:139::33)
 by DS0PR12MB8455.namprd12.prod.outlook.com (2603:10b6:8:158::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Tue, 1 Jul
 2025 07:17:25 +0000
Received: from BL02EPF0001A0FA.namprd03.prod.outlook.com
 (2603:10b6:408:139:cafe::c9) by BN9PR03CA0478.outlook.office365.com
 (2603:10b6:408:139::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.31 via Frontend Transport; Tue,
 1 Jul 2025 07:17:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A0FA.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 1 Jul 2025 07:17:24 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Jul
 2025 02:17:23 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 1 Jul 2025 02:17:23 -0500
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Jesse.Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t v2 1/3] lib/amdgpu: Add SDMA support for user queues
Date: Tue, 1 Jul 2025 15:17:20 +0800
Message-ID: <20250701071722.226903-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: Jesse.Zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FA:EE_|DS0PR12MB8455:EE_
X-MS-Office365-Filtering-Correlation-Id: 00182577-ea60-4d2d-4689-08ddb86f540f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KPdGkqEDjimT+ALTQ6BDSQqztQVMe6ZVOuY86bXu7XSd0eYe20wYG2amkfWz?=
 =?us-ascii?Q?bPOJfveKSrggi4QUaIRQLoV9N7BYeWsj/I8C6fHFcNKHsrUqktnuEgnC/t1Z?=
 =?us-ascii?Q?AP2OFQ9+yHIHMupgedurGxcaSX8NXUwdIsOMwWlqgFTrIjqhr3WijXQvyRGk?=
 =?us-ascii?Q?ct1HoPv5FkPuA8P//frePyVlR1Kmspfo8xAaBOtnSZYhQMoWO+SJnCFsDJBn?=
 =?us-ascii?Q?HB0iUfl2NcZQl9HNp/qZqTqHKF5HZzoqhR/4Se1uDYwcQ3ZPNO5k+igypZKi?=
 =?us-ascii?Q?BmaEzN1DfaVkg4hCsPyd+JGjWnBSZ+gg8JEuI7D1bXTnz80gj9+oRCSQUx+T?=
 =?us-ascii?Q?OAbGcHsR8Zosg0/3oQndxtuphHe9wso3zWpKEAkS/FixyE1JrfM1pcfZy2N8?=
 =?us-ascii?Q?412UV1pJH6LhX9wixmcy5sICsv/JPsBM6h7T6uuFBab04Hls9rOyL5g2hNSH?=
 =?us-ascii?Q?/DKEOwItlC7lclhSBbZ3Dag6/cYkwLfH6wuRkqNGVZRQzqRqRLIdEZiAhkHP?=
 =?us-ascii?Q?7ciX4UiJECCEdY1/WYyKemARSyFTMA3CD9Toc476CPNFyqaH0g1nC/it4rXm?=
 =?us-ascii?Q?XwxJf1r5/8Fk7XrH1eMTpruA7UA71LmMGAZgoIEInM19R9otE/IKsr+z/9/P?=
 =?us-ascii?Q?/GO1H34NyjNyZsLQPGuCizu98P3fjnE3lFNsCUkFT8kHz2g+7rl4tnZTx4fg?=
 =?us-ascii?Q?DOu6K/rRaOIcDNBHEidG49NmrPENBRPcTwE4aYkLgScNHkl/d2jz/qIx8Z07?=
 =?us-ascii?Q?LfXQb6FjxzZFNriz1+ZgIHVfkxPiGrHJWDHok31TOlpSW1lYy2gcdWAjOCZ3?=
 =?us-ascii?Q?nx5fCVQvzWS1R8QA/Or2mpCh5P2dYviv3AIMXig1w9Zgi61WNs84NKNcYztB?=
 =?us-ascii?Q?QvK1fttvlr1/Bcpd6x0Bx+1/XxZ9/A+aN8E7dIwMt6bEnv1dYovM1Q+nKcfg?=
 =?us-ascii?Q?njrjvShY7i0eTnXlewDf5LPOvkbhBEQr2OU1Ewq1HyDTtZteTVcNx0tU7jUV?=
 =?us-ascii?Q?ReN3oSY2sKs4K9q5gbq+QSeATKJS5/eu6nduTSpnhDrhuZJqzRczPpb3jAk2?=
 =?us-ascii?Q?8GMAm7oYwzsM1KS+iD8TBr5tPQiBzKOBSAlVHJsvxDb9f5gpbo94c6/FLnxK?=
 =?us-ascii?Q?acdyJPUfJVU7gsx4BYTh0AEkIIQTllh/HyFC8tkldvwCGeWNiX85m9JR/y6j?=
 =?us-ascii?Q?k1PsO8azPYVQiCbH3EugpBDn2p2O3kkhga7u/umqT0f1YGggw0d9ALPPp77p?=
 =?us-ascii?Q?Zu3i5mWn/A6jjLmU4JahI8jlpRNgdcC6M0hrmD/zLVwx59LkWWl7xD9eY52d?=
 =?us-ascii?Q?O9MKeoxwX17tExEcaZlvtiPxO8K0ME3reN7rothCinOy9RzGZF2YpJz4fDkj?=
 =?us-ascii?Q?e3Z/LEyr8JfI0g8y/ikb0GnZU7FhsOnCmh3eyscuh+TgvjjHLIqFabk8TTE5?=
 =?us-ascii?Q?z/sxGqkwiW0e6oyr2zU9NZ381qoOyQ4tlg+sdKnFutZCafms69+EM940162r?=
 =?us-ascii?Q?Eo1IK72jahDVVZk32U4T+rxMADYl5QL6iajh?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 07:17:24.7132 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00182577-ea60-4d2d-4689-08ddb86f540f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8455
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

