Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D10BE9A052
	for <igt-dev@archiver.kernel.org>; Thu, 19 Feb 2026 17:12:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E778310E131;
	Thu, 19 Feb 2026 17:12:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fM4PAFGH";
	dkim-atps=neutral
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011051.outbound.protection.outlook.com
 [40.93.194.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE3C10E131
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Feb 2026 17:12:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FFRsRZLGUccIa1WesltygfKyab2QUC3AABrRGEhGd30LrlINHzqUze4vxdAQbTGwPjaNYj00HKnszgR87l9LG9qzdwwb9MeeQBAqSuBPiA1vukHvbgcpTTJFH63SXSiu8pjR5gAGYr3W8hTZ+vhoSRvPCAFNkSCdIRgf2dhKMBXRd+ZYSUeJSZ5sVigr3AoQlOsafbK/LnAh/oUbpiSuNB4vLBpBunPqaepwj3bITXpQ9drNRECw4XEMD0EbIsAMQ2Q0EnX6YXxxCaCuMIY8yftTW5JFQXDeye57B7c+QtBdqNpWKasPtaEiPV9xrd6xau5vb0O26MqNGyD2llEv7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mCMAaAGhEVMdtZOsDjG6yBmBxHj0VaXuUdrLTiDTuyg=;
 b=tT/CwxR2hTdwHSNP2jWYeH5kwaI1DTae1NOMuZpSCtGb1IkmsYgiZNoEB5hHky8L4YdrMwojbMfKIagGq9FrYVRW5Q7COoaPnEZvWo+fTdT9RMijAMsbQ47s2F+25ai/if6DOT9sxAO4WHskXj751IJmQLUtPO7xl2GQ+ID0H9mE8NkpeMR5MXqwf3DtKqFRPZxlhMO90pRo/Scpp+SKQCDIwvTI9tR3U1Dt7ivN+4wbjPMZlvrQKVOVlc5Zs7fOMCrJJU3ObhKOR0KwYV9czdWzG6PC/JZYFb7xF2lgyA5ufnqXypltilyw2/YolF+ChDRg0oW3X3tka4wU2wSwWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mCMAaAGhEVMdtZOsDjG6yBmBxHj0VaXuUdrLTiDTuyg=;
 b=fM4PAFGHQSBksHgqWqBLNRBnu/oMseGxQsG6lT7zwg3Vrgwy755zayAK7f5Ka+v4NoqjbCStCZ2JnGt4CHSt3Weo7PIsqUXpxP/zQHlMQCJ7++iGVzTiRJ6LBV0DQTYb0IjdvgOT/CXl2Els9BxAZaDFh96fkBL5bpj02sF5Ies=
Received: from BN9PR03CA0764.namprd03.prod.outlook.com (2603:10b6:408:13a::19)
 by LV0PR12MB999069.namprd12.prod.outlook.com (2603:10b6:408:32a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 17:12:27 +0000
Received: from BN2PEPF00004FBC.namprd04.prod.outlook.com
 (2603:10b6:408:13a:cafe::45) by BN9PR03CA0764.outlook.office365.com
 (2603:10b6:408:13a::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.16 via Frontend Transport; Thu,
 19 Feb 2026 17:12:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF00004FBC.mail.protection.outlook.com (10.167.243.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 19 Feb 2026 17:12:27 +0000
Received: from amd-X570.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 19 Feb
 2026 11:12:23 -0600
From: Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <vitaly.prosyak@amd.com>, Yogesh Mohan Marimuthu
 <yogesh.mohanmarimuthu@amd.com>
Subject: [PATCH i-g-t v3 1/2] lib/amdgpu: support FWM packet in user queue
Date: Thu, 19 Feb 2026 22:42:08 +0530
Message-ID: <20260219171209.2296-1-yogesh.mohanmarimuthu@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBC:EE_|LV0PR12MB999069:EE_
X-MS-Office365-Filtering-Correlation-Id: 908dfcc4-2266-4ad5-258f-08de6fda0ed0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gWHeq7mVmnfxUbc2UXc95dBQGrrPeMH9zLiC2y+oYcnyeKzUn5hkEi7dpeSR?=
 =?us-ascii?Q?lIht/oT67gEB7lCdy+dEWmKcJ+bpR0A1eqxJs6Ney2HIFQBYV52FdYn+J4bR?=
 =?us-ascii?Q?siPhfkVnPmViJHhBtUV1NXTPvxJeNvFoFd+S76MzQcmBwKJQb7+LsltQXBkL?=
 =?us-ascii?Q?XqvJAms/yMb3MTg7vqNNWOKLp2tFEFxXKYLqYaE57otztXk5U75dUkF36FW+?=
 =?us-ascii?Q?cKRnZflbMVGIdjHLayWn3zQPtahCxheHGr7OqtNIzjxrnZ3qDESgnYB6jcc3?=
 =?us-ascii?Q?ASt6k62RHsmbUohVue+jfy6vn1OZ7iE/Juq1pAJNgdLISadJtN3EnQu4NjdE?=
 =?us-ascii?Q?CwNJ7upLdzFG6TYCoFJkclYeBY+j1YUK7kXwGtDYyC+nVZvjj4dnpP8ELC9j?=
 =?us-ascii?Q?taf03nh5lD2bH/GIaCUTAe6cvc8jK0Gb4bdTV0rZl7gBE5j2bA/Q32uQ7KHX?=
 =?us-ascii?Q?k0X9kkXG7XrcCmhPAdbSRTkpJQele/FU7T7PEz8Ec+JELTuz2f+zCg1JfFft?=
 =?us-ascii?Q?sIcPEwK4RK79UEk5IXdBwEVmJyX2phhvrOr9ZWQtgTyRAdjHiHlSYHLPWsBq?=
 =?us-ascii?Q?TOUMkOGy1N9DZJPUA/MCp+1U0qnF/kIk+Zv58ABkOhVIXzOUHO4nl22WT7Q7?=
 =?us-ascii?Q?fOoA8v3O7xJtlIWr0wyfU5P5ftEugUQPXvTaUgKh9rzffpsqK/0UdS8QAUoD?=
 =?us-ascii?Q?xlJFjY4SZeIxDXME1TUEHMhU/rW8Nxffpn/ImsIFW0Aku7F0/2myQlzfWKIk?=
 =?us-ascii?Q?nXii/S+lattIb19x8M58jbYaTdtHswRNAFEaIvMBETI8vRng+zAOdWOqsxc9?=
 =?us-ascii?Q?qBcKZTH9O0R0IaKZ+iqTh647Gpq/rcxYkfX50yW39cPPr9icQdz/sPugYaRl?=
 =?us-ascii?Q?vrcz0aegJHhrVzT38/UXYTX8qXZZjqXciooqwyp0bquM9rJ5TecPcX5gXWDd?=
 =?us-ascii?Q?d9DLnxbxB33WLZJ18LI/1ymj0fVF4OSl0guvou3HIPfLdL5Ueqpq06YzvFQw?=
 =?us-ascii?Q?/ded4rsRRk18zecyFX3LbRjWYeRNfIyQRa2fC65iO9OCBx/tLn9IWJ2o3DOd?=
 =?us-ascii?Q?h1ya9Q9sdgQV2ekS5ok+iaeNQNJxWtFPZx1i3A0JyHvVtJp7RcFY9JQsGtQs?=
 =?us-ascii?Q?b0SPhZE2VKF8xaVJouTSi/1O4Zu9DP2xe3Ev7Je6YJ4J4L9PJKpy1oJmnw2k?=
 =?us-ascii?Q?USCL9Ft0pfNsvXgX2v08Hw0h7QKr/TdinZ6pszPan54oHxpy/3wnXapITSgS?=
 =?us-ascii?Q?3UrLsER/MIvwB4MkiOiKV1z7/65evnfAQJ5tJk4HTgeiQZPj04uGaAQES0h2?=
 =?us-ascii?Q?xZHaw1gUZoSXiI9AdZu5Pbh6aYA6DAt6sCLeavtk0yD2RH/pLqEOIomXpotz?=
 =?us-ascii?Q?boHNSznfaryX5FGa1MkUiQaWBZIL2DUMnXJtaLZv9fFrcL9zvs1h28aT1iQa?=
 =?us-ascii?Q?BB80wpqr8iLeeAKlkNkn8qwxGFNduYRI+GirOUjFEr+n3uXRxeVzEK6lUD/K?=
 =?us-ascii?Q?CfiEHk88MRfjaOxGB0qsvkEgZIJ0leOCQNINQZ5rJJZlPRslbQeeduAInbjS?=
 =?us-ascii?Q?M2ZuwHQYkRCAZl3Y0PFIQi7AOc++ek2rZ/HuYcTuJxlBm7lRFh859r8IP8XM?=
 =?us-ascii?Q?7npq8WSp0O2l8w5x8sevPrUljHyiq5cGAEay4stkAm4nRY1WGxoEvTn4eV94?=
 =?us-ascii?Q?Mkwefg=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: yyKnpD6vw6o2TJ7CJNt3zBCRILIrS03/N+5a4js9Epdg3zAYJjfXEO3yG2fBVZcewcUB/s0tClQyTmD3FTEX3a5WiCbNwQHug64lJT2KGLWcZG2LDkzrZl4W6fPJDJ6gY72ZVZsr95nZjkFILcTyJy7heEUTZl5xIOfiEFzVUuwFHPo1QCXiZd/1l1I0XmyXGQQxGItzdvmDwOwRxZ4ahlFVIHSnfPZn1uJuoJJ9QrisP/y5frY/WU99zN7dFYy9AbPuMl4GATfqaMyrc+VBqf+E6bmW2O9YcCFhSUMjYzz3m+Y4sfv4ZSKpITKdNikAkxVNjLNmD/4+sWU4ldRoouafwW2ZkyGVJfUSqdE5U+BodBN5azx9ITBEGnjHfqpwCF0+TA25dfP2p+TVO/7dos7CVfMpO1mvFuVIBo95UtW9/fOHs8DK1mijAZ+qpcmE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 17:12:27.4834 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 908dfcc4-2266-4ad5-258f-08de6fda0ed0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR12MB999069
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

Also add WRITE_DATA job start marker packet optionally. This can be used
to know job has started and make FWM packet negative testing timeout to be
shorter.

v2: keep all variable definition in begining of the function.  (Vitaly)
v3: keep struct amdgpu_ring_context small.  (Vitaly)

Signed-off-by: Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>
---
 lib/amdgpu/amd_PM4.h                |  6 +++++
 lib/amdgpu/amd_command_submission.c |  5 ++++
 lib/amdgpu/amd_ip_blocks.c          | 39 ++++++++++++++++++++++++++++-
 lib/amdgpu/amd_ip_blocks.h          | 10 ++++++++
 4 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/lib/amdgpu/amd_PM4.h b/lib/amdgpu/amd_PM4.h
index 8f59b4223..923826656 100644
--- a/lib/amdgpu/amd_PM4.h
+++ b/lib/amdgpu/amd_PM4.h
@@ -224,4 +224,10 @@
 #define	PACKET3_INCREMENT_CE_COUNTER		0x84
 #define	PACKET3_WAIT_ON_CE_COUNTER		0x86
 
+#define	PACKET3_FENCE_WAIT_MULTI		0xD1
+#define		FWM_ENGINE_SEL(x)		((x & 1) << 0)
+#define		FWM_PREEMPTABLE(x)		((x & 1) << 1)
+#define		FWM_CACHE_POLICY(x)		((x & 3) << 2)
+#define		FWM_POLL_INTERVAL(x)		((x & 0xFFFF) << 16)
+
 #endif
diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index 52327c69e..399171b44 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -10,6 +10,7 @@
 #include "lib/amdgpu/amd_sdma.h"
 #include "lib/amdgpu/amd_PM4.h"
 #include "lib/amdgpu/amd_command_submission.h"
+#include "lib/amdgpu/amdgpu_asic_addr.h"
 #include "ioctl_wrappers.h"
 
 
@@ -185,6 +186,10 @@ static void amdgpu_create_ip_queues(amdgpu_device_handle device,
 		ring_context[ring_id].pm4_size = pm4_dw;
 		ring_context[ring_id].res_cnt = 1;
 		ring_context[ring_id].user_queue = user_queue;
+		if (ip_block->funcs->family_id == FAMILY_GFX1150)
+			ring_context[ring_id].max_num_fences_fwm = 4;
+		else
+			ring_context[ring_id].max_num_fences_fwm = 32;
 		igt_assert(ring_context[ring_id].pm4);
 
 		/* Copy the previously queried HW IP info instead of querying again */
diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 12f92a1d5..78e2c91d0 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -634,6 +634,10 @@ user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_
 	unsigned int nop_count;
 	struct timespec ts;
 	uint64_t current_ns;
+	unsigned int i, j;
+	uint64_t va, value;
+	unsigned num_fences_in_iter;
+	struct amdgpu_userq_params *userq_params;
 
 	clock_gettime(CLOCK_MONOTONIC, &ts);
 	current_ns = (uint64_t)ts.tv_sec * NSEC_PER_SEC + ts.tv_nsec;
@@ -643,7 +647,7 @@ user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_
 		amdgpu_sdma_pkt_begin();
 		/* For SDMA, we need to align the IB to 8 DW boundary */
 		nop_count = (2 - lower_32_bits(*ring_context->wptr_cpu)) & 7;
-		for (unsigned int i = 0; i < nop_count; i++)
+		for (i = 0; i < nop_count; i++)
 			amdgpu_pkt_add_dw(SDMA_PKT_HEADER_OP(SDMA_NOP));
 		amdgpu_pkt_add_dw(SDMA_PKT_HEADER_OP(SDMA_OP_INDIRECT));
 		amdgpu_pkt_add_dw(lower_32_bits(mc_address) & 0xffffffe0); // 32-byte aligned
@@ -659,6 +663,39 @@ user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_
 		amdgpu_sdma_pkt_end();
 	} else {
 		amdgpu_pkt_begin();
+
+		if (ring_context->userq_params) {
+			userq_params = ring_context->userq_params;
+
+			if (userq_params->job_start_write_data_va_addr) {
+				amdgpu_pkt_add_dw(PACKET3(PACKET3_WRITE_DATA, 4));
+				amdgpu_pkt_add_dw(WRITE_DATA_DST_SEL(5) | WR_CONFIRM | WRITE_DATA_CACHE_POLICY(3));
+				va = userq_params->job_start_write_data_va_addr;
+				value = userq_params->job_start_write_data_val;
+				amdgpu_pkt_add_dw(lower_32_bits(va));
+				amdgpu_pkt_add_dw(upper_32_bits(va));
+				amdgpu_pkt_add_dw(lower_32_bits(value));
+				amdgpu_pkt_add_dw(upper_32_bits(value));
+			}
+
+			if (ring_context->userq_params->num_fences) {
+				for (i = 0; i < userq_params->num_fences; i = i + ring_context->max_num_fences_fwm) {
+					num_fences_in_iter = (i + ring_context->max_num_fences_fwm > userq_params->num_fences) ?
+							     userq_params->num_fences - i : ring_context->max_num_fences_fwm;
+					amdgpu_pkt_add_dw(PACKET3(PACKET3_FENCE_WAIT_MULTI, num_fences_in_iter * 4));
+					amdgpu_pkt_add_dw(FWM_ENGINE_SEL(1) | FWM_POLL_INTERVAL(4));
+					for (j = 0; j < num_fences_in_iter; j++) {
+						va = userq_params->fence_info[i + j].va;
+						value = userq_params->fence_info[i + j].value;
+						amdgpu_pkt_add_dw(lower_32_bits(va));
+						amdgpu_pkt_add_dw(upper_32_bits(va));
+						amdgpu_pkt_add_dw(lower_32_bits(value));
+						amdgpu_pkt_add_dw(upper_32_bits(value));
+					}
+				}
+			}
+		}
+
 		/* Prepare the Indirect IB to submit the IB to user queue */
 		amdgpu_pkt_add_dw(PACKET3(PACKET3_INDIRECT_BUFFER, 2));
 		amdgpu_pkt_add_dw(lower_32_bits(mc_address));
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 424b3210a..3c8db1caf 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -208,6 +208,14 @@ struct amdgpu_cs_err_codes {
 	int err_code_wait_for_fence;
 };
 
+/* aux struct to hold parameters for userqueue fence */
+struct amdgpu_userq_params {
+	uint64_t num_fences;
+	struct drm_amdgpu_userq_fence_info *fence_info;
+	uint64_t job_start_write_data_va_addr;
+	uint64_t job_start_write_data_val;
+};
+
 /* aux struct to hold misc parameters for convenience to maintain */
 struct amdgpu_ring_context {
 
@@ -279,6 +287,8 @@ struct amdgpu_ring_context {
 	bool user_queue;
 	uint64_t time_out;
 	enum uq_submission_mode submit_mode;
+	uint32_t max_num_fences_fwm;
+	struct amdgpu_userq_params *userq_params;
 
 	struct drm_amdgpu_info_uq_fw_areas info;
 };
-- 
2.43.0

