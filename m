Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86AFBE63F3D
	for <igt-dev@archiver.kernel.org>; Mon, 16 Feb 2026 09:45:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3532710E1C3;
	Mon, 16 Feb 2026 09:45:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sRY0bBSg";
	dkim-atps=neutral
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012045.outbound.protection.outlook.com [52.101.43.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 820DC10E10B
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Feb 2026 09:45:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jqgK/9V/+QB5IQ28aCiBk+sWtjWFWLPwRovrpuz/wL9GuFdVNL7Ug4833vkWDcN7bmnN2nsWIrvIPmO8HDEkemHfeJfPGcI2FcZPfPZYNKxBFM645Pwrcj7dI/0Ak+AQpGOfquRnjzdx07q3fjnYp7/VoujG8pJtXhoB4FhjtidBmEgm5BN1OMEIPqKdSsVKIXVCiR4ZpvEVhTteHYcVUA93XBm5uXeOBSMk6MCa7j0FexnEtj2inpxPQsbAQE17JxVC24onry5pKgh3LhDqb6UOr8Y/mO7u9G1CNfBhLenydX57U2PRt/2Z5Kxn5rc5d/B7YefETuuhnSYzZUEZUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rfo59VTnqnI3eErK4AieLdUjsdmRpzuWP8fWf4xXgT0=;
 b=WzfV260Re8o1D26rg1jtTJc+0qjzuK8q7dUn2vyO+/damMQDZCAI7YJA4owrsxPn+GGhbc0lzk82wl9BHGCbCTli1V16N8LJrfS09yA1C3Vl4l2/+sXrq/MVDNub6Vy9IxQutr+Ot3eHRy+R+qCXM0AvlPpu6ewCsE7WCROvAZA9d75LsHL/DJdkhy2jcWWVvVlLy9fitTUfgNCLFYd2lg+SyXt5GCvbXS4y5LQtXdKLxQqJwWb7Q+NRL/oopZ7AdquVxs7qpf8kToRWjuYT5lgQPe5tD+NQ69lHtppkoI5ncAiccUmr9MOdz5kVC2LiWJVnBFzYYZVp1CdIplnCkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rfo59VTnqnI3eErK4AieLdUjsdmRpzuWP8fWf4xXgT0=;
 b=sRY0bBSgSCugiUDkhr/PxK/gkrIeSzUzex/9o5UBqe1+5UNQzUum8ajk1hk6YpF2RxBkBAJCkv0UG23ewoMEhtSP4t6bkUYrNfwd2s0DE4QwXWTA7+dUNmWPbZAK26vEh60F7nP91FHZFu/h05gsJpC6gjllHyBMzQlLHVwF6ps=
Received: from BL1PR13CA0307.namprd13.prod.outlook.com (2603:10b6:208:2c1::12)
 by PH7PR12MB7330.namprd12.prod.outlook.com (2603:10b6:510:20d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 09:45:22 +0000
Received: from BL02EPF0001A0FC.namprd03.prod.outlook.com
 (2603:10b6:208:2c1:cafe::b4) by BL1PR13CA0307.outlook.office365.com
 (2603:10b6:208:2c1::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Mon,
 16 Feb 2026 09:45:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A0FC.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 16 Feb 2026 09:45:22 +0000
Received: from amd-X570.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 16 Feb
 2026 03:45:20 -0600
From: Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <vitaly.prosyak@amd.com>, Yogesh Mohan Marimuthu
 <yogesh.mohanmarimuthu@amd.com>
Subject: [PATCH i-g-t v2 1/2] lib/amdgpu: support FWM packet in user queue
Date: Mon, 16 Feb 2026 15:15:05 +0530
Message-ID: <20260216094506.36506-1-yogesh.mohanmarimuthu@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FC:EE_|PH7PR12MB7330:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f9efe55-cc34-4a01-3fb7-08de6d401a8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zC0xwBf41vi3zKEBm7amVREaU0hgqidQYWenxRhrvJgxow0y3H6IcVKBzYsw?=
 =?us-ascii?Q?gXcKXCL95IYF2TRQCRArSXVSm1E8nhTAJnu+YeM2D1QdKJgt05Yx9C4aDI+j?=
 =?us-ascii?Q?eeuAV43E/aweFSXfKa7vWb/TNzG95mn75FiOXlW9SdNUa7oKj9Oi3I6cwLm2?=
 =?us-ascii?Q?ai9YV61X+pwaUVddcBebvi1kHuEi7DgAAdwQrMGbLqIPTZO3qtFwYpKLWmIQ?=
 =?us-ascii?Q?etGMaLIAdVulJKmkZUiMK+QYXtYzx526t7lJnlOuHhexE+AzlW2jE7HgsZu2?=
 =?us-ascii?Q?rIWJyICMFlwqGitNKx4MGkTqU1sIyCrU/ba9ojZXfjnZXxLFBy876KGUZkT1?=
 =?us-ascii?Q?pB01ywnuPqyYEcDzhTcMO5aEPudJj5qsD03o6St2+HA22brkMoxx9sHBc8fc?=
 =?us-ascii?Q?VqVY0CE1B1sTmncFA3xAnbRSEo+AqC10svnMYNiVDwcukAPgKiP7IiITZhz7?=
 =?us-ascii?Q?hagQO+iSe3eFgsEYpjwErwijiep5aYeKr13+6gx2JtCav9LH5HnRLZc+fFHo?=
 =?us-ascii?Q?KgbsqiRJd5dR1NyMrUH4X0bxPoHbkkIHi5Gmumh6mQq1g9/iUZImNUwlLZWs?=
 =?us-ascii?Q?op6T+GvSlbnE+zxj5y4av9ltwe1itZZNA13T+7fqgliZ1hTq4WT4RSdLpF/q?=
 =?us-ascii?Q?V4vgc6FlA0fUf2z58y3hzqRxXtaWskbnKgGGib5PGa929n00zjApBBZo2DP0?=
 =?us-ascii?Q?g3+Ave53BLCW8CahXn3HZ0rGCxB98P9gkR8m2Kb3P+fmHgZfZOZwpJFWlmRC?=
 =?us-ascii?Q?eK4CcFCvt9sOCs3yMkZHl2B/u0i0k9SKodji46JoE2y7ZuiJ4s5cR4aiHSPi?=
 =?us-ascii?Q?BAeObVlFrwq7W9cF1/V9ZD82u/0RXTdom3RJQR+1jYqTkGiW0SSB3p0xk/fI?=
 =?us-ascii?Q?vsFgPlKGg20R0f1Uog6uQlFxzkbhVg/AyDt2os4UfcVf8keyFSwmIzlvpzFM?=
 =?us-ascii?Q?/RAHXhlNwf1B6/E2TfgD5T/udepDq10ytk4DNO6B9LvzJfTOL09Mocb+UpRW?=
 =?us-ascii?Q?wZ+hhmq2QzDj947Meg9WYyxX6BTHBRT+JvPO5fG2kvB1vdrBTGZMuQIOm1V5?=
 =?us-ascii?Q?Ang7zfRtrEe8KPoxFDmtKyuX7FIoU0MmhdHD6npqwknb+U5FuFnmDHjoRfO4?=
 =?us-ascii?Q?i2gc4udODgWqsbKyxPGzUwMzJNHi+hCQ0WhhAkRb8m+i28UQtaZeieGLgRi2?=
 =?us-ascii?Q?14sGQUNXPghra2nc/JNPkoSE9s1T4Rowl+/+39iGNhiI/Ggwu3QTvg/pulEL?=
 =?us-ascii?Q?EKe8kSFacqB7n0Q+4VPFpQXpmUAmtxYlb75yUQ8IlHoXNJippJv+Nmf8wpss?=
 =?us-ascii?Q?0w+rcpoXEGcvzI5hws8q4BqRT1PtrUpzgZNCX1MYXlecqH27KM6AKpTKX6ZM?=
 =?us-ascii?Q?OCuxiO/HvV5pqjfla75u5O5eMsgdo1G8a0SOGzjEvDOKn5s6AFfkdfLnhQIk?=
 =?us-ascii?Q?K+kgaAJbsgq9CNuOTWY6Nmezv0TFpB8k1p/J3VuaFr8MGPKeWPXdNSXKssxB?=
 =?us-ascii?Q?DEym/Imr4LC6GSdxhX4HzDstyLhjXwXSMe9j4G4tIqLUHEKhIUBWxbM4i5b+?=
 =?us-ascii?Q?IvsiKCXcVRksmxyKpVwfNA1S146zxytWYNiFJaJ5jGTYBh8U7Kz8cwnmzgQ6?=
 =?us-ascii?Q?1dEpov02BP6OWSQyKSuMX0TUgjEKsXHSAXTb0AsAdI85?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: rJTh6yj2J20PYpGV2Jz/LLTkrRuUGLMYGlEeRMq+5lS7naIBzszrjLY6ms5prG2eWGb0ba7/FT4r8GIQvvFz3LhDxA/3dQD+Qgd8QPxHt7QPVzpcK2ojdpFXy+VzGPIzN448MMn4KMdSYwI84+2Sk1MECdHvbngxO2MR9O1RwbBYsqUDiyEAvlMoflLgGVT/TmVHRbJxFL6BU49ennNqaNbL4KKjNGGE86LSxHWde8KAG2iQFHiMBwWusr6wsCNw+XBlMB6jwQ8p9iWabpCK6EULsW9tpSzfWPaF8twFMcgEdDOG3VBsXONDsLua7MOyX07qOU7kidDCCW9mjQieJuax6jfJEmRkpWFV0sDeoTvZyynHMlRdldEQwuMu6xKT0W8SlpuTRPK2fwYmsdFmgK+VPrOjR72oXq/4X0hOHyvh/GvNvBffTt/K/WpJia9R
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 09:45:22.3488 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f9efe55-cc34-4a01-3fb7-08de6d401a8d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7330
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

Signed-off-by: Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>
---
 lib/amdgpu/amd_PM4.h                |  6 +++++
 lib/amdgpu/amd_command_submission.c |  5 +++++
 lib/amdgpu/amd_ip_blocks.c          | 34 ++++++++++++++++++++++++++++-
 lib/amdgpu/amd_ip_blocks.h          |  5 +++++
 4 files changed, 49 insertions(+), 1 deletion(-)

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
index 12f92a1d5..354847a1b 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -634,6 +634,9 @@ user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_
 	unsigned int nop_count;
 	struct timespec ts;
 	uint64_t current_ns;
+	unsigned int i, j;
+	uint64_t va, value;
+	unsigned num_fences_in_iter;
 
 	clock_gettime(CLOCK_MONOTONIC, &ts);
 	current_ns = (uint64_t)ts.tv_sec * NSEC_PER_SEC + ts.tv_nsec;
@@ -643,7 +646,7 @@ user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_
 		amdgpu_sdma_pkt_begin();
 		/* For SDMA, we need to align the IB to 8 DW boundary */
 		nop_count = (2 - lower_32_bits(*ring_context->wptr_cpu)) & 7;
-		for (unsigned int i = 0; i < nop_count; i++)
+		for (i = 0; i < nop_count; i++)
 			amdgpu_pkt_add_dw(SDMA_PKT_HEADER_OP(SDMA_NOP));
 		amdgpu_pkt_add_dw(SDMA_PKT_HEADER_OP(SDMA_OP_INDIRECT));
 		amdgpu_pkt_add_dw(lower_32_bits(mc_address) & 0xffffffe0); // 32-byte aligned
@@ -659,6 +662,35 @@ user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_
 		amdgpu_sdma_pkt_end();
 	} else {
 		amdgpu_pkt_begin();
+
+		if (ring_context->job_start_write_data_va_addr) {
+			amdgpu_pkt_add_dw(PACKET3(PACKET3_WRITE_DATA, 4));
+			amdgpu_pkt_add_dw(WRITE_DATA_DST_SEL(5) | WR_CONFIRM | WRITE_DATA_CACHE_POLICY(3));
+			va = ring_context->job_start_write_data_va_addr;
+			value = ring_context->job_start_write_data_val;
+			amdgpu_pkt_add_dw(lower_32_bits(va));
+			amdgpu_pkt_add_dw(upper_32_bits(va));
+			amdgpu_pkt_add_dw(lower_32_bits(value));
+			amdgpu_pkt_add_dw(upper_32_bits(value));
+		}
+
+		if (ring_context->num_fences) {
+			for (i = 0; i < ring_context->num_fences; i = i + ring_context->max_num_fences_fwm) {
+				num_fences_in_iter = (i + ring_context->max_num_fences_fwm > ring_context->num_fences) ?
+					ring_context->num_fences - i : ring_context->max_num_fences_fwm;
+				amdgpu_pkt_add_dw(PACKET3(PACKET3_FENCE_WAIT_MULTI, num_fences_in_iter * 4));
+				amdgpu_pkt_add_dw(FWM_ENGINE_SEL(1) | FWM_POLL_INTERVAL(4));
+				for (j = 0; j < num_fences_in_iter; j++) {
+					va = ring_context->fence_info[i + j].va;
+					value = ring_context->fence_info[i + j].value;
+					amdgpu_pkt_add_dw(lower_32_bits(va));
+					amdgpu_pkt_add_dw(upper_32_bits(va));
+					amdgpu_pkt_add_dw(lower_32_bits(value));
+					amdgpu_pkt_add_dw(upper_32_bits(value));
+				}
+			}
+		}
+
 		/* Prepare the Indirect IB to submit the IB to user queue */
 		amdgpu_pkt_add_dw(PACKET3(PACKET3_INDIRECT_BUFFER, 2));
 		amdgpu_pkt_add_dw(lower_32_bits(mc_address));
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 424b3210a..17f94fd5b 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -279,6 +279,11 @@ struct amdgpu_ring_context {
 	bool user_queue;
 	uint64_t time_out;
 	enum uq_submission_mode submit_mode;
+	uint32_t max_num_fences_fwm;
+	uint64_t num_fences;
+	struct drm_amdgpu_userq_fence_info *fence_info;
+	uint64_t job_start_write_data_va_addr;
+	uint64_t job_start_write_data_val;
 
 	struct drm_amdgpu_info_uq_fw_areas info;
 };
-- 
2.43.0

