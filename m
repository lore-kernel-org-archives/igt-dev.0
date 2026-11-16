Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D525D606A31F
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 00:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=IlJaU9cB
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 793FF10E77A;
	Mon, 16 Nov 2026 00:48:01 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011042.outbound.protection.outlook.com [52.101.62.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F4810E029
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 00:41:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WgouzQ0g39XqtwH6QV6jvD7rLv852I4EpQkAmyRL26fYkmJKPdbPEc6JdCERCJd6H/hTQ27q8F66BBLm2PafT3+eOqrGk/8yGyST/tLZA2+KYbWor1rzsEsM3MlvqVjfF32Qq09L2en9adIdifCS2QYTeybThvHV9/P90VAwy6LwVEmnQ2MaKxo2Cg28Vc7r3wxtFyEukHu6ketLvV3jZvhkvfXVKoNgVpdqojA4JMpeEgmLDR6MMLG/IPjRcynt8aedAUI3ObBw4JIbJSw+MeL3QRa9XQPN0qtUr8emUzKt/z3DQg4frg1lE2mjWnpDt3ZhWCcln/Sry33VnOxkfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eaBSI3o1TYjQAFtfXtf185SyIailAA4DiUsQSYC8QjM=;
 b=RsydGocBbtKjdxiqMebNV7W0ZNfmxB9MWhVHbVM84cmeVETNEaQagsmTWuuNNep91LjIDVOAwiK7JQHGZwpHL6VjHY3w33v+gYPEHIDMoiqftUoMQKUsdIGN7kWCSJJIKSCnkUGpHHBNbY+r6gg792y1vEkGiIra2+vm7aTw2RwfdafaqA3ZgAEMz9liiDsRTHtheuYFifi6CW5+sKHYFPlbIB9meT2iRODKV+djdRFGtMMtkzNsOtof699Ix4+D2wRfCH30UPNYRdVXnQxLQFa4Q6jfM3E7sf11GRU4ptYy5poW5I3l/IAeQ/1YlfmhVHVmFBJ3XyC2qIhQTwnoiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eaBSI3o1TYjQAFtfXtf185SyIailAA4DiUsQSYC8QjM=;
 b=IlJaU9cBqzL1UZvuecsjxbiHY39ZmXXnb2Xu5v/mhmEB49A7iNcuujvBvpiJwGhLhyd2w2fkLdl1EwMKNqngXIsBH/HL+zIk1gWQi8++w87hFa/el0r7SkdCsXR5KEK1yz0cCtXl4wncxboWQBK5QzRrSt+DXB1kleiQ2jtDaxc=
Received: from BN9PR03CA0238.namprd03.prod.outlook.com (2603:10b6:408:f8::33)
 by DS8PR12MB333896.namprd12.prod.outlook.com (2603:10b6:8:447::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 00:40:23 +0000
Received: from LV8PEPF00000066.namprd03.prod.outlook.com
 (2603:10b6:408:f8:cafe::72) by BN9PR03CA0238.outlook.office365.com
 (2603:10b6:408:f8::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Mon, 16
 Nov 2026 00:40:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 LV8PEPF00000066.mail.protection.outlook.com (10.167.248.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 00:40:22 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Sun, 15 Nov
 2026 18:40:22 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Sun, 15 Nov
 2026 18:40:22 -0600
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Sun, 15 Nov 2026 18:40:21 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Junhua Shen <Junhua.Shen@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, "Jesse
 Zhang" <jesse.zhang@amd.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH 4/8] lib/amdgpu: add CONST_FILL packet type and pass caller
 fill value through
Date: Sun, 15 Nov 2026 19:40:03 -0500
Message-ID: <20261116004016.121139-5-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116004016.121139-1-vitaly.prosyak@amd.com>
References: <20261116004016.121139-1-vitaly.prosyak@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF00000066:EE_|DS8PR12MB333896:EE_
X-MS-Office365-Filtering-Correlation-Id: 340c921b-c836-4366-4213-08df437a32f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|10067099003|11063799006|56012099006|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|20052099010|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: r6/oytxrl6+i3oHv/aMW7nnTXZgoYwdHX9ZcTNKK6Yqc66EgIIMIDgh1yDdCcmc8q24dw+Ziia4D95xry6Ny64xkiZmMsZABdT9pXfQHPsow0X6P6IydFFp74DlVcwIPZgW7gUJQYST0EP3nGXYQEk/OwMOK6ogz91nRR+zxMAbfcp7iFbeRYZjj3x42Szon+si0SN/opJIc1cbkGIELUa0lHYEDPgur64BbHB5GzofLBnYGyxlrho7WPRhEiQER0VwsjqVmz6vSi0j3d5AiCqikb4aOBP13Cp4LhbFZQyY4oef7Hcd7Rh1nM2KwPPfA9+0hTACiTPGVVv535o2/0WiNS03RNIdwWzF8JZbjJKOD+sE15iGYfFYSxwM7bmT50cvCiAarV2avabCn1arUOEsXQ3QsQqDmQ0mhIZg79WACo3jWG+69XBl1K5mzCIN/ly4ft5qgG7vt1iQlbttey8p2eV1HYz3E4GnLU/iPUP8L7SeUO5iEFpwAzl55exJ2AgAZuR2qtGE7nWDAnmWhyvtnd1r7Y9zgRE2Gmvb47g7nTBWkP/tq9RJS5amnEF9CRNDGOD3ygWcuVHQ1YyFZXQDEKfltPkrpPt0SBsh35QBuPq7avh7jFitCrAA4w7TOXcnpkQPa+TF3/t7sCC8Zf4Ib/+58EhyWV4GJpMy/w6FhBfLcuJHZvs07uOlKjs9vLtBBQmuaOM4tEflAWAqGiQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(10067099003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(20052099010)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: p4A7c9t9dYCyM/ecefd73IpRxinM/0Aj5wcF3xa5C90KvRYWIC0z3qDufzXOlk1pw4M8qZSEcogoPktvizriOt3g2YfDogG5q0qw/L6CWffSzgMSrxDbtK1+Bcg/tfHvzgYtX0Z9V8fhOe3fbf35Mbe67aYGYrFihpx95Bpw5mv5/Z2Kc3gP9A27Hy4QfmPT8Xxb5eB7db+RS/heK9La0nSkjRfK6Km/FRAUcdeAgBP+jMu7C8f6R40Vcg10TAH9iUp3zgAgOuUA0L21b2rXHHTpsHbb2FxRabNokw2slWfjmoEkB38OXsK6yYAddBO6wHsYJD0RoBIWbr+EV4nFZ85FXFb3BE5/j4x8QfflyJ0J2RlTk5yj4fYrjz204v/AVt1TqAE8JMwJshEHilHqkX9zjh3IaHd8RRgPUryDXlXbjuOzTqEH91TFyEihRkg3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 00:40:22.9742 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 340c921b-c836-4366-4213-08df437a32f9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: LV8PEPF00000066.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS8PR12MB333896
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

Add a CMD_PACKET_CONST_FILL packet type with a per-packet size guard, and
pass the caller-supplied fill value (write_data/write_data_valid) through
write_linear and const_fill in the IP block builders.

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Junhua Shen <Junhua.Shen@amd.com>
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_command_submission.c | 74 +++++++++++++++++++++++++++++
 lib/amdgpu/amd_command_submission.h |  3 ++
 lib/amdgpu/amd_ip_blocks.c          | 20 +++++---
 lib/amdgpu/amd_ip_blocks.h          |  2 +
 4 files changed, 93 insertions(+), 6 deletions(-)

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index 864c57b19..aa9b37d87 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -1119,6 +1119,8 @@ static void cmd_clear_packet_inputs(cmd_context_t *ctx)
 
 	rc->bo_mc = 0;
 	rc->bo_mc2 = 0;
+	rc->write_data = 0;
+	rc->write_data_valid = false;
 	rc->write_length = 0;
 
 	/* Drop the per-submit residency set. */
@@ -1243,6 +1245,38 @@ int cmd_submit_packet(cmd_context_t *ctx)
 	return 0;
 }
 
+static void cmd_assert_size_within_packet_limit(cmd_context_t *ctx, uint32_t size,
+						const char *op)
+{
+	struct amdgpu_dma_limits limits;
+	uint64_t max_bytes;
+
+	amdgpu_dma_limits_query(ctx->device, &limits);
+	max_bytes = amdgpu_dma_max_bytes(&limits, (unsigned int)ctx->ip_type);
+
+	igt_assert_f(size <= max_bytes,
+		     "%s size %u exceeds single-packet max %llu bytes for this IP; split the transfer\n",
+		     op, size, (unsigned long long)max_bytes);
+}
+
+/*
+ * WRITE_LINEAR inlines the payload directly into the PM4 stream as
+ * write_length/4 dwords (plus a small packet header), so its real limit is the
+ * PM4 buffer capacity, not the DMA engine's per-packet transfer maximum. Reject
+ * transfers whose inlined form would overrun pm4[] before the builder writes it.
+ */
+static void cmd_assert_inline_payload_fits(cmd_context_t *ctx, uint32_t size,
+					   const char *op)
+{
+	/* Upper bound on the header across the SDMA/GFX write_linear encodings. */
+	const uint32_t header_dw = 8;
+	uint64_t need_dw = (uint64_t)header_dw + (size / 4);
+
+	igt_assert_f(need_dw <= ctx->ring_ctx->pm4_size,
+		     "%s size %u needs %llu dw, exceeds PM4 buffer (%u dw); split the transfer\n",
+		     op, size, (unsigned long long)need_dw, ctx->ring_ctx->pm4_size);
+}
+
 int cmd_place_packet(cmd_context_t *ctx, const cmd_packet_params_t *params)
 {
 	int result = -EINVAL;
@@ -1264,7 +1298,10 @@ int cmd_place_packet(cmd_context_t *ctx, const cmd_packet_params_t *params)
 			ctx->ring_ctx->bo_mc = params->dst_addr;
 		igt_assert_f(ctx->ring_ctx->bo_mc,
 			     "WRITE_LINEAR requires a destination address\n");
+		cmd_assert_inline_payload_fits(ctx, params->size, "WRITE_LINEAR");
 		ctx->ring_ctx->write_length = params->size;
+		ctx->ring_ctx->write_data = params->data;
+		ctx->ring_ctx->write_data_valid = true;
 
 		/* Build PM4 packet */
 		result = ctx->ip_block->funcs->write_linear(ctx->ip_block->funcs,
@@ -1301,6 +1338,7 @@ int cmd_place_packet(cmd_context_t *ctx, const cmd_packet_params_t *params)
 			ctx->ring_ctx->bo_mc2 = params->dst_addr;
 		igt_assert_f(ctx->ring_ctx->bo_mc && ctx->ring_ctx->bo_mc2,
 			     "COPY_LINEAR requires source and destination addresses\n");
+		cmd_assert_size_within_packet_limit(ctx, params->size, "COPY_LINEAR");
 		ctx->ring_ctx->write_length = params->size;
 
 		result = ctx->ip_block->funcs->copy_linear(ctx->ip_block->funcs,
@@ -1308,6 +1346,27 @@ int cmd_place_packet(cmd_context_t *ctx, const cmd_packet_params_t *params)
 						   &ctx->ring_ctx->pm4_dw);
 		return result;
 
+	case CMD_PACKET_CONST_FILL:
+		if (!ctx->ip_block->funcs->const_fill)
+			return -ENOTSUP;
+
+		/* Destination operand comes from the caller; params->data is the
+		 * fill pattern written to every DWORD of the range.
+		 */
+		if (params->dst_addr)
+			ctx->ring_ctx->bo_mc = params->dst_addr;
+		igt_assert_f(ctx->ring_ctx->bo_mc,
+			     "CONST_FILL requires a destination address\n");
+		cmd_assert_size_within_packet_limit(ctx, params->size, "CONST_FILL");
+		ctx->ring_ctx->write_length = params->size;
+		ctx->ring_ctx->write_data = params->data;
+		ctx->ring_ctx->write_data_valid = true;
+
+		result = ctx->ip_block->funcs->const_fill(ctx->ip_block->funcs,
+							  ctx->ring_ctx,
+							  &ctx->ring_ctx->pm4_dw);
+		return result;
+
 	case CMD_PACKET_COPY_ATOMIC:
 		/* TODO: Implement atomic copy if supported */
 		igt_info("cmd_place_packet: ATOMIC_COPY not implemented\n");
@@ -1373,6 +1432,21 @@ int cmd_submit_copy_linear(cmd_context_t *ctx, uint64_t src_addr, uint64_t dst_a
 	return cmd_place_and_submit_packet(ctx, &params);
 }
 
+/**
+ * Convenience function for constant fill
+ */
+int cmd_submit_const_fill(cmd_context_t *ctx, uint64_t dst_addr, uint32_t size, uint32_t data)
+{
+	cmd_packet_params_t params = {
+		.type = CMD_PACKET_CONST_FILL,
+		.dst_addr = dst_addr,
+		.size = size,
+		.data = data,
+	};
+
+	return cmd_place_and_submit_packet(ctx, &params);
+}
+
 /**
  * Convenience function for atomic operation
  */
diff --git a/lib/amdgpu/amd_command_submission.h b/lib/amdgpu/amd_command_submission.h
index 8644f25ed..cf20ff457 100644
--- a/lib/amdgpu/amd_command_submission.h
+++ b/lib/amdgpu/amd_command_submission.h
@@ -36,6 +36,7 @@ typedef enum {
     CMD_PACKET_WRITE_ATOMIC,
     CMD_PACKET_COPY_LINEAR,
     CMD_PACKET_COPY_ATOMIC,
+    CMD_PACKET_CONST_FILL,
     CMD_PACKET_FENCE,
     CMD_PACKET_TIMESTAMP,
 } cmd_packet_type_t;
@@ -196,6 +197,8 @@ int cmd_submit_write_linear(cmd_context_t *ctx, uint64_t dst_addr, uint32_t size
 
 int cmd_submit_copy_linear(cmd_context_t *ctx, uint64_t src_addr, uint64_t dst_addr, uint32_t size);
 
+int cmd_submit_const_fill(cmd_context_t *ctx, uint64_t dst_addr, uint32_t size, uint32_t data);
+
 int cmd_submit_atomic(cmd_context_t *ctx, uint64_t dst_addr, uint32_t data);
 
 bool cmd_ring_available(amdgpu_device_handle device,
diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 9bed04f12..f8a3643fa 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -138,6 +138,8 @@ sdma_ring_write_linear(const struct amdgpu_ip_funcs *func,
 		       uint32_t *pm4_dw)
 {
 	uint32_t i, j;
+	uint32_t fill = ring_context->write_data_valid ?
+			ring_context->write_data : func->deadbeaf;
 
 	i = 0;
 	j = 0;
@@ -165,7 +167,7 @@ sdma_ring_write_linear(const struct amdgpu_ip_funcs *func,
 		ring_context->pm4[i++] = 0;
 
 	while (j++ < ring_context->write_length / 4)
-		ring_context->pm4[i++] = func->deadbeaf;
+		ring_context->pm4[i++] = fill;
 
 	*pm4_dw = i;
 
@@ -268,20 +270,22 @@ sdma_ring_const_fill(const struct amdgpu_ip_funcs *func,
 		     uint32_t *pm4_dw)
 {
 	uint32_t i;
+	uint32_t fill = context->write_data_valid ?
+			context->write_data : func->deadbeaf;
 
 	i = 0;
 	if (func->family_id == AMDGPU_FAMILY_SI) {
 		context->pm4[i++] = SDMA_PACKET_SI(SDMA_OPCODE_CONSTANT_FILL_SI,
 						   0, 0, 0, context->write_length / 4);
 		context->pm4[i++] = lower_32_bits(context->bo_mc);
-		context->pm4[i++] = 0xdeadbeaf;
+		context->pm4[i++] = fill;
 		context->pm4[i++] = upper_32_bits(context->bo_mc) >> 16;
 	} else {
 		context->pm4[i++] = SDMA_PACKET(SDMA_OPCODE_CONSTANT_FILL, 0,
 						SDMA_CONSTANT_FILL_EXTRA_SIZE(2));
 		context->pm4[i++] = lower_32_bits(context->bo_mc);
 		context->pm4[i++] = upper_32_bits(context->bo_mc);
-		context->pm4[i++] = func->deadbeaf;
+		context->pm4[i++] = fill;
 
 		if (func->family_id >= AMDGPU_FAMILY_AI)
 			context->pm4[i++] = context->write_length - 1;
@@ -359,6 +363,8 @@ gfx_ring_write_linear(const struct amdgpu_ip_funcs *func,
 		      uint32_t *pm4_dw)
 {
 	uint32_t i, j;
+	uint32_t fill = ring_context->write_data_valid ?
+			ring_context->write_data : func->deadbeaf;
 
 	i = 0;
 	j = 0;
@@ -378,7 +384,7 @@ gfx_ring_write_linear(const struct amdgpu_ip_funcs *func,
 	ring_context->pm4[i++] = lower_32_bits(ring_context->bo_mc);
 	ring_context->pm4[i++] = upper_32_bits(ring_context->bo_mc);
 	while (j++ < ring_context->write_length / 4)
-		ring_context->pm4[i++] = func->deadbeaf;
+		ring_context->pm4[i++] = fill;
 
 	*pm4_dw = i;
 	if (ring_context->pm4_size > 0)
@@ -477,11 +483,13 @@ gfx_ring_const_fill(const struct amdgpu_ip_funcs *func,
 		     uint32_t *pm4_dw)
 {
 	uint32_t i;
+	uint32_t fill = ring_context->write_data_valid ?
+			ring_context->write_data : func->deadbeaf;
 
 	i = 0;
 	if (func->family_id == AMDGPU_FAMILY_SI) {
 		ring_context->pm4[i++] = PACKET3(PACKET3_DMA_DATA_SI, 4);
-		ring_context->pm4[i++] = func->deadbeaf;
+		ring_context->pm4[i++] = fill;
 		ring_context->pm4[i++] = PACKET3_DMA_DATA_SI_ENGINE(0) |
 					 PACKET3_DMA_DATA_SI_DST_SEL(0) |
 					 PACKET3_DMA_DATA_SI_SRC_SEL(2) |
@@ -495,7 +503,7 @@ gfx_ring_const_fill(const struct amdgpu_ip_funcs *func,
 					 PACKET3_DMA_DATA_DST_SEL(0) |
 					 PACKET3_DMA_DATA_SRC_SEL(2) |
 					 PACKET3_DMA_DATA_CP_SYNC;
-		ring_context->pm4[i++] = func->deadbeaf;
+		ring_context->pm4[i++] = fill;
 		ring_context->pm4[i++] = 0;
 		ring_context->pm4[i++] = lower_32_bits(ring_context->bo_mc);
 		ring_context->pm4[i++] = upper_32_bits(ring_context->bo_mc);
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 16a9f2d4f..5aa697f4d 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -322,6 +322,8 @@ struct amdgpu_ring_context {
 	 */
 	uint64_t write_length;
 	uint64_t write_length2; /* IN: transfer size in bytes, second packet */
+	uint32_t write_data;    /* IN: payload for write_linear/const_fill */
+	bool write_data_valid;  /* IN: use write_data; else IP deadbeaf pattern */
 	uint32_t *pm4;		/* INTERNAL: packet buffer (submitter-owned, builder fills) */
 	uint32_t pm4_size;	/* IN: capacity of pm4[] in dwords (required, non-zero) */
 	bool secure;		/* IN: secure or not */
-- 
2.43.0

