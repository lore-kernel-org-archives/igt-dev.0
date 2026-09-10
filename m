Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5430C79F9F
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 08:21:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF9310F369;
	Thu, 10 Sep 2026 08:21:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Aoh2cKcV";
	dkim-atps=neutral
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012036.outbound.protection.outlook.com [52.101.53.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A7E710F374
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 08:20:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ocKJ3XX5TP0w5953GyVWI3cxh9nrbg9btsysqSaqgoO76QCkw7NN4v/8T/WljKbVTAmVh2SCABPMfDezCT4sRCktjEg/qM1J3guRTiZNoQHddI42JhB08vYYE9wfME1Fht3tAE9fyLETltWB5ndmPT3KM95Ixs1vkePYpc6TqnHVMV+g7qx7ugHBAICiFLVxj++G+tE5KQEkOz+ufb4J3Vy7/DMOJr9dlMq7QTY4zuoC28OpQd04g0p7L1/APIHgLGGF5YWZIckK6VQLk0eHaZkMM35mS7E3C2TwQWx0SXfUWnSBRHSzXeqDXHHYajCMidPXJEzf4Gq6bwfh93Zi2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T/62vaVgSb8lJ9bUEayRAt0IkyTRCa9He3B6kzk9IGo=;
 b=vixsv3GKPT6NexVBuJmPk6MwIufR7dbM6qjKQMCe+CRRRlyzyfzGgRzB/sf3ITqIT5Xp9A6YMZGd407h7Imhcg+FJmcaUJQQY9DOWvP0+4fwL2WBPKt3t+az/r7WzdulZLvnToupeFX7jNa8Vt5o/Tx10sHlECOFoO3BBawZ7HjLTaKCTmsPpZeLFfq8KXNgwCBiA4N2DMjlIPcGSDGnXvO/KR4IQopSJVo/wyc2T/1tXRztxp7TzrLW7CV6P+ypMQwW6sV563lynUJV5Xbr21wf2DoitxovTi+ppohf9pNZ7JfI/nIpRvFUXiXFJik5qD+u67lnY8pwDTiVxoANug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T/62vaVgSb8lJ9bUEayRAt0IkyTRCa9He3B6kzk9IGo=;
 b=Aoh2cKcV8mMFBSW9dsiJSVJjdry7VZynSHGQrec3gSGelgNa3HUIqTdNCJcZTy74HBGKL6zPqhl2a0/DaIDDkE2SkzsRabsiRriC5KQpjzm6eQS1s7KJc5M7i5S62lOXWY6xazfg3BHf4V1m+fpKZPTF3Qkp+/PyMQUy9rserUg=
Received: from BN9PR03CA0132.namprd03.prod.outlook.com (2603:10b6:408:fe::17)
 by BY1PR12MB8448.namprd12.prod.outlook.com (2603:10b6:a03:534::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 08:20:04 +0000
Received: from BN6PEPF00000075.namprd03.prod.outlook.com
 (2603:10b6:408:fe:cafe::ae) by BN9PR03CA0132.outlook.office365.com
 (2603:10b6:408:fe::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.8 via Frontend Transport; Thu, 10
 Sep 2026 08:20:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN6PEPF00000075.mail.protection.outlook.com (10.167.248.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 08:20:03 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 03:20:03 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 03:20:03 -0500
Received: from junhua-PC.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Thu, 10 Sep 2026 03:20:01 -0500
From: Junhua Shen <Junhua.Shen@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Jesse Zhang
 <Jesse.Zhang@amd.com>, Sunil Khatri <sunil.khatri@amd.com>, Honglei Huang
 <honglei1.huang@amd.com>, Huang Rui <ray.huang@amd.com>, Yiru Ma
 <yiru.ma@amd.com>, Junhua Shen <Junhua.Shen@amd.com>
Subject: [PATCH i-g-t v2 2/2] tests/amdgpu: replace execute_compute_dispatch
 with amdgpu_compute_copy_dword
Date: Thu, 10 Sep 2026 16:19:51 +0800
Message-ID: <20260910081951.68221-3-Junhua.Shen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910081951.68221-1-Junhua.Shen@amd.com>
References: <20260910081951.68221-1-Junhua.Shen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PEPF00000075:EE_|BY1PR12MB8448:EE_
X-MS-Office365-Filtering-Correlation-Id: 45b4308f-e4f2-41cc-b59b-08df0f1450cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|23010399003|36860700016|6133799003|3023799007|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: D85ZhRPWE832TDcV0UaGzLPwfU11qEXMl6ezWZR4Gg18Puh/OyhR8qLN8+IdkEvWs7vzpGMu20LK00qEgLHYKX92uM/YSTAqaBRvIE2xzXvI/N5xzA5kLclQGOVrbnmO1AOHuWtx/9o0+kcB1uQlLxabyPyZ0Iq0OU4bKt3xIzHTnj5vu55FhUZIHyfvjZW8TeHUcA+rAH5KbK5XPWmP/xTmMGdC+j7a03Cgv7sPc5qb4Bye8a4EWUQUorMMM86X27RHNS2ubRqqYlETsnRuGlikh59rhmOp8cswEL3qL23Ca7xzfJxSzGXnpldStXl7z2SR6IBXvgLu9t1bCG19in6dpHMFL9AKdSuROcoz9mgLMK8CMeenQc0zz3BqOhWeDl9Nx7Snd2F5vDZMWrUZrxaykVFQsNMVJ523puPXK8uMv3lNhIu/GglWNG7uA/ifwbYMH/PHCAEwUWRY5i8Z4eC5njPCjfzJ95VyZTMit9VqxFJxpfg/EYWd28C06oWo4Slsvn5FUvRmur1rGrM60q1aMhpEkBEtf07sSINsw4nYsz/acbS3Ya9S7R+XtwjRJsxQPfAglLi0jx9FJlpWSON+sauDNziZhsR1CO/1YfnnPLisrLspF9SCoOjjzo3bHLTY8IT0gu+wXiG/DgKTxFsAqxfCVcJvX9nvW8LtLdTQHxYLVkTJAkwV2irXky+37RLRu4hNf4ksgZBrVopLtw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(23010399003)(36860700016)(6133799003)(3023799007)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: RENHWEHdu8x/5BYtuyMWC/FSjGcFpt4WMTTuS3GUZE1NM3Fkq/FTZdE28KOq/6ysiDnwUi9vwDTTEc6T8WlGI6WmbRhizwIJwpIiCV5TTVmMOsYdzi27FLZSVnXCKO5U2PgSv7vk/pBgc6o856Y3KaI4eaNh0AfwPu6Tz8Iflhr7l9ZXUYozVOnrX8W6/y3sZ1chC57V6gP1zfKnPguGjcnSZFbGr/mCEFFPrgwiRLbnJn5rr2KbjHhcdUU9Mn/l+WPpcsjSE9FrCMLzw6kal0bsdxOxYXSch2Ay7Nqn2SwkC0n6idin1xI0wv0/T7KwMYP5jJcAvuBSRUOyKyJow2vFVIS2Cqr9tpUNVLshW8pnoQJgK+dcgmDiW+GCAgOmWq/E74pllgCCjWhqQdKGV6+z4f41dcGZ2VY1gBQqm/5xbwljSL6c6ZO/etPKCjnQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 08:20:03.8948 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45b4308f-e4f2-41cc-b59b-08df0f1450cd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN6PEPF00000075.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR12MB8448
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

Switch amd_mem's ptrace VRAM verification from execute_compute_dispatch()
to the new amdgpu_compute_copy_dword() helper, and drop the now-unused
execute_compute_dispatch().

Signed-off-by: Junhua Shen <Junhua.Shen@amd.com>
---
v2:
 - drop the amdgpu_llvm_asm_init()/amdgpu_llvm_asm_shutdown() wrapper
   around the verification call; the LLVM assembler and compute-IP
   lifecycle are owned inside amdgpu_compute_copy_dword() via
   copy_dword_shader_get(), which reports failure when either is
   unavailable. (Jesse Zhang)
 - rewrite the execute_shader_verification() doc comment to describe the
   actual behaviour (dispatch a CopyDword shader and verify readback)
   instead of "assembles the shader code". (Jesse Zhang)
 - thread the VRAM source BO and GTT destination BO through
   execute_shader_verification() into amdgpu_compute_copy_dword().

 .../compute_utils/amd_dispatch_helpers.c      | 165 ------------------
 .../compute_utils/amd_dispatch_helpers.h      |   7 -
 tests/amdgpu/amd_mem.c                        | 142 +++++----------
 3 files changed, 43 insertions(+), 271 deletions(-)

diff --git a/lib/amdgpu/compute_utils/amd_dispatch_helpers.c b/lib/amdgpu/compute_utils/amd_dispatch_helpers.c
index dd85b750e..a26022028 100644
--- a/lib/amdgpu/compute_utils/amd_dispatch_helpers.c
+++ b/lib/amdgpu/compute_utils/amd_dispatch_helpers.c
@@ -190,171 +190,6 @@ int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base *base, uint64_t shader_addr,
 	return base->cdw - offset_prev;
 }
 
-/**
- * execute_compute_dispatch - Execute a single compute dispatch for memory copy
- * @device: AMDGPU device handle
- * @version: GPU version for register programming
- * @shader_mc_addr: Shader buffer GPU address
- * @src_mc_addr: Source memory GPU address to read from
- * @dst_mc_addr: Destination buffer GPU address to write to
- * @expected_value: Expected 32-bit value for verification
- *
- * This function sets up and executes a compute dispatch that copies a single DWORD
- * from source to destination using a pre-compiled shader. Each dispatch uses
- * completely independent resources to avoid state pollution.
- *
- * Returns: 0 on success, -1 on failure
- */
-int execute_compute_dispatch(amdgpu_device_handle device,
-				   uint32_t version,
-				   uint64_t shader_mc_addr,
-				   uint64_t src_mc_addr,
-				   uint64_t dst_mc_addr,
-				   uint32_t expected_value)
-{
-	amdgpu_context_handle context_handle;
-	amdgpu_bo_handle bo_cmd = NULL, bo_shader = NULL, bo_dst = NULL;
-	uint32_t *ptr_cmd = NULL;
-	void *ptr_shader = NULL;
-	volatile uint32_t *ptr_dst = NULL;
-	uint64_t mc_cmd = 0, mc_shader = 0, mc_dst = 0;
-	amdgpu_va_handle va_cmd = 0, va_shader = 0, va_dst = 0;
-	struct amdgpu_cs_request ib_req = {0};
-	struct amdgpu_cs_ib_info ib_info = {0};
-	amdgpu_bo_list_handle bo_list = NULL;
-	struct amdgpu_cs_fence fence = {0};
-	uint32_t expired = 0;
-	struct amdgpu_cmd_base *base_cmd = get_cmd_base();
-	amdgpu_bo_handle bos[3];
-	int ret = 0;
-
-	/* Create fresh context for each dispatch to avoid state pollution */
-	if (amdgpu_cs_ctx_create(device, &context_handle) != 0) {
-		igt_info("Failed to create context\n");
-		return -1;
-	}
-
-	/* Command buffer for PM4 packets */
-	if (amdgpu_bo_alloc_and_map(device, 4096, 4096,
-	    AMDGPU_GEM_DOMAIN_GTT, 0, &bo_cmd, (void **)&ptr_cmd, &mc_cmd, &va_cmd) != 0) {
-		igt_info("Failed to allocate command buffer\n");
-		ret = -1;
-		goto cleanup_context;
-	}
-	memset(ptr_cmd, 0, 4096);
-	base_cmd->attach_buf(base_cmd, ptr_cmd, 4096);
-
-	/* Shader buffer containing compiled ISA */
-	if (amdgpu_bo_alloc_and_map(device, 4096, 4096,
-			AMDGPU_GEM_DOMAIN_VRAM, 0,
-			&bo_shader, &ptr_shader, &mc_shader, &va_shader) != 0) {
-		igt_info("Failed to allocate shader buffer\n");
-		ret = -1;
-		goto cleanup_cmd;
-	}
-	memset(ptr_shader, 0, 4096);
-	/* Note: shader content should be copied by caller */
-
-	/* Destination buffer for shader output (CPU-visible) */
-	if (amdgpu_bo_alloc_and_map(device, 4096, 4096,
-			AMDGPU_GEM_DOMAIN_GTT, 0,
-			&bo_dst, (void **)&ptr_dst, &mc_dst, &va_dst) != 0) {
-		igt_info("Failed to allocate destination buffer\n");
-		ret = -1;
-		goto cleanup_shader;
-	}
-	*ptr_dst = 0; /* Initialize for verification */
-
-	/* Initialize compute dispatch state */
-	amdgpu_dispatch_init(AMDGPU_HW_IP_COMPUTE, base_cmd, version);
-	amdgpu_dispatch_write_cumask(base_cmd, version);
-	amdgpu_dispatch_write2hw(base_cmd, shader_mc_addr, version, 0);
-
-	/* Program user data registers:
-	* s[0:1] = source address (64-bit)
-	* s[2:3] = destination address (64-bit)
-	*/
-	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 4));
-	base_cmd->emit(base_cmd, 0x240); /* SH0 register offset */
-	base_cmd->emit(base_cmd, src_mc_addr & 0xFFFFFFFF);
-	base_cmd->emit(base_cmd, src_mc_addr >> 32);
-	base_cmd->emit(base_cmd, mc_dst & 0xFFFFFFFF);
-	base_cmd->emit(base_cmd, mc_dst >> 32);
-
-	/* Dispatch compute shader with 1x1x1 workgroup */
-	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PACKET3_DISPATCH_DIRECT, 3));
-	base_cmd->emit(base_cmd, 0x10); /* Dispatch initiator */
-	base_cmd->emit(base_cmd, 1);    /* dim_x */
-	base_cmd->emit(base_cmd, 1);    /* dim_y */
-	base_cmd->emit(base_cmd, 1);    /* dim_z */
-	base_cmd->emit_aligned(base_cmd, 7, GFX_COMPUTE_NOP);
-
-	/* Submit command buffer */
-	bos[0] = bo_cmd;
-	bos[1] = bo_shader;
-	bos[2] = bo_dst;
-	if (amdgpu_bo_list_create(device, 3, bos, NULL, &bo_list) != 0) {
-		igt_info("Failed to create BO list\n");
-		ret = -1;
-		goto cleanup_dst;
-	}
-
-	ib_info.ib_mc_address = mc_cmd;
-	ib_info.size = base_cmd->cdw;
-	ib_req.ip_type = AMDGPU_HW_IP_COMPUTE;
-	ib_req.ring = 0;
-	ib_req.resources = bo_list;
-	ib_req.number_of_ibs = 1;
-	ib_req.ibs = &ib_info;
-	ib_req.fence_info.handle = NULL;
-
-	if (amdgpu_cs_submit(context_handle, 0, &ib_req, 1) != 0) {
-		igt_info("Failed to submit CS\n");
-		ret = -1;
-		goto cleanup_bo_list;
-	}
-
-	/* Wait for completion */
-	fence.context = context_handle;
-	fence.ip_type = AMDGPU_HW_IP_COMPUTE;
-	fence.ip_instance = 0;
-	fence.ring = 0;
-	fence.fence = ib_req.seq_no;
-
-	if (amdgpu_cs_query_fence_status(&fence, AMDGPU_TIMEOUT_INFINITE, 0, &expired) != 0) {
-		igt_info("Fence wait failed\n");
-		ret = -1;
-		goto cleanup_bo_list;
-	}
-
-	if (!expired) {
-		igt_info("Fence not expired\n");
-		ret = -1;
-		goto cleanup_bo_list;
-	}
-
-	/* Verify result */
-	if (*ptr_dst != expected_value) {
-		igt_info("Result mismatch: got 0x%x, expected 0x%x\n", *ptr_dst, expected_value);
-		ret = -1;
-	} else {
-		igt_info("Dispatch successful: got expected value 0x%x\n", *ptr_dst);
-	}
-
-cleanup_bo_list:
-	amdgpu_bo_list_destroy(bo_list);
-cleanup_dst:
-	amdgpu_bo_unmap_and_free(bo_dst, va_dst, mc_dst, 4096);
-cleanup_shader:
-	amdgpu_bo_unmap_and_free(bo_shader, va_shader, mc_shader, 4096);
-cleanup_cmd:
-	amdgpu_bo_unmap_and_free(bo_cmd, va_cmd, mc_cmd, 4096);
-cleanup_context:
-	amdgpu_cs_ctx_free(context_handle);
-
-	return ret;
-}
-
 int amdgpu_dispatch_shader(amdgpu_device_handle device,
 			   const struct amdgpu_dispatch_shader_req *req)
 {
diff --git a/lib/amdgpu/compute_utils/amd_dispatch_helpers.h b/lib/amdgpu/compute_utils/amd_dispatch_helpers.h
index f585d5a0e..ac858d517 100644
--- a/lib/amdgpu/compute_utils/amd_dispatch_helpers.h
+++ b/lib/amdgpu/compute_utils/amd_dispatch_helpers.h
@@ -35,13 +35,6 @@ int amdgpu_dispatch_write_cumask(struct amdgpu_cmd_base *base_cmd, uint32_t vers
 
 int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base *base_cmd, uint64_t shader_addr, uint32_t version, enum cmd_error_type err);
 
-int execute_compute_dispatch(amdgpu_device_handle device,
-				   uint32_t version,
-				   uint64_t shader_mc_addr,
-				   uint64_t src_mc_addr,
-				   uint64_t dst_mc_addr,
-				   uint32_t expected_value);
-
 /**
  * struct amdgpu_dispatch_shader_req - Description of a generic compute dispatch
  * @version: GPU version used for the compute state init (9/10/11/12)
diff --git a/tests/amdgpu/amd_mem.c b/tests/amdgpu/amd_mem.c
index eef869b41..e4a678165 100644
--- a/tests/amdgpu/amd_mem.c
+++ b/tests/amdgpu/amd_mem.c
@@ -2786,122 +2786,73 @@ cleanup_vram:
 /**
  * execute_shader_verification - Execute GPU verification of ptrace results
  * @device: AMDGPU device handle
+ * @vram_bo: VRAM buffer BO (source of the copies)
  * @vram_mc_addr: VRAM buffer GPU address
  * @vram_offset: Offset within VRAM buffer to test words
  * @expected_value1: Expected value for first word (word_before)
  * @expected_value2: Expected value for second word (word_after)
  *
- * This function assembles the shader code and executes two independent compute
- * dispatches to verify that the ptrace-modified values are visible to the GPU.
- * Each dispatch uses completely separate resources to ensure clean state.
+ * This function dispatches a CopyDword compute shader twice to read back the
+ * two ptrace-modified words from VRAM into a CPU-visible buffer, and verifies
+ * that each readback matches the expected value. The shared destination buffer
+ * is re-zeroed before each dispatch so a stale value cannot make the second
+ * check pass, keeping the two checks independent.
  *
  * Returns: 0 on success, -1 on failure
  */
 static int execute_shader_verification(amdgpu_device_handle device,
+				       amdgpu_bo_handle vram_bo,
 				       uint64_t vram_mc_addr,
-				      uint64_t vram_offset,
-				      uint32_t expected_value1,
-				      uint32_t expected_value2)
+				       uint64_t vram_offset,
+				       uint32_t expected_value1,
+				       uint32_t expected_value2)
 {
-	struct amdgpu_gpu_info info = {0};
-	char mcpu[32];
-	uint8_t isa_bin[4096];
-	size_t isa_sz = 0;
-	int r_asm;
-	uint32_t version = 9;
-
-	amdgpu_bo_handle bo_shader1 = NULL, bo_shader2 = NULL;
-	void *ptr_shader1 = NULL, *ptr_shader2 = NULL;
-	uint64_t mc_shader1 = 0, mc_shader2 = 0;
-	amdgpu_va_handle va_shader1 = 0, va_shader2 = 0;
+	const uint64_t src1 = vram_mc_addr + vram_offset;
+	const uint64_t src2 = vram_mc_addr + vram_offset + sizeof(uint64_t);
+	amdgpu_bo_handle bo_dst = NULL;
+	volatile uint32_t *ptr_dst = NULL;
+	uint64_t mc_dst = 0;
+	amdgpu_va_handle va_dst = 0;
 	int ret = 0;
 
-	/* Query GPU information for architecture-specific setup */
-	if (amdgpu_query_gpu_info(device, &info) != 0) {
-		igt_info("Query GPU info failed\n");
-		return -1;
-	}
-
-	amdgpu_family_id_to_mcpu(info.family_id, mcpu, sizeof(mcpu));
-	igt_info("Assembling shader for architecture: %s\n", mcpu);
-
-	/* Assemble shader code */
-	r_asm = amdgpu_llvm_assemble(mcpu, CopyDwordIsa, isa_bin, sizeof(isa_bin), &isa_sz);
-	if (r_asm != 0 || isa_sz == 0) {
-		igt_info("Shader assembly failed (error=%d, size=%zu)\n", r_asm, isa_sz);
+	if (amdgpu_bo_alloc_and_map(device, 4096, 4096,
+				AMDGPU_GEM_DOMAIN_GTT, 0,
+				&bo_dst, (void **)&ptr_dst, &mc_dst, &va_dst) != 0) {
+		igt_info("Failed to allocate destination buffer\n");
 		return -1;
 	}
 
-	/* Determine GPU version for register programming */
-	if (FAMILY_IS_GFX1200(info.family_id)) {
-		version = 12;
-	} else if (FAMILY_IS_GFX1150(info.family_id) ||
-	       FAMILY_IS_GFX1100(info.family_id) ||
-	       FAMILY_IS_GFX1036(info.family_id) ||
-	       FAMILY_IS_GFX1037(info.family_id) ||
-	       FAMILY_IS_YC(info.family_id) ||
-	       info.family_id == FAMILY_GFX1103) {
-		version = 11;
-	} else if (FAMILY_IS_AI(info.family_id) ||
-	       FAMILY_IS_RV(info.family_id) ||
-	       FAMILY_IS_NV(info.family_id) ||
-	       info.family_id == FAMILY_VGH) {
-		version = 10;
-	}
-
-	igt_info("Using GPU version %u for family 0x%x\n", version, info.family_id);
-
 	/* First dispatch - verify word_before value */
 	igt_info("=== First dispatch: reading word_before ===\n");
-
-	/* Allocate separate shader buffer for first dispatch */
-	if (amdgpu_bo_alloc_and_map(device, 4096, 4096,
-				AMDGPU_GEM_DOMAIN_VRAM, 0,
-				&bo_shader1, &ptr_shader1, &mc_shader1, &va_shader1) != 0) {
-		igt_info("Failed to allocate first shader buffer\n");
-		return -1;
-	}
-	memset(ptr_shader1, 0, 4096);
-	memcpy(ptr_shader1, isa_bin, isa_sz);
-
-	if (execute_compute_dispatch(device, version, mc_shader1,
-				 vram_mc_addr + vram_offset,
-				0, /* dst allocated in helper */
-				expected_value1) != 0) {
+	*ptr_dst = 0;
+	if (amdgpu_compute_copy_dword(device, vram_bo, src1, bo_dst, mc_dst) != 0) {
 		igt_info("First dispatch failed\n");
 		ret = -1;
+		goto out;
 	}
-
-	amdgpu_bo_unmap_and_free(bo_shader1, va_shader1, mc_shader1, 4096);
-
-	/* Only proceed if first dispatch succeeded */
-	if (ret != 0) {
-		return ret;
+	if (*ptr_dst != expected_value1) {
+		igt_info("First result mismatch: got 0x%x, expected 0x%x\n",
+			 *ptr_dst, expected_value1);
+		ret = -1;
+		goto out;
 	}
 
 	/* Second dispatch - verify word_after value */
 	igt_info("=== Second dispatch: reading word_after ===\n");
-
-	/* Allocate separate shader buffer for second dispatch */
-	if (amdgpu_bo_alloc_and_map(device, 4096, 4096,
-				AMDGPU_GEM_DOMAIN_VRAM, 0,
-				&bo_shader2, &ptr_shader2, &mc_shader2, &va_shader2) != 0) {
-		igt_info("Failed to allocate second shader buffer\n");
-		return -1;
-	}
-	memset(ptr_shader2, 0, 4096);
-	memcpy(ptr_shader2, isa_bin, isa_sz);
-
-	if (execute_compute_dispatch(device, version, mc_shader2,
-				 vram_mc_addr + vram_offset + sizeof(uint64_t),
-				0, /* dst allocated in helper */
-				expected_value2) != 0) {
+	*ptr_dst = 0;
+	if (amdgpu_compute_copy_dword(device, vram_bo, src2, bo_dst, mc_dst) != 0) {
 		igt_info("Second dispatch failed\n");
 		ret = -1;
+		goto out;
+	}
+	if (*ptr_dst != expected_value2) {
+		igt_info("Second result mismatch: got 0x%x, expected 0x%x\n",
+			 *ptr_dst, expected_value2);
+		ret = -1;
 	}
 
-	amdgpu_bo_unmap_and_free(bo_shader2, va_shader2, mc_shader2, 4096);
-
+out:
+	amdgpu_bo_unmap_and_free(bo_dst, va_dst, mc_dst, 4096);
 	return ret;
 }
 
@@ -3046,19 +2997,12 @@ static void ptrace_access_invisible_vram_test(amdgpu_device_handle device)
 		igt_assert_eq(*word_after,  original0);
 		igt_info("CPU verification passed. Attempting shader readback...\n");
 
-		/* GPU verification using refactored helper functions */
-		if (amdgpu_llvm_asm_init() == 0) {
-			if (execute_shader_verification(device, mc_address_vram, VRAM_OFFSET,
-							(uint32_t)original1, (uint32_t)original0) == 0) {
-				igt_info("GPU shader verification passed\n");
-			} else {
-				igt_info("GPU shader verification failed\n");
-				/* Continue test execution even if GPU verification fails */
-			}
-
-			amdgpu_llvm_asm_shutdown();
+		if (execute_shader_verification(device, vram_bo, mc_address_vram, VRAM_OFFSET,
+						(uint32_t)original1, (uint32_t)original0) == 0) {
+			igt_info("GPU shader verification passed\n");
 		} else {
-		    igt_info("LLVM assembler unavailable; skipping shader verification.\n");
+			igt_info("GPU shader verification failed\n");
+			/* Continue test execution even if GPU verification fails */
 		}
 
 		igt_info("ptrace-access-invisible-vram test: PASSED\n");
-- 
2.34.1

