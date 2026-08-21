Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0204BC5DF81
	for <igt-dev@archiver.kernel.org>; Mon, 24 Aug 2026 08:20:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A569410E53F;
	Mon, 24 Aug 2026 08:20:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="J05MosfI";
	dkim-atps=neutral
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011027.outbound.protection.outlook.com
 [40.93.194.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0025D10E9EE
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Aug 2026 12:42:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k+WfLuLhh5SqZsGg6Q7U9WxiUBmK6cMLgS15qBnWgxXqUYAv9Ko+wxS8H2xt33koIvXv9U1bJHNrNPezEz6yA7T5xh7ZSkWtCNE2fVd4aQcqe6qTFy+w7mcX4vxALcM7uQijt3BR+nR+seohex2xI3boO9iGIExGhi5gmMgMFXoL+lMyHchXSuo11mzgfBqzLbozLirfYLrL4y+1u+r+1ltdok5+G9QBEjYNIJvPeM6a9jJl5Pzhwb97RVZ0xEBEyEJT2XHZ8z64Tsw435wSDP9NU5RaFOgw5gUtNXDbG3q9SeZfI8zGWpt0vkHkw4/uJT7ducQhRK0quTghROynCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X9HVVSRSrYQq+3StfCngHojPBGEoCEuj/yoN2jTNotI=;
 b=P7Hw9jeIl274bqLJ7/fyr+WYtPUSvnCWlKZ6z0ESbopKZyg3zkkSC31p8vWa/1eo1+7AmiBg/0le01MdVIQLZtvH21XapwJEs0aamaNdwkDvetAKImONmKr+DDmtmrdP2u990h8xLX3q/uRKYrADx6Qte3EHeu5/c28f4UI/ritCgjyLuWMZQ++o7bWtzoOB+OW45oj97rUj90+sEwrJouN7Nf/QuSjajmHuSwkC+7no5MRHTxcv+qh7m+v7GIo65N+T0teERqkqYyH0kC4rHN2TvUyX6MsB1h7+phpK9DQvqj3AY5WSpvGGJ+qJkgFiCnLMV1FKCSCU0mtDkD5N2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X9HVVSRSrYQq+3StfCngHojPBGEoCEuj/yoN2jTNotI=;
 b=J05MosfIUthq4TXqsqt8luVArw9KsFMpqvbpa6TUmqxdY1100W+49VTW/mJpTHMDeyTGazoIjPvRzFkAgh5kZMaHZxCM060qlzcEuvgP0Hs5OxfZBV4LnCUetWCS6BHVsJALZW68AgL98bB3wFmGG57dSHqQgzLO/3MIZzkGlQA=
Received: from BN9PR03CA0494.namprd03.prod.outlook.com (2603:10b6:408:130::19)
 by DS7PR12MB5911.namprd12.prod.outlook.com (2603:10b6:8:7c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 12:42:06 +0000
Received: from BL6PEPF0001AB4B.namprd04.prod.outlook.com
 (2603:10b6:408:130:cafe::6b) by BN9PR03CA0494.outlook.office365.com
 (2603:10b6:408:130::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 12:42:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB4B.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Fri, 21 Aug 2026 12:42:05 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 21 Aug
 2026 07:42:01 -0500
Received: from junhua-PC.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Fri, 21 Aug 2026 07:42:00 -0500
From: Junhua Shen <Junhua.Shen@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Jesse Zhang
 <Jesse.Zhang@amd.com>, Sunil Khatri <sunil.khatri@amd.com>, Honglei Huang
 <honglei1.huang@amd.com>, Huang Rui <ray.huang@amd.com>, Yiru Ma
 <yiru.ma@amd.com>, Junhua Shen <Junhua.Shen@amd.com>
Subject: [PATCH i-g-t v1 3/4] lib/amdgpu: source packet operands from params
 and size the IB from pm4_size
Date: Fri, 21 Aug 2026 20:41:51 +0800
Message-ID: <20260821124152.19670-4-Junhua.Shen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260821124152.19670-1-Junhua.Shen@amd.com>
References: <20260821124152.19670-1-Junhua.Shen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4B:EE_|DS7PR12MB5911:EE_
X-MS-Office365-Filtering-Correlation-Id: f55c6189-1e34-422c-896e-08deff819b90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|1800799024|82310400026|376014|23010399003|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: Jbm4Ef2ZOyqoYxREXjQXMOjS+W31qsMnKTc+T9WOteqPb348iDYsxT4rISRhxy/ICd7hIvFCWZbdaNeJkRaTXQjqNGNFmLFFQKZqpXVy5VzV6UXIyFEGOQe72g29gwuL4i/qy7u0p8+YbSkqaD2Xul9Nj8KNHOkE5FL13JowsAmHdMS82Ezr4yDK8CdcQzW6UyVyi8LnH8hPRliAJlQ0s+iRMpWXuxJXG1g0tFT1QPQmCPL8dIE+w3Mq0PoqBRuHD2LgRjJi4Uec8VsQKCfz/UeID8UvBcCECoRhMn3Iu+XZQ+4l5tqwP80JegOVQFnWG7Ix6t3r33C4JMfSeTamuab+lCo9tOaNqn9oZJHJSgcA5u9NpA1McdkP7pbVLWOy9EcmA2Rv3zIgdoMgTz1v/JGBNPtZnWedwBCg+9waVxPKNOFiSBlhKspnEwZGg9Xu3Qwp1dNfvWjoW7qWDm4jYGDGLbC6vD9cMvnZdYFCD2eIP0MDMYpMiqUX2DD424WcyTA07EJMznCKKt5hpldlXGOPThc3v/FvJL/K13JGskVm9BXYrHkYbniqpnD2zjnCrFE8eEq8EIDyT4WC4VFUo5W8RI2y0LUpOWDvPG+rvZTDm7f3u/nShuSV1GCKqyXCLp6rLm3Xe/qLMTqpT7BvVorrgNAtjFOC+E66s2vzaM2gw+6Ef1C3NtIQlhVx56PN57RC6zkzALigKboT2EvRTQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: H0Jtdqny4E4rdcy1ms5OLSBwtDTgVTjG3qY6XSDXUAbyo7rBdOagAMkW6Jrz7m+KpHzG8+IZq2vOEJ/9jiALJefzVnWqpvl9+5ml5UDAt7Czo2wSejMoOGqjYqklQ6xTMXU7A2cRkp+2gA9vjYVFjHBALaaJ0DTXQ9bvwTEyan5k40z1XURfkfCfVWpEFgwTTrj8cf4qyi1I0RJNF7s58Fw0gWzsS6deDdQpBUYRKVEFBQ2QgotkRKxVwsTneG7Tieg1JK+OC0a3+k9eDYHtZzuoKXVjc0+HmP0APn2UZQYibpbStUeQWWgxMkiW6kxLkrMuFBtYRfpZB8byxx34yqi1wqxxRh3u9BZiZuN2LmL/oQ7X5+tn5M1w8l63WQ7dq6Ljn7wyCqbZWJw7tq2z2axqGxTZ3BpwHftnPecCsuBP8lypE84iomW+dqpEhSb3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 12:42:05.8561 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f55c6189-1e34-422c-896e-08deff819b90
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5911
X-Mailman-Approved-At: Mon, 24 Aug 2026 08:18:13 +0000
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
 lib/amdgpu/amd_command_submission.c | 31 ++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index 26f36256a..261ae096c 100644
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
@@ -1252,9 +1260,14 @@ int cmd_place_packet(cmd_context_t *ctx, const cmd_packet_params_t *params)
 	    if (!ctx->ip_block->funcs->copy_linear)
 		    return -ENOTSUP;
 
-	    /* For copy operations, we need both source and destination addresses */
-	    /* This would require extending the API to pass both addresses */
-	    /* For now, use the internal buffer as source */
+	    /* Copy takes both operands from the caller: bo_mc = source VA,
+	     * bo_mc2 = destination VA. */
+	    if (params->src_addr)
+		    ctx->ring_ctx->bo_mc = params->src_addr;
+	    if (params->dst_addr)
+		    ctx->ring_ctx->bo_mc2 = params->dst_addr;
+	    igt_assert_f(ctx->ring_ctx->bo_mc && ctx->ring_ctx->bo_mc2,
+			 "COPY_LINEAR requires source and destination addresses\n");
 	    ctx->ring_ctx->write_length = params->size;
 
 	    result = ctx->ip_block->funcs->copy_linear(ctx->ip_block->funcs,
-- 
2.34.1

