Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C58C79F8C
	for <igt-dev@archiver.kernel.org>; Wed,  9 Sep 2026 10:48:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 209BD10E543;
	Wed,  9 Sep 2026 10:48:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="oytWLAdF";
	dkim-atps=neutral
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012034.outbound.protection.outlook.com [52.101.48.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29B7210E169
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Sep 2026 10:46:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=It8eZrGtIHCWREXXUpvuEhd3VWxnAEBNfEGnvy+O+hl/Iaw5oDIonDWoF1AOKc7orX53XvMj6YKA7645lEkdjwVgVobE/ISOJ7RkoyXWg0XEgnIYDb9jE3hsQxDPyR4mMhivYu8Wo12MtX4hpqa5bqL7gPTAh9JgTpHAVO6wPyNoEryUEe14IxvikBFdF26CZaUY5lU1EtNa/Gk7bsuznVzoB1D/bqkpqV4u1S7sY/dNsHDgZLWHvkKj0hTFdjWD7/uOxQuRz91zO1p8KI7y8FOtz2P3JsoWLVu5hEC0GBF760kiUJv+pYN4R0MAcRizIoHhSG07cYERB6KKF5JatA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IbNtl08/bvpLYQhPFkroeDK+YqQmDk6PQPGeVAdmF3E=;
 b=ibWXRvTJCSxIDqAGOwZgCkHwx4k8ByysFXoeORW16yOzXd9i6ycqTjPS3YxFpXe8DMARbcsoPMBnih8/wZSY4c8BXULWdQYpbnXsb7O0KuFEgivY4yYNntQKhe4PIoVY4YkXj79S8iy766f6SvXLij25g+wnzHA5bZ38RCyPK9LKGLKD+89KOWtczt6vd2KNDN0TwR72gKGYOtU8cXwhpREYwjwcZl/ywxDfpKKIC2jZcDuXXOxun9tFR97svHMHh3b2Gd4zeUQcQO0imTtlvqgRJNtfyZeGp1IDvM2/mqbGcn0C+pK6RrwfLmLWt20nOb80a5VLEXFQIbjaWXGvZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IbNtl08/bvpLYQhPFkroeDK+YqQmDk6PQPGeVAdmF3E=;
 b=oytWLAdFiv/ypo2un6A5Pao5YL1r10lLQFd5f0VkxZNtaSSiT3HosgziHQh49SBkuRcd/0m9AeMFzePKnD/SKTWubNj6ngeo4Gq/GAbElS5ICZWvRGTx33ttw1dUQCplZVcRqnJNEFMlzVjqffsP4PmVuHTcUe5qxiJCLGLwzjU=
Received: from BY5PR03CA0013.namprd03.prod.outlook.com (2603:10b6:a03:1e0::23)
 by SA0PR12MB7464.namprd12.prod.outlook.com (2603:10b6:806:24b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 10:46:18 +0000
Received: from SJ5PEPF000001EA.namprd05.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::11) by BY5PR03CA0013.outlook.office365.com
 (2603:10b6:a03:1e0::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Wed, 9
 Sep 2026 10:46:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF000001EA.mail.protection.outlook.com (10.167.242.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Wed, 9 Sep 2026 10:46:17 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 9 Sep
 2026 05:46:17 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 9 Sep
 2026 05:46:16 -0500
Received: from junhua-PC.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Wed, 9 Sep 2026 05:46:15 -0500
From: Junhua Shen <Junhua.Shen@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Jesse Zhang
 <Jesse.Zhang@amd.com>, Sunil Khatri <sunil.khatri@amd.com>, Honglei Huang
 <honglei1.huang@amd.com>, Huang Rui <ray.huang@amd.com>, Yiru Ma
 <yiru.ma@amd.com>, Junhua Shen <Junhua.Shen@amd.com>
Subject: [PATCH i-g-t v2 3/6] lib/amdgpu: source packet operands from params
 and size the IB from pm4_size
Date: Wed, 9 Sep 2026 18:45:59 +0800
Message-ID: <20260909104602.13807-4-Junhua.Shen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260909104602.13807-1-Junhua.Shen@amd.com>
References: <20260909104602.13807-1-Junhua.Shen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EA:EE_|SA0PR12MB7464:EE_
X-MS-Office365-Filtering-Correlation-Id: c3e42517-d7e8-4f36-3840-08df0e5f942f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|22082099003|18002099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: rjvK6108CauQPlpAl14Gm66hh9s4AAp/WbLt+XsV6vGuFifWaq7djDb4Ef2Ea6mJHItOENeJjTiOfuv7vmwUVGZ5NTTZtBv27UqLbcfk8XSgeFu/XcggLwou1f+iGLZb8S2L7DsRRFCT7/a++Jtwdw0Zv8oMmQQNIwyNHgDDqqujuk5syO/Mq8cAw7s6Y5FCOXbUSojSjfLcbsF92vvPUjlbnnXNBKSCWAu+sQf2OTjeUe9Gblv2QEmXtcuizdSRDnKkkiv0Q/2OZuWlemHZ8evAJ+OoWEAQ0veDKfGlrBn7kjYpVoRfyyu2ui4mbWiM2c2R31LBpL6UUqhs2dvFV8izCb0sKELEMoMw68SARFViNFsEAut2q6fJLlfSJEu9ZMJMc0ZRHBQsPdAa/n6fmtKrKZKpyziDVf+qj6k49gNlmrcN2HmkR/8VkRWmAz5Rqvr60oDq6aS4xoDuqz05mVMJWptCOOfA2GVo+alKVM3dSOjPRjV5YPp9XJha2K80JVwxJX9+SqF1WvU5qYL+tnCQHB4/x6vc0sfWDoAJLh5Ie8wFQ//CdVmvbB2Fc313OwbqWCezD4dQDL1J8HdRMcH/bcpi6ToA4xrqMIyQSaWtdbCOCs+rs4fzZYOjHowsXiJkaXTGwqLBZ9F227W3WlZ8XSwEytw6XocpG56ZSjWBe9QpYD6vF0WSpkLQx4521YN9lOA1dfM2NbA3N8X2MQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: CvO3/AvegYhh30g7TpPYe4RWkoZIg1Ult5XiHRsfyIuSx+ug6XYdgh/2W3x3qzSJXNLbIp9j+1s0pT4qDwLqvwcQAsuZSxiuxYQ00JZbOeZgaJ0KNDA/CYXHaCcwg8Esz8Q4QvropBdkLE4Yjz/SQEgIJ1/x4PnvyGBgjEktlFIDJS5z7xN4EY+ZYvPHoZ1YnY02wMuPX8o3NbkaFrDDPdUdm1FuuAteeChYxd/5DrHl3tLPwRUVZj8fmHwWWRIPrAJK54UTDLr+RDPFJzLygysKpaRRKCBdavWCzYHQMafMTRQgiOdKA6MbTBBQyHGyUeLUMAKPccMT3prBHewrp6JoFOD+zQLnsy+Yrz1lrLCe0JnajJRMOnDhYzFnyzXBUHjMxIuvisgTqzTOhLM6GcR50o/POm54DkKCB1H8imVCwGOz31339Tv3+hLxc7W2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 10:46:17.9432 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3e42517-d7e8-4f36-3840-08df0e5f942f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7464
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

- Size the legacy IB from pm4_size: the IB carries the PM4 command
  stream, so its byte size derives from pm4_size, not from write_length
  (the data transfer size). amdgpu_test_exec_cs_helper() now computes
  ib_size from pm4_size.
- WRITE_LINEAR/WRITE_ATOMIC/COPY_LINEAR take their operand GPU VAs
  (src/dst) from cmd_packet_params_t, so callers pass virtual addresses
  directly instead of relying on context-internal BOs.

Signed-off-by: Junhua Shen <Junhua.Shen@amd.com>
---
 lib/amdgpu/amd_command_submission.c | 46 +++++++++++++++++++----------
 1 file changed, 30 insertions(+), 16 deletions(-)

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index d5837e0f1..6d55bd107 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -46,13 +46,15 @@ int amdgpu_test_exec_cs_helper(amdgpu_device_handle device, unsigned int ip_type
 	bool user_queue = ring_context->user_queue;
 	const struct amdgpu_ip_block_version *ip_block = NULL;
 	amdgpu_bo_handle *all_res;
+	uint64_t ib_size;
 
 	ip_block = get_ip_block(device, ip_type);
 	all_res = alloca(sizeof(ring_context->resources[0]) * (ring_context->res_cnt + 1));
+	ib_size = (uint64_t)ring_context->pm4_size * sizeof(*ring_context->pm4);
 
 	if (expect_failure) {
 		/* allocate IB */
-		r = amdgpu_bo_alloc_and_map_sync(device, ring_context->write_length, 4096,
+		r = amdgpu_bo_alloc_and_map_sync(device, ib_size, 4096,
 						 AMDGPU_GEM_DOMAIN_GTT, 0, AMDGPU_VM_MTYPE_UC,
 						 &ib_result_handle, &ib_result_cpu,
 						 &ib_result_mc_address, &va_handle,
@@ -62,7 +64,7 @@ int amdgpu_test_exec_cs_helper(amdgpu_device_handle device, unsigned int ip_type
 		/* prepare CS */
 		igt_assert(ring_context->pm4_dw <= 1024);
 		/* allocate IB */
-		r = amdgpu_bo_alloc_and_map_sync(device, ring_context->write_length, 4096,
+		r = amdgpu_bo_alloc_and_map_sync(device, ib_size, 4096,
 						 AMDGPU_GEM_DOMAIN_GTT, 0, AMDGPU_VM_MTYPE_UC,
 						 &ib_result_handle, &ib_result_cpu,
 						 &ib_result_mc_address, &va_handle,
@@ -1225,8 +1227,11 @@ int cmd_place_packet(cmd_context_t *ctx, const cmd_packet_params_t *params)
 		if (!ctx->ip_block->funcs->write_linear)
 			return -ENOTSUP;
 
-		/* TODO: allow user set the dst and data */
-		//ctx->ring_ctx->bo_mc = params->dst_addr;
+		/* Destination operand comes from the caller. */
+		if (params->dst_addr)
+			ctx->ring_ctx->bo_mc = params->dst_addr;
+		igt_assert_f(ctx->ring_ctx->bo_mc,
+			     "WRITE_LINEAR requires a destination address\n");
 		ctx->ring_ctx->write_length = params->size;
 
 		/* Build PM4 packet */
@@ -1239,8 +1244,11 @@ int cmd_place_packet(cmd_context_t *ctx, const cmd_packet_params_t *params)
 		if (!ctx->ip_block->funcs->write_linear_atomic)
 			return -ENOTSUP;
 
-		/* TODO: allow user set the dst and data */
-		//ctx->ring_ctx->bo_mc = params->dst_addr;
+		/* Destination operand comes from the caller. */
+		if (params->dst_addr)
+			ctx->ring_ctx->bo_mc = params->dst_addr;
+		igt_assert_f(ctx->ring_ctx->bo_mc,
+			     "WRITE_ATOMIC requires a destination address\n");
 		ctx->ring_ctx->write_length = 1; /* Atomic operations typically work on single DWORD */
 
 		result = ctx->ip_block->funcs->write_linear_atomic(ctx->ip_block->funcs,
@@ -1249,18 +1257,24 @@ int cmd_place_packet(cmd_context_t *ctx, const cmd_packet_params_t *params)
 		return result;
 
 	case CMD_PACKET_COPY_LINEAR:
-	    if (!ctx->ip_block->funcs->copy_linear)
-		    return -ENOTSUP;
+		if (!ctx->ip_block->funcs->copy_linear)
+			return -ENOTSUP;
 
-	    /* For copy operations, we need both source and destination addresses */
-	    /* This would require extending the API to pass both addresses */
-	    /* For now, use the internal buffer as source */
-	    ctx->ring_ctx->write_length = params->size;
+		/* Copy takes both operands from the caller: bo_mc = source VA,
+		 * bo_mc2 = destination VA.
+		 */
+		if (params->src_addr)
+			ctx->ring_ctx->bo_mc = params->src_addr;
+		if (params->dst_addr)
+			ctx->ring_ctx->bo_mc2 = params->dst_addr;
+		igt_assert_f(ctx->ring_ctx->bo_mc && ctx->ring_ctx->bo_mc2,
+			     "COPY_LINEAR requires source and destination addresses\n");
+		ctx->ring_ctx->write_length = params->size;
 
-	    result = ctx->ip_block->funcs->copy_linear(ctx->ip_block->funcs,
-						      ctx->ring_ctx,
-						      &ctx->ring_ctx->pm4_dw);
-	    return result;
+		result = ctx->ip_block->funcs->copy_linear(ctx->ip_block->funcs,
+						   ctx->ring_ctx,
+						   &ctx->ring_ctx->pm4_dw);
+		return result;
 
 	case CMD_PACKET_COPY_ATOMIC:
 		/* TODO: Implement atomic copy if supported */
-- 
2.34.1

