Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC1EC5DF81
	for <igt-dev@archiver.kernel.org>; Mon, 24 Aug 2026 08:22:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B1E610E355;
	Mon, 24 Aug 2026 08:22:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QhgIBj8a";
	dkim-atps=neutral
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012046.outbound.protection.outlook.com [52.101.48.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C790A10E39F
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Aug 2026 12:42:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t0HRlcwVsGJEK/7V58FJfh0PT1H0Ch/osgbNIMvJ4IgHQezTvPok5SIre1Nwg4ndX6I/BrB5HmAWsL2JZ0VVDUAjwhTr1G0c3w9CgX2ywHXGTWEJFAJNSWsbylXQtc//1cfwkn99JuEdalGqjj16LOqscxmDuEm6DCn05c+bWzYoj9TC6i0eJC14Wd5Fg6d6nK6VvDC244D3tTHy0Vyx0AF1/GFT5jp1e7jezs36CO2YoVUQUFMDTZ2SzC5/vLqgV3ljtLgAqYRdvhukf1x2Wnlkh0dMKEBboUYZSH/7PLq0Nt1hpPO84BoVphFTfO0uwUVYMJEbjdXFHMxzX18c4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BWQ+fRricqNIP7h/2BmEzzbBLAM49yuuDU1s6e4Ks68=;
 b=u/P45dKx4UxddTwnYo/ErXYYSR4fDkw6fLpwSD5vmVmK9IktD4yJlhKQY/4W0DzPbf7CbqSu95iWRZEoz0+onQFAMmkrtsjiXYeqQ6tS+PTF69aKBJSI8BpWz2HyNzh3yaLDUWW9BrIidAxzxj4Xebe8G2k5B/MGqHvESKceVNeU/VBtjMDzSLsJhMtpOZwg9cajBISIJ7KV8a2Fq/zM95zT42zQ+QBe91hMp7ifm+aI1TXT+TwdWePWw5m+tY+cCCsL6kDbSSfu6vS+E0sLzUJQj4aG/oqxc8j6VJ9GhWP5zd9fITza2PBBgpY3NFPA9T7GnoeJBkX4v5j8A8Zk+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BWQ+fRricqNIP7h/2BmEzzbBLAM49yuuDU1s6e4Ks68=;
 b=QhgIBj8aqwOxN+NO+BAqrlIkDveUI013U2vuF0sukNIy6WHonFPTCZ1a3Xt/DlpshK/gG1n3zLDD7B6Y12nAjsBEDK3sPAnTcYx4VsxL4CjPKCF+r9NnKRkxQ2bkkkkphm3nfxqsz8pg0QubyoB+TO2qP992HDwB7DNKQl6+s74=
Received: from SJ0PR13CA0082.namprd13.prod.outlook.com (2603:10b6:a03:2c4::27)
 by SA1PR12MB6703.namprd12.prod.outlook.com (2603:10b6:806:253::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 12:42:10 +0000
Received: from SJ1PEPF000023CC.namprd02.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::c4) by SJ0PR13CA0082.outlook.office365.com
 (2603:10b6:a03:2c4::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3 via Frontend Transport; Fri, 21
 Aug 2026 12:42:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000023CC.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Fri, 21 Aug 2026 12:42:09 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 21 Aug
 2026 07:42:04 -0500
Received: from junhua-PC.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Fri, 21 Aug 2026 07:42:02 -0500
From: Junhua Shen <Junhua.Shen@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Jesse Zhang
 <Jesse.Zhang@amd.com>, Sunil Khatri <sunil.khatri@amd.com>, Honglei Huang
 <honglei1.huang@amd.com>, Huang Rui <ray.huang@amd.com>, Yiru Ma
 <yiru.ma@amd.com>, Junhua Shen <Junhua.Shen@amd.com>
Subject: [PATCH i-g-t v1 4/4] lib/amdgpu: add CONST_FILL packet type and pass
 caller fill value through
Date: Fri, 21 Aug 2026 20:41:52 +0800
Message-ID: <20260821124152.19670-5-Junhua.Shen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260821124152.19670-1-Junhua.Shen@amd.com>
References: <20260821124152.19670-1-Junhua.Shen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CC:EE_|SA1PR12MB6703:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b056a80-a13c-4fe6-67f4-08deff819da8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|23010399003|36860700016|22082099003|18002099003|20052099010|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 9lpWwGR2SP+RzUUHI1jKgB68WF0qf/2Egda3a/MC0MQulDWgOocjOL46oUHXaSgmxL/9jlol/KGwl5pwbwWGmDMRoDh+hFrDe0Yuk1MmYznJ6z0rQWyF/vJbyMjNgGpjf5JqQiFn1093HRu/CArSWIMBomltKKekCv9F4CyryZgV7VcB2yiOyMIlidNNMuDzxzHygwo/5QfoFcwId2d/XwsbBDx/wpt3J27ZGFRq/fE/dUIlNv2SRut++dMkujAEGPiW7lNayMpM/U+Wz8qfc01EE69aTs0Y7KdPyG4UpL3elSztVCTXQZoaCutHBmZeGoUE4aD5+JQieEYs4vUAIgMNtr3ubZXprTpgPvjIWXVWadPVjxWEHOCg83JWIeIvRJCD4rR61Mfmr/5pF7ABtJMKO9WykPiRRh/bdHUkJYiXigZTVNc9l0wcLXe7KDi4klBjryesN9i3t1PxH3kfiyLXJyAcWPGkK7dx3GGmDRsgHjL7hJh6jzzf5Pw/MXiyQ8KZ2N2fezZzOUmI93CedksPWpRADyB1RZoJsoomTQMU7lJ4mnSH1ExJ3vigI8LClOkD6vPlmXqyX/6C/Mgl+BWWiw6EzhFv/gCtCtmtLQXeFQ/UYesBQAjhsgCHBGViDO4PEfB/G0LrQlwJZXFlVfcQZxHsXWz+A0mp41pWBMneV8ndJMZNTg6/AiWIYQYSB7psVMayDiCT14baSG4clA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(23010399003)(36860700016)(22082099003)(18002099003)(20052099010)(10067099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: BddbXvgEnyCDCnKzVn4GBSR6Hjv25ijdEIVydqnLhdkMIYViw6K1gv5Ek+Po/p7u59A/ejt65gHbEkCd2T7DDOxPVDhpWS4W5ZjYBvyF2lncOv4kFu6RoEtlLFXPn3l3x+CyXM9HVYTQYWGUtov+Z1bsDcgl3qHXcw664uNxNwXYEXDdMBv8BNqQFZAk8is0O7M2Jh5YlWzBrlfD2BrMfH8cDc0tXAbQfSTb6E9nRJEG0SvakXNdRaYEzS03L3tmuVDzbRavGO3yAA13JEbw4exz0rgoqVJw5MLVtapUtJ991MAhAmEH61ClcFKH2zFx8uHfEUIeQI7glppHvSInksKAseCqnjtWI7RF7+k7yKK7PKoR6w6+fib580gQy7sIkjapyQmJcrVdh4eb5rSE/uGq4Co2bpNTncb0GOUyXITdBlZtxoRVRjdz/ygEBJ5g
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 12:42:09.3465 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b056a80-a13c-4fe6-67f4-08deff819da8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6703
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

Add a CMD_PACKET_CONST_FILL packet type with a per-packet size guard, and
pass the caller-supplied fill value (write_data/write_data_valid) through
write_linear and const_fill in the IP block builders.

Signed-off-by: Junhua Shen <Junhua.Shen@amd.com>
---
 lib/amdgpu/amd_command_submission.c | 73 +++++++++++++++++++++++++++++
 lib/amdgpu/amd_command_submission.h |  3 ++
 lib/amdgpu/amd_ip_blocks.c          | 20 +++++---
 lib/amdgpu/amd_ip_blocks.h          |  2 +
 4 files changed, 92 insertions(+), 6 deletions(-)

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index 261ae096c..54e101882 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -1088,6 +1088,8 @@ static void cmd_reset_packet_operands(cmd_context_t *ctx)
 
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
+					 const char *op)
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
@@ -1268,6 +1305,7 @@ int cmd_place_packet(cmd_context_t *ctx, const cmd_packet_params_t *params)
 		    ctx->ring_ctx->bo_mc2 = params->dst_addr;
 	    igt_assert_f(ctx->ring_ctx->bo_mc && ctx->ring_ctx->bo_mc2,
 			 "COPY_LINEAR requires source and destination addresses\n");
+	    cmd_assert_size_within_packet_limit(ctx, params->size, "COPY_LINEAR");
 	    ctx->ring_ctx->write_length = params->size;
 
 	    result = ctx->ip_block->funcs->copy_linear(ctx->ip_block->funcs,
@@ -1275,6 +1313,26 @@ int cmd_place_packet(cmd_context_t *ctx, const cmd_packet_params_t *params)
 						      &ctx->ring_ctx->pm4_dw);
 	    return result;
 
+	case CMD_PACKET_CONST_FILL:
+		if (!ctx->ip_block->funcs->const_fill)
+			return -ENOTSUP;
+
+		/* Destination operand comes from the caller; params->data is the
+		 * fill pattern written to every DWORD of the range. */
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
@@ -1340,6 +1398,21 @@ int cmd_submit_copy_linear(cmd_context_t *ctx, uint64_t src_addr, uint64_t dst_a
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
index b56fb68b8..8da468988 100644
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

