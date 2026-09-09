Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF19C79FAD
	for <igt-dev@archiver.kernel.org>; Wed,  9 Sep 2026 10:51:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB5810E552;
	Wed,  9 Sep 2026 10:51:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mk5Yb6DO";
	dkim-atps=neutral
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010020.outbound.protection.outlook.com [52.101.56.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9FFC10E169
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Sep 2026 10:46:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SfuGjVOvQdvL8PGKzPK8cY+XTSlIFcd9CPAiH1/baVH7zLxyueK/0p2Em83ohBl//R7P5f8Xeflj302hyGMAP8TVcjXg52Lp4EihHPRcE4Y8FD+oEDOderyQZUAR4nmmIHrSWpbF5M6kz61Qqc+a6DDJcoAfSAkzMRF1IYyb1kc1EUtQRZF88UzmWe5SyNW7SZS7G2kt4+AIDe3I2CyGMPRjMh7uAhiBZQIChTtmr6mYpZ1f//JNTYCF7vXxPgE68LxAoNTWCMhZ9F130bz6e7AZRu6sVQRcfV4/PbsY5opYmRhLflHLkNThGT6Meb+PZwzsX4yOOGstE68C6TfjZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RpQnRGvlNVVT6gbC8Gm5zTHiN4NgAz/1g48C8XchFe8=;
 b=bvQ/WAbEOQKoKQ7zGn368am+GBP8j86mlDuIYpcLQh6mwjVw4pin/mudf7rAT5Jp6wdSWS9Cxvj7023DxCpgoQM2aatfBT4mX//YBszei7W3zNa6xHrHl53VeGV37js4ZOxMZlczg/D1k7olaKK/DwTj+fuMB2hfx4VNCbWNBjrEGNnjla5nkaEhHoAbwqZZ/Qh4v6BiGJjpBdHOnyKYui+Jg6A5FW2b/L92y2lJoxhWsmJwB9+MXEt9aLJkfNTQhQGSlSeWweTk+tmvefUMzxaWxKMT0SrFVPGGPFKHeDmmEqObFEsRRc+1FwArRumMZSIUy0tRSqv1C5afdC4ujg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RpQnRGvlNVVT6gbC8Gm5zTHiN4NgAz/1g48C8XchFe8=;
 b=mk5Yb6DOj0JdyomnhXnCHQjtq7BqlFq8Ord6KAdzFsZcgWm8WaBhnSphafFjNbRYMUJoCWt3Myakj0TK73YtYMaoYI2hmoqGB1iZognoyP+VndHbsAhO64NvdqCkJupBInmHgwJYedjYgukKVrmcEpcoL04canyaZZl5FJxwb1Y=
Received: from SA1P222CA0072.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2c1::28)
 by MN2PR12MB4093.namprd12.prod.outlook.com (2603:10b6:208:198::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Wed, 9 Sep 2026
 10:46:21 +0000
Received: from SN1PEPF0002529E.namprd05.prod.outlook.com
 (2603:10b6:806:2c1:cafe::3e) by SA1P222CA0072.outlook.office365.com
 (2603:10b6:806:2c1::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.8 via Frontend Transport; Wed, 9
 Sep 2026 10:46:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002529E.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Wed, 9 Sep 2026 10:46:20 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 9 Sep
 2026 05:46:19 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 9 Sep
 2026 05:46:19 -0500
Received: from junhua-PC.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Wed, 9 Sep 2026 05:46:17 -0500
From: Junhua Shen <Junhua.Shen@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Jesse Zhang
 <Jesse.Zhang@amd.com>, Sunil Khatri <sunil.khatri@amd.com>, Honglei Huang
 <honglei1.huang@amd.com>, Huang Rui <ray.huang@amd.com>, Yiru Ma
 <yiru.ma@amd.com>, Junhua Shen <Junhua.Shen@amd.com>
Subject: [PATCH i-g-t v2 4/6] lib/amdgpu: add CONST_FILL packet type and pass
 caller fill value through
Date: Wed, 9 Sep 2026 18:46:00 +0800
Message-ID: <20260909104602.13807-5-Junhua.Shen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260909104602.13807-1-Junhua.Shen@amd.com>
References: <20260909104602.13807-1-Junhua.Shen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529E:EE_|MN2PR12MB4093:EE_
X-MS-Office365-Filtering-Correlation-Id: 774815db-3da6-4919-2c80-08df0e5f95be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|10067099003|56012099006|11063799006|20052099010|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: +++rat52jWh1HF7jmBteUHqN5C4dge+DWrED11iiTXSCcWlKVpYiAlo6QQzqxTpHyu77cakWGlqHb/p+3rJWjJhpDc6XunuFJbNfyGpPaNFA+MTGUV/zTC6e4tVBcBEpAP0+SAb9vRPjgwHujbjleeEg2kDiHyIWmS1LoBJGsyKMlxbRDZzDQtl7Qaz0QXA77iyUSw2HBtAMgE/lPX9x3T4cMMGI/hHmJm8X2Trwnt2r0cxd5iEyYyF20a5+yeBwkKbL6bz6KzYdVJhleCklvcFkO2cem4nR3B7sMmQWuPZe41eacIPWjFlddAHgY3VsjX68XDyYb+F2MV2cj0KOR5Q5mebXvaZD6Tg81uwiKFughommRU/KZkoGfx6clOYM1QaqtgDh7EpHFmIskXBbyb+6heQi5tcoBFd/Rm8lx+v0BzKaPr5ES5Nbh85xLYcrc1d7tGkJOpGkUwXbOePhxn2uupyxte3EBchWI6eceOKMj1/ilFLHZAvQOJLNZNqXReS3FESuIHLgEZH8PKNQ01U0I0/7BkR8gjUGvLp6uVCNecVgRTESUvHZODU7gGdBNRc6r67FXHSnRqBA+CD3VSnUtYyepunHAzUIoY3sm06Q5P23d5fXO1Ijf+JcEM0CwLgLynn+CrQzQ7FsjGLSpc9rJZngre42alBGOvUXLq6m1O9lJUWH0OVzJgRjNPbSHBCl24YR+ugVHF4uY+YoXA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(10067099003)(56012099006)(11063799006)(20052099010)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: k6SytRWbZX0IsOM83+aSmpla6ihidB2O+dPGsDT6wG9EaW32mrQdlnS5wWj3/LomFb6mBXen7cOmPwhwnv+Ci1P8LydtV98R+R1NZG0mWtnyPbPbVrVETaC7S0kWCTqGQjDF8yUblbCB2jNnRW67L56HeMY08x2Cy5gOwMTq7pf6K25UXQaj598nI0tS9iXwrlO0He5rv/ThrIWcs+QLIF5EA9/uuHO5G34pSfpTRjHB/cGxD0uVnrv6hS74l/Dhi5Bb5wz1MY/rt1n2QJbfmaj76YFvIqAMUolp+SWGM+/F9SPCmBoZ0O877m2kaBnoC0djP/kkMqo+KoyzBYVco+su/koXG26p6ivCbDGKWIraKxUZvFydcXyO6klwJsZq7LQmcOhAmEMzMp14nKiW1ldmBn4xqzlpUxJTjKMHn6XIwsWWMlRczDBo30W1M+q3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 10:46:20.6214 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 774815db-3da6-4919-2c80-08df0e5f95be
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002529E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4093
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

Add a CMD_PACKET_CONST_FILL packet type with a per-packet size guard, and
pass the caller-supplied fill value (write_data/write_data_valid) through
write_linear and const_fill in the IP block builders.

Signed-off-by: Junhua Shen <Junhua.Shen@amd.com>
---
 lib/amdgpu/amd_command_submission.c | 74 +++++++++++++++++++++++++++++
 lib/amdgpu/amd_command_submission.h |  3 ++
 lib/amdgpu/amd_ip_blocks.c          | 20 +++++---
 lib/amdgpu/amd_ip_blocks.h          |  2 +
 4 files changed, 93 insertions(+), 6 deletions(-)

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index 6d55bd107..fd1915221 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -1087,6 +1087,8 @@ static void cmd_clear_packet_inputs(cmd_context_t *ctx)
 
 	rc->bo_mc = 0;
 	rc->bo_mc2 = 0;
+	rc->write_data = 0;
+	rc->write_data_valid = false;
 	rc->write_length = 0;
 
 	/* Drop the per-submit residency set. */
@@ -1211,6 +1213,38 @@ int cmd_submit_packet(cmd_context_t *ctx)
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
@@ -1232,7 +1266,10 @@ int cmd_place_packet(cmd_context_t *ctx, const cmd_packet_params_t *params)
 			ctx->ring_ctx->bo_mc = params->dst_addr;
 		igt_assert_f(ctx->ring_ctx->bo_mc,
 			     "WRITE_LINEAR requires a destination address\n");
+		cmd_assert_inline_payload_fits(ctx, params->size, "WRITE_LINEAR");
 		ctx->ring_ctx->write_length = params->size;
+		ctx->ring_ctx->write_data = params->data;
+		ctx->ring_ctx->write_data_valid = true;
 
 		/* Build PM4 packet */
 		result = ctx->ip_block->funcs->write_linear(ctx->ip_block->funcs,
@@ -1269,6 +1306,7 @@ int cmd_place_packet(cmd_context_t *ctx, const cmd_packet_params_t *params)
 			ctx->ring_ctx->bo_mc2 = params->dst_addr;
 		igt_assert_f(ctx->ring_ctx->bo_mc && ctx->ring_ctx->bo_mc2,
 			     "COPY_LINEAR requires source and destination addresses\n");
+		cmd_assert_size_within_packet_limit(ctx, params->size, "COPY_LINEAR");
 		ctx->ring_ctx->write_length = params->size;
 
 		result = ctx->ip_block->funcs->copy_linear(ctx->ip_block->funcs,
@@ -1276,6 +1314,27 @@ int cmd_place_packet(cmd_context_t *ctx, const cmd_packet_params_t *params)
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
@@ -1341,6 +1400,21 @@ int cmd_submit_copy_linear(cmd_context_t *ctx, uint64_t src_addr, uint64_t dst_a
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
index 7d31a582a..c6a189fdf 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -32,6 +32,8 @@ sdma_ring_write_linear(const struct amdgpu_ip_funcs *func,
 		       uint32_t *pm4_dw)
 {
 	uint32_t i, j;
+	uint32_t fill = ring_context->write_data_valid ?
+			ring_context->write_data : func->deadbeaf;
 
 	i = 0;
 	j = 0;
@@ -56,7 +58,7 @@ sdma_ring_write_linear(const struct amdgpu_ip_funcs *func,
 		ring_context->pm4[i++] = ring_context->write_length / 4;
 
 	while (j++ < ring_context->write_length / 4)
-		ring_context->pm4[i++] = func->deadbeaf;
+		ring_context->pm4[i++] = fill;
 
 	*pm4_dw = i;
 
@@ -156,20 +158,22 @@ sdma_ring_const_fill(const struct amdgpu_ip_funcs *func,
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
@@ -239,6 +243,8 @@ gfx_ring_write_linear(const struct amdgpu_ip_funcs *func,
 		      uint32_t *pm4_dw)
 {
 	uint32_t i, j;
+	uint32_t fill = ring_context->write_data_valid ?
+			ring_context->write_data : func->deadbeaf;
 
 	i = 0;
 	j = 0;
@@ -258,7 +264,7 @@ gfx_ring_write_linear(const struct amdgpu_ip_funcs *func,
 	ring_context->pm4[i++] = lower_32_bits(ring_context->bo_mc);
 	ring_context->pm4[i++] = upper_32_bits(ring_context->bo_mc);
 	while (j++ < ring_context->write_length / 4)
-		ring_context->pm4[i++] = func->deadbeaf;
+		ring_context->pm4[i++] = fill;
 
 	*pm4_dw = i;
 	if (ring_context->pm4_size > 0)
@@ -357,11 +363,13 @@ gfx_ring_const_fill(const struct amdgpu_ip_funcs *func,
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
@@ -375,7 +383,7 @@ gfx_ring_const_fill(const struct amdgpu_ip_funcs *func,
 					 PACKET3_DMA_DATA_DST_SEL(0) |
 					 PACKET3_DMA_DATA_SRC_SEL(2) |
 					 PACKET3_DMA_DATA_CP_SYNC;
-		ring_context->pm4[i++] = func->deadbeaf;
+		ring_context->pm4[i++] = fill;
 		ring_context->pm4[i++] = 0;
 		ring_context->pm4[i++] = lower_32_bits(ring_context->bo_mc);
 		ring_context->pm4[i++] = upper_32_bits(ring_context->bo_mc);
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 37f38ed44..19d698e91 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -307,6 +307,8 @@ struct amdgpu_ring_context {
 	 */
 	uint64_t write_length;
 	uint64_t write_length2; /* IN: transfer size in bytes, second packet */
+	uint32_t write_data;    /* IN: payload for write_linear/const_fill */
+	bool write_data_valid;  /* IN: use write_data; else IP deadbeaf pattern */
 	uint32_t *pm4;		/* INTERNAL: packet buffer (submitter-owned, builder fills) */
 	uint32_t pm4_size;	/* IN: capacity of pm4[] in dwords (required, non-zero) */
 	bool secure;		/* IN: secure or not */
-- 
2.34.1

