Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4A6606A32F
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 00:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=1MMi6bJg
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41FC310E38C;
	Mon, 16 Nov 2026 00:43:24 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013029.outbound.protection.outlook.com
 [40.93.201.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF1DF10E049
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 00:40:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ha0ltBnfSBW93lFV/HfOIaKp+JEop65kt6sz2rW05jhcNjNK3a7C0cGFhQr7/qIHzwweOhXokaD/8MWEOwFnVB6y6VazIbZ3snQzrm1beI6nx08iSy31zLQtFQWeoNXU6uuSqHfMtBJob5MLlXbwNKaGBmC3TjrZGkCtiigUDbHEQCeZfiIrnm4if8pgbnv26Bd6cBy8ikzpqdMMvkDGWtVZiITd+CeTVJY4Km7E1eh1ZuWNCZcJeIQ6M/L9hoaw8ndwbqnxKfYudcw9aOAAbbMcyeSdhg6OmIQQwMFd55xos7ALIA2sqnkhz8R1CxNTqbb6NTxDcfxwRcS9LHRMGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0yCD8S5jjzcLQSQ5iNmqqJA+Y5b2/CHXPVlku1RTeZo=;
 b=b53FzrP5OIzsP84R9qqYT/aMMReeMapHEC53SpKPi98v1/6rP4aVN6O7PdoQmp5oo7S83kEDVm0toeOj41loesZEVptmFIgetKczby+K+dssDZYdB4FDdcV9OjTkm39m3jIueKWsZ4pLwZPrgL5btI+WzBKW2F1TQZayGn75B27DzwsVYXFn8dIgjdgi2aw5vHGdeQAl0OoYz9Z0jDzTt5ZLx7ORNJp/RlI6YWLeq9dRhR3scCohMXAfFvHVJaNVHNlx7+FYjEyEzK+wwpKeKLIS+h0mq7OnhYrR4dpcjUHjO+qztZplZRaWZ5Pth3k6Tq+WUsmhywsEDvz9aoHsnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0yCD8S5jjzcLQSQ5iNmqqJA+Y5b2/CHXPVlku1RTeZo=;
 b=1MMi6bJgglRj3o8sJSbnKGNMZAby+Lw4ITa7eLLoeMopRJz9Kn7oNnFKAmJz5vxIhUyj9aL8xRv3Yc8RuGbty+RjLIRqBX7x4eVuW1LPHUbF/h8TG7BWa6MCsaA1Vt+FQG7HIMJxMNev/ak/fgqPypyrOtxWZUJeBC+8i4YQIk4=
Received: from BN0PR02CA0016.namprd02.prod.outlook.com (2603:10b6:408:e4::21)
 by SA3PR12MB7923.namprd12.prod.outlook.com (2603:10b6:806:317::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Mon, 16 Nov
 2026 00:40:23 +0000
Received: from BN1PEPF00018070.namprd04.prod.outlook.com
 (2603:10b6:408:e4:cafe::5e) by BN0PR02CA0016.outlook.office365.com
 (2603:10b6:408:e4::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 00:40:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00018070.mail.protection.outlook.com (10.167.245.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 00:40:22 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Sun, 15 Nov
 2026 18:40:21 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Sun, 15 Nov
 2026 18:40:21 -0600
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Sun, 15 Nov 2026 18:40:20 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Junhua Shen <Junhua.Shen@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, "Jesse
 Zhang" <jesse.zhang@amd.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH 3/8] lib/amdgpu: source packet operands from params and size
 the IB from pm4_size
Date: Sun, 15 Nov 2026 19:40:02 -0500
Message-ID: <20261116004016.121139-4-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116004016.121139-1-vitaly.prosyak@amd.com>
References: <20261116004016.121139-1-vitaly.prosyak@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018070:EE_|SA3PR12MB7923:EE_
X-MS-Office365-Filtering-Correlation-Id: bb4c5c2f-2c01-41a4-dcfc-08df437a32f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|10067099003|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|261102123227099003|261026121527099003|261026140227099003|261022105027099003|261028144727099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 8z1OJNvzJmY+sqrPVe/TdDInUbr/YLyA8ufEITXqBGPYEAgYVS1UQrf3YAYbgtmptu3TF3rQJWXHnjIlIY3muRgNZ914Chz42T4IIw/m0D2zabU+DgLAX34zHldqlyCKzdoL9Ayw18rYbDVgzzkcRayPCi/W4yOFZnVlImUm0w9ZjADsGxbcyW2TYzpPX+qRbC7hB6uHphNsgsjwK/Z827/QSIra+0wZYu8XPtxWd5Y+/ewCfM0gOUcKodYU7q7tEkk5V++X70aXLAePx/YpHweX+pC58J6V9uhCy2fcjOPjAvGR1DkoC0pT6wiJCTsxjhtYQ2vvawEHMp5YI3fydb2aSWVnyylG43dlPqA69SNDyH1husxKH/k9YLnUZDwELfmKt6t4uzCLkkrvNyRMTHnYaY8MJe+5jcid2OShSLnM+rxM347Z0CCP4vhUPgHI2SBzfTzaiwBsY6NNsix4Ea3icwIeIu9TVKlgBwpC4Dw19KOL9ziDdbcLYYMEavyMXqjpFecxBrx6HEj32h49qehftPyHPejkqCr8VwesIgN7S/uPm44v75+cGIVD0f83tt1W0E3p8jNJ6z8g8rsAKJT5JZcIq46/hc8Zg0Ir0tzoJad6QyExZyFappPS0cuEnHO9eKRsSfVcbKxxuc8Qb5cy3V4dI2WtOQ3Yy+xWOQfmcuCCKil9bLWvnoMgU+T9mhLEIhwPBdTzOyut6BSJsw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(10067099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(261026121527099003)(261026140227099003)(261022105027099003)(261028144727099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: JabTIHEDanZ6lroy/Z0wuXcyuvSxZ86/eauZRHOKszKK6MWONM1TvsNtxFEgcuX5mI+6fT/q7E1I5tT1bw1wxrFGN5GJ9gMehPJmlWV2ZDspBeFhbZ6/7utDu0UHz+ywiEQxDk2m69/MH15wsRLH4erVY943kePLBd7l/3JehjGyFpDFwhD7BT+SIFN2cv9udMCp+sFZic2GjY1UeiR9tEVrmvcPXa9e8IVAsF8Hjag1qJwKB4FtnO8vLHHi8ezG4Ntsbnp9yYvrSIIfaXEZBpSPlDp4WE1rYhw7wY1/Cb7Nv4EwcWdsbipT2/kZwaNKC0nhpgBvcEpc6s/MwGNs4Bw0Mm3yFhBYIQaKOFw0fth0I/A9K7J8FEUZYgw81/cm8hOqT6ku8928g9CMC6+q3pBeDuaGtow4RWXI0iQM8knH3Z2JqZqRs73CB69eh3QD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 00:40:22.9433 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb4c5c2f-2c01-41a4-dcfc-08df437a32f3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00018070.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7923
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Junhua Shen <Junhua.Shen@amd.com>

- Size the legacy IB from pm4_size: the IB carries the PM4 command
  stream, so its byte size derives from pm4_size, not from write_length
  (the data transfer size). amdgpu_test_exec_cs_helper() now computes
  ib_size from pm4_size.
- WRITE_LINEAR/WRITE_ATOMIC/COPY_LINEAR take their operand GPU VAs
  (src/dst) from cmd_packet_params_t, so callers pass virtual addresses
  directly instead of relying on context-internal BOs.

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Junhua Shen <Junhua.Shen@amd.com>
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_command_submission.c | 46 +++++++++++++++++++----------
 1 file changed, 30 insertions(+), 16 deletions(-)

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index b7e1214f5..864c57b19 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -47,13 +47,15 @@ int amdgpu_test_exec_cs_helper(amdgpu_device_handle device, unsigned int ip_type
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
@@ -63,7 +65,7 @@ int amdgpu_test_exec_cs_helper(amdgpu_device_handle device, unsigned int ip_type
 		/* prepare CS */
 		igt_assert(ring_context->pm4_dw <= 1024);
 		/* allocate IB */
-		r = amdgpu_bo_alloc_and_map_sync(device, ring_context->write_length, 4096,
+		r = amdgpu_bo_alloc_and_map_sync(device, ib_size, 4096,
 						 AMDGPU_GEM_DOMAIN_GTT, 0, AMDGPU_VM_MTYPE_UC,
 						 &ib_result_handle, &ib_result_cpu,
 						 &ib_result_mc_address, &va_handle,
@@ -1257,8 +1259,11 @@ int cmd_place_packet(cmd_context_t *ctx, const cmd_packet_params_t *params)
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
@@ -1271,8 +1276,11 @@ int cmd_place_packet(cmd_context_t *ctx, const cmd_packet_params_t *params)
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
@@ -1281,18 +1289,24 @@ int cmd_place_packet(cmd_context_t *ctx, const cmd_packet_params_t *params)
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
2.43.0

