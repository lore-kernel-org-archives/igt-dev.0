Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAC3606A330
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 00:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=xInlhglz
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D98CC10E6FE;
	Mon, 16 Nov 2026 00:46:12 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011061.outbound.protection.outlook.com [52.101.52.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5618310E029
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 00:40:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rYTaPSAlvcPTw9ICC1tHfwI5Ud4VnyUpATTbGs3/pdlUy8duWkyhS7jkBi79d+alL9I8PX7gj79UjhJ192IFi8rE/Ujs4tenjNWVejr1N1Po1yrtvI3BqytJ0OFAapoTVlyZeIMTV6HXiJiPN/I0R/QTYIFA4JZQSTUl6PqTqom6UgHmlbqQoyQKE2wtNz6ezLn814WNvdcXdowm3YS5ujyQzfaXYRrp2FsJESOyI/E8JL9hOLkEU48TMrAl2YNzQvNfyCw9O7Dt0tOrzZPrvoHinWDzcRcrFGAgRX9ehx4K5BdmUD294hMEnMUjktYRdii2nlq182+lJyA64ccW3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fnX7n3d4fMzJN9qE3Md1PP/IUCrmjHwTNLuMD4IH7JE=;
 b=IgQyS1hrzqvVVkJziUAuATfoZlVCFQwX0OS9Z8f0cBNXJYdtct2wFWCMJg0OxgXdRk8weX9bNuCPkNgSx+SJVFAGkfmvIusxp3cvHKoLHpz5J9hUL8ZKR+/N4Kd8v/7nSc1FJ8f6rAIbyh/gmK+d0HXcyLsc77kPABrfK+fOxGYnvTe0lRG3Cl3X/2wpGvsw75drAFDHT4dwRyYLCcjXz7ugxZdU851NQLCo9gvKR5P+GpAvzLJSwMJiJX4y6/d9vwjQafWkKrqRs2O/2BtzO2R9d0LvKKETa++wLtwlg5yEppOot+q8LZnTWFEZCH72akhTil7H6rU+DhtxWAv5LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fnX7n3d4fMzJN9qE3Md1PP/IUCrmjHwTNLuMD4IH7JE=;
 b=xInlhglzXTUDKZTe/gGIto/LmwzNH7YycFVUcArPcvrXYnRAQ9K9DvAMj4+uy34DSAJ/Q+ccBaHnF9mCIrKK8MQEUTmVgLiO7qNDsiZgl5IYLa/iyxAWtKkJyDe/p7EMiLyLBeRYPfSFqi8ON/m3oWpBQMFfWMC4FqC+WRF2hwA=
Received: from BN9PR03CA0216.namprd03.prod.outlook.com (2603:10b6:408:f8::11)
 by IA4PR12MB144179.namprd12.prod.outlook.com (2603:10b6:207:12d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Mon, 16 Nov
 2026 00:40:32 +0000
Received: from BN1PEPF00018075.namprd04.prod.outlook.com
 (2603:10b6:408:f8:cafe::49) by BN9PR03CA0216.outlook.office365.com
 (2603:10b6:408:f8::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Mon,
 16 Nov 2026 00:40:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00018075.mail.protection.outlook.com (10.167.245.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 00:40:32 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Sun, 15 Nov
 2026 18:40:24 -0600
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Sun, 15 Nov 2026 18:40:24 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Junhua Shen <Junhua.Shen@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, "Jesse
 Zhang" <jesse.zhang@amd.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH 7/8] lib/amdgpu: add generic compute dispatch and copy_dword
 helpers
Date: Sun, 15 Nov 2026 19:40:06 -0500
Message-ID: <20261116004016.121139-8-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116004016.121139-1-vitaly.prosyak@amd.com>
References: <20261116004016.121139-1-vitaly.prosyak@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018075:EE_|IA4PR12MB144179:EE_
X-MS-Office365-Filtering-Correlation-Id: f364a148-d9be-4805-8c5d-08df437a3877
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|10067099003|11063799006|5023799004|56012099006|261021135927099003|261021133027099003|261021130227099003|261021123027099003|261021121427099003|261009221227099003|261009223027099003|261102123227099003|261026140227099003|261026130827099003|261022113327099003|261022105027099003|261022075727099003|261026121527099003|261022115727099003|261026135527099003|261028144727099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: O7KVj1ejQScOWecUWl0LLaChSJNVyzqViMaUQZjoSvFC8hCYHRYZ/jheR+pFd0nT8GHEZY2FfJ4/ALSvhsKATzualdweiVLe4ZaNfyhkNyD9Hgt2S73b1f/KW7YBbkw3F8RTo6ICpK/h82ACY8Z+v/ED60i/QNVQa+yuwyjMhNXBah2Px6Mq0dAuAvrpjdxcvW7sy5igw9Lz+kzfHZtOIUZh7kZBPcL2Mm0Ci4OM9KPZW8aBnxmZ0MlVTcNNPw30b9Tx0Am4jtynSHtwsM6qmltOBkpyrLfnMznOhANnN77mfM5LO6FJE9+IQo4RBtovvgJe1C+DZvl9IVr/VUiK7XSVmNZa3Gx+MAo2YKN33ivQyQVatkRLYG/9aF3UeNJyxkykulUWddy3xaRefQJ6vQ2aLUhgBHjNv4n+qE0GN2b8CKIaYVllcOLYqBqJ8tCOFzPAUMZ9wzKMnMN7AOIE0xtK59SGzIIZ27E37YGWGr1WrXoPQpnMXYj6DNmXUf7ui13T4HmXqlyq12XHCoLYXjwYM5h9eHM6zVe8RlOWpF/vyB/1oYnXba5g1OGSNOyxczMmhso0VgV7a/WnoAXaeNX/H5Clb8r+n2HTjkwXhwteCx1L72rg7TFFAXQ4NhkqirMLaCMe3cDdsiEo6R/vVa4y8/LPW161CxARW6zXqtQaEyzHDcVBtysiiELfET2VDNt8lXr5Zu6oeCS28g5nWg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(10067099003)(11063799006)(5023799004)(56012099006)(261021135927099003)(261021133027099003)(261021130227099003)(261021123027099003)(261021121427099003)(261009221227099003)(261009223027099003)(261102123227099003)(261026140227099003)(261026130827099003)(261022113327099003)(261022105027099003)(261022075727099003)(261026121527099003)(261022115727099003)(261026135527099003)(261028144727099003)(18002099003)(22082099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: RqbnQRhwxaJaeiRSug28xiCST3Qta0tQqgxXoj/WbO0dXmK/0mF+egzoUcGknkqf8bz3piWDMfNV4wkFk6wpxQtTV+mvcFEoUdlp5o+nWCnr3UTwZeoKBPDUCEFVTUI7BFLC/6GIvlOqc10Tng6GM2JFeXv6h125YZkfLKaXr4t6oHtGs3c81VmlElyw9WGRtYOe52r/6fRGWSyXCitThxgQIgbIl9iBUOxE6/5zJS4Q9qw23kX6m+3+vx+pkvd/bZyp/o3Myt6NEN607vJ0MTbFEclgC5Z8SfBum8iofshj8HPfyAI+AZM/7pQeA/mNEMvMnigQcmm2deVLsoIbBSFMbplZgVQG5/6tp+W1A2QUEwRZ2BRm7IQTTicHywPc5R2tp0JM+C0eAuidX7njIiw7iLGS4d8yG3T/8cV2g7kJagpi40Jguo/PDtdz+Rr+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 00:40:32.1934 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f364a148-d9be-4805-8c5d-08df437a3877
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00018075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB144179
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

Add amdgpu_dispatch_shader(), a family-agnostic compute dispatch emitter
driven by a caller-filled amdgpu_dispatch_shader_req. The caller supplies
all shader-binding state (RSRC*, thread dims, user data, grid and BO list),
so any shader can be run without changing the emitter. It creates the
context, allocates the command buffer, emits the compute state and
DISPATCH_DIRECT packets, and submits.

Also add amdgpu_compute_copy_dword(), a small wrapper that builds a
single-DWORD copy shader for the current GPU family and dispatches it,
for use as a lightweight submission workload in tests.

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Junhua Shen <Junhua.Shen@amd.com>
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 .../compute_utils/amd_dispatch_helpers.c      | 348 ++++++++++++++++++
 .../compute_utils/amd_dispatch_helpers.h      |  83 +++++
 2 files changed, 431 insertions(+)

diff --git a/lib/amdgpu/compute_utils/amd_dispatch_helpers.c b/lib/amdgpu/compute_utils/amd_dispatch_helpers.c
index c05198d8b..60fbc7d10 100644
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
@@ -401,3 +407,345 @@ cleanup_context:
 
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
index e1c6e37f4..02e28aba7 100644
--- a/lib/amdgpu/compute_utils/amd_dispatch_helpers.h
+++ b/lib/amdgpu/compute_utils/amd_dispatch_helpers.h
@@ -43,4 +43,87 @@ int execute_compute_dispatch(amdgpu_device_handle device,
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
2.43.0

