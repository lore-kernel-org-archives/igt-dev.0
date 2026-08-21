Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56193C5DF81
	for <igt-dev@archiver.kernel.org>; Mon, 24 Aug 2026 08:19:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0461B10E36F;
	Mon, 24 Aug 2026 08:19:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zVLQ8yuO";
	dkim-atps=neutral
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013040.outbound.protection.outlook.com
 [40.107.201.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3556210E0A5
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Aug 2026 14:22:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gd8sXouf7h/bbi0RfoKBuqtHzGvm2HXb0TFQy0FIZndzl+rrFT8sFpbFLi53S4vsTRncG/Bue0apyit1y6maJcECJ/8f82V1lPrGsVQlyZB0lqqWP5yF9BfQyFVWednAytfhpuNhJGiC7hbh8ZIvJGGu9Mu6Rhxbo3R0YN/THx6zxxI7ArP6Leq56gUkLifu8iJLuYwKosxJ1uQqHsju6BPfYzoj7sKAsHsYJLeg7k6BJ9B0iMTmEJrqSfEYXf0yPy8OB4DoZnEM8+bNRYxgx6ufdh1G/op5gHS/yWmNWszJqggVHoQ56tMZs2SXVWTXr8sgDfw0BtHlwvkuM5H0jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xaKOL1HeVa3A4F0/tZGBYdfjB8oTAVvQNOV9JkVmqb4=;
 b=WgeTMDl2sGfz2ngBbJJQzIUNEMGme6dFXrR7x7QWzLGMVLLnDZThGEcKmsKVroH9J5aAUkrIQawiWm8tAm0BadL6358fp5jbTigypKwI/UmQU7LHL/wCMO9cB2bKVfMBI0J4EUvlhT0rxEW5Jy6jKFEV3J0+gqB2koqnmmTTpDDEuD4NxXRHiUao6luQIpuhyEbOqg3c7SJ5F0nluVYIP6odw213KziSSc6jY9kWXRoDQu6URGccySwkE/n5as1mx5jHUD5aOuCupasgpokBOrjEe7HLGVahHfy05BvOHCOraUsDgWdino4xv2ovUP2sychKpKD9GvFDbqzq4E8IkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xaKOL1HeVa3A4F0/tZGBYdfjB8oTAVvQNOV9JkVmqb4=;
 b=zVLQ8yuODHAF2hUW3WOcPfSethK5ZHiMww2mlbeyDSCVplotlNQt5u2IVnCVuxcsQLQ3Jhn0Vo1eHs80pnR/OpHiCcW5scJAGzckQSRrRL4cTsWKNI5E33r7rEKTbs81FIDK2trALimhzu7A1Wb6oupy4BxkRhfFrgAFnFCOJyU=
Received: from SJ0PR03CA0161.namprd03.prod.outlook.com (2603:10b6:a03:338::16)
 by LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 14:22:51 +0000
Received: from BY1PEPF0001AE1B.namprd04.prod.outlook.com
 (2603:10b6:a03:338:cafe::31) by SJ0PR03CA0161.outlook.office365.com
 (2603:10b6:a03:338::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.10 via Frontend Transport; Fri,
 21 Aug 2026 14:22:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BY1PEPF0001AE1B.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Fri, 21 Aug 2026 14:22:50 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 21 Aug
 2026 09:22:50 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 21 Aug
 2026 09:22:49 -0500
Received: from junhua-PC.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Fri, 21 Aug 2026 09:22:48 -0500
From: Junhua Shen <Junhua.Shen@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Jesse Zhang
 <Jesse.Zhang@amd.com>, Sunil Khatri <sunil.khatri@amd.com>, Honglei Huang
 <honglei1.huang@amd.com>, Huang Rui <ray.huang@amd.com>, Yiru Ma
 <yiru.ma@amd.com>, Junhua Shen <Junhua.Shen@amd.com>
Subject: [PATCH i-g-t v1 2/2] tests/amdgpu: replace execute_compute_dispatch
 with amdgpu_compute_copy_dword
Date: Fri, 21 Aug 2026 22:22:42 +0800
Message-ID: <20260821142242.34700-3-Junhua.Shen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260821142242.34700-1-Junhua.Shen@amd.com>
References: <20260821142242.34700-1-Junhua.Shen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1B:EE_|LV5PR12MB9779:EE_
X-MS-Office365-Filtering-Correlation-Id: e79d97f9-45c3-4f23-b349-08deff8faeb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700016|23010399003|82310400026|376014|22082099003|18002099003|3023799007|56012099006|10067099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 2C8Alk9fi8XpxE67Bljh18ztkdlJDaBcruo9QeToieGxJeNXBR7O3a8pOTq9xWoYrUALEy9zJCRBPxK4tuz3vqLS9NM+duUhMVkCmWkuxB9FjCZY+Q1sf5UCjCY+HosjdI7QfFkJKv6IiYJn28u3ZoXxV5LhHqrz+Xm245L8tN8ddEKK9SoqMSH683/AKRsL3nOdLaQeTj2x6wCo/jPkOxHok6FFxaZFCphvYCT5bdrlOTuyT38NnSmsROWWHclkfnkYoLj0FU/xBrGFmZnV9vs/x9ie6DcpKV/FwYQHHQTIh5Z0jlYF37QTeMx5vTwtxr0Nnt9UZB3MiTxvGrLdnSkyZGNawMm3rCJQfCWR9QLzEKsoLAdvLm/QTzLG+bV729xUMy2pUOFkHWb/ce7Khy+WwB0110MDZOdBnY7l9wUVd953o0oEHrDmdXfTPxHwm1KzWQvAh4Z6OkEWxu8qvy7c2BurJm4NdMKX0S+m0E6ZzVZtTXAXk2w774LXBS2tTg2FpIA0U4neAw6QcjgcZVz6z7vUVLWNrS9X7qLT25is37/ILujYyGW5Ti/O6CjbzxLiOdsLXeCiUVHGHATG2Ia/fQlmxYRof5I53upnDFYdzA17cyk+tZjAdyeX7IuacjCOMm5naGoCMo+gfpsqMJdQ+kgATMhRyu0e4zNSn4bDrF77uzKa3jTwBPeoKDwudCppJls9wn81AxLJN5gGcw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700016)(23010399003)(82310400026)(376014)(22082099003)(18002099003)(3023799007)(56012099006)(10067099003)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: blcnDyPlprmx9+pPIHwg9bJiYn3xjeR175lmKIXbcmYpKZ9ybILU280iYimpG1eJc4lU7qD5SwAgT6Gqm4fGRQ0Ry3viKTF4CU/2yD44YuNn2gT9vQT/Z/n8bZZmftn8ZvXrxPaCYoblOa3UYzffnznjnnj1LrRYni44ZijYsILEc767W/F7+dYrKOgCMG8GuWzNvI/8Pb/Q0QsksIwra0U4nVAKZp7dWnEcLLzoTaFu1QmfFAZio6CdrR55sFuxxneO9gtNbZY4UUEn9b2WE9i08Dh6XHiWu9EqMEVe11ptLDFRgfWC9GT9abeqKi8sDxADzlPcR+ZM/Gd0zBD4w5mED8onRzCXFMOCDJo15TqJ8U3XCgBO+M2kKybcpGsdzF42z+fimSEgR879NfgwtooOirgEP8p/02JOeTap046WjNHOIbB/Lp3FhP1wO0bl
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 14:22:50.8751 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e79d97f9-45c3-4f23-b349-08deff8faeb9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9779
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

Switch amd_mem's ptrace VRAM verification from execute_compute_dispatch()
to the new amdgpu_compute_copy_dword() helper, and drop the now-unused
execute_compute_dispatch().

Signed-off-by: Junhua Shen <Junhua.Shen@amd.com>
---
 .../compute_utils/amd_dispatch_helpers.c      | 165 ------------------
 .../compute_utils/amd_dispatch_helpers.h      |   7 -
 tests/amdgpu/amd_mem.c                        | 109 +++---------
 3 files changed, 28 insertions(+), 253 deletions(-)

diff --git a/lib/amdgpu/compute_utils/amd_dispatch_helpers.c b/lib/amdgpu/compute_utils/amd_dispatch_helpers.c
index 7ad1efa16..eb6a1e707 100644
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
index 8890e99b4..39b6a6fbd 100644
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
index eef869b41..b924d66bf 100644
--- a/tests/amdgpu/amd_mem.c
+++ b/tests/amdgpu/amd_mem.c
@@ -2803,105 +2803,52 @@ static int execute_shader_verification(amdgpu_device_handle device,
 				      uint32_t expected_value1,
 				      uint32_t expected_value2)
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
+	if (amdgpu_compute_copy_dword(device, src1, mc_dst) != 0) {
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
+	if (amdgpu_compute_copy_dword(device, src2, mc_dst) != 0) {
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
 
-- 
2.34.1

