Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D859CC5479A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 09:45:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F9E10E083;
	Wed, 28 Aug 2024 09:45:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bNtDPF8E";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8A4410E083
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 09:45:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iWLk6dLw7BoDTH0+Y98RKptfJ/sC6p1J3QyoGUWeSDRii/XECaylTVEa/KWePB+GbXJqXW1gyqeFqeN+a5iFGwes15cfpfZBVxsaW+uGp8pCzKyywPy651EyxU4nxZytCw2A/8Gl7Tv3L7P53QaPPF6hI9iu5MbIDkcaSFFS2AfDklmjzG4OWBaIXHGb5NXcAxj/i22mVcOYbY4GnXHzEKnh14byRnCfXObrIKR4p3Hrwhg8yGrcozXxXZMWwF3THnfw9wkIfZfdyim5QNWwpB/LFzffFj6s5JFYAHICfeQSjqvVuVzJsyRm7DS6wzfYk0c9zHI3zqRZxV30u20cnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QbcyYgZEofP4e7t1jZ9q6c2xRrPijVWLg3cWhE76PQ8=;
 b=vj25j8UiQK/q07N4U5ilpoXdqmfcxXPxOIty0jNOzfkKt8TpKwZXTnFlJN2l5EFz6VqdI4+8P9ZNXRYKVYxfQCSxLu0yeaRuSWBV5BUSrAPk52GDq1THvvzsB6Y/eEwhVt47I1HQ684+IPb2YKa1gxDQ0goMX8AWk0Nbc/fq1FlLOJVp8CBDZHzxMVfoSDH/KDeSpzZWyCRjB6Ly8TY7lbKYl+ZC9Ou/oqGQRPhbIJTwaEljo8K0B7QiJcJw5Tzf/PfvNlYvBgh9cBKOailZ+ug2a0e+DFRWO0rKb5pXrzzjZmS20bNyqfK6LaF3PA0JLjy1gq0gU7p8EWzUW3f58w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QbcyYgZEofP4e7t1jZ9q6c2xRrPijVWLg3cWhE76PQ8=;
 b=bNtDPF8ErU5zwFwxLMPoWzUihmGLwsLhfER8qanJyl9XiGDCw0rIZdUVOp8CrAS0lgjhIGt8r4+Uiamg3rO/ziQ9ovDqCoJWq50rsx5qxJ1VNlkkzoCyPBjiUtawHgK0wNB5L2X8tgNZU1xqz2OYTl4zPb1pdEXz+fHKF8bxLvQ=
Received: from SA1P222CA0074.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2c1::20)
 by CH3PR12MB9395.namprd12.prod.outlook.com (2603:10b6:610:1ce::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Wed, 28 Aug
 2024 09:45:54 +0000
Received: from SA2PEPF00003AE7.namprd02.prod.outlook.com
 (2603:10b6:806:2c1:cafe::24) by SA1P222CA0074.outlook.office365.com
 (2603:10b6:806:2c1::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28 via Frontend
 Transport; Wed, 28 Aug 2024 09:45:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AE7.mail.protection.outlook.com (10.167.248.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 28 Aug 2024 09:45:53 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 28 Aug
 2024 04:45:52 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 28 Aug
 2024 04:45:52 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 28 Aug 2024 04:45:50 -0500
From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
Subject: [PATCH 1/2 V2 i-g-t] lib/amdgpu: Enhanced SDMA negative test interface
Date: Wed, 28 Aug 2024 17:45:49 +0800
Message-ID: <20240828094549.150449-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE7:EE_|CH3PR12MB9395:EE_
X-MS-Office365-Filtering-Correlation-Id: e24200bb-e206-44ba-3670-08dcc746359b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XLMBeCLzE3jNk1mjxJgX/235ZpwlFiDkmVJ8SXAW+8f/JXZyHUdBzF4JpAj3?=
 =?us-ascii?Q?lbpqypsQm8dUw7CtROX2t8epWoeLfu1d7mS8iTbhmrNvvoPKtvluMptKhokn?=
 =?us-ascii?Q?06B1h5HzyQX1mKQQvZ5P3zP6zVqU82cqT0M/w8iIE8LB4yq0qrUqh4OLgr93?=
 =?us-ascii?Q?0lqmwTtL/hYwjyCiMQPRb00kI3CTJwZWnZjUQdd32QfK9EUQyZuKNwWm5dXR?=
 =?us-ascii?Q?7ilGKft2+86emLTGOZQrbxgNYOaR/rUlP9lBnShbVsLkeVBmul3jdcYcgkWH?=
 =?us-ascii?Q?IEhFj12UIRS3ghCTYpkwtTDH95eYApm+/LnhNi3KvUUaWj7hS31G/jEy4vu1?=
 =?us-ascii?Q?4NlSBYSBOMSoJQEJJ5gFfuiyvVgcADxFx6EqVa84vA7TIQV4wc7NpcGe1nPK?=
 =?us-ascii?Q?tKyccMUGTFJyCADyHsgyFq/YctAdXgMVEzq2Cx7cjZqfrBIAli3j+9KWKE8u?=
 =?us-ascii?Q?mCDkB+LLH+k/BXwB4qUmrJ16xShrRDbve31PTwluQE2pEHQvP57ZlmdjC7TE?=
 =?us-ascii?Q?7jvAvhMtlmPYSlpHEuL1w5M+d/gBQo9aK2uDsXUKWDtbHprR+NatGRvqSI8b?=
 =?us-ascii?Q?OUOvQt+7EF5l8/ZoWMPfTZgn0J1xvaZsLruFncHccN0ZvNi3478QhrT6vNRI?=
 =?us-ascii?Q?6+8qFqMUg4GTD9fP2h/oECRezhMHSlFMlTGIvyBnVT3MLnmMnlU/5xuSZS1z?=
 =?us-ascii?Q?lFOkIO97gZiPeB5l/EPT0uH3Ph2mBxFxSy/sYTMTW9oUW+EUcH9zvo3UJhUV?=
 =?us-ascii?Q?8eM38OA5cCQGB7um8H82wAL6LiTg/bGcEI1tVdqX5HAaD1F1CEDXcqTy91pY?=
 =?us-ascii?Q?uvm51+LZ+nxuwwv/7wm1iCkbBIjOn85QVqooNr+iWRuHqbgFsNnezyu4Q+q9?=
 =?us-ascii?Q?zFLz4LfIIJV7Ygnh6iU1bU2LmENuwQ/2IsN3Zavbal+OO/1mlmcM3oBMC5Vw?=
 =?us-ascii?Q?hAxkClqKE7S0kRLj7drSv0znZkX5Dhhgt4TZjaj8zMhrlS0s1D6bxbqbiIOZ?=
 =?us-ascii?Q?ywyvBsCf8NsvzgN7/RjYUIK3b+abAm4F+y42s6+F1nwGX6GLQNAhLrFul06d?=
 =?us-ascii?Q?lCcj1qOMxmE46Ec/Hjmm99UHKyHW6Plxx1JT0O1ieI7T7uAa1QDm2t4dWI60?=
 =?us-ascii?Q?OrpBbKSXjiYec3ZQjnEPiXHjmw1ub6lrqn49TLDC2CqUo5gJPD30X8cI3Dhc?=
 =?us-ascii?Q?9hrTJgyP73Xdk23+TCe9+ymT7iEvauENXRfMAnOREtwg1PrkW5JCLtJ0AwIb?=
 =?us-ascii?Q?tOxhd2z3zY65Q8rvxLOoPGDo6XrF2CT+jAE410fqqjW6TrEINxYvzHEipKba?=
 =?us-ascii?Q?Z3p0ThKX/Pox/Z1i2JwyjlD1Hyi7mfmhD9k8I6xVpV5LmVg6OABx69BeyGU+?=
 =?us-ascii?Q?onrlURpkbFTPh0unOW/0vp91KFAEaXUjDucX344A7k3zAx71x6QkY1ghG9t6?=
 =?us-ascii?Q?cl4BnrOS6p/WuoEoAUkkQAV3o5VIrnmM?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 09:45:53.9989 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e24200bb-e206-44ba-3670-08dcc746359b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9395
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

To enhance the reset function, several invalid sdma writes are added.
1. Assembling invalid operation code.
2. Writing invalid memory address.
3. Writing illegal register.
4. Sending invalid packet length.

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 lib/amdgpu/amd_deadlock_helpers.h |  5 ---
 lib/amdgpu/amd_ip_blocks.c        | 51 +++++++++++++++++++++++++++++++
 lib/amdgpu/amd_ip_blocks.h        |  5 ++-
 3 files changed, 55 insertions(+), 6 deletions(-)

diff --git a/lib/amdgpu/amd_deadlock_helpers.h b/lib/amdgpu/amd_deadlock_helpers.h
index e36227950..165ffb98d 100644
--- a/lib/amdgpu/amd_deadlock_helpers.h
+++ b/lib/amdgpu/amd_deadlock_helpers.h
@@ -24,11 +24,6 @@
 #ifndef __AMD_DEADLOCK_HELPERS_H__
 #define __AMD_DEADLOCK_HELPERS_H__
 
-enum  hang_type {
-	DMA_CORRUPTED_HEADER_HANG,
-	DMA_SLOW_LINEARCOPY_HANG
-};
-
 void
 amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int ip_type);
 
diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 175c84cf9..a486347ac 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -57,6 +57,56 @@ sdma_ring_write_linear(const struct amdgpu_ip_funcs *func,
 	return 0;
 }
 
+static int
+sdma_ring_bad_write_linear(const struct amdgpu_ip_funcs *func,
+		       const struct amdgpu_ring_context *ring_context,
+		       uint32_t *pm4_dw, unsigned int cmd_error)
+{
+	uint32_t i, j, stream_length;
+	uint32_t opcode;
+
+	i = 0;
+	j = 0;
+
+	if (cmd_error == CMD_STREAM_EXEC_INVALID_PACKET_LENGTH)
+		stream_length = ring_context->write_length / 16;
+	else
+		stream_length = ring_context->write_length;
+
+	if (cmd_error == CMD_STREAM_EXEC_INVALID_OPCODE)
+		opcode = 0xf2;
+	else
+		opcode = SDMA_OPCODE_WRITE;
+
+	if (func->family_id == AMDGPU_FAMILY_SI)
+		ring_context->pm4[i++] = SDMA_PACKET_SI(opcode, 0, 0, 0,
+					 ring_context->write_length);
+	else
+		ring_context->pm4[i++] = SDMA_PACKET(opcode,
+					 SDMA_WRITE_SUB_OPCODE_LINEAR,
+					 ring_context->secure ? SDMA_ATOMIC_TMZ(1) : 0);
+	if (cmd_error == CMD_STREAM_TRANS_BAD_MEM_ADDRESS) {
+		ring_context->pm4[i++] = lower_32_bits(0xdeadbee0);
+		ring_context->pm4[i++] = upper_32_bits(0xdeadbee0);
+	}else if (cmd_error == CMD_STREAM_TRANS_BAD_REG_ADDRESS) {
+		ring_context->pm4[i++] = lower_32_bits(mmVM_CONTEXT0_PAGE_TABLE_BASE_ADDR);
+		ring_context->pm4[i++] = upper_32_bits(mmVM_CONTEXT0_PAGE_TABLE_BASE_ADDR);
+	} else {
+		ring_context->pm4[i++] = lower_32_bits(ring_context->bo_mc);
+		ring_context->pm4[i++] = upper_32_bits(ring_context->bo_mc);
+	}
+	if (func->family_id >= AMDGPU_FAMILY_AI)
+		ring_context->pm4[i++] = ring_context->write_length - 1;
+	else
+		ring_context->pm4[i++] = ring_context->write_length;
+
+	while (j++ < stream_length)
+		ring_context->pm4[i++] = func->deadbeaf;
+	*pm4_dw = i;
+
+	return 0;
+}
+
 static int
 sdma_ring_atomic(const struct amdgpu_ip_funcs *func,
 		       const struct amdgpu_ring_context *ring_context,
@@ -429,6 +479,7 @@ static struct amdgpu_ip_funcs sdma_v3_x_ip_funcs = {
 	.deadbeaf = 0xdeadbeaf,
 	.pattern = 0xaaaaaaaa,
 	.write_linear = sdma_ring_write_linear,
+	.bad_write_linear = sdma_ring_bad_write_linear,
 	.write_linear_atomic = sdma_ring_atomic,
 	.const_fill = sdma_ring_const_fill,
 	.copy_linear = sdma_ring_copy_linear,
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 86b82c40c..3e729f4c0 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -42,7 +42,10 @@ enum  cmd_error_type {
 	BACKEND_SE_GC_SHADER_INVALID_SHADER,
 	BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR,    /* COMPUTE_PGM */
 	BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING, /* COMPUTE_PGM_RSRC */
-	BACKEND_SE_GC_SHADER_INVALID_USER_DATA /* COMPUTE_USER_DATA */
+	BACKEND_SE_GC_SHADER_INVALID_USER_DATA, /* COMPUTE_USER_DATA */
+
+	DMA_CORRUPTED_HEADER_HANG,
+	DMA_SLOW_LINEARCOPY_HANG
 };
 
 #define _MAX_NUM_ASIC_ID_EXCLUDE_FILTER 3
-- 
2.25.1

