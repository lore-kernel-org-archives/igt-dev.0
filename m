Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 780D4C88E41
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 08:22:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF94D10F369;
	Thu, 10 Sep 2026 08:22:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3jpk6TDx";
	dkim-atps=neutral
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013022.outbound.protection.outlook.com
 [40.93.201.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F3E410F375
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 08:20:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QH2AQ7KOkSpihW5arXQHif3hqIfqU6m4TfbtL1TXkPxFAVy1yST9JAOvE9/M5UlfoWm0UyNZIejbHcOmbxUmzphKTyRy4KKvqZbBu40QTp46o/cut0hCq9BfilGVurWojfIhRGtpWsEaIsEjdi9qlB07jRZOSHSfXriKGVNzYzalMSOnZ5kL2Xvz/uqF/dcxVLKKsi36mIg4LjFkxaTcVl7vkWfwZGSGNfkyUbOqokse1zAJjtEINNxGLhscN0e6AVe4d6OMhUl/E7t+Dja9eiehfdr6zluq041MdvucfEHDBk62yuYWf10pNEOGoMTlGJ7M/cL7Q9xHTjiKTJwjOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dmsjm6bEZv4W8SWRP/y0sP5OBjKoPWo8elCZIVnCtnY=;
 b=nzCPNUmEWS0PCRI3EkG7RYYMrNn7IChb2zPrVWu7yfZSxicSnuhddo4L+iAsPbgzDPV3aB/5mJFL5c3/9z14j3m8iyiHF5+ilHv+GcWMVuhAT3j62cE9IxSnv057Ez12xlhblH9yOWEWsflPVn6jhPBjxJ6d8sSam3sElRlG3+b6Hbw+VlXNhT9FIZzBjAjQmgJ5vhE5hfUVZkDEbEandH4WJIM/i56kPxE/8hI2c7QmkyBsTEG2uAcAh41Z/1JgWFpiZBhXiOZ4uLEkt5VBCGobbYpSss/2Tcwfhbqsujoefe8YksMo4Vxo5dovJv90TLjp4S5/CCbr/nB3BhPeNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dmsjm6bEZv4W8SWRP/y0sP5OBjKoPWo8elCZIVnCtnY=;
 b=3jpk6TDxW0RgGLqnN0kCDFngVn1wPDvg7pAhwaIWptPgO4mtJg+kIrfRg6u8vgxgx1jeyuQcyws1nHujh0ipen0wZ1F5yK+H1JM2rukoyEbt652xK1dzD/L2fOjRthpCf+lBG4YkGVljpeCFclcbfRrWY6okjyo1UWe5B3uOoeY=
Received: from MW4P223CA0018.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::23)
 by CYXPR12MB9428.namprd12.prod.outlook.com (2603:10b6:930:d5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 08:20:02 +0000
Received: from CO1PEPF00012E60.namprd05.prod.outlook.com
 (2603:10b6:303:80:cafe::8b) by MW4P223CA0018.outlook.office365.com
 (2603:10b6:303:80::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Thu, 10
 Sep 2026 08:20:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E60.mail.protection.outlook.com (10.167.249.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 08:20:01 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 03:20:01 -0500
Received: from junhua-PC.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Thu, 10 Sep 2026 03:19:59 -0500
From: Junhua Shen <Junhua.Shen@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Jesse Zhang
 <Jesse.Zhang@amd.com>, Sunil Khatri <sunil.khatri@amd.com>, Honglei Huang
 <honglei1.huang@amd.com>, Huang Rui <ray.huang@amd.com>, Yiru Ma
 <yiru.ma@amd.com>, Junhua Shen <Junhua.Shen@amd.com>
Subject: [PATCH i-g-t v2 1/2] lib/amdgpu: add generic compute dispatch and
 copy_dword helpers
Date: Thu, 10 Sep 2026 16:19:50 +0800
Message-ID: <20260910081951.68221-2-Junhua.Shen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910081951.68221-1-Junhua.Shen@amd.com>
References: <20260910081951.68221-1-Junhua.Shen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E60:EE_|CYXPR12MB9428:EE_
X-MS-Office365-Filtering-Correlation-Id: 2452bdbd-29d8-4efc-2943-08df0f144fb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700016|23010399003|82310400026|6133799003|3023799007|10067099003|18002099003|22082099003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: ocTbiWSL3RqbLjboGKx6wFN63JxD/VReVRz9lOPyniwsEgcoE5OPFJZKTBGtnSF4jrNUwkhTZiTw8uoMXIjphHT89umRBmWbMKu44AThBoS+G4rgxm2AfQ2PUxqD0/8PzlrfLSa37l+MfVbg37IDXVTDex5BLFEk5SP9R5D7Gt1OtVGas89qHVhyl48S7aADMpkQ6/HGKILO3VjnTcQ7KRRAEmr8R7cWxND9hxIhzPYLRXKHoDTiedWqyrTV716gKdFUuhWO82VzT3g92li3wMr9yccDCKyw+2WYvzRx96nTbZJCPPiTyPWUiU1csbSfUi5GghnoC3bku28VHdvrD5wFbTahy2fh0sAeyohucdjveHiqMatoQLIdZAwde0y0d04EpTVqtiYCIHa3eWDfylLz6I41YLYfpUf+lGUNzgfFpCkDVM9LkQ6NU6HRgtWqBXQLQZ/zbCIFestTm/o1FX6r/fw8M9SqAqoWlIDv8URi8gQjGxcm8NiZsIoe42jojkQvgS+2bUiQLXp/H9vG2zILtcX6HHeBkJc8qIkNoUAiGUW3NrDxrMlkEtwarDCsi0WpAgmFJhO2msZmF5wk1mj/4/kf0xi1bFGD2rMDP7bj5yW0BemvEgsl6oxodlaPgmJlUCEJSS1DUzK+/mtCfmHLvlGu4Zh8TmyTVpaon3MjWGPwPQxMB4B0GFQL4zXwlRe94euqi9JBFLjocbkvoA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700016)(23010399003)(82310400026)(6133799003)(3023799007)(10067099003)(18002099003)(22082099003)(5023799004)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: wKwMiXO1U2H66dV/fgK+YNEkrMbabfp/ZOBq156B4TPWp7J4qxpBeWnwcSDo5DvrXZWdscjTg7Oc/+0gCTkqtz3vDDEEkRqscqb6+Gbgaiq6LOXPxqaAiZFzmw9+S+FQaAfoX00L6S0MW7damvQLhlhkwRSRaUqlRAxibTFuPQ8dWzTP5Qzt8e1AA4ktE8p9+4mfu5Qk7ZYgp8kZTFp4oqm0MFvG8NJXXCk5scho4MowJGEcdLV+tVH4u1ELtCb0qMgxqW8hsPCQYv52zcmVmMVKO3rhACPiVxksnbFxUTSrYcRi4EJZA2vNeVF5DecOeHSlGdK7le3xkHOixrMenoIq8DT8iotERvfiEdjK6Dxq8NVFLS5bDJdtRbdL3KtVQytIxMShKzgk9qLm0MTQ+Tyd4c3HZ5L+FjvMd+h3ucL+cG6BufgYxnQWtnMMk6zU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 08:20:01.9638 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2452bdbd-29d8-4efc-2943-08df0f144fb6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E60.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9428
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

Add amdgpu_dispatch_shader(), a family-agnostic compute dispatch emitter
driven by a caller-filled amdgpu_dispatch_shader_req. The caller supplies
all shader-binding state (RSRC*, thread dims, user data, grid and BO list),
so any shader can be run without changing the emitter. It creates the
context, allocates the command buffer, emits the compute state and
DISPATCH_DIRECT packets, and submits.

Also add amdgpu_compute_copy_dword(), a small wrapper that builds a
single-DWORD copy shader for the current GPU family and dispatches it,
for use as a lightweight submission workload in tests.

Signed-off-by: Junhua Shen <Junhua.Shen@amd.com>
---
v2:
 - amdgpu_compute_copy_dword(): take src_bo/dst_bo and register the
   accessed data BOs in the dispatch BO list alongside the shader BO so
   the driver keeps them resident; both handles are optional (NULL) for
   addresses with no backing GEM BO (e.g. SVM/HMM). Update the header doc
   accordingly. (Jesse Zhang)
 - use AMD_IP_COMPUTE (enum amd_ip_block_type) for get_ip_block() instead
   of the libdrm AMDGPU_HW_IP_COMPUTE constant. (Jesse Zhang)

 .../compute_utils/amd_dispatch_helpers.c      | 348 ++++++++++++++++++
 .../compute_utils/amd_dispatch_helpers.h      |  83 +++++
 2 files changed, 431 insertions(+)

diff --git a/lib/amdgpu/compute_utils/amd_dispatch_helpers.c b/lib/amdgpu/compute_utils/amd_dispatch_helpers.c
index 180fbdd40..dd85b750e 100644
--- a/lib/amdgpu/compute_utils/amd_dispatch_helpers.c
+++ b/lib/amdgpu/compute_utils/amd_dispatch_helpers.c
@@ -10,6 +10,12 @@
 #include <amdgpu_drm.h>
 #include "amdgpu/amd_PM4.h"
 #include "amdgpu/amd_ip_blocks.h"
+#ifdef AMDGPU_LLVM_ENABLED
+#include "amdgpu/shaders/amd_llvm_asm.h"
+#else
+#include "amdgpu/shaders/amd_llvm_asm_stub.h"
+#endif
+#include "amdgpu/shaders/amd_shader_store.h"
 #include "igt.h"
 
 int
@@ -348,3 +354,345 @@ cleanup_context:
 
 	return ret;
 }
+
+int amdgpu_dispatch_shader(amdgpu_device_handle device,
+			   const struct amdgpu_dispatch_shader_req *req)
+{
+	amdgpu_context_handle context_handle;
+	amdgpu_bo_handle bo_cmd = NULL;
+	uint32_t *ptr_cmd = NULL;
+	uint64_t mc_cmd = 0;
+	amdgpu_va_handle va_cmd = 0;
+	struct amdgpu_cs_request ib_req = {0};
+	struct amdgpu_cs_ib_info ib_info = {0};
+	amdgpu_bo_list_handle bo_list = NULL;
+	struct amdgpu_cs_fence fence = {0};
+	uint32_t expired = 0;
+	struct amdgpu_cmd_base *base_cmd = get_cmd_base();
+	amdgpu_bo_handle *resources = NULL;
+	uint32_t num_resources = 0;
+	uint32_t i;
+	int ret = -1;
+
+	if (!req || !req->shader_mc_addr) {
+		igt_info("Invalid dispatch request\n");
+		goto cleanup_base;
+	}
+
+	/* Create fresh context for each dispatch to avoid state pollution */
+	if (amdgpu_cs_ctx_create(device, &context_handle) != 0) {
+		igt_info("Failed to create context\n");
+		goto cleanup_base;
+	}
+
+	/* Command buffer for PM4 packets */
+	if (amdgpu_bo_alloc_and_map(device, 4096, 4096,
+	    AMDGPU_GEM_DOMAIN_GTT, 0, &bo_cmd, (void **)&ptr_cmd, &mc_cmd, &va_cmd) != 0) {
+		igt_info("Failed to allocate command buffer\n");
+		goto cleanup_context;
+	}
+	memset(ptr_cmd, 0, 4096);
+	base_cmd->attach_buf(base_cmd, ptr_cmd, 4096);
+
+	/* Generic compute state init (version-specific defaults) */
+	amdgpu_dispatch_init(AMDGPU_HW_IP_COMPUTE, base_cmd, req->version);
+	amdgpu_dispatch_write_cumask(base_cmd, req->version);
+
+	/*
+	 * The SET_SH_REG offsets below are hardcoded (0x20c, 0x212, 0x213,
+	 * 0x207, 0x228, 0x240). These values are stable across gfx9..gfx12,
+	 * so hardcoding is correct today.
+	 *
+	 * The intended abstraction for offsets is
+	 * ip_block->funcs->get_reg_offset(): fetch the compute IP block via
+	 * get_ip_block(device, AMDGPU_HW_IP_COMPUTE) and call
+	 * ip_block->funcs->get_reg_offset(COMPUTE_PGM_LO) etc. instead of the
+	 * literals. It is deliberately NOT used here for two reasons:
+	 *   1. Coverage - enum general_reg (amd_registers.h) only defines
+	 *      COMPUTE_PGM_LO, PGM_RSRC1, TMPRING_SIZE, USER_DATA_0/1,
+	 *      RESOURCE_LIMITS and NUM_THREAD_X. RSRC2 (0x213), RSRC3 (0x228)
+	 *      and NUM_THREAD_Y/Z (0x208/0x209) have no enum, so the dispatch
+	 *      path cannot be expressed through get_reg_offset alone.
+	 *   2. No per-gen adaptation - there is a single compute IP block
+	 *      (compute_v8_x_ip_block) wired to gfx_v8_0_get_reg_offset for all
+	 *      generations, so it returns the same gfx8/VI offsets regardless
+	 *      of the running IP; adopting it would centralize but not future-
+	 *      proof the offsets.
+	 * To fully adopt get_reg_offset, first extend enum general_reg with the
+	 * missing registers and add real per-generation offset tables/IP blocks.
+	 */
+
+	/* Shader program address (COMPUTE_PGM_LO/HI) */
+	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 2));
+	base_cmd->emit(base_cmd, 0x20c);
+	base_cmd->emit(base_cmd, req->shader_mc_addr >> 8);
+	base_cmd->emit(base_cmd, req->shader_mc_addr >> 40);
+
+	/* Caller-provided shader resource state (COMPUTE_PGM_RSRC1/RSRC2) */
+	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
+	base_cmd->emit(base_cmd, 0x212);
+	base_cmd->emit(base_cmd, req->rsrc1);
+
+	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
+	base_cmd->emit(base_cmd, 0x213);
+	base_cmd->emit(base_cmd, req->rsrc2);
+
+	/* Workgroup dimensions (COMPUTE_NUM_THREAD_X/Y/Z, consecutive regs) */
+	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 3));
+	base_cmd->emit(base_cmd, 0x207);
+	base_cmd->emit(base_cmd, req->thread_x);
+	base_cmd->emit(base_cmd, req->thread_y);
+	base_cmd->emit(base_cmd, req->thread_z);
+
+	/* COMPUTE_PGM_RSRC3 exists on gfx10/gfx11 */
+	if (req->version == 10 || req->version == 11) {
+		base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
+		base_cmd->emit(base_cmd, 0x228);
+		base_cmd->emit(base_cmd, req->rsrc3);
+	}
+
+	/* User data / kernel arguments (COMPUTE_USER_DATA_0..) */
+	if (req->user_data_count) {
+		base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, req->user_data_count));
+		base_cmd->emit(base_cmd, 0x240);
+		for (i = 0; i < req->user_data_count; i++)
+			base_cmd->emit(base_cmd, req->user_data[i]);
+	}
+
+	/* Dispatch: dim_x, dim_y, dim_z, dispatch_initiator */
+	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PACKET3_DISPATCH_DIRECT, 3));
+	base_cmd->emit(base_cmd, req->grid_x);
+	base_cmd->emit(base_cmd, req->grid_y);
+	base_cmd->emit(base_cmd, req->grid_z);
+	base_cmd->emit(base_cmd, req->dispatch_initiator);
+	base_cmd->emit_aligned(base_cmd, 7, GFX_COMPUTE_NOP);
+
+	/* Resource list = internal command buffer + caller-provided BOs */
+	num_resources = req->num_bos + 1;
+	resources = malloc(num_resources * sizeof(*resources));
+	if (!resources) {
+		igt_info("Failed to allocate resource list\n");
+		goto cleanup_cmd;
+	}
+	resources[0] = bo_cmd;
+	for (i = 0; i < req->num_bos; i++)
+		resources[i + 1] = req->bos[i];
+
+	if (amdgpu_bo_list_create(device, num_resources, resources, NULL, &bo_list) != 0) {
+		igt_info("Failed to create BO list\n");
+		goto cleanup_resources;
+	}
+
+	ib_info.ib_mc_address = mc_cmd;
+	ib_info.size = base_cmd->cdw;
+	ib_req.ip_type = AMDGPU_HW_IP_COMPUTE;
+	ib_req.ring = 0;
+	ib_req.resources = bo_list;
+	ib_req.number_of_ibs = 1;
+	ib_req.ibs = &ib_info;
+	ib_req.fence_info.handle = NULL;
+
+	if (amdgpu_cs_submit(context_handle, 0, &ib_req, 1) != 0) {
+		igt_info("Failed to submit CS\n");
+		goto cleanup_bo_list_run;
+	}
+
+	/* Wait for completion */
+	fence.context = context_handle;
+	fence.ip_type = AMDGPU_HW_IP_COMPUTE;
+	fence.ip_instance = 0;
+	fence.ring = 0;
+	fence.fence = ib_req.seq_no;
+
+	if (amdgpu_cs_query_fence_status(&fence, AMDGPU_TIMEOUT_INFINITE, 0, &expired) != 0) {
+		igt_info("Fence wait failed\n");
+		goto cleanup_bo_list_run;
+	}
+
+	if (!expired) {
+		igt_info("Fence not expired\n");
+		goto cleanup_bo_list_run;
+	}
+
+	ret = 0;
+
+cleanup_bo_list_run:
+	amdgpu_bo_list_destroy(bo_list);
+cleanup_resources:
+	free(resources);
+cleanup_cmd:
+	amdgpu_bo_unmap_and_free(bo_cmd, va_cmd, mc_cmd, 4096);
+cleanup_context:
+	amdgpu_cs_ctx_free(context_handle);
+cleanup_base:
+	free_cmd_base(base_cmd);
+
+	return ret;
+}
+
+struct copy_dword_shader {
+	amdgpu_device_handle device;
+	amdgpu_bo_handle bo_shader;
+	amdgpu_va_handle va_shader;
+	uint64_t mc_shader;
+	uint32_t version;
+	bool ready;
+};
+
+/*
+ * Assemble the CopyDword compute shader for @device and populate @sh.
+ *
+ * Returns true on success (sh->ready set). Returns false if the shader could
+ * not be prepared -- whether unavailable (no compute IP block, unsupported gfx
+ * version, no LLVM assembler) or a hard error (query / BO alloc failed).
+ */
+static bool copy_dword_shader_assemble(amdgpu_device_handle device,
+				       struct copy_dword_shader *sh)
+{
+	struct amdgpu_gpu_info info = {0};
+	struct drm_amdgpu_info_hw_ip hw_ip = {0};
+	char mcpu[32];
+	uint8_t isa_bin[4096];
+	size_t isa_sz = 0;
+	void *ptr_shader = NULL;
+	int r;
+
+	if (get_ip_block(device, AMD_IP_COMPUTE) == NULL) {
+		igt_info("Compute IP block not available\n");
+		return false;
+	}
+
+	if (amdgpu_query_gpu_info(device, &info) != 0)
+		return false;
+
+	if (amdgpu_query_hw_ip_info(device, AMDGPU_HW_IP_COMPUTE, 0, &hw_ip) != 0)
+		return false;
+	sh->version = hw_ip.hw_ip_version_major;
+	/*
+	 * Only gfx9..gfx12 have verified register-programming tables here
+	 * (see amdgpu_dispatch_write2hw() and amdgpu_compute_copy_dword()).
+	 * Fail fast on anything outside that range instead of silently
+	 * reusing the gfx9 defaults, which would emit wrong RSRC1/offsets
+	 * on a future IP.
+	 */
+	if (sh->version < 9 || sh->version > 12) {
+		igt_info("Compute copy unsupported on gfx version %u (need GFX9..GFX12)\n",
+			 sh->version);
+		return false;
+	}
+
+	amdgpu_family_id_to_mcpu(info.family_id, mcpu, sizeof(mcpu));
+
+	if (amdgpu_llvm_asm_init() != 0)
+		return false;
+
+	r = amdgpu_llvm_assemble(mcpu, CopyDwordIsa, isa_bin,
+				 sizeof(isa_bin), &isa_sz);
+	if (r != 0 || isa_sz == 0) {
+		amdgpu_llvm_asm_shutdown();
+		igt_info("Failed to assemble CopyDwordIsa\n");
+		return false;
+	}
+
+	sh->device = device;
+
+	/* Upload the assembled ISA into a dedicated shader BO */
+	if (amdgpu_bo_alloc_and_map(device, 4096, 4096, AMDGPU_GEM_DOMAIN_GTT, 0,
+				    &sh->bo_shader, &ptr_shader, &sh->mc_shader,
+				    &sh->va_shader) != 0) {
+		amdgpu_llvm_asm_shutdown();
+		return false;
+	}
+	memset(ptr_shader, 0, 4096);
+	memcpy(ptr_shader, isa_bin, isa_sz);
+	amdgpu_llvm_asm_shutdown();
+
+	sh->ready = true;
+	return true;
+}
+
+/*
+ * Lazily assemble (once per process) and return the cached CopyDword shader for
+ * @device, or NULL if the shader could not be prepared. The shader BO is
+ * intentionally left mapped until process exit; the test binary is short-lived.
+ */
+static struct copy_dword_shader *copy_dword_shader_get(amdgpu_device_handle device)
+{
+	static struct copy_dword_shader cache;
+
+	if (cache.ready && cache.device == device)
+		return &cache;
+
+	/* A device change is not expected; drop any stale shader. */
+	if (cache.ready) {
+		if (cache.bo_shader)
+			amdgpu_bo_unmap_and_free(cache.bo_shader, cache.va_shader,
+						 cache.mc_shader, 4096);
+		memset(&cache, 0, sizeof(cache));
+	}
+
+	if (!copy_dword_shader_assemble(device, &cache)) {
+		memset(&cache, 0, sizeof(cache));
+		return NULL;
+	}
+
+	return &cache;
+}
+
+int amdgpu_compute_copy_dword(amdgpu_device_handle device,
+			      amdgpu_bo_handle src_bo, uint64_t src_va,
+			      amdgpu_bo_handle dst_bo, uint64_t dst_va)
+{
+	struct copy_dword_shader *sh;
+	struct amdgpu_dispatch_shader_req req = {0};
+	uint32_t user_data[4];
+	amdgpu_bo_handle bos[3];
+	uint32_t num_bos = 0;
+
+	sh = copy_dword_shader_get(device);
+	if (!sh) {
+		igt_info("Compute shader unavailable (no compute IP / LLVM)\n");
+		return -1;
+	}
+
+	/* CopyDword ABI: s[0:1] = source pointer, s[2:3] = destination pointer */
+	user_data[0] = src_va & 0xFFFFFFFF;
+	user_data[1] = src_va >> 32;
+	user_data[2] = dst_va & 0xFFFFFFFF;
+	user_data[3] = dst_va >> 32;
+
+	req.version = sh->version;
+	req.shader_mc_addr = sh->mc_shader;
+	/* Register state mirrors amdgpu_dispatch_write2hw() for CopyDword */
+	if (sh->version == 11 || sh->version == 12)
+		req.rsrc1 = 0x600C0041 & ~(1u << 29);
+	else
+		req.rsrc1 = 0x000C0041;
+	req.rsrc2 = 0x00000090;
+	req.rsrc3 = (sh->version == 11) ? 0x3f0 : 0;
+	req.thread_x = 0x40;
+	req.thread_y = 1;
+	req.thread_z = 1;
+	req.user_data = user_data;
+	req.user_data_count = 4;
+	req.grid_x = 1;
+	req.grid_y = 1;
+	req.grid_z = 1;
+	req.dispatch_initiator = 0x1;	/* COMPUTE_SHADER_EN */
+
+	/*
+	 * Register the shader BO plus any caller-supplied source/destination
+	 * BOs so the driver keeps every buffer the shader accesses resident for
+	 * the dispatch. The command buffer BO is added internally by
+	 * amdgpu_dispatch_shader().
+	 */
+	bos[num_bos++] = sh->bo_shader;
+	if (src_bo)
+		bos[num_bos++] = src_bo;
+	if (dst_bo)
+		bos[num_bos++] = dst_bo;
+	req.bos = bos;
+	req.num_bos = num_bos;
+
+	return amdgpu_dispatch_shader(device, &req);
+}
diff --git a/lib/amdgpu/compute_utils/amd_dispatch_helpers.h b/lib/amdgpu/compute_utils/amd_dispatch_helpers.h
index c0113519b..f585d5a0e 100644
--- a/lib/amdgpu/compute_utils/amd_dispatch_helpers.h
+++ b/lib/amdgpu/compute_utils/amd_dispatch_helpers.h
@@ -41,4 +41,87 @@ int execute_compute_dispatch(amdgpu_device_handle device,
 				   uint64_t src_mc_addr,
 				   uint64_t dst_mc_addr,
 				   uint32_t expected_value);
+
+/**
+ * struct amdgpu_dispatch_shader_req - Description of a generic compute dispatch
+ * @version: GPU version used for the compute state init (9/10/11/12)
+ * @shader_mc_addr: GPU address of the shader ISA to execute
+ * @rsrc1: value written to COMPUTE_PGM_RSRC1
+ * @rsrc2: value written to COMPUTE_PGM_RSRC2
+ * @rsrc3: value written to COMPUTE_PGM_RSRC3 (only emitted on version 10/11)
+ * @thread_x: value written to COMPUTE_NUM_THREAD_X (workgroup size X)
+ * @thread_y: value written to COMPUTE_NUM_THREAD_Y (workgroup size Y)
+ * @thread_z: value written to COMPUTE_NUM_THREAD_Z (workgroup size Z)
+ * @user_data: dwords loaded into COMPUTE_USER_DATA_0.. (kernel arguments)
+ * @user_data_count: number of dwords in @user_data (0 to skip)
+ * @grid_x: DISPATCH_DIRECT dimension X (number of workgroups)
+ * @grid_y: DISPATCH_DIRECT dimension Y
+ * @grid_z: DISPATCH_DIRECT dimension Z
+ * @dispatch_initiator: COMPUTE_DISPATCH_INITIATOR flags (bit0 = COMPUTE_SHADER_EN)
+ * @bos: BOs the shader accesses (inputs/outputs); the command buffer is added
+ *       internally, so this list only needs the shader and data BOs
+ * @num_bos: number of entries in @bos
+ *
+ * All shader-binding state (RSRC*, thread dims, user data, grid) is supplied by
+ * the caller so that any shader can be executed without changing the emitter.
+ */
+struct amdgpu_dispatch_shader_req {
+	uint32_t version;
+
+	uint64_t shader_mc_addr;
+	uint32_t rsrc1;
+	uint32_t rsrc2;
+	uint32_t rsrc3;
+
+	uint32_t thread_x;
+	uint32_t thread_y;
+	uint32_t thread_z;
+
+	const uint32_t *user_data;
+	uint32_t user_data_count;
+
+	uint32_t grid_x;
+	uint32_t grid_y;
+	uint32_t grid_z;
+	uint32_t dispatch_initiator;
+
+	amdgpu_bo_handle *bos;
+	uint32_t num_bos;
+};
+
+/**
+ * amdgpu_dispatch_shader - Execute a generic compute dispatch
+ * @device: AMDGPU device handle
+ * @req: Description of the dispatch to execute
+ *
+ * This function creates a fresh context, allocates a command buffer, emits the
+ * compute state and dispatch packets, and submits it. The caller must provide
+ * all shader-binding state (RSRC*, thread dims, user data, grid) so that any
+ * shader can be executed without changing the emitter.
+ *
+ * Returns: 0 on success, -1 on failure
+ */
+int amdgpu_dispatch_shader(amdgpu_device_handle device,
+			       const struct amdgpu_dispatch_shader_req *req);
+
+/**
+ * amdgpu_compute_copy_dword - Copy a single DWORD from src to dst via compute
+ * @device: AMDGPU device handle
+ * @src_bo: BO backing @src_va, or NULL if there is no BO to track
+ *          (for example, an SVM/HMM address)
+ * @src_va: GPU virtual address of the source DWORD
+ * @dst_bo: BO backing @dst_va, or NULL if there is no BO to track
+ * @dst_va: GPU virtual address of the destination DWORD
+ *
+ * This function assembles a small compute shader that copies a single 32-bit
+ * value from @src_va to @dst_va, uploads it to a dedicated shader BO, and
+ * dispatches it. Any non-NULL @src_bo / @dst_bo is registered in the dispatch
+ * BO list alongside the shader BO so the driver keeps the accessed buffers
+ * resident for the duration of the dispatch.
+ *
+ * Returns: 0 on success, -1 on failure
+ */
+int amdgpu_compute_copy_dword(amdgpu_device_handle device,
+			      amdgpu_bo_handle src_bo, uint64_t src_va,
+			      amdgpu_bo_handle dst_bo, uint64_t dst_va);
 #endif
-- 
2.34.1

